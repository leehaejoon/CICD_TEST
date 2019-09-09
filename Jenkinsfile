def CHECK_DOCKER_INSTANCES(){
    sh '''
        if test ! -z "$(docker ps -af name=ec-iti | grep -w ec-iti)"; then
            docker stop ec-iti && docker rm ec-iti
        fi
    '''
}


def DOCKER_EC_INIT(){
    sh'''
        docker build -t iti-image ./
        docker run -itd --name ec-iti iti-image:latest;
    '''
}

def RUN_UNITTEST_IN_DOCKER()  {
    sh '''
        docker exec -t ec-iti run_test.py;
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

        stage ('DOCKER_INIT')  {
            steps  {
                CHECK_DOCKER_INSTANCES()
                DOCKER_EC_INIT()
            }
        }

        stage ('UNITTEST')  {
            steps  {
                RUN_UNITTEST_IN_DOCKER()
            }
        }
    }
}
