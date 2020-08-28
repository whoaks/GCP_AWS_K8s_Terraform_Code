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
    type    = string
    default = "my-ig"
}

variable "allow_all" {
    type    = string
    default = "0.0.0.0/0"
}

variable "route_table_name" {
    type    = string
    default = "my_rt2"
}

variable "aws_sg_name" {
    type    = string
    default = "db_sg"
}

variable "aws_sg_tag" {
    type    = string
    default = "mysql_sg"
}

variable "aws_db_subnet_name" {
    type    = string
    default = "db-subnet"
}

variable "db_identifier" {
    type    = string
    default = "mydb-tf"
}

variable "db_engine" {
    type    = string
    default = "mysql"
}

variable "db_engine_version" {
    type    = string
    default = "5.7.30"
}

variable "db_instance_class" {
    type    = string
    default = "db.t2.micro"
}

variable "db_storage" {
    default = 10
}

variable "database_name" {
    type    = string
    default = "aksdb"
}

variable "database_username" {
    type    = string
    default = "diyaksh"
}

variable "database_password" {
    type    = string
    default = "whoaks1234"
}

variable "database_port" {
    type    = string
    default = "3306"
}

variable "db_public_accessible" {
    type = bool
    default = true
}

variable "db_parameter_name" {
    type    = string
    default = "default.mysql5.7"
}

variable "db_tag" {
    type    = string
    default = "aks30"
}

variable "gcp_credentials" {
    type    = string
    default = "E:/Google_GCP/credentials/aks07.json"
}

variable "gcp_project_id" {
    type    = string
    default = "whoaks-12345"
}

variable "gcp_region" {
    type    = string
    default = "asia-southeast1"
}

variable "gcp_auto_create_subnetwork" {
    type = bool
    default = false
}

variable "gcp_routing_mode" {
    type    = string
    default = "REGIONAL"
}

variable "gcp_subnet_name" {
    type    = string
    default = "mylab-tf"
}

variable "gcp_subnet_cidr" {
    type    = string
    default = "10.0.10.0/24"
}

variable "gcp_firewall_name" {
    type    = string
    default = "firewall-tf"
}

variable "gcp_protocol" {
    type    = string
    default = "all"
}

variable "cluster_name" {
    type    = string
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
    type    = string
    default = "mynode-tf"
}

variable "gcp_node_count" {
    default = 1
}

variable "gcp_container_machine_type" {
    type    = string
    default = "n1-standard-1"
}

variable "pod_name" {
    type    = string
    default = "wordpress-tf"
}

variable "pod_labels" {
    default = [ "winterfell" , "wordpress" ]
}

variable "image_name" {
    type    = string
    default = "wordpress"
}

variable "container_name" {
    type    = string
    default = "my-wp-tf"
}

variable "loadbalancer_name" {
    type    = string
    default = "wp-loadbalancer-tf"
}

variable "pod_expose_type" {
    type    = string
    default = "LoadBalancer"
}
