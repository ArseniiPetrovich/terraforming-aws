output "ssl_cert" {
  value     = length(var.ssl_ca_cert) > 0 ? tls_locally_signed_cert.ssl_cert.0.cert_pem : var.ssl_cert
}

output "ssl_private_key" {
  sensitive = true
  value = length(var.ssl_ca_cert) > 0 ? tls_private_key.ssl_private_key.0.private_key_pem : var.ssl_private_key
}

