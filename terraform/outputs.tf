output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "infoapp_ecr_url" {
  description = "ECR repository URL for InfoApp"
  value       = aws_ecr_repository.infoapp.repository_url
}

output "statusapp_ecr_url" {
  description = "ECR repository URL for StatusApp"
  value       = aws_ecr_repository.statusapp.repository_url
}
output "github_actions_role_arn" {
  description = "IAM role ARN used by GitHub Actions"
  value       = aws_iam_role.github_actions.arn
}

output "ecs_execution_role_arn" {
  description = "ECS task execution role ARN"
  value       = aws_iam_role.ecs_execution.arn
}

output "ecs_task_role_arn" {
  description = "ECS task role ARN"
  value       = aws_iam_role.ecs_task.arn
}

output "ecs_cluster_name" {
  description = "ECS Cluster name"
  value       = aws_ecs_cluster.main.name
}

output "infoapp_task_definition_arn" {
  description = "InfoApp ECS Task Definition ARN"
  value       = aws_ecs_task_definition.infoapp.arn
}

output "statusapp_task_definition_arn" {
  description = "StatusApp ECS Task Definition ARN"
  value       = aws_ecs_task_definition.statusapp.arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "Application Load Balancer hosted zone ID"
  value       = aws_lb.main.zone_id
}
output "infoapp_service_name" {
  description = "InfoApp ECS Service name"
  value       = aws_ecs_service.infoapp.name
}

output "statusapp_service_name" {
  description = "StatusApp ECS Service name"
  value       = aws_ecs_service.statusapp.name
}
