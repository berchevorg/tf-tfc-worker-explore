resource "null_resource" "files" {
  provisioner "local-exec" {
    command = "find | sed 's|[^/]*/|- |g'"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "env" {
  provisioner "local-exec" {
    command = "env"
  }
  triggers = {
    run_every_time = uuid()
  }
}

# resource "null_resource" "cat-backend-override" {
#   provisioner "local-exec" {
#     command = "cat zzz_backend_override.tf.json"
#   }
#   triggers = {
#     run_every_time = uuid()
#   }
# }

resource "null_resource" "mem-check" {
  provisioner "local-exec" {
    #command = "cat /proc/meminfo | grep 'MemTotal'"
    command = "cat /proc/meminfo"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "run_command" {
  provisioner "local-exec" {
    command = "/usr/bin/python3 --version"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "pwd" {
  provisioner "local-exec" {
    command = "pwd"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "aws" {
  provisioner "local-exec" {
    command = "aws --version"
  }
  triggers = {
    run_every_time = uuid()
  }
}


# resource "null_resource" "az" {
#   provisioner "local-exec" {
#     command = "which az"
#   }
#   triggers = {
#     run_every_time = uuid()
#   }
# }


resource "null_resource" "sleep" {
  provisioner "local-exec" {
    command = "sleep 120"
  }
  triggers = {
    run_every_time = uuid()
  }
}
