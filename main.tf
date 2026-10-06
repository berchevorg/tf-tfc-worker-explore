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

 resource "null_resource" "df" {
   provisioner "local-exec" {
     command = "df -hT"
   }
   triggers = {
     run_every_time = uuid()
   }
}

resource "null_resource" "mem-check" {
  provisioner "local-exec" {
    #command = "cat /proc/meminfo | grep 'MemTotal'"
    command = "cat /proc/meminfo"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "cpu" {
  provisioner "local-exec" {
    command = "find /sys/fs/cgroup/ -name "*quota*" -o -name "*cpu.max*" 2>/dev/null"
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


resource "null_resource" "free-m" {
   provisioner "local-exec" {
     command = "free -m"
   }
   triggers = {
     run_every_time = uuid()
   }
 }


#resource "null_resource" "sleep" {
#  provisioner "local-exec" {
#    command = "sleep 120"
 # }
#  triggers = {
#    run_every_time = uuid()
#  }
#}
