FROM python:3.7-stretch

ENV PYTHONUNBUFFERED 1
#ARG requirements=requirements.txt
WORKDIR /app/myapp
COPY requirements.txt ./

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r ./requirements.txt
#    && pip install --no-cache-dir cython \
#    && pip install https://github.com/pysam-developers/pysam/archive/master.zip \


#COPY . ./

#CMD ["pheweb",  "serve"]
CMD ["python","app.py"]