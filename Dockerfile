FROM python:3.10.1-buster

COPY main.py /main.py
COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt
# RUN chmod +x src/main.py

ENTRYPOINT ["python", "/main.py"]
