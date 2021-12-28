terraform {
  source = ".././/install"
}

remote_state {
  backend = "local"
  config = {
    path = "../../../../../states/install/terraform.tfstate"
  }
}