/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Projects for log sinks
*****************************************/

module "org_audit_logs" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-logging"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-logging"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.org_audit_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_audit_logs_project_alert_spent_percents
  budget_amount               = var.org_audit_logs_project_budget_amount
}

module "org_billing_logs" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-billing-logs"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-billing-logs"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.org_billing_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_billing_logs_project_alert_spent_percents
  budget_amount               = var.org_billing_logs_project_budget_amount
}

/******************************************
  Project for Org-wide Secrets
*****************************************/

module "org_secrets" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-secrets"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["logging.googleapis.com", "secretmanager.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-secrets"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.org_secrets_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_secrets_project_alert_spent_percents
  budget_amount               = var.org_secrets_project_budget_amount
}

/******************************************
  Project for Org-wide Artifact Registry
*****************************************/

module "org_registry" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-registry"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["logging.googleapis.com", "artifactregistry.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-registry"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.org_registry_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_registry_project_alert_spent_percents
  budget_amount               = var.org_registry_project_budget_amount
}


/******************************************
  Project for Org-wide IaC State
*****************************************/

module "org_iac" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-iac"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["logging.googleapis.com", "storage.googleapis.com", "billingbudgets.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-iac"
    business_code    = "org"
    env_code         = "s"
  }

  budget_amount = 10
}

/******************************************
  Project for Interconnect
*****************************************/

module "interconnect" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-interconnect"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download
  activate_apis               = ["billingbudgets.googleapis.com", "compute.googleapis.com"]

  labels = {
    environment      = "shared"
    application_name = "org-interconnect"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.interconnect_project_alert_pubsub_topic
  budget_alert_spent_percents = var.interconnect_project_alert_spent_percents
  budget_amount               = var.interconnect_project_budget_amount
}

/******************************************
  Project for SCC Notifications
*****************************************/

module "scc_notifications" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-scc"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  activate_apis               = ["logging.googleapis.com", "pubsub.googleapis.com", "securitycenter.googleapis.com", "billingbudgets.googleapis.com"]
  skip_gcloud_download        = var.skip_gcloud_download

  labels = {
    environment      = "shared"
    application_name = "org-scc"
    business_code    = "org"
    env_code         = "s"
  }
  budget_alert_pubsub_topic   = var.scc_notifications_project_alert_pubsub_topic
  budget_alert_spent_percents = var.scc_notifications_project_alert_spent_percents
  budget_amount               = var.scc_notifications_project_budget_amount
}

/******************************************
  Project for DNS Hub
*****************************************/

module "dns_hub" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 8.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${var.project_prefix}-dns-hub"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.shared.id
  skip_gcloud_download        = var.skip_gcloud_download

  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = {
    environment      = "shared"
    application_name = "org-dns-hub"
    business_code    = "org"
    env_code         = "s"
  }

  budget_alert_pubsub_topic   = var.dns_hub_project_alert_pubsub_topic
  budget_alert_spent_percents = var.dns_hub_project_alert_spent_percents
  budget_amount               = var.dns_hub_project_budget_amount
}
