FROM python:3.7-alpine
RUN mkdir /flask_cicd
COPY . /flask_cicd
WORKDIR /flask_cicd
RUN pip install -r requirements.txt
EXPOSE 9000
CMD ["python","web.py"]
