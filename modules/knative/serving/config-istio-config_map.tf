resource "k8s_core_v1_config_map" "config-istio" {
  data = {
    "_example" = <<-EOF
      ################################
      #                              #
      #    EXAMPLE CONFIGURATION     #
      #                              #
      ################################
      
      # This block is not actually functional configuration,
      # but serves to illustrate the available configuration
      # options and document them in a way that is accessible
      # to users that `kubectl edit` this config map.
      #
      # These sample configuration options may be copied out of
      # this block and unindented to actually change the configuration.
      
      # Default Knative Gateway after v0.3. It points to the Istio
      # standard istio-ingressgateway, instead of a custom one that we
      # used pre-0.3.
      gateway.knative-ingress-gateway: "istio-ingressgateway.istio-system.svc.cluster.local"
      
      # A cluster local gateway to allow pods outside of the mesh to access
      # Services and Routes not exposing through an ingress.  If the users
      # do have a service mesh setup, this isn't required and can be removed.
      #
      # An example use case is when users want to use Istio without any
      # sidecar injection (like Knative's istio-lean.yaml).  Since every pod
      # is outside of the service mesh in that case, a cluster-local  service
      # will need to be exposed to a cluster-local gateway to be accessible.
      local-gateway.cluster-local-gateway: "cluster-local-gateway.istio-system.svc.cluster.local"
      
      EOF
  }
  metadata {
    labels = {
      "networking.knative.dev/ingress-provider" = "istio"
      "serving.knative.dev/release"             = "devel"
    }
    name      = "config-istio"
    namespace = "${var.namespace}"
  }
}