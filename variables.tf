variable "netlify_account_id" {
  type        = string
  description = "The account ID (team slug) for your Netlify account."
  nullable    = false
}

variable "site_files_path" {
  type        = string
  description = "The path to the directory containing the static site files."
  default     = "site"
}