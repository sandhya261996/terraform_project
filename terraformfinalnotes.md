> ## Final Terraform Notes Summary
<details>
<ol>
  <li>Who developed Terraform?	Hashicorp</li>
  <li>What is Terraform used for?	Infrastructure as code</li>
  <li>When defining resources in Terraform, you could say it is written in a way that is?	Declarative</li>
<li>Can you compare the abilities of Terraform and Ansible?	Terraform is better for setting up infrastructure, and Ansible is better for configuring that infrastructure</li>
<li>What are the two inputs of Terraform?	The terraform config, and the current state</li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>

What are the two inputs of Terraform?	The terraform config, and the current state
The `terraform{}` block contains what?	Terraform settings
What does the `provider{}` block do in Terraform?	Configures providers
What does a `resource{}` block do in Terraform?	Defines components of your infrastructure
What is a provider in Terraform?	It is a plugin that enables interaction with an API
What does the `terraform output` command do?	It will return the outputs you defined in `outputs.tf`
What is the file name for outputs in terraform?	outputs.tf
What is a `locals block` in Terraform?	It is used to define local variables for that module
What is an output in Terraform?	It selects fields that you want to see come back from a Terraform apply
Why is `terraform init` not sufficient to test your code?	Because it is only interested in the terrafor, provider and module blocks
If you wanted to run a bash script on your new server using terraform, how would you do it?	With the custom_data tag
"Why shouldn't you store the terraform state file in git?"	"Because other people working with Terraform wouldn't know the current state of terraform, and the file contains secrets"
"How to hide your state files so that they don't appear on disk when using Terraform?"	Have a remote state storage solution (backend)
What is Terraform state?	How Terraform tracks changes made in your cloud instances
"What is the Terraform ""backend""?"	Your remote storage state solution
What is Infrastructure as Code (IaC)?	The practice of managing and provisioning infrastructure resources using code
What are the advantages of IaC patterns? {{c1::automation}} {{c2::consistency}} {{c3::scalability}} {{c4::version control}}	
What is the purpose of version control in IaC?	It allows for tracking of infrastructure configurations over time
How does IaC improve collaboration among teams?	Teams can work together by using a shared, version-controlled codebase for infrastructure management
How does IaC provide scalability?	Through automating the provisioning and scaling of infrastructure resources
How does IaC provide consistency?	By using infrastructure configurations that are deployed in a repeatable way
What is the benefit of Terraform being multi-cloud and provider-agnostic?	Increased reliability
How does using Terraform with multiple cloud providers increase your reliability?	"If one provider goes down, all of your infrastructure isn't affected"
"How does Terraform state improve the performance of 'terraform apply'?"	"By caching the state of your infrastructure so that Terraform doesn't have to query the providers every run"
How is Terraform state beneficial from the perspective of syncing?	It enables multiple people to be able to work on one Terraform project
How does Terraform enable multiple people to work on one project?	By using remote state
"What will Terraform do to make sure two people using a remote storage solution can't run terraform apply at the same time?"	Remote locking
What flag do you need to pass to Terraform to use the state file as a cache and not query the cloud providers?	`-refresh=false`
How is Terraform state beneficial from the perspective of tracking metadata?	It allows Terraform to infer what order to delete resources in
When you want to use existing infrastructure with your Terraform config, what tool do you use?	An import resource block
What do providers supply Terraform?	The resource types and data sources that Terraform can manage
In Terraform, for a commonly used provider (like AWS), what is the source?	The Terraform Registry
Where must providers be specified to be used in Terraform?	In the required_providers block
What 3 things does a required_providers block specify? {{c1::local name}} {{c2::source}} {{c3::version}}	
What do you provide to a provider block in Terraform for unique identification when you have two or more of them?	An alias
"When using a provider that looks like the one below, how would you access it in a recourse block? provider ""aws"" { alias = ""west"" region = ""us-west-2"" }"	provider = aws.west
What is used to uniquely identity where you download a provider from?	Source addresses
What are the three building blocks of source addresses for providers? {{c1::hostname}}/{{c2::namespace}}/{{c3::type}}	
When does Terraform validate your providers?	When running `terraform init`
"How does Terraform enable developers to extend it's functionality?"	Through plugins
What will Terraform build after running `terraform init`?	A dependency version lock file for your plugins
To install a provider in Terraform, what block and resource do you need?	A `required_providers` block and a `provider` resource block
What are providers and provisioners both considered by Terraform?	Plugins
What tool do you use when you want to import in existing infrastructure under Terraform management?	`terraform import`
Importing infrastructure involves five steps: 1) {{c1::Identify the existing infrastructure you will import.}} 2) {{c2::Import infrastructure into your Terraform state file using `terraform import`}} 3) {{c3::Write Terraform configuration that matches that infrastructure.}} 4) {{c4::Review the Terraform plan to ensure the configuration matches the expected state and infrastructure.}} 5) {{c5::Apply the configuration to update your Terraform state.}}	
What command line instruction imports an AWS instance with the resource_id of i-abcd1234 into a Terraform resource with the id of aws_instance.foo?	`terraform import aws_instance.foo i-abcd1234`
What do you need to be careful of when using import in Terraform?	That you only import a resource into your configuration once
When running `terraform state` commands that modify the state, what will Terraform produce?	A backup file
What is a tainted resource in Terraform?	A resource in an incomplete or degraded state
What will happen to a tainted resource when `terraform apply` is run?	Terraform will rebuild it
What does the `terraform state list` command do?	It will display the resources addresses for all resources in your state
What command in Terraform would you run to list all resources in your state?	`terraform state list`
What does the `terraform state show <resource_address>` command do?	It will show detailed information about one resource
What command in Terraform would you run to show detailed information about one resource?	terraform state show <resource_address>
What does the `terraform refresh` command do?	It will update the state data to match the real-world condition of the managed resources
What command in Terraform would you run to update the state data to match the real-world condition of the managed resources?	`terraform refresh`
What does the `terraform state mv` command do?	It can be used to move resources from one state file to another, or to rename resources
What command in Terraform would you run to rename a resource?	`terraform state mv`
What command in Terraform would you run to move a resource from one state file to another?	`terraform state mv`
What does the `terraform state rm` command do?	It will stop Terraform from managing a resource *without* deleting the real-world resource
What command in Terraform would you run to stop managing a resource without deleting it?	`terraform state rm`
What does the `terraform state pull` command do?	It will manually download and override your local copy of state from a remote state location
What command in Terraform would you run to manually download and override your local copy of state from a remote state location?	`terraform state pull`
What does the `terraform state push` command do?	Manually upload a local state file to a remote state
What does the `terraform apply -replace=<resource_address>` command do?	It will rebuild that resource
What command in Terraform would you run to replace/re-establish a resource? Without running `terraform taint`	`terraform apply -replace=<resource_address>`
What does the `terraform taint <resource_address>` command do?	"Marks a resource as tainted so that it's replaced next `terraform apply`"
What command in Terraform would you run to trigger a resource to be rebuilt on the next `terraform apply`?	`terraform taint <resource_address>`
What does the `terraform untaint <resource_address>` command do?	Un-taints a resource so that it will not be replaced on the next `terraform apply`
What command in Terraform would you run to un-taint a resource?	`terraform untaint <resource_address>`
What environment variable do you set to change the verbosity of the logs in Terraform?	`TF_LOG`
To persist Terraform logs, what environment variable do you set?	`TF_LOG_PATH`
Where are debugging logs used in Terraform outputted to?	`stderr`
What do all `module` blocks require in Terraform?	A source argument
What can a source argument for a module be in Terraform?	A URL, local path or a registry source address
When importing a module from the Terraform public registry, what do you use as the source?	A registry source address `<NAMESPACE>/<NAME>/<PROVIDER>`
What are modules in Terraform?	They are containers for multiple resources that enable reusability
When adding, removing or modifying modules in Terraform, what do you need to run?	`terraform init`
When installing a Terraform module from a module registry, what should you pass in?	A version argument
How do you access outputs from a Terraform module?	`module.<module_name>.<output_name>`
When defining a module, what do you need to use to define what inputs can be passed into the module?	Variables
When passing variables into the child modules, the calling module passes the variables in how?	Arguments in the module block
When working in a team, where does Terraform recommend executing your plans?	In a continuous integration environment
How do you initialize a working directory containing Terraform configuration files?	`terraform init`
What will `terraform init` configure?	Backend state configurations, modules and plugins
What will Terraform build after running `terraform init`?	A dependency version lock file for your plugins
How do you validate that your Terraform configuration files are syntactically valid and internally consistent?	`terraform validate`
What command do you use in Terraform to create an execution plan for the changes you are making in your infrastructure?	`terraform plan`
If you want to output a plan file to disk to use later in Terraform, what do you run?	`terraform plan -out=<plan_file>`
How do you read a Terraform plan on disk in a human-readable format?	`terraform show <plan_file>`
How do you produce and execute the actions you have configured in your Terraform?	`terraform apply`
How do you execute the actions in a Terraform plan that is on disk?	`terraform apply <plan_file>`
How do you destroy all Terraform resources?	`terraform destroy`
How do you format your Terraform configuration files?	`terraform fmt`
When does Terraform validate your providers?	When running `terraform init`
What does `terraform apply` do in Terraform?	Executes a plan to modify Terraform resources
What do backends in Terraform store?	State files
What is a state file used for in Terraform?	To keep a track of resources that Terraform manages
What are the three places that Terraform can use for backends?	Local, Terraform cloud and a remote backend (cloud)
What block is used to store state remotely in Terraform?	The `backend` block
Where does the `backend` block go in Terraform?	Within the `terraform` block
What is the limitation with arguments to the `backend` block in Terraform?	It cannot refer to named values (like variables, locals or data sources)
"Whenever a Terraform configuration's backend changes, what must you do?"	Run `terraform init`
Where is state stored by default in Terraform?	Locally
Why are local state files not optimal in Terraform?	You cannot collaborate effectively and secrets are in plain text
When passing in arguments for your backend configuration for Terraform to place into the `backend` block, what is your configuration considered to be?	A partial configuration
What is a partial configuration in Terraform?	When you leave sensitive configuration arguments for you `backend` block empty and pass them in through some other means
How can you pass in arguments to a partial configuration in Terraform?	Using a file, cli arguments, or interactively
What method does Terraform use to enable collaboration with remote state (if two people `apply` at the same time)?	State locking
What is resource drift in Terraform?	When your resources within your cloud provider have been modified through a method other than Terraform
If you suspect that you have resource drift in your Terraform, what should you run?	`terraform plan -refresh-only`
If you suspect that you have resource drift in your Terraform, what should you run?	`terraform plan -refresh-only`
After running `terraform plan -refresh-only` and seeing that there have been changes in your resources, what do you need to do?	Update your configuration to match the changes
When accessing a variable in Terraform, what is the prefix?	`var.`
The Terraform root module variables are set using the {{c1::CLI}}, {{c2::environment variables}}, {{c3::variable files}} or in a {{c4::Terraform Cloud workspace}}	
How would you automatically load in variables from a file in Terraform?	Name the file `terraform.tfvars` or `terraform.tfvars.json`, or files ending in `.auto.tfvars` or `.auto.tfvars.json`
When defining variables in a `.tfvar` file, what is the difference with definitions?	"You don't need to include the `variable` block surrounding the variable"
How do you access attributes of a `resource` block in Terraform?	`<RESOURCE TYPE>.<NAME>.<ATTRIBUTE>`
What would you use to retrieve read-only data from your cloud provider in Terraform?	A `data` block
What is the difference between a `resource` and `data` block in Terraform?	A data block is read-only data, a resource block modifies infrastructure
How do you access data from a `data` block in Terraform?	`data.<TYPE>.<NAME>.<ATTRIBUTE>`
What does Terraform use to generate plans, refresh state and apply changes under the hood?	A dependency graph
What traversal will Terraform use to walk its graph?	A parallel depth-first search
How do you define a list/tuple in Terraform?	"[""a"", ""b"", ""c""]"
How do you define a map/object in Terraform?	"{ name = ""John"", age = 52 }"
What is the type constraint on a structural type in Terraform?	It will allow all types
What is the type constraint on a collection type in Terraform?	It will only allow one type
What is the general pattern for calling functions in Terraform?	A function name followed by comma-separated arguments in parentheses `max(5,12,9)`
How do you mark a variable as sensitive in Terraform?	You surround it with the sensitive function `sensitive(data)`
What can you use to test your Terraform functions?	The `terraform console`
How do you use an environment variable to set a variable value in Terraform?	`TF_VAR_<variable_name>`
What block do you use to download secrets (whether a file or from a vault) to populate your Terraform config with?	A `data` block
How to get additional information for a command line tool in Terraform?	Append `-help`
What Hashicorp solution can you use with Terraform to streamline your experience with Terraform?	Terraform Cloud
When more than one person is working on a Terraform project, you need at minimum to have a {{c1::remote state solution}}, and ideally also a {{c2::CI environment}}	
Terraform Cloud offers what to run Terraform actions on your own private servers?	Terraform Cloud Agents
Terraform Cloud manages infrastructure collections with {{c1::workspaces}} instead of directories	
What would you use to create and share private modules for your corporation in Terraform?	The private registry
"What is the name of Terraform's policy enforcer?"	Sentinel
After you define policies in Sentinel in Terraform, where do you need to add them?	To policy sets on workspaces
How do you use a variable in a string in Terraform?	"`""${var.name}-rest-of-string""`"
What is a implicit dependency in Terraform?	"When two resources rely on each other, but you haven't specified depends on"
To switch workspaces in Terraform, what do you run?	`terraform workspace select <workspace_name>`
Will Terraform create a new workspace when you run `terraform workspace select <workspane_name>?	No
Do workspaces provide similar functionality in the open-source and Terraform Cloud versions of Terraform?	No
What Terraform command can be used to remove the lock on the state for the current configuration?	`terraform force-unlock <lock_id>`
How do you create a new workspace in Terraform?	`terraform workspace new <workspace_name>`
The Terraform get command is used for what?	To download and update modules
What Terraform version would a new workspace be configured to use after migrating the state to the Terraform Cloud?	The version used to perform the migration
After executing a `terraform plan`, you notice that a resource has a tilde (~) next to it. What does this mean?	The resource will be updated in place
What function does the terraform init -upgrade command perform?	Updates all the plugins that comply with the version contraints
True or False? A main.tf file is always required when using Terraform?	False
Ralphie has executed a terraform apply using a complex Terraform configuration file. However, a few resources failed to deploy due to incorrect variables. After the error is discovered, what happens to the resources that were successfully provisioned?	The resources that were provisioned will remain deployed
"In Terraform, if there is no `provider` argument provided to a resource, what will be used if there's multiple providers in the configuration?"	The default provider (the one with no alias)
True or False? Before a Terraform validate can be run, the directory must be initialized	True
What command do you use after you have set up a new backend solution in Terraform to move the file?	`terraform init -migrate-state`
What should you be using instead of `terraform refresh`?	`terraform plan -refresh-only` or `terraform apply -refresh-only`
What does a `dynamic block` do in Terraform?	It iterates over a value and generates a nested block for each element of that value
What does a `dynamic block` act like in Terraform?	A `for` expression
You are working on updating your infrastructure managed by Terraform. Someone makes a manual change (outside the Terraform workflow) to a `tag` ID to one of your resources. What will happen when you run a terraform apply?	It will overwrite the resource and delete the manual changes
When using Sentinel policies to define and enforce policies in Terraform, when does it run?	After a terraform plan, but before a terraform apply
To specify the version of Terraform provider that is required, what block do you use?	`required_providers`
How do you update providers in Terraform?	`terraform init -upgrade`
In order to use the terraform console command, the CLI must be able to do what?	Lock the state file
What is an explicit dependency in Terraform?	When you specify the `[depend_on]` argument to a resource
</details>
