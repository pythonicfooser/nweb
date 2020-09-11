node {
    stage('Checkout SCM'){
        checkout scm
        BRANCH_NAME=env.BRANCH_NAME
    }
    stage('Build Docker image'){
        def nwebImage = docker.build("nweb:${BRANCH_NAME}")
    }
    stage('Run Docker image'){
        sh 'docker run -p 7000:7000 --rm nweb:$BRANCH_NAME'
    }
}
