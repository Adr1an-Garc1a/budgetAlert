#VPC
variable "project_number" {
  default = "0000000000000"
}

#VPC
variable "billing_account" {
  default = "000000-0000000-0000000-000000"
}

#Subnet
variable "display_name" {
  default ="[P1]-[Billing] Alerta de facturación 90% PROYECTO"
}

#Subnet
variable "currency" {
  default ="USD"
}

#Subnet
variable "budget" {
  default ="100"
}

#Subnet
variable "display_name_email" {
  default ="sbn-service"
}

variable "email" {
  default ="sbn-service"
}