terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.37.0"
    }
  }
}

provider "github" {
    token ="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"
  
}

resource "github_repository" "terraformtest" {
  name  = "terraform-first-repo"
  description  = "Creating github_repository from github provider through IAC tool terrraform"
  visibility  = "public"
  auto_init  = "true"
  
}
