Please follow the live [document](https://docs.google.com/document/d/17OwlITE-yPWNj3Vi5RtQfz3ItvSkOfnbaVMnzlZyGTg)


<h2>Steps in building the CI/CD pipeline:</h2>
<ol>
  <li>Created two AWS cloud instances (JenkinsMaster and Kubernetes cluster.</li>
  <li>Configured the SSH for communication.</l1>
      <ol>
          <li>created a public key @JenkinsMaster</li>
  <li>used ssh-copy-id to copy this key into the kubernates cluster.</li>
      </ol>
  <li>Setting the environment for the JenkinsMaster:</li>
         * Installed Docker to spin up a Jenkins Container and configured the multibranch pipeline, installer Ansible and configured the hosts files.
  <li>Setting the Kubernetes cluster:</li>
      * Installed Docker,minikube and kubectl to launch and execute the flask app in the cluster.
  <li>Dockerfile: contains the recipe to build the flask app as image along with i.ts dependencies.</li>
  <li>Jenkinsfile: containes the pipeline code to</li>
        * clean the workspace
        * perform the SVM Checkout
        * launch ansible playbook
  <li>deployment.yaml: this file contains the details of the kubernetes deployment( along with the blueprint for the pods, with replicas)and service, which will be invoked via the       ansible.</l1>
  <li>ansible.yaml: This file is a playbook with plays configured to create the deployment and service the deployment in the kubernetes cluster, provisioning to scale the replicas from 3 to 5.</li>
  
      
  
      
  
     
