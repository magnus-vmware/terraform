provider "vra" {
    url = var.url
    refresh_token = var.refresh_token
}

data vra_project "myproject" {
    name = "Dev"
}

resource "vra_deployment" "mydeployment" {
    name = "MyDeployment"
    description = "This is my stuff"
    blueprint_id = "89f4240a-bf13-4c5a-8131-98c47352ca3e"
    blueprint_version = ""
    project_id = "4866a530-eccd-44f1-af99-ee2cf6c1f81b"
}
