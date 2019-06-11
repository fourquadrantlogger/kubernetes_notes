docker build -t timeloveboy/moedocker -f moedocker/Dockerfile --no-cache .
docker push timeloveboy/moedocker
docker build -t timeloveboy/go -f go/Dockerfile --no-cache .
docker push timeloveboy/go