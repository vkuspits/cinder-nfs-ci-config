import yaml
import os
path = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'settings_1.yaml')
stream = file('settings_1.yaml', 'r')
docs = yaml.load_all(stream)
for doc in docs:
    params = doc.copy()
params['editable']['nfs-service']['metadata']['enabled'] = 'true'
os.remove(path)
out_stream = file('settings_1.yaml', 'w')
yaml.dump(params, out_stream)