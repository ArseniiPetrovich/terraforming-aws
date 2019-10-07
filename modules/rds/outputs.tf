output "rds_address" {
  value = var.rds_instance_count > 0 ? aws_db_instance.rds.0.address : ""
}

output "rds_port" {
  value = var.rds_instance_count > 0 ? aws_db_instance.rds.0.port : ""
}

output "rds_username" {
  value = var.rds_instance_count > 0 ? aws_db_instance.rds.0.username : ""
}

output "rds_password" {
  sensitive = true
  value     = var.rds_instance_count > 0 ? aws_db_instance.rds.0.password : ""
}

output "rds_db_name" {
  value = var.rds_instance_count > 0 ? aws_db_instance.rds.0.name: ""
}

