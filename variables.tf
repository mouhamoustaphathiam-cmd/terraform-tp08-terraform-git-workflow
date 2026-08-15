variable "region_aws" {
  type    = string
  default = "us-east-1"

}
variable "type_instance" {
  type    = string
  default = "t2.micro"
}

variable "nom_instance" {
  type    = string
  default = "TP08-EC2"
}

variable "env" {
  type = string

}

variable "projet" {
  type = string
}

