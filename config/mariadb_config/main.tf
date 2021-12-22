terraform {
  required_providers {
    mysql = {
      source = "petoju/mysql"
      version = "3.0.7"
    }
  }
}

provider "mysql" {
    endpoint = "localhost:3306"
    username = "root"
    password = "admin"
}

