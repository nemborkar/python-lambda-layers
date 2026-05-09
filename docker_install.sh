python3.14 -m venv python
source /python/bin/activate

pip install --upgrade pip
pip install -r requirements.txt -t /python/lib/python*/site-packages

mkdir /tmp/python
rsync -av --exclude=pip* /python/lib/python*/site-packages/* /tmp/python
cd tmp/
zip -r9 python_layer.zip python