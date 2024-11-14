module "tetris" {
  source = "../workload"
  type = "standard"
  name = "tetris"
  gvc = cpln_gvc.terraform-testing.name
  support_dynamic_tags = false
  containers = {
    tetris: {
      image: "bsord/tetris",
      cpu: "50m",
      memory: "128Mi",
      inherit_env: false,
      ports: [
        {
          number: 80,
          protocol: "http"
        }
      ]
    }
  }
  options = {
    autoscaling: {
      max_concurrency: 0,
      max_scale: 3,
      metric: "cpu",
      min_scale: 1,
      scale_to_zero_delay: 300,
      target: 100
    }
    capacity_ai: false
    suspend: false
    timeout_seconds: 5
  }
  firewall_spec = {
    internal: {
      inbound_allow_type: "none"
    }
    external: {
      inbound_allow_cidr: [
        "0.0.0.0/0"
      ]
    }
  }
  load_balancer = {
    direct: {
      enabled: false
    }
  }
}
