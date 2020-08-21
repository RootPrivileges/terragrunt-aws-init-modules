provider "aws" {
  alias = "member"

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/OrganizationAccountAccessRole"
  }
}

module "private_subnet" {
  source = "../../utility/networking/create-subnet"

  providers = {
    aws = aws.member
  }

  availability_zone = var.availability_zone
  subnet_cidr       = var.subnet_cidr
  subnet_name       = "${var.availability_zone}-${var.subnet_name}"
  vpc_id            = "${var.vpc_id}"
}
