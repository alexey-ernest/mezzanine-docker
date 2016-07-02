FROM python:2.7
MAINTAINER Alexey Melnikov <alexey.ernest@gmail.com>

# Prerequisites
RUN apt-get update
# RUN apt-get update && apt-get install -y \
#  nginx \
#  libpq-dev \
#  python-psycopg2 \
#  supervisor

# Install Mezzanine
RUN pip install mezzanine

# Init Mezzanine
RUN mezzanine-project project
WORKDIR /project

# Configure Mezzanine
# RUN sed -i "s|DEBUG =.*|DEBUG = False|g" ./project/local_settings.py
RUN sed -i "s|# ALLOWED_HOSTS.*|ALLOWED_HOSTS = [\"*\"]|g" ./project/local_settings.py

EXPOSE 8000

CMD python manage.py createdb --noinput && \
    #python manage.py collectstatic --noinput && \
    python manage.py runserver 0.0.0.0:8000

# Prepare env vars and start app
#ADD docker-entrypoint.sh /project/docker-entrypoint.sh
#RUN chmod +x ./docker-entrypoint.sh
#ENTRYPOINT ["./docker-entrypoint.sh"]
