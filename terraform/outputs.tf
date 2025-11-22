output "master_public_ip" {
  description = "Public IP of Spark Master"
  value       = google_compute_instance.master.network_interface[0].access_config[0].nat_ip
}

output "master_private_ip" {
  description = "Private IP of Spark Master"
  value       = google_compute_instance.master.network_interface[0].network_ip
}

output "worker_public_ips" {
  description = "Public IPs of Spark Workers"
  value       = [for w in google_compute_instance.workers : w.network_interface[0].access_config[0].nat_ip]
}

output "worker_private_ips" {
  description = "Private IPs of Spark Workers"
  value       = [for w in google_compute_instance.workers : w.network_interface[0].network_ip]
}

output "edge_public_ip" {
  description = "Public IP of Spark Edge node"
  value       = google_compute_instance.edge.network_interface[0].access_config[0].nat_ip
}

output "edge_private_ip" {
  description = "Private IP of Spark Edge node"
  value       = google_compute_instance.edge.network_interface[0].network_ip
}
