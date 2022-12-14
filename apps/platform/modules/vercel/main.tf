# Testing deployment

terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
    }
  }
}

resource "vercel_project" "example" {
  id        = "tec2000"
  name      = "tec2000"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "algoflows/tec2000.com"
  }

  ignore_command = "npx nx-ignore next-web"
}

resource "vercel_project_domain" "domain" {
  project_id = vercel_project.example.id
  domain     = "dev-tec2000.vercel.app"
  git_branch = "dev"
}

resource "vercel_deployment" "deployment" {
  project_id = vercel_project.example.id
  production = false
  ref        = "dev"
  project_settings = {
    build_command    = "npx nx build next-web --prod"
    output_directory = "./dist/apps/next-web/.next"
  }
}
