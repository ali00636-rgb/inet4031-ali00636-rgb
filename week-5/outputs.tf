output "port_forward_command" {
  description = "Command to access the Flask application"
  value       = "kubectl port-forward --address 0.0.0.0 service/web 8080:8080"
}
