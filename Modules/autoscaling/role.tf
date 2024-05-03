resource "kubernetes_role" "cluster_autoscaler_role" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"
    
    labels = {
      "k8s-addon" = "cluster-autoscaler.addons.k8s.io"
      "k8s-app"   = "cluster-autoscaler"
    }
  }

  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["create", "list", "watch"]
  }

  rule {
    api_groups      = [""]
    resources       = ["configmaps"]
    resource_names  = ["cluster-autoscaler-status", "cluster-autoscaler-priority-expander"]
    verbs           = ["delete", "get", "update", "watch"]
  }
}

resource "kubernetes_role_binding" "cluster_autoscaler_role_binding" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"
    labels = {
      "k8s-addon" = "cluster-autoscaler.addons.k8s.io"
      "k8s-app"   = "cluster-autoscaler"
    }
  }
  
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "cluster-autoscaler"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "cluster-autoscaler"
    namespace = "kube-system"
  }
}