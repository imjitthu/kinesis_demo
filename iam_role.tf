# aws_iam_role.demo_put_records_forehose_stream_role:
resource "aws_iam_role" "demo_put_records_forehose_stream_role" {
  # arn                   = "arn:aws:iam::991243022080:role/service-role/demo_put_records_forehose_stream-role-jrp3g9px"
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  # create_date           = "2022-11-27T07:42:11Z"
  # force_detach_policies = false
  # id                    = "demo_put_records_forehose_stream-role-jrp3g9px"
  # managed_policy_arns   = [
  #     "arn:aws:iam::991243022080:policy/service-role/AWSLambdaBasicExecutionRole-dc08a652-df3b-45c1-844d-03be39e08a62",
  # ]
  # max_session_duration  = 3600
  # name                  = "demo_put_records_forehose_stream-role-jrp3g9px"
  # path                  = "/service-role/"
  # tags                  = {}
  # tags_all              = {}
  # unique_id             = "AROA6NSVQF4AAGXL7MAIH"
}