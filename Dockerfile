FROM python:3.7-alpine
WORKDIR /flask_cicd
COPY ./2020_03_DO_Boston_casestudy_part_1 /flask_cicd
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python","web.py"]
