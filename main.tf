data "google_billing_account" "account" {
  billing_account = var.billing_account
}

data "google_project" "project" {
    project_number = var.project_number
}

resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name    = var.display_name

  budget_filter {
    projects = ["projects/${data.google_project.project.number}"]
  }

  amount {
    specified_amount {
      currency_code = var.currency
      units         = var.budget
    }
  }

  threshold_rules {
    threshold_percent = 0.9
  }


  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.notification_channel.id,
    ]
    disable_default_iam_recipients = true
  }
}

resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = var.display_name
  type         = "email"

  labels = {
    email_address = var.email
  }
}