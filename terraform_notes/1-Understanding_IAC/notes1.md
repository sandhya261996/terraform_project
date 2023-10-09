# Understanding IaC - Spaced Repetition (Anki) Cards

What is Infrastructure as Code (IaC)? The practice of managing and provisioning infrastructure resources using code

What are the advantages of IaC patterns? 
{{c1::automation}} 
{{c2::consistency}}
{{c3::scalability}} 
{{c4::version control}}

What is the purpose of version control in IaC? It allows for tracking of infrastructure configurations over time

How does IaC improve collaboration among teams? Teams can work together by using a shared, version-controlled codebase for infrastructure management

How does IaC provide scalability? Through automating the provisioning and scaling of infrastructure resources 

How does IaC provide consistency? By using infrastructure configurations that are deployed in a repeatable way

## Notes

**The problem**

Standing up infrastructure in a traditional datacenter where you process work through tickets is slow, inconsistent and hard to scale. 

**The solution - IaC**

How do we take the process of 'ClickOps' for standing up infrastructure and codify the process? We do this through **IaC**.

**IaC** is a practise that enables the creation of infrastructure and services using declarative configuration files. This allows for a consistent and scalable environment that is fully automated and tracked through version control.

## Exam Objectives 

<details>
<summary>Explain what IaC is</summary>

- The practice of managing and provisioning infrastructure resources using code
</details>

<details>
<summary>Describe advantages of IaC patterns</summary>

- Automation
  - The click heavy process of standing up infrastructure can now be codified into configuration file, saving large amounts of time 
- Consistency
  - Our infrastructure should be consistent as we're using an idempotent process to stand it up
- Scalability
  - Traditional datacenters with hypervisors had limited scale by nature their manual processes 
- Version control
  - Who changed what
  - Transparency of documentation
  - Tracking the changes of the infrastructure over time
</details>