# resource "kubernetes_service" "nexus" {
#   metadata {
#     name      = "nexus-service"
#     namespace = "tools"
#     labels = {
#       app = "nexus"
#     }
#   }

#   spec {
#     selector = {
#       app = "nexus"
#     }

#     port {
#       port        = 8081
#       target_port = 8081
#     }

#     type = "NodePort"
#   }
# }

resource "kubernetes_service" "nexus" {
  metadata {
    name      = "nexus-service"
    namespace = "tools"
    labels = {
      app = "nexus"
    }
  }

  spec {
    selector = {
      app = "nexus"
    }

    port {
      name        = "http"
      port        = 8081
      target_port = 8081
      node_port = 32321

    }
    port {
      name        = "docker"
      port        = 5000
      target_port = 5000
      node_port = 32322

    }
    type = "NodePort"
  }
}



