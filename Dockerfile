FROM python:3.9.0

WORKDIR /home/

RUN git clone https://www.github.com/hyung6370/nice.git

WORKDIR /home/nice/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY=django-insecure-u&jxndgn2l+*sgst*&ga(ay$no(v3n8)73jro8s*3rtg*ty--j" > .env

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "nice.wsgi", "--bind", "0.0.0.0:8000"]