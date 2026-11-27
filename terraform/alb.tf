# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-alb"
  }
}

# Target Group for InfoApp
resource "aws_lb_target_group" "infoapp" {
  name        = "${var.project_name}-infoapp-tg"
  port        = 5001
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/app1/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name        = "${var.project_name}-infoapp-tg"
    Application = "InfoApp"
  }
}

# Target Group for StatusApp
resource "aws_lb_target_group" "statusapp" {
  name        = "${var.project_name}-statusapp-tg"
  port        = 5002
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/app2/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

  tags = {
    Name        = "${var.project_name}-statusapp-tg"
    Application = "StatusApp"
  }
}

# HTTP Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Path not found"
      status_code  = "404"
    }
  }
}

# Routing rule for InfoApp
resource "aws_lb_listener_rule" "infoapp" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.infoapp.arn
  }

  condition {
    path_pattern {
      values = ["/app1", "/app1/*"]
    }
  }
}

# Routing rule for StatusApp
resource "aws_lb_listener_rule" "statusapp" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.statusapp.arn
  }

  condition {
    path_pattern {
      values = ["/app2", "/app2/*"]
    }
  }
}
