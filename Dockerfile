FROM python:3.10-alpine
LABEL "organization"="Promitia Technology Inc"

ENV PYTHONUNBUFFERED 1

# we create new user for security reasons
# Don't work with user
RUN adduser -D promitia

WORKDIR /home/promitia

# Set the path to use
ENV PATH="/home/promitia/.local/bin:${PATH}"

#create apps directory and use it
RUN mkdir /home/promitia/code
WORKDIR /home/promitia/code

# give permissions to the new user before installing
RUN chown -R promitia:promitia /home/promitia/code
RUN chmod 755 .

USER promitia

# Update pip
RUN pip install --upgrade pip

# install libraries
COPY ./requirements.txt /home/promitia/code/requirements.txt
WORKDIR  /home/promitia/code
RUN pip install -r ./requirements.txt # installing from requirements.txt





