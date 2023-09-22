1. Cloud-agnostic
>> Terraform can provision infrastructure across many providers in one workflow. When provisioning resources across multiple cloud providers increase your tolerance as you protect yourself form provider specific outages.

2. Terraform State
>> The two requirements for Terraform to run are: the state and the configuration files. So, why is state good?
>> Mapping to the Real World

>>The state file is used as a database for resources you have provisioned in your providers.

>>Be warned, when importing existing resources into your Terraform config, you need to make sure that you maintain only one reference to it in your configuration.

3. Metadata

>> Terraform needs to track metadata about the built resources as it needs to be able to calculate dependency trees so that it knows the sequencing of deletes. This is important when it comes to deleting resources across providers as well.

4. Performance

>> When your state becomes rather large, you can use the state file as a cache so that you don't need to go out to your provider to check the status of all of the infrastructure when writing a plan. This is enabled with the -refresh=false flag.

5. Syncing

>> Remote state allows for people to collaborate on the same Terraform project. Terraform performs remote locking and will prevent users from running Terraform at the same time. Without state this wouldn't be possible.

*Exam Objectives* 

1. Explain multi-cloud and provider-agnostic benefits
Increases reliability through distributing your infrastructure across multiple platforms

2. Explain the benefits of state 
In term of Performance :
>> You can cache the state of your infrastructure so that Terraform doesn't have to query the providers every run
In term of Syncing : 
>> State enables multiple people to be able to work on one Terraform project by using remote state and locking configuration changes to one person at a time

3. Metadata
By using state, Terraform can track metadata needed to infer what order to delete resources in

Summary 

1. What is the benefit of Terraform being multi-cloud and provider-agnostic? 

Increased reliability

2. How does using Terraform with multiple cloud providers increase your reliability? 

If one provider goes down, all of your infrastructure isn't affected

3. How does Terraform state improve the performance of 'terraform apply'? 

By caching the state of your infrastructure so that Terraform doesn't have to query the providers every run

4. How is Terraform state beneficial from the perspective of syncing? It enables multiple people to be able to work on one Terraform project

5. How does Terraform enable multiple people to work on one project? 

By using remote state

6. What will Terraform do to make sure two people using a remote storage solution can't run terraform apply at the same time?

 Remote locking

7. What flag do you need to pass to Terraform to use the state file as a cache and not query the providers?

    -refresh=false

8. How is Terraform state beneficial from the perspective of tracking metadata?

   It allows Terraform to infer what order to delete resources in

9. When you want to use existing infrastructure with your Terraform config, what tool do you use? 

   An import resource
