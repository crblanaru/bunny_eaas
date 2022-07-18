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
                dir('app/tests'){
                    sh 'bash ./bunnycli.sh'
                }
            }
        }

        stage('app env') {
            agent any

            steps {
                echo 'printing env for App'
                dir('app'){
                    sh 'env'
                    sh 'echo $GIT_BRANCH'
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
