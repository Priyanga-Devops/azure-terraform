# Azure Infrastructure Automation using Terraform

## 1. Project Overview

This project demonstrates how to provision and manage Microsoft Azure infrastructure using Terraform, an Infrastructure as Code (IaC) tool.

The objective is to build a structured Azure network environment using reusable, version-controlled configuration files. The project also demonstrates Git and GitHub workflows for managing infrastructure code.

I am developing this project as part of my hands-on learning journey to strengthen my Azure, Terraform, and DevOps skills.

## 2. Project Objectives

- Understand Infrastructure as Code using Terraform.
- Automate Azure infrastructure configuration.
- Create and manage Azure resource groups and virtual networks.
- Configure subnets within a virtual network.
- Use Terraform variables and outputs to improve maintainability.
- Manage infrastructure code using Git and GitHub.
- Practise feature branches, pull requests, code reviews, and merging changes into the main branch.
- Follow a structured workflow for infrastructure changes.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| Microsoft Azure | Cloud infrastructure platform |
| Terraform | Infrastructure as Code |
| Azure CLI | Azure command-line management and authentication |
| Ubuntu on WSL | Local development environment |
| Git | Version control |
| GitHub | Source code hosting and collaboration |
| HCL | Terraform configuration language |

## 4. Architecture Overview

The project currently focuses on the Azure networking foundation.

```text
Microsoft Azure
       |
       └── Resource Group
             |
             └── Virtual Network
                   |
                   └── Web Subnet
```

### Resource configuration

| Resource | Name / Configuration |
|---|---|
| Resource Group | `rg-terraform-devops` |
| Azure Region | `uksouth` |
| Virtual Network | `vnet_terraform_devops` |
| VNet Address Space | `10.0.0.0/16` |
| Web Subnet | `snet-web` |
| Web Subnet Address Range | `10.0.0.0/24` |

The web subnet address range is contained within the virtual network address space.

**Note:** The resource group and virtual network were previously created in Azure. The web subnet configuration has been added to the Terraform code and merged into the GitHub `main` branch. The subnet's deployed status should be verified separately in Azure.

## 5. Project Structure

```text
azure-terraform/
├── .gitignore
├── README.md
└── terraform/
    ├── main.tf
    ├── providers.tf
    ├── variable.tf
    ├── output.tf
    └── modules/
        └── network/
```

### File descriptions

- `main.tf` — Defines the Azure resources, including the resource group, virtual network, and web subnet.
- `providers.tf` — Configures the Terraform and Azure provider requirements.
- `variable.tf` — Defines configurable values such as resource names and network address ranges.
- `output.tf` — Defines outputs for resource details, including the virtual network and web subnet information.
- `.gitignore` — Excludes local files such as Terraform state files and other generated files that should not be committed.
- `modules/network/` — Directory reserved for organising reusable network configuration as the project grows.

## 6. Implementation Steps

### Step 1: Set up the development environment

Installed and configured the required tools:

- Ubuntu using Windows Subsystem for Linux (WSL)
- Azure CLI
- Terraform
- Git

### Step 2: Configure the Terraform project

Created the Terraform configuration files to organise provider settings, resource definitions, variables, and outputs.

### Step 3: Configure the Azure resource group

Defined the resource group configuration in Terraform and created the resource group in Azure.

### Step 4: Create the virtual network

Configured the virtual network with the address space `10.0.0.0/16`.

### Step 5: Configure the web subnet

Added a subnet resource to `main.tf` using Terraform variables:

- Subnet name: `snet-web`
- Subnet address range: `10.0.0.0/24`

Added outputs to display the subnet name and address range.

### Step 6: Apply Git and GitHub best practices

Used a feature branch to manage the subnet changes separately from the main branch.

The workflow was:

```text
Update Terraform configuration
            |
            v
Create feature branch
            |
            v
Stage and commit changes
            |
            v
Push branch to GitHub
            |
            v
Create pull request
            |
            v
Review and merge into main
```

This workflow helps keep infrastructure changes organised and reviewable.

## 7. Terraform Commands

The following commands are useful when working with the project.

Format Terraform files:

```bash
terraform fmt -recursive
```

Validate the configuration:

```bash
cd terraform
terraform validate
```

Check the current Git status:

```bash
git status
```

Create a feature branch:

```bash
git switch -c feature/example-change
```

Stage specific Terraform files:

```bash
git add terraform/main.tf terraform/variable.tf terraform/output.tf
```

Commit the changes:

```bash
git commit -m "Update Azure network configuration"
```

Push the branch:

```bash
git push -u origin feature/example-change
```

**Important:** Formatting, validation, and Git operations do not deploy Azure resources. Terraform commands such as `plan` may require working Azure authentication in this project, while `apply` can create or modify resources and potentially incur charges.

## 8. Version Control and Collaboration

GitHub is used to maintain the Terraform configuration and track changes.

The project follows these practices:

- Keep infrastructure code under version control.
- Use descriptive commit messages.
- Make changes on feature branches.
- Submit pull requests for review.
- Merge reviewed changes into the main branch.
- Exclude Terraform state files and sensitive information from source control.

## 9. Challenges and Troubleshooting

During development, I encountered Azure CLI authentication issues while running Terraform from Ubuntu on WSL.

Although the resource group and virtual network had previously been created, subsequent authentication attempts returned an Azure sign-in error.

I investigated the CLI authentication context and reviewed the tenant's Security Defaults setting. This highlighted the importance of understanding the difference between Azure Portal access, Azure CLI authentication, and Terraform provider authentication.

The authentication issue remains a separate troubleshooting task and needs to be resolved before continuing with authenticated Terraform operations.

## 10. Security and Cost Considerations

- Avoid committing credentials, access tokens, or other secrets to GitHub.
- Do not commit Terraform state files.
- Review Terraform plans before applying infrastructure changes.
- Check Azure resources and estimated costs before deployment.
- Remove unused resources when they are no longer needed, after checking their dependencies.
- Use least-privilege access wherever possible.

## 11. Future Enhancements

Planned improvements include:

- Add application and database subnets with non-overlapping address ranges.
- Organise the network configuration into reusable Terraform modules.
- Improve input validation and output documentation.
- Add automated Terraform formatting and validation checks through GitHub Actions.
- Explore remote Terraform state management.
- Add monitoring and security configurations.
- Document deployment and troubleshooting procedures.

These enhancements will be introduced incrementally as the project develops.

## 12. Key Learnings

Through this project, I am gaining practical experience with:

- Azure networking fundamentals.
- Infrastructure as Code principles.
- Terraform resources, variables, and outputs.
- Git branching and pull request workflows.
- Azure CLI and Terraform authentication troubleshooting.
- Infrastructure change management and cloud cost awareness.

## Conclusion

This project is an ongoing practical demonstration of Azure infrastructure automation using Terraform. It combines cloud networking, Infrastructure as Code, and GitHub version control while providing a foundation for more advanced DevOps automation projects.
