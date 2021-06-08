## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![alt text](https://github.com/barrydwood/Project-ELKStack/blob/main/Diagrams/Network_diagram.png "Network diagram")


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Select playbook files may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system usage statistics.

The configuration details of each machine may be found below.

| Name    | Function | IP Address | Operating System |
|---------|----------|------------|------------------|
| JumpBox | Gateway  | 10.0.0.4   | Linux (Ubuntu)   |
| Web1    | Server   | 10.0.0.5   | Linux (Ubuntu)   |
| Web2    | Server   | 10.0.0.6   | Linux (Ubuntu)   |
| Web3    | Server   | 10.0.0.9   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
69.131.79.22

Machines within the network can only be accessed by the JumpBox (10.0.0.4).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump box | Yes                 | 69.131.79.22         |
| Web1     | No                  | 10.0.0.4             |
| Web2     | No                  | 10.0.0.4             |
| Web3     | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automation cuts out the possibility of operator error, such as typographical mistakes.

The playbook implements the following tasks:
- Install Docker and python3-pip
- Increase virtual memory
- Download and launch Docker ELK container
- Enable Docker on startup

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![alt text](https://github.com/barrydwood/Project-ELKStack/blob/main/Images/ELK_installed.png "docker ps -a")

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
10.0.0.5 (Web1)
10.0.0.6 (Web2)
10.0.0.9 (Web3)

We have installed the following Beats on these machines:
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat keeps track of log files, enabling us to keep track of changes to the system.
Metricbeat tracks system and service metrics, such as CPU and memory usage.

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat configuration file to the /etc/filebeat/ directory of each VM that will run Filebeat.
- Update the hosts file to include the group of VMs to be monitored with Beats (here 10.0.0.5, 10.0.0.6, and 10.0.0.9, titled "[webservers]") and the VM that will host the ELK server (here 10.2.0.4, titled "[elk]").
- Run the playbook, and navigate to port 5601 of the ELKServer's public IP (as generated by Azure; currently 40.87.24.182) to check that the installation worked as expected.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

To download the playbook:
ansible-playbook 

To update the files:
