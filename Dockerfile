FROM python:3.7-alpine
RUN mkdir /flask_cicd
WORKDIR /flask_cicd
ADD . /flask_cicd
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python","web.py"]
