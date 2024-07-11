
<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">DigitalOcean Kubernetes Cluster with Terraform</h3>

  <!-- <p align="center">
    Processing rides events from Kafka with Bytewax
  </p> -->
</div>

<br>
<p align="justify">
&ensp;&ensp;&ensp;&ensp;This repository contains Terraform configurations to provision a simple Kubernetes cluster on DigitalOcean using best practices such as modularization.
</p>


## Directory Structure

- `main.tf`: Main configuration file to call the modules.
- `variables.tf`: Variable definitions.
- `outputs.tf`: Output definitions.
- `terraform.tfvars`: Default values for the variables.
- `modules/`: Directory containing Terraform modules.
  - `k8s_cluster/`: Module for creating a Kubernetes cluster.

## Usage

**0. ⚠️ Create an Access Token and Export it as an Environemnt Variable⚠️**
First of all, we need a Token. The creation is very simple, just navigate to the API section in the Digital Ocean portal and then click on `Generate New Token`. Give it a name, select the scope (for practicing purposes, you can choose the `Full Access`.) and then `Generate Token`. Make sure to  copy and save it.

   Then, create and Environment variable:
   ```sh
   export DIGITALOCEAN_TOKEN=your_access_token
   ```

**1. Clone this repository.**

    ```sh
    git clone https://github.com/yourusername/doks-iac.git
    cd doks-iac/
    ```

**2. Install Opentofu and doctl (DigitalOcean's CLI)**

If you're using Linux, just run this command:

    ```sh
    bash installs/run-all.sh
    ```
    If you don't need these installations, just skip to the next step. If you only need one or another, just comment the specific line in the `run-all.sh` file.

**3. Create the `infra/terraform.tfvars` file**

Replace the values with yours.
```
  region             = "nyc3"
  cluster_name       = "cluster_name_you_want
  kubernetes_version = "1.30.1-do.0"
  node_pool_name     = "pool_name_you_want"
  node_count         = 1
  node_size          = "s-2vcpu-4gb"
```
I left default values for the `region`, `kubernetes_version`, `node_count` and `node_size`. If you're using for testing purposes, you can keep them.

**4. Initialize Terraform**

```sh
tofu init
```

Insert the Token if asked.

**5. Create an Execution Plan**

The command bellow creates an execution plan, showing what actions Terraform will take without making changes. the `-out` parameters allows us to save this plan in a file, so when we apply, we'll perform exactly those actions saved. If you wish, you can only run `tofu plan`.

```sh
tofu plan -out plan.output
```

**6. Apply the Terraform configurations.**

If didn't save the plan, just run `tofu apply`. Otherwise, run the command bellow:

```sh
tofu apply plan.output
```

**7. Enter the Digital Ocean Token and then confirm the apply action.**

## Variables

- `do_token`: DigitalOcean API token.
- `region`: The region to deploy resources in (default: "nyc3").
- `cluster_name`: The name of the Kubernetes cluster.
- `kubernetes_version`: The version of Kubernetes to use for the cluster.
- `node_pool_name`: The name of the node pool.
- `node_count`: The number of nodes in the node pool (default: 1).
- `node_size`: The size of the nodes in the node pool (default: "s-2vcpu-4gb").

## Outputs

- `k8s_cluster_id`: The ID of the Kubernetes cluster.

## Modules

### Kubernetes Cluster

- `main.tf`: Resource definition for the Kubernetes cluster.
- `variables.tf`: Variable definitions for the Kubernetes cluster module.
- `outputs.tf`: Output definitions for the Kubernetes cluster module.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
