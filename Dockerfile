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

EXPOSE 8000
ENTRYPOINT ["bash"]
CMD ["-c", "./entrypoint.sh"]