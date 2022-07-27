resource "aws_db_instance" "db-instance" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "mydbsubha"
  password             = "mydbsubhal"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  backup_retention_period = 1
  multi_az = true
  vpc_security_group_ids = [aws_security_group.my_sql_server.id]
  db_subnet_group_name = aws_db_subnet_group.mysql_db_subnet_grp.name
}


resource "aws_db_subnet_group" "mysql_db_subnet_grp" {
  name       = "mysql-db-grp"
  subnet_ids = [data.aws_subnet.data_a.id, data.aws_subnet.data_b.id]

  tags = {
    Name = "MySQL DB subnet group"
  }
}