FROM python:3.12-alpine

WORKDIR /app
COPY app.py requirements.txt /app/

RUN pip install -r requirements.txt

# Set the image version dynamically (to be overridden during container runtime)
ENV IMAGE_VERSION="unknown"

EXPOSE 5000
CMD ["python", "app.py"]
