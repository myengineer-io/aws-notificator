resource "aws_sns_topic" "aws-notificator-topic" {
  name = "aws-notificator-topic"
  tags = var.tags
}

resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.aws-notificator-topic.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.aws-notificator-lambda.arn
}