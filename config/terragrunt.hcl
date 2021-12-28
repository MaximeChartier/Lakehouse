terraform {
  source = ".././/config"

  before_hook "before_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["bash", "start_port_forward.sh"]
  }

  after_hook "after_hook" {
    commands     = ["apply", "plan", "destroy"]
    execute      = ["bash", "stop_port_forward.sh"]
    run_on_error = true
  }
}

dependency "install" {
  config_path = "../install"
  skip_outputs = true
}

remote_state {
  backend = "local"
  config = {
    path = "../../../../../states/config/terraform.tfstate"
  }
}
