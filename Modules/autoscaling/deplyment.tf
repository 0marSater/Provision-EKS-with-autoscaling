resource "kubernetes_deployment" "cluster_autoscaler_deployment" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"
    labels = {
      "app" = "cluster-autoscaler"
    }
  }
  
  spec {
    replicas = 1
    
    selector {
      match_labels = {
        "app" = "cluster-autoscaler"
      }
    }

    template {
      metadata {
        labels = {
          "app" = "cluster-autoscaler"
        }
        annotations = {
          "cluster-autoscaler.kubernetes.io/safe-to-evict" = "false"
          "prometheus.io/scrape"                           = "true"
          "prometheus.io/port"                             = "8085"
        }
      }

      spec {
        priority_class_name = "system-cluster-critical"

        security_context {
          run_as_non_root = true
          run_as_user     = 65534
          fs_group        = 65534
          seccomp_profile {
            type = "RuntimeDefault"
          }
        }

        service_account_name = "cluster-autoscaler"

        container {
          image = "registry.k8s.io/autoscaling/cluster-autoscaler:v1.29.2"  #Change it to k8s version
          name  = "cluster-autoscaler"

          resources {
            limits = {
              cpu    = "100m"
              memory = "600Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "600Mi"
            }
          }

          command = ["./cluster-autoscaler",
                     "--v=4",
                     "--stderrthreshold=info",
                     "--cloud-provider=aws",
                     "--skip-nodes-with-local-storage=false",
                     "--expander=least-waste",
                     "--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/eks-cluster-test", #Change it to your cluster name
                     "--balance-similar-node-groups",
                     "--skip-nodes-with-system-pods=false"]

          volume_mount {
            name       = "ssl-certs"
            mount_path = "/etc/ssl/certs/ca-certificates.crt"
            read_only  = true
          }

          image_pull_policy = "Always"

          security_context {
            allow_privilege_escalation = false
            capabilities {
              drop = ["ALL"]
            }
            read_only_root_filesystem = true
          }
        }

        volume {
          name = "ssl-certs"
          host_path {
            path = "/etc/ssl/certs/ca-bundle.crt"
          }
        }
      }
    }
  }
}