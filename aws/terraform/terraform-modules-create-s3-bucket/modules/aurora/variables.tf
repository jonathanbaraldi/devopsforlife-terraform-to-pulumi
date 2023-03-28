

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "availability_zones" {
  description = "Regions for AWS HA"
  type = list(string)
  default = [ "us-east-1a", "us-east-1b"]
}


variable "database_port" {
  description = "Database port"
  type        = number
  sensitive   = true
}

variable "database_instance_name" {
  description = "Database instance name"
  type        = string  
}


variable "cluster_name" {
  description = "Cluster name"
  type        = string  
}

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string  
}


variable "rds_instance_type" {
  description = "Instance type for RDS instance"
  type = string
  
}


variable "db_subnet_group_name" {
  description = "Database SubnetGroup"
  type        = string  
}
