# 1. Configure remote state management with HCP Terraform (Terraform Cloud)
terraform {
  cloud {
    organization = "SaintBaj" # <-- Replace with your HCP organization

    workspaces {
      name = "SaintBaj" # <-- Replace with your HCP workspace name
    }
  }
}

# 2. Configure the Netlify provider
# The auth token is configured as an environment variable in the HCP workspace
provider "netlify" {}

# 3. Use the Random provider to generate a unique suffix for the site name
resource "random_pet" "site_suffix" {
  length = 2
}

# 4. Define the Netlify site resource
resource "netlify_site" "challenge_site" {
  # Create a unique site name like "hcp-challenge-clever-dog"
  name = "hcp-challenge-${random_pet.site_suffix.id}"

  repo {
    provider    = "github" 
    repo_path   = "rotbaj/NetlifyTerraform"
    repo_branch = "main" 
    dir         = var.site_files_path
  }
}