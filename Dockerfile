FROM marketsquare/robotframework-browser:v11.1.0
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

USER root
COPY tests /tests
RUN chown -R pwuser:pwuser /tests
USER pwuser
