FROM ubuntu:24.04

RUN apt-get update && apt-get install -y python3 python3-pip python3.12-venv && rm -rf /var/lib/apt/lists/*
WORKDIR /StaticJinja

ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinja

RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/StaticJinja/venv/bin/python3", "main.py"]

CMD ["--srcpath=/app/templates/", "--outpath=/app/build/"]