data "archive_file" "demo_put_records_forehose_stream" {
  type        = "zip"
  source_file = "${path.module}/stream.py"
  output_path = "${path.module}/files/init.zip"
}

resource "aws_lambda_function" "demo_put_records_forehose_stream" {
  filename      = data.archive_file.demo_put_records_forehose_stream.output_path
  function_name = "demo_put_records_forehose_stream"
  role          = aws_iam_role.demo_put_records_forehose_stream_role.arn
  handler       = "stream.lambda_handler"
  runtime       = "python3.9"
  package_type  = "Zip"
}

resource "aws_lambda_permission" "demo_put_records_forehose_stream" {
  statement_id  = "AllowExecutionFromS3Bucket2"
  action        = "lambda:InvokeFunction"
  function_name = aws_iam_role.demo_put_records_forehose_stream_role.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::jithendar"
}

resource "aws_s3_bucket_notification" "demo_put_records_forehose_stream" {
  bucket = "jitendar"
  lambda_function {
    lambda_function_arn = aws_lambda_function.demo_put_records_forehose_stream.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "trigger/"
    filter_suffix       = ".json"
  }
}

resource "aws_cloudwatch_log_group" "demo_put_records_forehose_stream" {
  name              = "demo_put_records_forehose_stream"
  retention_in_days = 7
  tags = {
    Environment = "demo"
    Application = "demo"
  }
}