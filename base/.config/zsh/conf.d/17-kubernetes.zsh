# Kubernetes and Azure CLI tooling

# Core kubectl aliases (only if kubectl is installed)
if command -v kubectl &>/dev/null; then
    alias k='kubectl'
    alias kg='kubectl get'
    alias kd='kubectl describe'
    alias ka='kubectl apply -f'
    alias kdel='kubectl delete'
    alias kl='kubectl logs -f'
    alias ke='kubectl exec -it'
    alias kgp='kubectl get pods'
    alias kgs='kubectl get svc'
    alias kgi='kubectl get ingress'
    alias kgn='kubectl get nodes'
    alias kga='kubectl get all'
    alias kgd='kubectl get deployments'
    alias kgns='kubectl get namespaces'
    alias ktop='kubectl top pods'
    alias ktopn='kubectl top nodes'
    alias kaf='kubectl apply -f'
    alias kdf='kubectl delete -f'
    alias kroll='kubectl rollout'
    alias krs='kubectl rollout status'
    alias krr='kubectl rollout restart'
fi

# Context & namespace switching (kubectx/kubens)
if command -v kubectx &>/dev/null; then
    alias kctx='kubectx'
fi

if command -v kubens &>/dev/null; then
    alias kns='kubens'
fi

# kubecolor as kubectl drop-in
if command -v kubecolor &>/dev/null; then
    alias kubectl='kubecolor'
fi

# Azure CLI
if command -v az &>/dev/null; then
    alias azl='az login'
    alias azaks='az aks get-credentials --resource-group'
    alias azwho='az account show -o table'
    alias azsub='az account list -o table'
    alias azctx='az account set --subscription'
fi
