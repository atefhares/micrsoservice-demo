FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install -U Flask Werkzeug gunicorn

EXPOSE 5000

# Run the application using Gunicorn (production server)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.main:app"]