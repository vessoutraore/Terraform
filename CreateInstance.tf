# Configure the AWS Provider
provider "aws" {
    version = "3.53.0"
    access_key = "AKIASPWCTWGYB3I5IHRM"
    secret_key = "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"
    region     = "us-east-1"
}
resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
}
