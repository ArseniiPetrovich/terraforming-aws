output "bucket" {
  value = length(aws_s3_bucket.ops_manager_bucket) > 0? aws_s3_bucket.ops_manager_bucket.0.bucket : ""
}

output "public_ip" {
  value = local.ops_man_vm && length(aws_eip.ops_manager_attached) > 0 ? aws_eip.ops_manager_attached.0.public_ip : length(aws_eip.ops_manager_attached) > 0 ? aws_eip.ops_manager_unattached.0.public_ip : ""
}

output "dns" {
  value = local.ops_man_vm && length(aws_route53_record.ops_manager_attached_eip) > 0 ? aws_route53_record.ops_manager_attached_eip.0.name : length(aws_route53_record.ops_manager_unattached_eip) > 0 ? aws_route53_record.ops_manager_unattached_eip.0.name : ""
}

output "optional_dns" {
  value = length(aws_route53_record.optional_ops_manager) > 0 ? aws_route53_record.optional_ops_manager.0.name : ""
}

output "optional_public_ip" {
  value = length(aws_eip.optional_ops_manager) > 0 ? aws_eip.optional_ops_manager.0.public_ip : ""
}

output "security_group_id" {
  value = length(aws_security_group.ops_manager_security_group) > 0 ? aws_security_group.ops_manager_security_group.0.id : ""
}

output "ssh_private_key" {
  value = length(tls_private_key.ops_manager) > 0 ? tls_private_key.ops_manager.0.private_key_pem : ""
  sensitive = true
}

output "ssh_public_key_name" {
  value = length(aws_key_pair.ops_manager) > 0 ? aws_key_pair.ops_manager.0.key_name : ""
}

output "ssh_public_key" {
  value = length(aws_key_pair.ops_manager) > 0 ? aws_key_pair.ops_manager.0.public_key : ""
}

output "ops_manager_private_ip" {
  value = length(aws_instance.ops_manager) > 0 ? aws_instance.ops_manager.0.private_ip : ""
}

output "ops_manager_iam_instance_profile_name" {
  value = length(aws_iam_instance_profile.ops_manager) > 0 ? aws_iam_instance_profile.ops_manager.0.name : ""
}

output "ops_manager_iam_user_name" {
  value = length(aws_iam_user.ops_manager) > 0 ? aws_iam_user.ops_manager.0.name : ""
}

output "ops_manager_iam_user_access_key" {
  value = length(aws_iam_access_key.ops_manager) > 0 ? aws_iam_access_key.ops_manager.0.id : ""
}

output "ops_manager_iam_user_secret_key" {
  value     = length(aws_iam_access_key.ops_manager) > 0 ? aws_iam_access_key.ops_manager.0.secret : ""
  sensitive = true
}

output "ops_manager_iam_role_name" {
  value = aws_iam_role.ops_manager.name
}
