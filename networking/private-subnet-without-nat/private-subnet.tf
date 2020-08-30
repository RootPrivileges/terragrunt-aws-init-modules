module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  availability_zone = var.availability_zone
  subnet_cidr       = var.subnet_cidr
  subnet_name       = "${var.availability_zone}-${var.subnet_name}"
  tags              = var.tags
  vpc_id            = "${var.vpc_id}"
}
