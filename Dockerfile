FROM ubuntu:22.04


RUN apt update  -y
RUN apt install tesseract-ocr -y
RUN apt install tesseract-ocr-all -y
RUN apt install imagemagick -y

RUN mkdir project 

# COPY requirements/install.sh /project/install.sh
COPY requirements.txt /project/requirements.txt
RUN python3.10 -m pip install -r /project/requirements.txt

# mounting folder directly using dockerfile
ADD / /project/

WORKDIR /project

CMD [ "streamlit", "run", "./Home.py"]

