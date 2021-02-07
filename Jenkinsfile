pipeline{
	agent any
	environment{
	DOCKER_HUB_REPO = "vijaya81kp/flask-cicd"
	REGISTRY_CREDENTIAL = "dockerhub"
        CONTAINER_NAME = "flask-container"
		dockerImage = ''
		PATH = "/var/lib/jenkins/workspace/capstone/2020_03_DO_Boston_casestudy_part_1:/usr/bin/docker:$PATH"
		//PATH = "/home/ubuntu/2020_03_DO_Boston_casestudy_part_1:/usr/bin/ansible:/usr/bin/ansible-playbook:$PATH"
        //ANS_HOME = tool('ansible')
	}
	
	stages{
		stage('Clean'){
			steps{
				script{
					sh 'rm -rf 2020_03_DO_Boston_casestudy_part_1'
					echo 'inside project clean'
				}
			}
		}
		stage('SVM-Checkout'){
			steps{
				script{
					sh 'git clone https://github.com/srinanpravij/2020_03_DO_Boston_casestudy_part_1.git'
					sh 'ls'
				}
			}
		}
		stage('Build Image') {
            steps {
				script {
						sh 'env'
						sh 'pwd'
						//  Building new image
						//sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
						sh 'docker image build . -f ./2020_03_DO_Boston_casestudy_part_1/Dockerfile -t vijaya81kp/flask-cicd:latest'
						sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'
					//  Pushing Image to Repository
						docker.withRegistry( '', REGISTRY_CREDENTIAL ) {
						sh 'docker push vijaya81kp/flask-cicd:$BUILD_NUMBER'
						sh 'docker push vijaya81kp/flask-cicd:latest'
					}
					
                	echo "Image built and pushed to repository"
				}
			}
        }
		stage('Deploy-Playbook'){
			steps{
				script{
					sh 'ansible-playbook -f ./2020_03_DO_Boston_casestudy_part_1/ansible.yaml'
				}
				//ansiblePlaybook become: true, credentialsId: 'ubuntu-worker', disableHostKeyChecking: true, installation: 'ansible', playbook: './2020_03_DO_Boston_casestudy_part_1/ansible.yaml'
			}
		}
	}

}