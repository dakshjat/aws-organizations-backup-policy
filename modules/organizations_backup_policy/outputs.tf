output "id" {
  value        = aws_organizations_policy.this.id
  description  = "The name to assign to the backup policy"
}

output "arn" {
  value        = aws_organizations_policy.this.arn
  description  = "The policy content to add to the new policy"
}