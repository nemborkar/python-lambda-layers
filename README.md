# lambda-layers
To run Python functions in AWS Lambda with extra imported packages, we need to have these packages in Lambda Layers  
However making the layers locally uses your local environment's Python Runtime, OS and CPU Architecture.  
So the zip files we upload to the Lambda layers can be very hit or miss (mostly miss)  

This repo tries to solve that problem with the following steps,
1. Create an Amazon Linux container
2. Install the required packages with requirements.txt and pip3
3. Generate the zip file INSIDE the container
4. Output the zip file to your local machine

# Usage
1. update requirements.txt with the packages you want in the layer
- Use specific versions, if possible.  eg: ```requests==2.31.0``` instead of ```requests```  
- [Syntax for requirements.txt](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
- [Introduction to requirements.txt](https://www.freecodecamp.org/news/python-requirementstxt-explained/)  

2. run the runner.sh script and it will generate the python.zip file  
```./runner.sh```

3. upload this python.zip file to Lambda layers and use with,  
Python Runtime : Python 3.9  
Architecture : x86_64  

# Change Python Runtime or Architecture
- If you wish to use a different Python runtime like 3.11, 3.12 etc, you can import a newer [Amazon Linux base image](https://hub.docker.com/_/amazonlinux) in the Dockerfile.  
- You can also install a [specific version of Python](https://www.python.org/downloads/) by updating the ```yum install``` lines of the Dockerfile
- arm64 has known unresolved issues on Lambda with Python as of 20240322, so I recommend against it for now
