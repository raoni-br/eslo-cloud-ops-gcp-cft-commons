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

project_prefix = "eslo-shared"

domains_to_allow = ["eslo.com.br"]

billing_data_users = "gcp.billing-admin@eslo.com.br"

audit_data_users = "gcp.org-admins@eslo.com.br"

org_id = "972983908711"

billing_account = "014D90-2E1331-0F1156"

terraform_service_account = "org-terraform@eslo-seed-4117.iam.gserviceaccount.com"

default_region = "southamerica-east1"

scc_notification_name = "scc-notify"

skip_gcloud_download = true

# create_access_context_manager_access_policy = false

data_access_logs_enabled = false


dns_hub_project_budget_amount           = 1
interconnect_project_budget_amount      = 1
org_secrets_project_budget_amount       = 1
org_registry_project_budget_amount      = 1
org_billing_logs_project_budget_amount  = 1
org_audit_logs_project_budget_amount    = 1
scc_notifications_project_budget_amount = 1

projects_allowed_public_access = ["prj-e2c-n-platform-ee5b", "prj-e2c-p-platform-bb51"]