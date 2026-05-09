# Lambda Layers for Python Runtimes
### Problem
To import packages in AWS Lambda Functions, they are required as Lambda Layers  

These layers need to match the language runtime/version, architecture, lambda operating system, etc. Creating these in local environments can cause unforeseen inconsistencies and potential compatibility issues  

### Solution
This repo tries to solve the problem by standardising the environment using a container. The packages are baked into layers inside this standard container. A .zip artifact is generated, which can be easily uploaded to Lambda Layers    

&nbsp;

# Usage
1. Update `requirements.txt` with the packages you want in the layer  
[Syntax options for requirements.txt](https://pip.pypa.io/en/stable/reference/requirements-file-format/)  
2. Make sure podman or docker daemon is running
3. Execute `runner.sh` script and it will generate the `python_layer.zip` artifact  
4. Upload `python_layer.zip` to Lambda Layers and use it in your Python Lambda function(s)  
> [!NOTE]
> Stating package versions explicitly lowers dependencies, layer size and attack surface  


### Following is done automatically by `runner.sh`
1. Create an Amazon Linux container
2. Install the required packages written in requirements.txt with pip
3. Generate the zip file INSIDE the container so as to match the Lambda environment
4. Output the zip file to your local machine which you can upload to Lambda Layers
5. Delete the Amazon Linux container and image to free up space (can be disabled in `runner.sh` file)  

&nbsp;

# Supported Defaults
> [!NOTE]
> Python Runtime: Python 3.14  
> Lambda Operating System: Amazon Linux 2023  
> Architecture: x86_64  
> Container Runtimes: Podman, Docker  

# Support for other Python versions
If you wish to build layers for Python runtimes/versions other than 3.14, 
1. [Note the operating system necessary for your python runtime.](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html#runtimes-supported)  
This repo uses Amazon Linux 2023 by default. But if your runtime/version needs a different operating system, you can find the specific image tags on [amazonlinux dockerhub](https://hub.docker.com/_/amazonlinux). Use that tag in the `Dockerfile`

2. Update the `PYTHON_VERSION` argument in the `Dockerfile`  
3. Execute `runner.sh`


# Future Considerations
- Support for arm64 architecture
- Support runtimes for other languages
- Support other popular container runtimes
