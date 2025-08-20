# The live URL for your Netlify site.
output "site_url" {
  description = "The URL of the deployed Netlify site."
  # The 'url' attribute is not supported by the AegirHealth provider.
  # We will construct the URL manually using the 'name' attribute.
  value = "https://${netlify_site.challenge_site.name}.netlify.app"
}