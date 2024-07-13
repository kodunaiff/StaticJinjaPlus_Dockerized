FROM ubuntu
RUN apt update && apt install -y python3 python3-pip python3.12-venv git
RUN git clone https://github.com/MrDave/StaticJinjaPlus.git
WORKDIR /StaticJinjaPlus
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install -r requirements.txt
RUN mv templates_example templates
ENTRYPOINT ["venv/bin/python3", "main.py"]