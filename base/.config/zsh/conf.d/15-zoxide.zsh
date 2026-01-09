if command -v zoxide >/dev/null; then
  if [[ "$OSTYPE" == darwin* ]]; then
    # Use 'z' on macOS to avoid path normalization issues with case-insensitive filesystem
    # This prevents lowercased paths breaking Docker volume mounts to Linux containers
    eval "$(zoxide init zsh --cmd z)"
  else
    eval "$(zoxide init zsh --cmd cd)"
  fi
fi
