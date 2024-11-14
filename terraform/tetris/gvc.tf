resource "cpln_gvc" "terraform-testing" {
  name = "terraform-testing"
  description = "terraform-testing"
  tags = {

  }
  locations = ["aws-eu-central-1"]
  env = {

  }
  load_balancer {
    dedicated = false
    trusted_proxies = 0
  }
}
