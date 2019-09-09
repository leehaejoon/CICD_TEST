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
		        dir ('CICD_TEST')  {
                    git branch: 'master',
                    credentialsId: '64e57f69624709368d113c1af59c099519f843db',
                    url: 'git@github.com:leehaejoon/CICD_TEST.git'
                }
            }
        }

        stage ('UNITTEST')  {
            steps  {
                RUN_UNITTEST()
            }
        }
    }
}
