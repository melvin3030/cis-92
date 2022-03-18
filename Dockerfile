FROM docker.io/ubuntu:20.04
  
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y \
  python3-pip \
  tzdata \
  postgresql-client
RUN python3 -m pip install django \
  psycopg2-binary


COPY app/ /app

RUN mkdir /db
WORKDIR /app/mysite

ENV DJANGO_ADMIN_EMAIL=django@django.com
ENV DJANGO_ADMIN_USERNAME=django
ENV DJANGO_SUPERUSER_PASSWORD=django

ENV DB_ENGINE=sqlite
# If sqlite will not be used, change DB_ENGINE variable to prefered db application name. Then uncomment lines below, and set db variables  
#ENV DB_NAME=
#ENV DB_USER=
#ENV DB_PASSWORD=
#ENV DB_HOST=


EXPOSE 8000
ENTRYPOINT ["bash"]
CMD ["-c", "./entrypoint.sh"]