pipeline{
	agent any
	environment{
	DOCKER_HUB_REPO = "vijaya81kp/flask-cicd"
	REGISTRY_CREDENTIAL = "dockerhub"
        CONTAINER_NAME = "flask-container"
		dockerImage = ''
	}
	stages{
		stage('Clean'){
			steps{
				script{
					sh 'rm -rf $PWD/capstonepd'
					echo 'inside project clean'
				}
			}
		}
		stage('SVM-Checkout'){
			steps{
				script{
					sh 'git clone https://github.com/srinanpravij/2020_03_DO_Boston_casestudy_part_1.git $PWD/capstonepd'
					sh 'ls'
				}
			}
		}
		stage('Build Image') {
            steps {
				script {
						//  Building new image
					sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
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
		stage('Ansible Deployment via Playbook'){
			steps{
				script{
					sh 'ansible-playbook ansible.yaml -l target -u kubernetes'
				}
			}
		}
		
	
	}

}