#!/bin/bash
echo $SERVICE_ACCOUNT_KEY | base64 -d > "deduce/$GOOGLE_APPLICATION_CREDENTIALS"
# python deduce/manage.py migrate
gunicorn --chdir deduce --bind :8000 --worker-class=gthread deduce.wsgi:application