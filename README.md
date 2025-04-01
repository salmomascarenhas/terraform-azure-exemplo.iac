# ☁️ Terraform Infraestrutura - Azure (Estudo Pessoal)

Este projeto contém uma infraestrutura simples utilizando **Terraform** para provisionar recursos no **Microsoft Azure**: um **Resource Group** e uma **Virtual Network (VNet)**.

> 🧪 Este repositório é voltado para fins educacionais e prática com Azure e Terraform.

---

## 📁 Estrutura do Projeto

```
.
├── main.tf         # Define os recursos: Resource Group e VNet
├── providers.tf    # Configuração do provider da Azure
├── .terraform/     # Diretório criado após terraform init
└── README.md       # Este guia
```

---

## ⚙️ Passo a Passo para Testar

### 1. ✅ Pré-requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.3
- Conta na [Azure](https://portal.azure.com/)
- [Azure CLI (az)](https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli) instalado na máquina

---

### 2. 🔐 Autenticar no Azure via CLI

```bash
az login
```

> Se você estiver usando SSO (ex: conta corporativa):
```bash
az login --use-device-code
```

---

### 3. 🧾 Ajustar o Provider (providers.tf)

Certifique-se de que seu `providers.tf` esteja assim:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
```

---

### 4. 💻 Executar o Terraform

```bash
# Inicialize o projeto
terraform init

# Verifique o que será criado
terraform plan

# Aplique a infraestrutura
terraform apply

# (Opcional) Remover todos os recursos
terraform destroy
```

---

## 🏗️ Recursos Criados

- **Resource Group**
  - Nome: `rg-terraform`
  - Região: `brazilsouth`
  - Tags: ambiente `dev`, IAC `true`

- **Virtual Network (VNet)**
  - Nome: `vnet-terraform`
  - Address space: `10.0.0.0/16`
  - Associada ao Resource Group acima

---

## 🔗 Documentação Útil

- 📚 Terraform Provider Azure:  
  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

- 📖 Documentação oficial do Azure CLI:  
  https://learn.microsoft.com/cli/azure/

- 📘 Recursos Terraform para Azure:  
  https://learn.microsoft.com/en-us/azure/developer/terraform/

---

## 🧪 Objetivo

Este repositório visa praticar:

- Uso do Terraform com Azure
- Provisionamento básico (resource group + VNet)
- Boas práticas de organização de infraestrutura

---

## 📃 Licença

MIT
