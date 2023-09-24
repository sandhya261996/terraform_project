# Terraform Outside of the Core Workflow

## Notes

### **Terraform Import**

Terraform allows you to import existing infrastructure into Terraform management. This will bring the management of this resource under Terraform's control.

When importing, you must manually build a `resource` configuration block for the mapping of the resource.

Importing infrastructure involves five steps:

1) Identify the existing infrastructure you will import.
2) Import infrastructure into your Terraform state file.
3) Write Terraform configuration that matches that infrastructure.
4) Review the Terraform plan to ensure the configuration matches the expected state and infrastructure.
5) Apply the configuration to update your Terraform state.


#### **Commands**

`terraform import [options] <resource_id>` where the `resource_id` matches the existing resource in your provider

Example: `terraform import aws_instance.foo i-abcd1234` will import an AWS instance into the `aws_instance` resource named `foo`

#### **Usage Tips**

Make sure that each resource imported into Terraform is only reference once. Just like in programming, it's not good to have two references to one object as you may have unexpected behavior.

### **Terraform State Commands**

The `terraform state` command is used for advanced state management. 

When running `terraform state` commands that modify the state, Terraform will build a backup file, you can control where this outputs with the `-backup` arg.

#### **Tainting**

A resource can become tainted when an object is in an incomplete or a degraded state. In this case, running `terraform apply` will re-create the resource.

#### **Commands**

`terraform state list` will display the resources addresses for all resources in your state

`terraform state show <resource_address>` will show detailed information about one resource 

`terraform refresh` will update the state data to match the real-world condition of the managed resources

`terraform state mv` can be used to move resources from one state file to another, or to rename resources

`terraform state rm` will stop Terraform from managing a resource *without* deleting the real-world resource

`terraform state pull` will manually download and override your local copy of state from a remote state location

`terraform state push` will manually upload a local state file to a remote state (it shouldn't be used, let the normal workflow handle this)

`terraform apply -replace=<resource_address>` if you know that the state of a resource is corrupt and you want to replace that resource, you can force that with passing of the `-replace` arg to terraform

`terraform taint <resource_address>` to purposefully taint a resource so that it's replaced

`terraform untaint <resource_address>` when you know a resource is actually untainted and Terraform has marked it incorrectly

### **Logging**

To configure logging in Terraform you must manipulate environment variables. `TF_LOG` is used to change the detail of the logging you receive on stderr. 

You can set `TF_LOG` to one of the log levels `TRACE`, `DEBUG`, `INFO`, `WARN` or `ERROR` to change the verbosity of the logs.

To persist logs you can set the `TF_LOG_PATH`. 

## Exam Objectives / Testing

<details>
<summary>Describe when to use terraform import to import existing infrastructure into your Terraform state</summary>

- When you want an already existing resource in your infrastructure to be manged by Terraform
- This is good for gradually moving your infrastructure management over to Terraform
</details>

<details>
<summary>Use terraform state to view Terraform state</summary>

- `terraform state list` to view the resources addresses for all resources in your state
- `terraform state show <resource_address>` to view the detailed state for one resource
- `terraform show` can also be used to view state 
</details>

<details>
<summary>Describe when to enable verbose logging and what the outcome is</summary>

- You should enable logging when you want to debug an issue that you're having
- You can set the logging level using the environment variable `TF_LOG`
- The debugging logs are outputted to `stderr`
</details>

<summary>Summary</summary>

# Terraform Outside of the Core Workflow 

What tool do you use when you want to import in existing infrastructure under Terraform management? `terraform import`

Importing infrastructure involves five steps:

1) {{c1::Identify the existing infrastructure you will import.}}
2) {{c2::Import infrastructure into your Terraform state file.}}
3) {{c3::Write Terraform configuration that matches that infrastructure.}}
4) {{c4::Review the Terraform plan to ensure the configuration matches the expected state and }}infrastructure.
5) {{c5::Apply the configuration to update your Terraform state.}}

How do you import an AWS instance with the resource_id of i-abcd1234 into a Terraform resource with the id of aws_instance.foo? terraform import aws_instance.foo i-abcd1234

What do you need to be careful of when using import in Terraform? That you only import a resource into your configuration once

When running `terraform state` commands that modify the state, what will Terraform produce? A backup file

What is a tainted resource in Terraform? A resource in an incomplete or degraded state

What will happen to a tainted resource when `terraform apply` is run? Terraform will rebuild it

What does the `terraform state list` command do? It will display the resources addresses for all resources in your state

What command in Terraform would you run to list all resources in your state? `terraform state list`

What does the `terraform state show <resource_address>` command do? It will show detailed information about one resource

What command in Terraform would you run to show detailed information about one resource? `terraform state show <resource_address>`

What does the `terraform refresh` command do? It will update the state data to match the real-world condition of the managed resources

What command in Terraform would you run to update the state data to match the real-world condition of the managed resources? `terraform refresh`

What does the `terraform state mv` command do? It can be used to move resources from one state file to another, or to rename resources

What command in Terraform would you run to rename a resource? `terraform state mv`

What command in Terraform would you run to move a resource from one state file to another? `terraform state mv`

What does the `terraform state rm` command do? It will stop Terraform from managing a resource *without* deleting the real-world resource

What command in Terraform would you run to stop managing a resource without deleting it? `terraform state rm`

What does the `terraform state pull` command do? It will manually download and override your local copy of state from a remote state location

What command in Terraform would you run to manually download and override your local copy of state from a remote state location? `terraform state pull`

What does the `terraform state push` command do? Manually upload a local state file to a remote state

What does the `terraform apply -replace=<resource_address>` command do? It will rebuild that resource

What command in Terraform would you run to replace/re-establish a resource? `terraform apply -replace=<resource_address>`

What does the `terraform taint <resource_address>` command do? Marks a resource as tainted so that it's replaced next `terraform apply`

What command in Terraform would you run to trigger a resource to be rebuilt on the next `terraform apply`? `terraform taint <resource_address>`

What does the `terraform untaint <resource_address>` command do? Un-taints a resource so that it will not be replaced on the next `terraform apply`

What command in Terraform would you run to un-taint a resource? `terraform untaint <resource_address>`

What environment variable do you set to change the verbosity of the logs in Terraform? `TF_LOG`

To persist Terraform logs, what environment variable do you set? `TF_LOG_PATH`

Where are debugging logs used in Terraform outputted to? `stderr`