// Configure the Google Cloud provider
provider "google" {
 project     = "magnus-bergman"
 region      = "europe-north1"
}

resource "random_id" "instance_id" {
 byte_length = 8
}


// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "flask-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"

   boot_disk {
     initialize_params {
       image = "debian-cloud/debian-9"
     }
   }
   network_interface {
     network = "default"

     access_config {
       // Include this section to give the VM an external ip address
     }
  }
}
