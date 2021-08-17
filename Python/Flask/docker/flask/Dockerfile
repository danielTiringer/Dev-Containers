ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine

WORKDIR /app
ADD . .
RUN pip install -r requirements.txt


ENV FLASK_APP=index.py

# Run
ENTRYPOINT [ "flask", "run", "--host=0.0.0.0" ]
