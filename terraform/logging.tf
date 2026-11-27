# CloudWatch Log Group for InfoApp
resource "aws_cloudwatch_log_group" "infoapp" {
  name              = "/ecs/${var.project_name}/infoapp"
  retention_in_days = 7

  tags = {
    Name        = "${var.project_name}-infoapp-logs"
    Application = "InfoApp"
  }
}

# CloudWatch Log Group for StatusApp
resource "aws_cloudwatch_log_group" "statusapp" {
  name              = "/ecs/${var.project_name}/statusapp"
  retention_in_days = 7

  tags = {
    Name        = "${var.project_name}-statusapp-logs"
    Application = "StatusApp"
  }
}
