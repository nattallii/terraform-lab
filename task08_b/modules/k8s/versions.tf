terraform {
  required_providers {

    kubectl = {
      source = "alekc/kubectl"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }

  }
}