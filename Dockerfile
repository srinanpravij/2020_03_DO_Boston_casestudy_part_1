FROM python:3.7-alpine
RUN mkdir /flask_cicd
WORKDIR /flask_cicd
COPY . .
RUN pip install -r /home/ubuntu/2020_03_DO_Boston_casestudy_part_1/requirements.txt
EXPOSE 9000
CMD ["python","web.py"]
