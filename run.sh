docker stop mezzanine
docker rm mezzanine
docker rmi mezzanine
docker build -t mezzanine .
docker run -d --name mezzanine -p 8000:8000 mezzanine
