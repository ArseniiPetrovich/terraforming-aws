resource "aws_subnet" "pas_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(local.pas_cidr, 2, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.env_name}-ert-subnet${count.index}"
  }
}

data "template_file" "pas_subnet_gateways" {
  vars = {
    gateway = cidrhost(aws_subnet.pas_subnets[count.index].cidr_block, 1)
  }

  # Render the template once for each availability zone
  count    = length(var.availability_zones)
  template = "$${gateway}"
}

resource "aws_route_table_association" "route_pas_subnets" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.pas_subnets[count.index].id
  route_table_id = var.route_table_ids[count.index]
}

resource "aws_subnet" "services_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(local.services_cidr, 2, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.tags,
    {
      "Name" = "${var.env_name}-services-subnet${count.index}"
    },
  )
}

data "template_file" "services_subnet_gateways" {
  vars = {
    gateway = cidrhost(
      aws_subnet.services_subnets[count.index].cidr_block,
      1,
    )
  }

  # Render the template once for each availability zone
  count    = length(var.availability_zones)
  template = "$${gateway}"
}

resource "aws_route_table_association" "route_services_subnets" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.services_subnets[count.index].id
  route_table_id = var.route_table_ids[count.index]
}
