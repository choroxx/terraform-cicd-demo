terraform {
  required_version = ">= 1.5.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  # GitHub Actionsからリモート（君のマシン）のDockerを叩くためのエンドポイント
  # ローカルでテストする場合はデフォルトのままでOK
  host = "unix:///var/run/docker.sock"
}

# NGINXのイメージをプルする定義
resource "docker_image" "nginx" {
  name         = "nginx:1.25.3"  # latestをやめ、バージョンを明示する
  keep_locally = false
}

# コンテナを起動する定義
resource "docker_container" "web" {
  image = docker_image.nginx.image_id
  name  = "global_tech_web_server"

  ports {
    internal = 80
    external = 8080
  }
}
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}