FROM python:3.7-alpine
RUN mkdir /flask_cicd
COPY . /fask_cicd
COPY /home/ubuntu/2020_03_DO_Boston_casestudy_part_1/requirements.txt /flask_cicd
WORKDIR /flask_cicd
RUN pip install -r requirements.txt
EXPOSE 9000
CMD ["python","web.py"]
