terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = ">1.0.11, <1.3.7"
    }
  }
}