def GET_PACKAGES()  {
    sh '''
        pip install -r requirements.txt;
    '''
}

def RUN_UNITTEST()  {
    sh '''
        python run_test.py;
    '''
}


pipeline  {
    agent any
    stages {
        stage ('VCS')  {
            steps  {
                dir ('ITI')  {
                    git branch: 'insert-to-maria',
                    credentialsId: '64e57f69624709368d113c1af59c099519f843db',
                    url: 'git@github.com:leehaejoon/ITI.git'
                }
            }
        }

        stage ('READY_TO_TEST')  {
            steps  {
                GET_PACKAGES()
            }
        }

        stage ('UNITTEST')  {
            steps  {
                RUN_UNITTEST()
            }
        }
    }
}
