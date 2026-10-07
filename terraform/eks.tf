module "eks" {

  # EKS community module
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  # EKS cluster configuration
  cluster_name    = "devops-eks-cluster"
  cluster_version = "1.35"

  # Allow access to the Kubernetes API
  cluster_endpoint_public_access = true

  # Use our existing Terraform VPC
  vpc_id = module.vpc.vpc_id

  # Deploy worker nodes into private subnets
  subnet_ids = module.vpc.private_subnet_ids

  # Disable optional features not required by the original project
  enable_irsa                 = false
  create_cloudwatch_log_group = false

  # Disable EKS secret encryption and the module-created KMS key
  cluster_encryption_config = {}

  # Worker node configuration
  eks_managed_node_group_defaults = {
    instance_types = ["t2.medium"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    cluster_nodes = {
      instance_types = ["t2.medium"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }

  # Project tags
  tags = {
    Environment = "dev"
  }
}
