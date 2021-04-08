FROM marketsquare/robotframework-browser:latest

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

COPY tests /tests

USER root
RUN chmod -R 777 /tests
USER pwuser
