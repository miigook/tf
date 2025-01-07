locals {
  common_tags = {
    Env = var.environment
    Department = var.department
    Team = var.team
    Project = var.project
    Managedby = var.managedby
    Owner = var.owner
    
  }
  Name = "${var.cloud}-${var.region}-${var.team}-${var.environment}-${var.app-tier}-%s"
}

