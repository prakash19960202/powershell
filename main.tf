# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "sqlserver1-2" {
  boot_disk {
    auto_delete = true
    device_name = "sqlserver"

    initialize_params {
 	image = "https://www.googleapis.com/compute/v1/projects/groovy-karma-388506/global/images/sqlserver1"
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
    startup-script     = "$SQL=\"CREATE DATABASE [DB1]\n CONTAINMENT = NONE\n ON  PRIMARY \n( NAME = N'DB1', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL14.SQL2017\\MSSQL\\DATA\\DB1.mdf' , SIZE = 524288KB , FILEGROWTH = 65536KB )\n LOG ON \n( NAME = N'DB1_log', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL14.SQL2017\\MSSQL\\DATA\\DB1_log.ldf' , SIZE = 262144KB , FILEGROWTH = 65536KB )\nGO\nALTER DATABASE [DB1] SET COMPATIBILITY_LEVEL = 140\nGO\nALTER DATABASE [DB1] SET ANSI_NULL_DEFAULT OFF \nGO\nALTER DATABASE [DB1] SET ANSI_NULLS OFF \nGO\nALTER DATABASE [DB1] SET ANSI_PADDING OFF \nGO\nALTER DATABASE [DB1] SET ANSI_WARNINGS OFF \nGO\nALTER DATABASE [DB1] SET ARITHABORT OFF \nGO\nALTER DATABASE [DB1] SET AUTO_CLOSE OFF \nGO\nALTER DATABASE [DB1] SET AUTO_SHRINK OFF \nGO\nALTER DATABASE [DB1] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)\nGO\nALTER DATABASE [DB1] SET AUTO_UPDATE_STATISTICS ON \nGO\nALTER DATABASE [DB1] SET CURSOR_CLOSE_ON_COMMIT OFF \nGO\nALTER DATABASE [DB1] SET CURSOR_DEFAULT  GLOBAL \nGO\nALTER DATABASE [DB1] SET CONCAT_NULL_YIELDS_NULL OFF \nGO\nALTER DATABASE [DB1] SET NUMERIC_ROUNDABORT OFF \nGO\nALTER DATABASE [DB1] SET QUOTED_IDENTIFIER OFF \nGO\nALTER DATABASE [DB1] SET RECURSIVE_TRIGGERS OFF \nGO\nALTER DATABASE [DB1] SET  DISABLE_BROKER \nGO\nALTER DATABASE [DB1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF \nGO\nALTER DATABASE [DB1] SET DATE_CORRELATION_OPTIMIZATION OFF \nGO\nALTER DATABASE [DB1] SET PARAMETERIZATION SIMPLE \nGO\nALTER DATABASE [DB1] SET READ_COMMITTED_SNAPSHOT OFF \nGO\nALTER DATABASE [DB1] SET  READ_WRITE \nGO\nALTER DATABASE [DB1] SET RECOVERY FULL \nGO\nALTER DATABASE [DB1] SET  MULTI_USER \nGO\nALTER DATABASE [DB1] SET PAGE_VERIFY CHECKSUM  \nGO\nALTER DATABASE [DB1] SET TARGET_RECOVERY_TIME = 60 SECONDS \nGO\nALTER DATABASE [DB1] SET DELAYED_DURABILITY = DISABLED \nGO\nUSE [DB1]\nGO\nALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;\nGO\nALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;\nGO\nALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;\nGO\nALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;\nGO\nALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;\nGO\nALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;\nGO\nALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;\nGO\nALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;\nGO\nUSE [DB1]\nGO\nIF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [DB1] MODIFY FILEGROUP [PRIMARY] DEFAULT\nGO\nUSE [DB1]\nGO\n\n/****** Object:  Table [dbo].[Table_1]    Script Date: 6/27/2023 11:16:20 AM ******/\nSET ANSI_NULLS ON\nGO\n\nSET QUOTED_IDENTIFIER ON\nGO\n\nCREATE TABLE [dbo].[Table_1](\n\t[name] [nchar](10) NULL,\n\t[id] [int] NULL\n) ON [PRIMARY]\nGO\n\n\"\ninvoke-sqlcmd -serverinstance sqlserver\\sql2017 -u sa -p \"Prakash@123\" -database master -query $SQL"
    windows-keys       = "{\"expireOn\":\"2023-06-27T11:11:24.780807Z\",\"userName\":\"user1\",\"email\":\"subrahmanyam113@gmail.com\",\"modulus\":\"ilC1vvs5P5lMYudxhABTDYHmwxUENDGM1lbqYkQgSZEBiL9rmGfth0chkdtyS9hRJc6Z8UuIs6+2ITPF/wGm4EaHZ2YXI6H09QbudvHsulNqT/qOqmwDbLWvwsJMdCIST6/zIxMFdPlSxv09JdaIb30Hfw5VokPZ7m+p3Pq4HJt8hFPAXdUCZFfrV0OPOnqK8Kz/vH8P8pJ+Cg9Iydv+6BFEyMol8lGsNQRmhGpJzLcnSUYaa5mgFe9ymt47+5Jt5kCkKpRYhY9jamlCp7E8mXjK9/1NJrimVTUjzEuXUm4QpEPeZ220RF2n3oA0FuWgrZiw1Bd4zrP7HJzI/8g6ow==\",\"exponent\":\"AQAB\"}"
	
  }



  min_cpu_platform = "Automatic"
  name             = "sqlserver1-2"

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


