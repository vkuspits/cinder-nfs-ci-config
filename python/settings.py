import yaml

stream = file('settings*.yaml', 'r')
outstream = file('settings*.yaml', 'w')
docs = yaml.load_all(stream)

for doc in docs:
	params = doc.copy()

params['nfs-service']['metadata']['enabled'] = 'true'
yaml.dump_all(params, outstream)