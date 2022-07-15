pipeline {
    environment {
  }
    agent none

   stages {

        stage('vote test') {
            when {
                changeset '**/vote/**'
            }
            agent{
                    docker{
                        image 'python:2.7.18-slim-stretch'
                        args '--user 0:0'
                    }
            }

            steps {
                echo 'testing python App'
                dir('vote'){
                    sh 'pip install -r requirements.txt'
                    sh 'nosetests -v'
                }
            }
        }

    }
    post {
        always {
            echo 'Pipeline finished executing'
        }
    }
}
