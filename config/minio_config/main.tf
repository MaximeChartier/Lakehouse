terraform {
  required_providers {
    minio = {
      version = "0.1.0"
      source  = "refaktory/minio"
    }
  }
}

provider "minio" {
  endpoint = "localhost:9000"
  access_key = "minioadmin"
  secret_key = "minioadmin"
  ssl = false
}