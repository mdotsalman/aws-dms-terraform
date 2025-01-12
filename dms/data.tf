data "aws_vpc" "this" {
  filter {
    name   = "tag:Environment"
    values = ["production"]
  }
  filter {
    name   = "tag:Region"
    values = ["us-east-1"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  filter {
    name   = "tag:Visibility"
    values = ["private"]
  }
}
