# Terraform Challenge: Netlify Site + HCP Terraform Remote State

This repository contains the infrastructure-as-code to deploy a static website on Netlify, with its state managed remotely and securely in HCP Terraform.

**Live Site URL:** `[Link to your deployed Netlify site]`

![Terraform Apply Screenshot](path/to/your/screenshot.png)

---

## 🚀 Overview

This project accomplishes the following objectives:
- **Deploys a static site** from the `/site` directory to Netlify.
- **Uses HCP Terraform** as the remote backend for secure, collaborative state management.
- **Generates a unique site name** on each deployment using the `random` provider.
- **Keeps all secrets** (like API tokens) out of the repository by storing them as variables in the HCP Terraform workspace.

## ✅ Prerequisites

Before you begin, you will need:
1.  **Terraform CLI:** Version `1.5.0` or newer.
2.  **A Netlify Account:** A free account is sufficient.
3.  **An HCP Terraform Account:** A free account is sufficient.
4.  **A GitHub Account:** To host your forked/cloned repository.

## ⚙️ Setup and Configuration

Follow these steps to configure your environment and deploy the site.

### 1. Fork and Clone the Repository

Fork this repository to your own GitHub account and then clone it to your local machine:
```bash
git clone [https://github.com/YOUR_USERNAME/terraform-netlify-challenge.git](https://github.com/YOUR_USERNAME/terraform-netlify-challenge.git)
cd terraform-netlify-challenge
```

### 2. Configure Netlify Credentials

1.  Log in to your Netlify account.
2.  Go to **User settings > Applications > Personal access tokens**.
3.  Click **New personal access token**, give it a description (e.g., "Terraform Challenge"), and copy the generated token. **You will not see this token again.**
4.  Find your **Netlify Account ID** (also called the team slug). Go to **Team settings**, and you'll find the "Team slug" under the "General" section. It's the part of the URL like `app.netlify.com/teams/YOUR-SLUG/`.

### 3. Configure HCP Terraform (Terraform Cloud)

1.  **Create an Organization:** Log in to your HCP Terraform account and create a new organization (e.g., `your-name-hcp`).
2.  **Create a Workspace:** Inside your organization, create a new **CLI-driven** workspace. Name it something like `hcp-netlify-challenge`.
3.  **Update `main.tf`:** In the `main.tf` file, update the `cloud` block with your organization and workspace names:
    ```terraform
    terraform {
      cloud {
        organization = "your-hcp-organization-name" # <-- Your organization
        workspaces {
          name = "hcp-netlify-challenge"      # <-- Your workspace
        }
      }
    }
    ```
4.  **Set Workspace Variables:** In your HCP workspace, go to **Variables**. Add the following variables. **Mark the token as Sensitive**.
    - **`NETLIFY_TOKEN`**:
        - **Type:** Environment Variable
        - **Key:** `NETLIFY_TOKEN`
        - **Value:** Your Netlify Personal Access Token from step 2.
        - **Sensitive:** ✅ Yes
    - **`TF_VAR_netlify_account_id`**:
        - **Type:** Terraform Variable
        - **Key:** `netlify_account_id`
        - **Value:** Your Netlify Account ID (team slug) from step 2.
        - **Sensitive:** ❌ No

### 4. How to Run

1.  **Log in to HCP Terraform:** Open your terminal and run the login command. Follow the prompts to authenticate in your browser.
    ```bash
    terraform login
    ```
2.  **Initialize Terraform:** This will download the necessary providers and connect to your HCP workspace.
    ```bash
    terraform init
    ```
3.  **Plan the Deployment:** Review the changes Terraform will make.
    ```bash
    terraform plan
    ```
4.  **Apply the Changes:** If the plan looks correct, apply it to deploy your site.
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm.

## 📊 Outputs

After a successful `apply`, Terraform will output the following:
- **`site_url`**: The public URL where your live website is accessible.
- **`site_admin_url`**: The URL to manage your site in the Netlify dashboard.