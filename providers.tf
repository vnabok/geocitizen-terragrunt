provider "aws" {
  alias = "my_provider"
  region = "eu-west-3"
  profile = "vn-lz"
  shared_credentials_file = "~/.aws/credentials"
}