variable "policy_id" {
  type        = string
  description = "The backup policy id that you want to attach to the target."
}

variable "target_id" {
  type        = string
  description = "The id of the root, organizational unit, or account number that you want to attach the backup policy."
}