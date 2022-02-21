docker build -t haritejnarayan/multi-client:latest -t haritejnarayan/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t haritejnarayan/multi-server:latest -t haritejnarayan/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t haritejnarayan/multi-worker:latest -t haritejnarayan/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push haritejnarayan/multi-client:latest
docker push haritejnarayan/multi-server:latest
docker push haritejnarayan/multi-worker:latest
docker push haritejnarayan/multi-client:$SHA
docker push haritejnarayan/multi-server:$SHA
docker push haritejnarayan/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=haritejnarayan/multi-client$SHA
kubectl set image deployments/server-deployment server=haritejnarayan/multi-server$SHA
kubectl set image deployments/worker-deployment worker=haritejnarayan/multi-worker$SHA
