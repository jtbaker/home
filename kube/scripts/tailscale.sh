# sets up the tailscale operator on the cluster, given the oauth keys set below.
# these need to have the k8s-operator ACL tag attached to them in the tailscale file.

helm repo add tailscale https://pkgs.tailscale.com/helmcharts

helm repo update

helm upgrade \
  --install \
  tailscale-operator \
  tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId="$MINI_TAILSCALE_CLIENT_ID" \
  --set-string oauth.clientSecret="$MINI_TAILSCALE_CLIENT_SECRET" \
  --wait
