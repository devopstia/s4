terraform {
  source = "../../../modules/s3"
}
include {
  path = find_in_parent_folders()
}

inputs = {
    aws_region  = "us-east-1"
    bucket_name = "development-test-0005"
}
