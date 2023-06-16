output "lb_dns_name" {
  value = aws_lb.main.dns_name
}

output "lb_listner_arn" {
  value = var.internal? aws_lb_listener.main[0].arn: aws_lb_listener.public-https[0].arn
}

output "lb_arn" {
  value = aws_lb.main.arn
}