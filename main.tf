

# resource "ibm_is_vpc" "vpc" {
#   name = var.vpc_name
#   tags = var.vpc_tags
# }
# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_900_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "3600s"
}

# This resource will create (at least) 900 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_900_seconds]
}

#data "ibm_is_vpc" "example" {
#  name = var.vpc_name
#}
