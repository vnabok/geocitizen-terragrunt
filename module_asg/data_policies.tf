data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    } 
  }
}

data "aws_iam_policy_document" "instance_policy" {
  statement {
    actions = [
        "ec2:*"
    ]
    resources = ["*"]
  }
  statement {
    actions = ["rds:*"]
    resources = ["*"]    
  }
}