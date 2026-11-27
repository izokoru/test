resource "kubernetes_deployment" "web" {
  metadata {
    name = "web"
  }
  spec {
    replicas = 1
    selector {
      match_labels = { app = "web" }
    }
    template {
      metadata {
        labels = { app = "web" }
      }
      spec {
        container {
          name = "nginx"
          # Vulnerable
          image = "nginx:1.24.0"
        }
      }
    }
  }
}

# Vulnerable: docker provider image
resource "docker_image" "proxy" {
  name = "nginxinc/nginx-unprivileged:1.27-alpine"
}

# Not reported: fixed release
resource "docker_image" "proxy_fixed" {
  name = "nginx:1.30.7"
}
