pipeline{
	agent none
	environment{
	DOCKER_HUB_REPO = "vijaya81kp/flask-cicd:1"
	REGISTRY_CREDENTIAL = "dockerhub"
        CONTAINER_NAME = "flask-container"
	}
	stages{
		stage('Build') {
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
		
	
	}

}