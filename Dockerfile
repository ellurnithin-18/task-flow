FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]

jobs:
    build-and-test:
# ... existing job unchanged ...

    build-image:
        runs-on: ubuntu-latest
        needs: build-and-test
        steps:
        - uses: actions/checkout@v4
        - name: Build image
        run: docker build -t taskflow:ci .