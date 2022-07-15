pipeline {
   agent none

   stages {

        stage('app test') {
            when {
                branch 'feature/*'
                //     changeset '**/app/**'
            }
            agent any

            steps {
                echo 'testing python App'
                dir('app'){
                    sh 'curl https://api-ntsqmv.bunnyenv.com/'
                    sh 'echo $CHANGE_BRANCH'
                    sh 'echo $GIT_BRANCH'
                }
            }
        }

        stage('app env') {
            agent any

            steps {
                echo 'printing env for App'
                dir('app'){
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
