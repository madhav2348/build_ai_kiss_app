FROM python:3.9

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt

ENV FLASK_APP=app.python

CMD ["flask" , "run" , "--host=0.0.0.0" , "--port=5000"]

EXPOSE 5000