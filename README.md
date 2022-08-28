# AWS Organizations Backup Policy
### Manage AWS Organizations Backup Policy using Terraform

![Architecture Diagrams](https://user-images.githubusercontent.com/47545538/187096825-801ed6c4-5d81-4def-b229-eb7bee39f7d8.jpg)
Use Terraform IaC to create AWS AWS Organizations Backup Policies and attach them to the organization root, organizational unit (OU), or account within your organization.

With AWS Backup, you can create backup plans to define how to back up your AWS resources using tags. It contains rules with various settings such as backup frequency, time windows, region, vault, etc. For more information on AWS Backup, visit [AWS Backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html). 

AWS Organizations Backup Policies can be attached to different parts of the organization tree and will inherit policies in the organization's root, parent OUs, or the account. By leveraging the same, you can manage combinations of backup policies for different organization levels centrally.

For more information, visit [AWS Organizations Backup Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html).
___
* As a prerequisite, AWS Backup Vault to store backups and the IAM role for AWS Backup to use to perform the backup jobs must exist in your AWS accounts that you want to add backup policies to.
* Terraform resources 'aws_organizations_policy' with type BACKUP_POLICY is used to create backup policies, and 'aws_organizations_policy_attachment' to attach backup policies to an organization account, root, or unit as a target.
* In the 'aws_organizations_policy' content parameter, the backup policy is structured as JSON. You can create a backup policy according to your requirement. For more information, visit [Backup policy syntax and examples](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup_syntax.html).

For more information, visit Terraform resource [aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy) and [aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment).

For more information on best practices for using backup policies, visit [Best practices for using backup policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup_best-practices.html).

Additionally, you can use [AWS Backup Monitoring](https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html) and [Audit backups and create reports with AWS Backup Audit Manager](https://docs.aws.amazon.com/aws-backup/latest/devguide/aws-backup-audit-manager.html).