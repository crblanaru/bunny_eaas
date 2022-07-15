pipeline {
   agent none

   stages {

        stage('app test') {
            when {
                changeset '**/app/**'
            }
            agent any

            steps {
                echo 'testing python App'
                dir('app'){
                    sh 'curl https://api-ntsqmv.bunnyenv.com/'
                    sh 'env'
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
