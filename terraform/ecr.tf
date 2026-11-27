# ECR repository for InfoApp
resource "aws_ecr_repository" "infoapp" {
  name                 = "${var.project_name}-infoapp"
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-infoapp"
    Application = "InfoApp"
  }
}

# ECR repository for StatusApp
resource "aws_ecr_repository" "statusapp" {
  name                 = "${var.project_name}-statusapp"
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "${var.project_name}-statusapp"
    Application = "StatusApp"
  }
}

# Lifecycle policy for InfoApp
resource "aws_ecr_lifecycle_policy" "infoapp" {
  repository = aws_ecr_repository.infoapp.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep only the latest 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}

# Lifecycle policy for StatusApp
resource "aws_ecr_lifecycle_policy" "statusapp" {
  repository = aws_ecr_repository.statusapp.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep only the latest 10 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
      action = {
        type = "expire"
      }
    }]
  })
}
