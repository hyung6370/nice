FROM python:3.9.0

WORKDIR /home/

RUN echo "testing12345"

RUN git clone https://github.com/hyung6370/nice.git

WORKDIR /home/nice/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=nice.settings.deploy && python manage.py migrate --settings=nice.settings.deploy && gunicorn nice.wsgi --env DJANGO_SETTINGS_MODULE=nice.settings.deploy --bind 0.0.0.0:8000"]