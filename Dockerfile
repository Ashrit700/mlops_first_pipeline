#Pull the Python image from the docker hub
#use the lightweight Python image to reduce the size of the image

FROM python:3.14-slim


#set the working directory in the container inside container to /app
WORKDIR /app

#copy the requirements.txt file to the working directory, copying dependencies brfore copying the rest of the code to leverage Docker cache and speed up build time
COPY requirements.txt .

#install the dependencies from the requirements.txt file
RUN pip install -r requirements.txt

#copy the rest of the code and saved model to the working directory
COPY . .
#phla dot tells source dusra destination
#Document the port used by the Fastapi application

EXPOSE 8000
# start the api server when the container is ready to serve requests, uvicorn is the server that will run the FastAPI application, main is the name of the Python file (without the .py extension) that contains the FastAPI application, app is the name of the FastAPI application instance inside the main.py file, --host
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]