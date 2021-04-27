FROM python:3-alpine
COPY . /python
WORKDIR /python
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt
CMD python /python/app.py
