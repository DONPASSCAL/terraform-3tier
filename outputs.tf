output "web_instance_public_ip" {
value = aws_instance.web.public_ip
}

output "app_instance_private_ip" {
value = aws_instance.app.private_ip
}

output "db_instance_private_ip" {
value = aws_instance.db.private_ip
}