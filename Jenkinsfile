node {
    stage('Checkout SCM'){
        checkout scm
        BRANCH_NAME=env.BRANCH_NAME
    }
    stage('Build Docker image'){
        def nwebImage = docker.build("nweb:master")
    }
    stage('Run Docker image'){
	    sh 'docker rm -f nweb'
        sh 'docker run -d --name nweb -p 7000:7000 --rm nweb:master'
    }
}
