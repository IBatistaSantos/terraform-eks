
# Terraform Infrastructure for ECS Fargate Deployment

Este repositório contém o código Terraform para provisionar uma infraestrutura na AWS que cria um cluster EKS (Elastic Kubernetes Service), incluindo VPC, subnets, roles IAM e outras dependências necessárias.


## Visão Geral

Este projeto automatiza a criaação de um cluster Kubernetes. Ele inclui a criação de uma VPC personalizada, subnets públicas, cluster, nodes além de configurações de segurança e IAM.

## Arquitetura

A infraestrutura provisionada inclui:

- **VPC Personalizada**: Com subnets públicas para acomodar o cluster.
- **EKS Cluster e Nodes**: Criando o cluster EKS e um no.
- **IAM Roles e Policies**: Para permitir que as tarefas ECS interajam com outros serviços AWS, como ECR, S3 e CloudWatch Logs.
- **CloudWatch Logs**: Para coletar logs das tarefas ECS.
- **Integração com S3**: Carregamento do Terraform State para compartilhamento do estado atual da infraestrutura

## Pré-requisitos

Antes de começar, certifique-se de ter:

- **Conta AWS Ativa**: Com permissões adequadas para criar recursos.
- **AWS CLI Configurado**: Com credenciais e região padrão configuradas.
- **Terraform Instalado**: Versão 0.12 ou superior.
- **Docker**: Para construir e enviar imagens Docker, se necessário.

## Estrutura do Projeto

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules
│   ├── vpc
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── eks
└── README.md
```

## Como Usar

### 1. Clonar o Repositório

```bash
git clone https://github.com/IBatistaSantos/terraform-eks.git
cd terraform-eks
```

### 2. Configurar Variáveis

Edite o arquivo `terraform.tfvars` com os valores apropriados:

```hcl
region                   = "us-west-2"
prefix                   = "app"
vpc_cidr_block           = "10.0.0.0/16"
cluster_name             = "new-eks"
retention_days           = 7
desired_size             = 3
max_size                 = 4
min_size                 = 2
```

### 3. Inicializar o Terraform

```bash
terraform init
```

### 4. Executar o Plano e Aplicar

Verifique o plano de execução:

```bash
terraform plan
```

Se estiver tudo certo, aplique as mudanças:

```bash
terraform apply
```

Digite `yes` quando solicitado.

## Acessando o cluster local

- Para acessar o cluster recem criado, basta rodar o seguinte codigo no terminal:

```bash
cp kubeconfig ~/.kube/config

```

## Limpeza

Para destruir todos os recursos criados pelo Terraform:

```bash
terraform destroy
```

Confirme digitando `yes` quando solicitado.

