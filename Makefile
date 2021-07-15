SCHEMA_URL= 	https://raw.githubusercontent.com/ehn-dcc-development/ehn-dcc-schema/release/1.3.0/valueset.json
SCHEMA=		./schemas/DCC.valueset.schema.json

AJV=		./node_modules/.bin/ajv -c ajv-formats --spec=draft2020 --strict=false

test:
	#$(AJV) test -s $(SCHEMA) -d "*.json" --valid
	ls *.json
	ls *.json | grep -v "package" | xargs -I {} $(AJV) test -s $(SCHEMA) -d {} --valid

prepare: 
	mkdir schemas
	wget -O $(SCHEMA) $(SCHEMA_URL)

install-ajv:
	npm install ajv ajv-cli ajv-formats
