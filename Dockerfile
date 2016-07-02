FROM python:2.7
MAINTAINER Alexey Melnikov <alexey.ernest@gmail.com>

ENV PROJECT_NAME=project

# Prerequisites
RUN apt-get update && apt-get install -y \
  python-psycopg2
#  nginx \
#  libpq-dev \
#  supervisor

# Install Mezzanine
RUN pip install mezzanine && \ 
  pip install psycopg2

# Configure Mezzanine
RUN mezzanine-project ${PROJECT_NAME}
WORKDIR /${PROJECT_NAME}

# Configure Mezzanine
# RUN sed -i "s|DEBUG =.*|DEBUG = False|g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py
RUN sed -i "s|# ALLOWED_HOSTS.*|ALLOWED_HOSTS = [\"*\"]|g" /${PROJECT_NAME}/${PROJECT_NAME}/local_settings.py

EXPOSE 8000

CMD [""]

# Prepare env vars and start app
ADD docker-entrypoint.sh /project/docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
