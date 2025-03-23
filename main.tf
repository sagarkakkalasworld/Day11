data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "SagarKakkalasWorld"
  }
}

resource "aws_instance" "terraform_import_instance" {
  ami           = "ami-04f7a54071e74f488"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform import instance"
  }    
}

module "s3_bucket" {
 source = "github.com/Hari0o/module-s3-bucket"
 bucket_name = "randombucketnames849393"
}
