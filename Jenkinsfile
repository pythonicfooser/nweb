node {
    stage('Checkout SCM'){
        checkout scm
        BRANCH_NAME=env.BRANCH_NAME
    }
    stage('Build Docker image'){
        def nwebImage = docker.build("nweb:${env.BUILD_NUMBER}")
    }
    stage('Run Docker image'){
        sh 'docker run -d -p 7000:7000 --rm nweb:${BUILD_NUMBER}'
    }
}
