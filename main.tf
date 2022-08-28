provider "aws" {
  region = "ap-south-1"
}

module "daily_backup_policy" {
  source = "./modules/organizations_backup_policy"

  name = "DailyBackup"
  content =  <<CONTENT
{
    "plans": {
        "DailyBackupPlan": {
            "regions": {
                "@@assign": [
                    "us-east-1",
                    "us-east-2"
                ]
            },
            "rules": {
                "DailyBackupRule": {
                    "schedule_expression": {
                        "@@assign": "cron(0 0 * * ? *)"
                    },
                    "start_backup_window_minutes": {
                        "@@assign": "60"
                    },
                    "complete_backup_window_minutes": {
                        "@@assign": "360"
                    },
                    "lifecycle": {
                        "delete_after_days": {
                            "@@assign": "7"
                        }
                    },
                    "target_backup_vault_name": {
                        "@@assign": "Default"
                    },
                    "recovery_point_tags": {
                        "BackupPlan": {
                            "tag_key": {
                                "@@assign": "BackupPlan"
                            },
                            "tag_value": {
                                "@@assign": "DailyBackup"
                            }
                        }
                    },
                    "enable_continuous_backup": {
                        "@@assign": false
                    }
                }
            },
            "selections": {
                "tags": {
                    "DailyBackupAssignment": {
                        "iam_role_arn": {
                            "@@assign": "arn:aws:iam::$account:role/service-role/AWSBackupDefaultServiceRole"
                        },
                        "tag_key": {
                            "@@assign": "DailyBackup"
                        },
                        "tag_value": {
                            "@@assign": [
                                "True"
                            ]
                        }
                    }
                }
            }
        }
    }
}
CONTENT
}

module "weekly_backup_policy" {
  source = "./modules/organizations_backup_policy"

  name = "WeeklyBackup"
  content =  <<CONTENT
{
    "plans": {
        "WeeklyBackupPlan": {
            "regions": {
                "@@assign": [
                    "us-east-1",
                    "us-east-2"
                ]
            },
            "rules": {
                "WeeklyBackupRule": {
                    "schedule_expression": {
                        "@@assign": "cron(0 6 ? * SUN *)"
                    },
                    "start_backup_window_minutes": {
                        "@@assign": "60"
                    },
                    "complete_backup_window_minutes": {
                        "@@assign": "360"
                    },
                    "lifecycle": {
                        "delete_after_days": {
                            "@@assign": "7"
                        }
                    },
                    "target_backup_vault_name": {
                        "@@assign": "Default"
                    },
                    "recovery_point_tags": {
                        "BackupPlan": {
                            "tag_key": {
                                "@@assign": "BackupPlan"
                            },
                            "tag_value": {
                                "@@assign": "WeeklyBackup"
                            }
                        }
                    },
                    "enable_continuous_backup": {
                        "@@assign": false
                    }
                }
            },
            "selections": {
                "tags": {
                    "WeeklyBackupAssignment": {
                        "iam_role_arn": {
                            "@@assign": "arn:aws:iam::$account:role/service-role/AWSBackupDefaultServiceRole"
                        },
                        "tag_key": {
                            "@@assign": "WeeklyBackup"
                        },
                        "tag_value": {
                            "@@assign": [
                                "True"
                            ]
                        }
                    }
                }
            }
        }
    }
}
CONTENT
}

module "monthly_backup_policy" {
  source = "./modules/organizations_backup_policy"

  name = "MonthlyBackup"
  content =  <<CONTENT
{
    "plans": {
        "MonthlyBackupPlan": {
            "regions": {
                "@@assign": [
                    "us-east-1",
                    "us-east-2"
                ]
            },
            "rules": {
                "MonthlyBackupRule": {
                    "schedule_expression": {
                        "@@assign": "cron(0 12 1 * ? *)"
                    },
                    "start_backup_window_minutes": {
                        "@@assign": "60"
                    },
                    "complete_backup_window_minutes": {
                        "@@assign": "360"
                    },
                    "lifecycle": {
                        "delete_after_days": {
                            "@@assign": "7"
                        }
                    },
                    "target_backup_vault_name": {
                        "@@assign": "Default"
                    },
                    "recovery_point_tags": {
                        "BackupPlan": {
                            "tag_key": {
                                "@@assign": "BackupPlan"
                            },
                            "tag_value": {
                                "@@assign": "MonthlyBackup"
                            }
                        }
                    },
                    "enable_continuous_backup": {
                        "@@assign": false
                    }
                }
            },
            "selections": {
                "tags": {
                    "MonthlyBackupAssignment": {
                        "iam_role_arn": {
                            "@@assign": "arn:aws:iam::$account:role/service-role/AWSBackupDefaultServiceRole"
                        },
                        "tag_key": {
                            "@@assign": "MonthlyBackup"
                        },
                        "tag_value": {
                            "@@assign": [
                                "True"
                            ]
                        }
                    }
                }
            }
        }
    }
}
CONTENT
}

module "yearly_backup_policy" {
  source = "./modules/organizations_backup_policy"

  name = "YearlyBackup"
  content =  <<CONTENT
{
    "plans": {
        "YearlyBackupPlan": {
            "regions": {
                "@@assign": [
                    "us-east-1",
                    "us-east-2"
                ]
            },
            "rules": {
                "YearlyBackupRule": {
                    "schedule_expression": {
                        "@@assign": "cron(0 18 1 1 ? *)"
                    },
                    "start_backup_window_minutes": {
                        "@@assign": "60"
                    },
                    "complete_backup_window_minutes": {
                        "@@assign": "360"
                    },
                    "lifecycle": {
                        "delete_after_days": {
                            "@@assign": "7"
                        }
                    },
                    "target_backup_vault_name": {
                        "@@assign": "Default"
                    },
                    "recovery_point_tags": {
                        "BackupPlan": {
                            "tag_key": {
                                "@@assign": "BackupPlan"
                            },
                            "tag_value": {
                                "@@assign": "YearlyBackup"
                            }
                        }
                    },
                    "enable_continuous_backup": {
                        "@@assign": false
                    }
                }
            },
            "selections": {
                "tags": {
                    "YearlyBackupAssignment": {
                        "iam_role_arn": {
                            "@@assign": "arn:aws:iam::$account:role/service-role/AWSBackupDefaultServiceRole"
                        },
                        "tag_key": {
                            "@@assign": "YearlyBackup"
                        },
                        "tag_value": {
                            "@@assign": [
                                "True"
                            ]
                        }
                    }
                }
            }
        }
    }
}
CONTENT
}

data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_units" "ou" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

data "aws_caller_identity" "current" {}

module "daily_backup_policy_attachment" {
  source = "./modules/organizations_backup_policy_attachment"

  policy_id = module.daily_backup_policy.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}

module "weekly_backup_policy_attachment" {
  source = "./modules/organizations_backup_policy_attachment"

  policy_id = module.weekly_backup_policy.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}

module "monthly_backup_policy_attachment" {
  source = "./modules/organizations_backup_policy_attachment"

  policy_id = module.monthly_backup_policy.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}

module "yearly_backup_policy_attachment" {
  source = "./modules/organizations_backup_policy_attachment"

  policy_id = module.yearly_backup_policy.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}