docker stop mezzanine
docker rm mezzanine
docker rmi mezzanine
docker build -t mezzanine .
docker run -d --name mezzanine -p 8000:8000 -e POSTGRES_HOST=192.168.99.100 -e POSTGRES_DB=db -e POSTGRES_PORT=5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e GENERATE_DB=false mezzanine
