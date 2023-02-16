resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated" {
  depends_on = [tls_private_key.this]
  key_name   = "${var.aws_region}_${var.project_name}_${var.project_name}_keypair"
  public_key = tls_private_key.this.public_key_openssh
  tags       = var.tags
}

resource "aws_secretsmanager_secret" "pem" {
  name        = "${var.project_name}-${random_string.name.result}"
  description = "Keypair_${var.aws_region}_${var.project_name}_private_key"
  kms_key_id  = var.kms_key_id
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "pem" {
  secret_id     = aws_secretsmanager_secret.pem.id
  secret_string = tls_private_key.this.private_key_pem
}