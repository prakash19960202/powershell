# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "sqlserver1-1" {
  boot_disk {
    auto_delete = true
    device_name = "sqlserver"

    initialize_params {
      size = 50
      type = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "n2-standard-2"

  metadata = {
    enable-windows-ssh = "TRUE"
    ssh-keys           = "subrahmanyam113:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcMryPhc1g8Ip6UAHUXh5KZ4z55PtG32TzOGfywUiRRjrqtK/cQimnoOTLLIb6niP93xJ8xayn5hBVNIkb5xgWUNNLdqyMJfcjDtpqWETKwXBaYll9YtE+ENmG5ZBK4JjdU9cXsI4KiQafO/OOKX9VhhmBunIpbstPngZN81FRXCcfCgsD9fA4gfVT8eGmA9Hxs4yfVnUHpM54fv3UPToGNSXL85p5D8kY8+mwuMm7StOlVbqPcSdczfUTbcmPdLaaW5oOjMGjLLcloiRCowVyog/vZCFC62kD7UuexcA2M3OKuYJvNQa68mBYzDCZ70SjD3yziUeGfbWrfj3yXW2A3bMrE/idtYnPJwd0wQ/eAuyqhOa7zEO1IyzTgI/Q6brgbLeiuAduzi36gSvx+sIEx11WoTfaDhjr88sgyuKyc+2Um8fuuHddVy1z4JordS9TYblTpTnvG9s7QfIivf8/f75Jtk5qTQbAKovjliMTpUKA4vHHSQYlp5K2nAmycU8= subrahmanyam113@gmail.com"
    windows-keys       = "{\"expireOn\":\"2023-06-27T11:11:24.780807Z\",\"userName\":\"user1\",\"email\":\"subrahmanyam113@gmail.com\",\"modulus\":\"ilC1vvs5P5lMYudxhABTDYHmwxUENDGM1lbqYkQgSZEBiL9rmGfth0chkdtyS9hRJc6Z8UuIs6+2ITPF/wGm4EaHZ2YXI6H09QbudvHsulNqT/qOqmwDbLWvwsJMdCIST6/zIxMFdPlSxv09JdaIb30Hfw5VokPZ7m+p3Pq4HJt8hFPAXdUCZFfrV0OPOnqK8Kz/vH8P8pJ+Cg9Iydv+6BFEyMol8lGsNQRmhGpJzLcnSUYaa5mgFe9ymt47+5Jt5kCkKpRYhY9jamlCp7E8mXjK9/1NJrimVTUjzEuXUm4QpEPeZ220RF2n3oA0FuWgrZiw1Bd4zrP7HJzI/8g6ow==\",\"exponent\":\"AQAB\"}"
	
  }

metadata-from-file=windows-startup-script-ps1="c:\scripts\createdb.ps1"

  min_cpu_platform = "Automatic"
  name             = "sqlserver1-1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/groovy-karma-388506/regions/us-central1/subnetworks/default"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "101674418114-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-central1-a"
}


