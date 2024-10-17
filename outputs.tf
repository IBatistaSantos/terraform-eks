locals {
  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.cluster.certificate_authority[0].data}
  name: kubernetes
- cluster:
    certificate-authority-data: ${aws_eks_cluster.cluster.certificate_authority[0].data}
    server: ${aws_eks_cluster.cluster.endpoint}
  name: ${aws_eks_cluster.cluster.arn}
contexts:
- context:
    cluster: kubernetes
    user: "${aws_eks_cluster.cluster.name}"
  name: "${aws_eks_cluster.cluster.name}"
- context:
    cluster: ${aws_eks_cluster.cluster.arn}
    user: "${aws_eks_cluster.cluster.arn}"
  name: ${aws_eks_cluster.cluster.arn}
current-context: ${aws_eks_cluster.cluster.arn}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.cluster.arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-west-2
      - eks
      - get-token
      - --cluster-name
      - "${aws_eks_cluster.cluster.name}"
      - --output
      - json
      command: aws
KUBECONFIG
}

resource "local_file" "kubeconfig" {
  filename = "kubeconfig"
  content = local.kubeconfig
}