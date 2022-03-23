ecr-login() {
  aws --profile "$1" ecr get-login --no-include-email | bash
# aws --profile "$1" ecr get-login-password | docker login --username AWS --password-stdin \
# "$(aws --profile think-new sts get-caller-identity | jq -r '.Account')".dkr.ecr
}

kfconfig() {
  aws --profile "$1" eks update-kubeconfig --name "$2" --alias "$2"
}

kconfig() {
  configmap=${1:-"thinkific-environment"}
  namespace=${2:-"default"}

  kubectl get configmap $configmap -n $namespace -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v}}{{end}}{{"\n"}}{{end}}'
}

ksecret() {
  secret=${1:-"thinkific-secrets"}
  namespace=${2:-"default"}

  kubectl get secret $secret -n $namespace -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}

vpn() {
  environment=${1:-"st"}

  ##
  # Fetch appropriated server
  ##
  if [ $environment = "st" ]; then
    vpn="Thinkific - Staging"
  else
    vpn="Thinkific - Production"
  fi

  active=$(nmcli con show --active "$vpn")
  if [[ -z $active ]];then
    echo "Connecting to vpn: $vpn"
    nmcli con up "$vpn"
  else
    echo "Shutting down vpn connection: $vpn"
    nmcli con down "$vpn"
  fi

  return $?
}

genvpn() {
  SSH_KEY_PATH=$HOME/Development/Thinkific/keys
  USERNAME=ec2-user

  environment=${1:-"staging"}
  name=${2:-""}

  ##
  # Validate input variables
  ##
  if [ -z $name ]; then echo "Missing name argument. Ex: genvpn [enviroment] [name]"; return 1; fi
  if [ $environment != "staging" ] && [ $environment != "production" ]; then echo "Invalid environment. Supported: staging|production"; return 1; fi

  ##
  # Fetch appropriated server
  ##
  if [ $environment = "staging" ]; then
    ec2_address="$USERNAME@REDACTED_IP"
    # address=vpn.thinkific-staging.com
  else
    ec2_address="$USERNAME@REDACTED_IP"
    # address=vpn.thinkific.com
  fi

  ##
  # Generate OVPN Credentials
  ##
  ec2_pem="$SSH_KEY_PATH/thinkific-$environment-us-east-1.pem"

  echo "Connecting to: $address"
  echo "Running: ssh -i $ec2_pem $ec2_address sudo ./create_client.sh $name"
  ssh -i $ec2_pem $ec2_address sudo ./create_client.sh $name
  if [ $? -gt 0 ]; then return 1; fi
  echo "Downloading client cert: scp -i $ec2_pem $ec2_address:~/$name.ovpn $SSH_KEY_PATH/$name.$environment.ovpn"
  scp -i $ec2_pem $ec2_address:~/$name.ovpn $SSH_KEY_PATH/$name.$environment.ovpn
  if [ $? -gt 0 ]; then return 1; fi
  echo "Cleaning client cert from remote: ssh -i $ec2_pem $ec2_address rm $name.ovpn"
  ssh -i $ec2_pem $ec2_address rm $name.ovpn
  if [ $? -gt 0 ]; then return 1; fi
}

pullsecret(){
    # Create a Kubernetes registry secret for an AWS ECR region
    # Requires AWS CLI: https://aws.amazon.com/cli/
    # Requires kubectl: https://coreos.com/kubernetes/docs/latest/configure-kubectl.html
    #

    #
    # This secret can be used with 'imagePullSecret' for Kubernetes
    #
    # ...
    # spec:
    #   containers:
    #   - name: busybox
    #     image: busybox:latest
    #   imagePullSecrets:
    #   - name: us-west-2-ecr-registry
    #...
    #

    #
    # When Kubernetes 1.3.0+ is released this approach should not be necessary
    # This patch will allow Kubernetes to automatically cache cross-region AWS ECR tokens
    # https://github.com/kubernetes/kubernetes/pull/24369
    #

    ACCOUNT=`aws --profile think-new sts get-caller-identity | jq -r .Account`
    REGION=us-east-1
    SECRET_NAME=${REGION}-ecr-registry
    EMAIL=savio@thinkific.com

    #
    # Fetch token (which will expire in 12 hours)
    #

    TOKEN=`aws ecr --profile think-new get-authorization-token --output text --query authorizationData[].authorizationToken | base64 -d | cut -d: -f2`

    #
    # Create or repleace registry secret
    #

    # kubectl delete secret --ignore-not-found $SECRET_NAME
    kubectl create secret docker-registry --dry-run -o yaml $SECRET_NAME \
    --docker-server=https://${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com \
    --docker-username=AWS \
    --docker-password="${TOKEN}" \
    --docker-email="${EMAIL}"
}
