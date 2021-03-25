FROM python:3.4-alpine
WORKDIR /code
COPY app.py /code
COPY requirements.txt /code
RUN pip3 install -r requirements.txt
CMD ["python", "app.py"]
