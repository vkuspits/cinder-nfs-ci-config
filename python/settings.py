import yaml
import os
import fnmatch
for file in os.listdir('/home/vlad/working_dir/python_project/'):
    if fnmatch.fnmatch(file, 'settings*.yaml'):
        file_name = file
path = os.path.join(os.path.abspath(os.path.dirname(__file__)), file_name)
stream = open(file_name, "r")
docs = yaml.load_all(stream)
for doc in docs:
    params = doc.copy()
params['editable']['nfs-service']['metadata']['enabled'] = 'true'
os.remove(path)
out_stream = open(file_name, "w")
yaml.dump(params, out_stream)