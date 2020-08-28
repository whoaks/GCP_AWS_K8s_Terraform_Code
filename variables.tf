variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "aws_profile" {
    type = string
    default = "aks07"
}

variable "vpc_name" {
    type = string
    default = "myvpc-tf"
}

variable "aws_vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}

variable "aws_vpc_dns_hostname" {
    type = bool
    default = true
}


variable "aws_subnet_cidr" {
    default = [ "192.168.0.0/24" , "192.168.1.0/24" ]
}

variable "aws_availability_zone" {
    default = [ "ap-south-1a" , "ap-south-1b" ]
}

variable "aws_subnet_name" {
    default = [ "subnet-1" , "subnet-2" ]
}

variable "aws_ig_name" {
    default = "my-ig"
}

variable "allow_all" {
    default = "0.0.0.0/0"
}

variable "route_table_name" {
    default = "my_rt2"
}

variable "aws_sg_name" {
    default = "db_sg"
}

variable "aws_sg_tag" {
    default = "mysql_sg"
}

variable "aws_db_subnet_name" {
    default = "db-subnet"
}

variable "db_identifier" {
    default = "mydb-tf"
}

variable "db_engine" {
    default = "mysql"
}

variable "db_engine_version" {
    default = "5.7.30"
}

variable "db_instance_class" {
    default = "db.t2.micro"
}

variable "db_storage" {
    default = 10
}

variable "database_name" {
    default = "aksdb"
}

variable "database_username" {
    default = "diyaksh"
}

variable "database_password" {
    default = "whoaks1234"
}

variable "database_port" {
    default = "3306"
}

variable "db_public_accessible" {
    type = bool
    default = true
}

variable "db_parameter_name" {
    default = "default.mysql5.7"
}

variable "db_tag" {
    default = "aks30"
}

variable "gcp_credentials" {
    default = "E:/Google_GCP/credentials/aks07.json"
}

variable "gcp_project_id" {
    default = "whoaks-12345"
}

variable "gcp_region" {
    default = "asia-southeast1"
}

variable "gcp_auto_create_subnetwork" {
    type = bool
    default = false
}

variable "gcp_routing_mode" {
    default = "REGIONAL"
}

variable "gcp_subnet_name" {
    default = "mylab-tf"
}

variable "gcp_subnet_cidr" {
    default = "10.0.10.0/24"
}

variable "gcp_firewall_name" {
    default = "firewall-tf"
}

variable "gcp_protocol" {
    default = "all"
}

variable "cluster_name" {
    default = "cluster-tf"
}

variable "gcp_remove_default_node_pool" {
    type = bool
    default = true
}

variable "gcp_initial_node_count" {
    default = 1
}

variable "gcp_container_node_pool_name" {
    default = "mynode-tf"
}

variable "gcp_node_count" {
    default = 1
}

variable "gcp_container_machine_type" {
    default = "n1-standard-1"
}

variable "pod_name" {
    default = "wordpress-tf"
}

variable "pod_labels" {
    default = [ "winterfell" , "wordpress" ]
}

variable "image_name" {
    default = "wordpress"
}

variable "container_name" {
    default = "my-wp-tf"
}

variable "loadbalancer_name" {
    default = "wp-loadbalancer-tf"
}

variable "pod_expose_type" {
    default = "LoadBalancer"
}