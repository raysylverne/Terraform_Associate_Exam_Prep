# Terraform Resource Block - To Add S3 Bucket 
resource "aws_s3_bucket" "my_new_s3_bucket" {
  bucket = "my-new-tf-test-bucket-${random_id.randomness.hex}" # referencing the random resource ID

  tags = {
    Name    = "My S3 Bucket"
    Purpose = "Intro to Resource Buckets Block"
  }
}

# Terraform Resource Block - To Add S3 Bucket ACL
resource "aws_s3_bucket_acl" "my_new_bucket_acl" {
  bucket = aws_s3_bucket.my_new_s3_bucket.id
  acl    = "private"
}

# Terraform Resource Block - To Add New SG
resource "aws_security_group" "my-new-security-group" {
  name        = "web_server_inbound"
  description = "Allow inbound traffic on tcp/443"
  vpc_id      = aws_vpc.demo_vpc.id

  ingress {
    description = "Allow 443 from the Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "web_server_inbound"
    Purpose = "Intro to Resource Blocks Lab"
  }
}

# Can be used to automate the creation of unique names for resources like our S3 Buckets
resource "random_id" "randomness" {
byte_length = 16
}