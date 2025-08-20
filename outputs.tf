output "site_url" {
  description = "The live URL of the deployed Netlify site."
  value       = "https://${netlify_site.challenge_site.name}.netlify.app"
}

output "site_admin_url" {
  description = "The administrative URL for the site in the Netlify UI."
  value       = netlify_site.challenge_site.admin_url
}