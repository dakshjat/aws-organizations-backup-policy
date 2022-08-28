resource "aws_organizations_policy" "this" {
  name = var.name
  type = "BACKUP_POLICY"
  content = var.content
}