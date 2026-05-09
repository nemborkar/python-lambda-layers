python3 -m venv python
source python/bin/activate

pip3 install -r requirements.txt -t python/lib/python*/site-packages

zip -r9 python_layer.zip python