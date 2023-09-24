## Notes

### **Workflow**

The core Terraform workflow has three steps:

1) **Write** - Author infrastructure as code
2) **Plan** - Preview changes before applying, `terraform plan`
3) **Apply** - Provision reproducible infrastructure, `terraform apply`

When working as a team, Terraform recommends using source control and branches. When running Terraform in a larger team, it's also recommended that you run the applying of your configuration in a [Continuous Integration environment](https://developer.hashicorp.com/terraform/tutorials/automation/automate-terraform?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS). When running the `terraform apply` within a CI environment, you will be able to review team member's plans using a pull request.

### **Initializing a working directory**

The `terraform init` command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run. This is safe to run multiple times.

`terraform init` will configure your backend state configurations if you have them, it will also handle the installation of your child modules and plugins/providers.

The running of `terraform init` will create a dependency version lock file for your plugins.

### **Validating a configuration**

The `terraform validate` command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.

This is good for validating that the configuration that you've written is syntactically valid and internally consistent, especially the linking of child modules which is prone to misconfiguration.

### **Reviewing an execution plan**

The `terraform plan` command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

The steps of a plan are as follows:

1) Reads the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date
2) Compares the current configuration to the prior state and noting any differences
3) Proposes a set of change actions that should, if applied, make the remote objects match the configuration

`terraform plan` will not modify any of your resources. It is also ran prior to applying changes when `terraform apply` is ran, so if your intention is to modify resources, just stick with `terraform apply`. 

A common way to use `terraform plan` is to produce a plan file, which can then be selectively executed by `terraform apply` using the `-out=` argument with `terraform apply`. To view the output from this plan in human-readable text when it is on disk you can use the `terraform show` command.

If there is a tilde (~) next to a resource when planning, this means that the resource will be updated in place.

### **Executing your configuration**

The `terraform apply` command executes the actions proposed in a Terraform plan. If run with no further arguments, it will build an execution plan before prompting you to continue with executing that plan. 

You can pass a saved plan to apply like this: `terraform apply [plan file]`.

### **Destroying resources**

The `terraform destroy` command is a convenient way to destroy all remote objects managed by a particular Terraform configuration. You don't want to run this in production!

### **Formatting and styling your configuration**

The `terraform fmt` command is used to rewrite Terraform configuration files to a canonical format and style. Very straightforward.

## Exam Objectives 

<details>
<summary>Describe Terraform workflow</summary>

1) **Write** - Author infrastructure as code
2) **Plan** - Preview changes before applying, `terraform plan`
3) **Apply** - Provision reproducible infrastructure, `terraform apply`
</details>

<details>
<summary>Initialize a Terraform working directory</summary>

- `terraform init`
</details>

<details>
<summary>Validate a Terraform configuration</summary>

`terraform validate`
</details>

<details>
<summary>Generate and review an execution plan for Terraform</summary>

- Use `terraform plan` to view the plan
- If you want a plan on file you run `terraform plan -out=<plan_file>`
- If you want to read that plan run `terraform show <plan_file>`
</details>

<details>
<summary>Execute changes to infrastructure with Terraform</summary>

- `terraform apply`
- If you want to run a specific plan run `terraform apply <plan_file>`
</details>

<details>
<summary>Destroy Terraform managed infrastructure</summary>

- `terraform destroy`
</details>

<details>
<summary>Apply formatting and style adjustments to a configuration</summary>

- `terraform fmt`
</details>
<h1>Summary</h1>

# Core Terraform Workflow

The core Terraform workflow has three steps:

1) {{c1::**Write** - Author infrastructure as code}}
2) {{c2::**Plan** - Preview changes before applying, `terraform plan`}}
3) {{c3::**Apply** - Provision reproducible infrastructure, `terraform apply`}}

When working in a team, where does Terraform recommend executing your plans? In a continuous integration environment

How do you initialize a working directory containing Terraform configuration files? `terraform init`

What will `terraform init` configure? Backend state configurations, modules and plugins

What will Terraform build after running `terraform init`? A dependency version lock file for your plugins

How do you validate that your Terraform configuration files are syntactically valid and internally consistent? `terraform validate`

What command do you use in Terraform to create an execution plan for the changes you are making in your infrastructure? `terraform plan`

If you want to output a plan file to disk to use later in Terraform, what do you run? `terraform plan -out=<plan_file>`

How do you read a Terraform plan on disk in a human-readable format? `terraform show <plan_file>`

How do you produce and execute the actions you have configured in your Terraform? `terraform apply`

How do you execute the actions in a Terraform plan that is on disk? `terraform apply <plan_file>`

How do you destroy all Terraform resources? `terraform destroy`

How do you format your Terraform configuration files? `terraform fmt`

Why is `terraform init` not sufficient to test your code? Because it is only interested in the `terraform`, `provider` and `module` blocks

When does Terraform validate your providers? When running `terraform init`

What does `terraform apply` do in Terraform? Executes a plan to modify Terraform resources

After executing a `terraform plan`, you notice that a resource has a tilde (~) next to it. What does