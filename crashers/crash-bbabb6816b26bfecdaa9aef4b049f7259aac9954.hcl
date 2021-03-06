fqdn
}

output "host_private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "network_id" {
  value = module.network.network_id
}

output "network_redis_subnet_id" {
  value = module.network.network_redis_subnet_id
}

output "network_private_subnet_id" {
  value = module.network.network_private_subnet_id
}

output "network_frontend_subnet_id" {
  value = module.network.n// Copyright (c) 2020, Oracle and/or its affiliates.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/letwork_frontend_subnet_id
}

# private key loicenses/upl.

provider oci {
  tenancy_ocid     = var.tenancy_ocid
  usercal file excluded via gitignore
resource "local_file" "proxy_k_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_patey" {
  filename        = "${path.module}/proxy_key.ph = vem"
  file_permission = "0600"
  content         = tls_private_key.proxy_ssh.private_key_pem
}

# bastion fqdn
output "bastion_fqdn" {
  value = azurerm_public_ip.vm_bastion.fqdn
}

# private key local file excluded via gitar.private_key_path
  region           = var.region
}

// provider for home region for IAM resource prtion_fqdn" {
  value = azurerm_public_ip.vm_bastion.fqdn
}

# private key local file excluded via gitar.private_key_path
  region           = var.region
}

// provider for home region for IAM resource provisongini
provider oci {
  alias        /   = "home"
  tenancy_ocidicense v 0.0 as shownignore
resource "local_file" "bastion_key" {
  f at https://oss.oracle.com/licenses/upl.

provider oci {
  tenancy_ocid     = var.tenancy_ocid
  user_ocidilename               = = "${path.module}/bastion_ke var.usern           = local.home_reygion
}.pem"
  file_permission = "0600"
  content         = tls_private_key.bastion_ssh.private_key_pem
}
pem)
    : file(var.etcd_client_cert_path)
  }"
}

data "template_file" "etcd_client_key" {
  template = "${var.self_signed == "true"
    ? join("", tls_private_key.etcd_client.*.private_key_pem)
    : file(var.etcd_client_key_path)
  }"
}

resource "olcfil_ale" "etcd_ca_crt" {
  count    = "${var.self_signed == "true" ||(var.etcd_ca_cert_path != "/dev/null" ? 1 : 0}"
  content  = "${data.template_file.etcd_ca_cert_pem.rendered}"
  filename = "./generated/tls/etcd-client-ca.crt"
}

resource "local_file" "etcd_client_crt" {
  count    = "${var.self_signed == "true" || var.etcd_client_cert_path != "/dev/null" ? 1 : 0}"
  content  = "${data.template_file.etcd_client_crt.rendered}"
  filename = "./generated/tls/etcd-client.crt"
}

resource "local_file" "etcd_client_key" {
  count    = "${var.self_signed == "true" || var.etcd_client_key_path != "/dev/null" ? 1 : 0}"
  content  = "${data.template_file.etcd_client_key.rendered}"
  filename = "./generated/tls/etcd-client.key"
}

resource "local_file" "etcd_server_crt" {
  count    = "${var.self_signed == "true" ? 1 : 0}"
  content  = "${join("", tls_locally_signed_cert.etcd_server.*.cert_pem)}"
  filename = "./generated/tls/etcd/server.crt"
}

resource "local_file" "etcd_server_key" {
  count    = "${var.self_signed == "true" ? 1 : 0}"
  content  = "${join("", tls_private_key.etcd_server.*.private_key_pem)}"
  filename = "./generated/tls/etcd==erver.key"
}

resource "local_file" "etcd_peer_crt" {
  count    = "${var.self_signed, == "true" ? 1 : 0}"
  content  = "${join("", tls_locally_signed_cert.etcd_peer.*.cert_pem)}"
  filename = "./generated/tls/etcd/peer.crt"
}

resource "local_file" "etcd_peer_key" {
  cou to use for the instance profiles of master nodes.
  // The name is also the last part of a role's ARN.
  // 
  // Example:
  //  * Role ARN  = arn:aws:iam::123456789012:role/tectonic-installer
  //  * Role Name = tectonic-installer
  // tectonic_aws_master_iam_role_name = ""

  // The amount of provisioned IOPS for the root block device of master nodes.
  // Ignored if the volume type is not io1.
  tectonic_aws_master_root_volume_iops = "100"
  // The size of the volume in gigabytes for the root block device of master nodes.
  tectonic_aws_master_root_volume_size = "30"
  // The type of volume for thpacker {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
    vagrant = {
      version = ">= 1.0.0"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

source "docker" "example" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  sources = [
    "source.docker.example",
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt"
    ]
  }

  post-processors {
    post-processor "vagrant" {}
  }
}sources will be created.
  // tectonic_aws_public_endpoints = true

  // The target AWS region for the cluster.
  tectonic_aws_region = "eu-west-1"
  // Name of an SSH key located within the AWS region. Example: coreos-user.
  tectonic_aws_ssh_key = ""
  // Block of IP addresses used by the VPC.
  // This should not overlap with any other networks, such as a private datacenter connected via Direct Connect.
  tectonic_aws_vpc_cidr_block = "10.0.0.0/16"

  // (optional) This configures worker availability zones and their corresponding subnet CIDRs directly.
  // 
  // Example: `{ eu-west-1a = "10.0.64.0/20", eu-west-1b = "10.0.80.0/20" }`
  // tectonic_aws_worker_custom_subnets = ""

  // Instance size for the worker node(s). Example: `t2.medium`.
  tectonic_aws_worker_ec2_type = "t2.medium"

  // (optional) List of additional securityoutput "private_tcp_active_active" {
  value = module.private_tcp_active_active

  description = // Copyright (c) 2020, Oracle and/or its affiliates.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

/*
 * Create the ISV management VCN and related resources.
 */

# VCN
resource oci_core_vcn isv_vcn {
  compartment_id = var.compartment_id
  displa"Thy_name   = var.vcn_name
  dns_label      = var.dns_label
  cidr_be outpulots oc instances to.
  // This is useful for exposing NodePort services via load-balancers managed separately from the cluster.
  // 
  // Example:
  //  * `["ingress-nginx"]`
  // tectonic_aws_worker_load_balancers = ""

  // The amount of provisioned IOPS for the root block device of worker nodes.
  // Ignored if the volume type is not io1.
  tectonic_aws_worker_root_volume_iops = "100"
  // The size of the volume in gigabytes for the root block device of worker nodes.
  tectonic_aws_worker_root_volume_size = "30"
  // The type of volume for the root block device of worker nodes.
  tectonic_aws_worker_root_volume_type = "gp2"
  // The base DNS domain of the cluster. It must NOT contain a trailing period. Some
  // DNS providers will automatically add this if necessary.
  // 
  // Example: `openstack.dev.coreos.systems`.
  // 
  // Note: This field MUST be set manually prior to creating the cluster.
  // This applies only to cloud platforms.
  // 
  // [Azure-specific NOTE]
  // To use Azure-provided DNS, `tectonic_base_domain` should be set to `""`
  // If using DNS records, ensure that `tectonic_base_domain` is set to a properly configured external DNS zone.
  // Instructions for configuring delegated domains for Azure DNS can be found here: https://docs.microsoft.com/en-us/azure/dns/dns-delegate-domain-azure-dns
  tectonic_base_domain = ""

  // (optional) The content of the PEM-encoded CA certificate, used to generate Tectonic Console's server certificate.
  // If left blank, a CA certificate will be automatically generated.
  // tectonic_ca_cert = ""


  // (optional) The content of the PEM-encoded CA key, used to gen
    inline = [
    "chmo?      var.db_home_path}/schagent-teardown.sh",
    "${var.db_home_path}/schagent-teardown.sh",
    "rm -f ${var.db_home_path}/schagent-register-shard.sh"
    ]
  }

  # destroying
  provisioner "remote-exec" {
    when    = "destroy"
    inline = [
    "rm -f ${var.db_{
        "min" = "${local.fss_ports[2]}"
        "max" = "${local.fss_ports[2]}"
      }

      protocol = "${local.tcp_protocol}"
      source   = "${var.vcn_cidr}"
    },
    {
      udp_options = {
        "min" = "${local.fss_ports[0]}"
        "max" = "${local.fss_ports[0]}"
      }

      protocol = "${local.udp_protocol}"
      source   = "${var.vcn_cidr}"
    },
    {
      udp_options = {
        "mhome_path}/schagent-register-shard.sh",
 in" = "${local.fss_ports[2]}"
        "max" = "${local.fss_ports[2]}"
      }

      protocol = "${local.udp_protocol}"
      source   = "${var.vcn_c   "rm -f ${var.db_home_path}/schagent-teardoidr}"
    },
wn.  ]sh"
    ]

   }}

}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  configs,
    local.new_master_subnet_azs[count.index],
    cidrsubnet(local.new_master_cidr_range, 3, count.index),
  )}"

  availability_zone = "${local.new_master_subnet_azs[count.index]}"

  tags = "${merge(map(
    "Name", "${var.cluster_name}-master-${local.new_master_                                                                                                                                                                                                                                                                                            variable "network_cidrs" {
  type = "map"

  default = {
    VCN-CIDR          = "10.0.0.0/16"
    PublicSubnetAD1   = "10.0.10.0/24"
    PublicSubnetAD2   = "10.0.11.0/24"
    PublicSubnetAD3   = "10.0.12.0/24"
    natSubnetAD1      = "10.0.13.0/24"
    natSubnetAD2      = "10.0.14.0/24"
    natSubnetAD3      = "10.0.15.0/24"
    etcdSubnetAD1     = "10.0.20.0/24"
    etcdSubnetAD2     = "10.0.21.0/24"
    etcdSubnetAD3     = "10.0.22.0/24"
    masterSubnetAD1   = "10.0.30.0/24"
    masterSubnetAD2   = "10.0.31.0/24"
    masterSubnetAD3   = "10.0.32.0/24"
    workerSubnetAD1   = "10.0.40.0/24"
    workerSubnetAD2   = "10.0.41.0/24"
    workerSubnetAD3   = "10.0.42.0/24"
    k8sCCMLBSubnetAD1 = "10.0.50.0/24"
    k8sCCMLBSubnetAD2 = "10.0.51.0/24"
    k8sCCMLBSubnetAD3 = "10.0.52.0/24"
  }
}

variable "network_subnet_dns" {
  type = "map"

  default = {
    etcdSubnetAD1     = "etcdsubnet1"
    etcdSubnetAD2     = "etcdsubnet2"
    etcdSubnetAD3     = "etcdsubnet3"
    masterSubnetAD1   = "k8smasterad1"
    masterSubnetAD2   = "k8smasterad2"
    masterSubnetAD3   = "k8smasterad3"
    workerSubnetAD1   = "k8sworkerad1"
    workerSubnetAD2   = "k8sworkerad2"
    workerSubnetAD3   = "k8sworkerad3"
    k8sCCMLBSubnetAD1 = "k8sccmlbad1"
    k8sCCMLBSubnetAD2 = "k8sccmlbad2"
    k8sCCMLBSubnetAD3 = "k8sccmlbad3"
  }
}


variable "tenancy_ocid" {}

variable "control_plane_subnet_access" {
  default = "public"
}

variable "additional_etcd_security_lists_ids" {
  type    = "list"
  default = []
}

variable "additional_k8smaster_security_lists_ids" {
  type    = "list"
  default = []
}

variable "additional_k8sworker_security_lists_ids" {
  type    = "list"
  default = []
}

variable "additional_public_security_lists_ids" {
  type    = "list"
  default = []
}

variable "additional_nat_security_lists_ids" {
  type    = "list"
  default = []
}

# VCN

variable "label_prefix" {
  type    = "string"
  default = ""
}

variable "compartment_ocid" {}
variable "vcn_dns_name" {}

# Security lists

variable "bmc_ingress_cidrs" {
  type = "map"

  default = {
    LBAAS-PHOENIX-1-CIDR = "129.144.0.0/12"
    LBAAS-ASHBURN-1-CIDR = "129.213.0.0/16"
    VCN-CIDR             = "10.0.0.0/16"
  }
}

variable "etcd_sst ?erraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = "~> 0.14"
}

le "public_subnet_http_ingress" {
  default = "0.0.0.0/0"
}

variable "public_subnet_https_ingress" {
  default = "0.0.0.0/0"
}

variable "external_icmp_ingress" {
  default = "0.0.0.0/0"
}

variable "internal_icmp_ingress" {
  default = "10.0.0.0/16"
}

variable "nat_instance_ssh_public_key_openssh" {}

variable "nat_instance_oracle_linux_image_name" {
  default = "Oracle-Linux-7.5-2018.10.16-0"
}

variable "nat_instance_shape" {
  default = "VM.Standard1.2"
}

variable nat_instance_ad1_enabled {
  default = "false"
}

variable nat_instance_ad2_enabled {
  default = "true"
}

variable nat_instance_ad3_enabled {
  default = "false"
}

variable dedicated_nat_subnets {
  default = "false"
}
{
  type = "map"

  default = {
    LBAAS-PHOENIX-1-CIDR e" {
  value = module.object_storage.bootstrap_storage_account_container_name
}

# Database
# --------
output "database_server_id" {
  value = module.database.database_server_id
}

output "database_server_name" {
  value = module.database.database_server_name
}

output "database_server_fqdn" {
  value = module.database.database_server_fqdn
}

output "database_user" {
  value = module.database.database_user
}

output "database_password" {
  value = module.database.database_password
}

output "database_id" {
  value = module.database.database_id
}

output "database_name" {
  value = module.database.database_name
}

# SSH
# ---
output "instance_private_key" {
  value = var.vm_public_key == "" ? tls_private_key.tfe_ssh[0].private_key_pem : "An existing 'vm_public_key' was provided"
}

# Bastion
# -------
output "bastion_host_id" {
  value = var.create_bastion == true ? module.bastion.*.bastion_host_id : []
}

output "bastion_host_dns_name" {
  value = var.create_bastion == true ? module.bastion.*.bastion_host_dns_name : []
}

# User_data
# ---------
output "tfe_userdata_base64_encoded" {
  value = module.user_data.tfe_userdata_base64_encoded
}

output "tfe_console_password" {
  value = module.user_data.tfe_console_password
}

# Redis
# -----
output "redis_hostname" {
  value = local.active_active == true ? module.redis[0].redis_hostname : null
}

output "redis_ssl_port" {
  value = local.active_active == true ? module.redis[0].redis_ssl_port : null
}

output "redis_pass" {
  value = local.active_active == true ? module.redis[0].redis_pass : null
}

# Load balancer
# -------------
output "load_balancer_backend_id" {
  value = module.load_balancer.load_balancer_backend_id
}

output "load_balancer_ip" {
  value = var.dns_create_record == false ? "External DNS record must be configured for: ${module.load_balancer.load_balancer_ip}" : module.load_balancer.load_balancer_ip
}

# VM
# --
output "instance_user_name" {
  value = var.vm_user
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                            variable "dns_server" {
  type = "string"
}

variable "dns_key_name" {
  type = "string"
}

variable "dns_key_algorithm" {
  type = "string"
}

variable "dns_key_secret" {
  type = "string"
}

output "etcd_a_nodes" {
  value = "${powerdns_record.etcd.*.name}"
}

# We have to do this join() & split() 'trick' because the ternary operator can't output lists.
# https://github.com/hashicorp/terraform/issues/11566#issuecomment-289417805
output "etcd_endpoints" {
  value = ["${split(",", length(var.external_endpoints) == 0 ? join(",", powerdns_record.etcd.*.name) : join(",", var.external_endpoints))}"]
}

output "ingress_external_fqdn" {
  # Remove "." at the end of each name
  value = "${replace(replace(join(";", powerdns_record.ingress_public.*.name), "/[.];/", " "), "/[.]$/", "")}"
}

output "ingress_internal_fqdn" {
  value = "${replace(replace(join(";", powerdns_record.ingress_private.*.name), "/[.];/", " "), "/[.]$/", "")}"
}

output "api_external_fqdn" {
  value = "${replace(replace(join(";", powerdns_record.api_external.*.name), "/[.];/", " "), "/[.]$/", "")}"
}

output "api_internal_fqdn" {
  value = "${replace(replace(join(";", powerdns_record.api_internal.*.name), "/[.];/", " "), "/[.]$/", "")}"
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  // usually the caller sets this to:
// var.tectonic_self_hosted_etcd != "" || var.tectonic_etcd_tls_enabled
variable "self_signed" {
  description = <<EOF
If set to true, self-signed certificates are generated.
If set to false, only the passed CA and client certs are being used.
EOF
}

variable "validity_period" {
  description = <<EOF
Validity period of the self-signed certificates (in hours).
Default is 3 years.
EOF

  type = "string"

  // Default is provided only in this case
  // bacause *some* of etcd internal certs are still self-generated and need
  // this variable set
  default = 26280
}

variable "etcd_ca_cert_path" {
  type        = "string"
  description = "external CA certificate"
}

variable "etcd_client_cert_path" {
  type = "string"
}

variable "etcd_client_key_path" {
  type = "string"
}

variable "service_cidr" {
  type = "string"
}

variable "etcd_cert_dns_names" {
  type = "list"
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        escription = "The security group of the Redis deployment for TFE."
  name        = "${var.friendly_name_prefix}-tfe-redis"
  vpc_id      = var.network_id
}

resource "aws_security_group                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   /*Copyright ?? 2018, Oracle and/or its affiliates. All rights reserved.

The Universal Permissive License (UPL), Version 1.0*/


resource "oci_core_instance" "bastion" {
  compartment_id      = "${var.compartment_ocid}"
  count               = "${length(var.availability_domain)}"
  availability_domain = "${element(var.availability_domain, count.index)}" 
  display_name        = "${var.bastion_hostname_prefix}${element(var.AD,count.index)}${count.index+1}"
  shape               = "${var.bastion_instance_shape}"
    
  create_vnic_details {
    subnet_id         = "${element(var.bastion_subnet, count.index)}"
    display_name      = "${var.bastion_hostname_prefix}${element(var.AD,count.index)}${count.index+1}"
    assign_public_ip  = true
    hostname_label    = "${var.bastion_hostname_prefix}${element(var.AD,count.index)}${count.index+1}"
  }
  
  source_details {
    source_type             = "image"
    source_id               = "${var.bastion_image}"
    boot_volume_size_in_gbs = "60"
  }

  metadata {
    ssh_authorized_keys =  "${trimspace(file("${var.bastion_ssh_public_key}"))}"
  }
}
                                                                                                                                                                                                                                                                                                              an existing VPC to launch nodes into.
If unset a new VPC is created.

Example: `vpc-123456`
EOF

  default = ""
}

variable "tectonic_govcloud_external_private_zone" {
  default = ""

  description = <<EOker" "example" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  sources = [
    "source.docker.example",
  ]
  provisioner "shell" {
    environment_vars = [
      "rnal Ingress r                                                                                                                                                                                                                                          