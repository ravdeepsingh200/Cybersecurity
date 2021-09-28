## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - \Ansible\Filebeat_playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting acesses to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box?
    - Helps to optimize servers uptime and productivity 
    - Adds a fail safe if a server happens to be down

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system logs.
- What does Filebeat watch for?
    - Monitors the log files/locations that you specify and forwards them to Elasticsearch/Logstash for indexing
- What does Metricbeat record?
    - Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function |      IP Address                  | Operating System |
|----------|----------|----------------------------------|------------------|
| Jump Box | Gateway  | 104.43.198.41/10.0.0.4           | Linux            |
| ELK-VM   | Server   | 20.85.224.12/10.1.0.4            | Linux            |
| Web-1    | Server   | 40.122.158.95/10.0.0.5           | Linux            |
| Web-2    | Server   | 40.122.158.95/10.0.0.6           | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Localhost IP(75.23.243.133)

Machines within the network can only be accessed by the JumpBox VM.
- Which machine did you allow to access your ELK VM? What was its IP address?
    - Jumpbox vm - 104.43.198.41/10.0.0.4 

A summary of the access policies in place can be found in the table below.

| Name         | Publicly Accessible | Allowed IP Addresses |
|--------------|---------------------|----------------------|
| Jump Box     | Yes                 | 104.43.198.41        |
| ELK-VM       | No                  | 10.1.0.6             |
| Web-1/Web-2  | No                  | 10.1.0.4/5           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- What is the main advantage of automating configuration with Ansible?
    - Very simple to set up and use: No special coding skills are necessary to use Ansible's playbooks
    - Playbooks allow you to automate and scale as needed

The playbook implements the following tasks:
- In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
    - SSH to the Jumbbox VM
    - Start and attach ansible docker container
    - Created the ELK playbook in /etc/ansible/role folder
    - Ran the ELK playbook and verifyed the server is running 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- List the IP addresses of the machines you are monitoring
    - Web-1 (10.0.0.4)
    - Web-2 (10.0.0.5)
    
We have installed the following Beats on these machines:
- Specify which Beats you successfully installed
    - FileBeat Module
    - Metrickbeat Module

These Beats allow us to collect the following information from each machine:
- In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.
    - Filebeat - allows to collect log file. Example - forwards log data from remote machines and tools
    - Metricbeat collects VM/machine data such as CPU/RAM useage on a machine

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-configuration.yml file to etc/ansible/role.
- Update the Filebeat-confliguration.yml file to include ELK private IP
- Run the playbook, and navigate to ELK VM to check that the installation worked as expected.

Metricbeat
- Copy the metricbeat-configuration.yml file to etc/ansible/role.
- Update the metricbeat-confliguration.yml file to include ELK private IP
- Run the playbook, and navigate to ELK VM to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it? .yml files are playbooks to the /etc/ansible/role folder
- _Which file do you update to make Ansible run the playbook on a specific machine? ansible host file
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? specifiy what ip in the host file
- _Which URL do you navigate to in order to check that the ELK server is running? http://20.85.224.12/:5601/app/kibana

