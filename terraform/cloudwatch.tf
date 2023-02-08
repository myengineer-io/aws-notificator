resource "aws_cloudwatch_metric_alarm" "billing-alarm" {
  alarm_name          = "Billing"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = var.threshold
  alarm_description   = format("{'account': '%s', 'threshold': '%s', 'discord': '%s', 'whatsapp': '%s', 'from_number': '%s', 'destination_number': '%s', 'discord_webhook_url': '%s'}", var.account, var.threshold, var.discord, var.whatsapp, var.from_number, var.destination_number, var.discord_webhook_url)
  actions_enabled     = "true"
  alarm_actions       = [aws_sns_topic.aws-notificator-topic.arn]
  dimensions = {
    Currency = "USD"
  }
  tags = var.tags
}