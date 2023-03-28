resource "random_password" "database-cluster-aurora-sunrise-prod" {
  length           = 16
  special          = false
}

resource "aws_secretsmanager_secret" "database-cluster-aurora-sunrise-prod" {
  #name = "${var.cluster_name}/aurora_master_password"
  name = "devopsforlife2_prod/aurora_master_password"
}

resource "aws_secretsmanager_secret_version" "database-cluster-aurora-sunrise-prod" {
  secret_id     = aws_secretsmanager_secret.database-cluster-aurora-sunrise-prod.id
  secret_string = random_password.database-cluster-aurora-sunrise-prod.result
}


resource "aws_rds_cluster" "database-cluster-aurora" {
  cluster_identifier      = var.cluster_name
  engine                  = "aurora-postgresql"  
  availability_zones      = var.availability_zones
  database_name           = "defaultdb"
  master_username         = var.db_username
  master_password         = random_password.database-cluster-aurora-sunrise-prod.result
  storage_encrypted       = true
  #deletion_protection     = true
  db_subnet_group_name    = var.db_subnet_group_name
  port                    = var.database_port
  skip_final_snapshot     = "true"
  backup_retention_period = 5
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.postgresql-parameter-aurora.name
  preferred_backup_window = "00:00-02:00"
  preferred_maintenance_window = "sun:03:00-sun:05:00"
}

resource "aws_rds_cluster_instance" "database_instance_aurora" {
  count                   = 1
  cluster_identifier      = aws_rds_cluster.database-cluster-aurora.id
  engine                  = aws_rds_cluster.database-cluster-aurora.engine
  engine_version          = aws_rds_cluster.database-cluster-aurora.engine_version
  #publicly_accessible     = "true"
  instance_class          = var.rds_instance_type
}

# Only printable ASCII characters besides '/', '@', '"', ' ' may be used. 

resource "aws_rds_cluster_parameter_group" "postgresql-parameter-aurora" {
  name        = "postgresql-parameter-aurora"
  family      = "aurora-postgresql14"
  description = "Parameter group for OneHouse"

  parameter {
    name  = "rds.logical_replication"
    value = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "log_replication_commands"
    value = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "log_statement"
    value = "all"
    apply_method = "pending-reboot"
  }
}



