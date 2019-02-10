#!/usr/env/python
import re

with open("sedenials") as f:
    content = f.readlines()

content = [x.strip() for x in content]

for line in content:
	result = re.search('scontext=u:r:(.*):', line)
	if result is not None:
		offender = result.group(1).split(":")[0]

	result = re.search('tcontext=u:object_r:(.*):', line)
	if result is not None:
		context = result.group(1).split(":")[0]

	result = re.search('tclass=(.*)', line)
	if result is not None:
		sclass = result.group(1).split(" ")[0]

	result = re.search('denied  { (.*) }', line)
	if result is not None:
		permission = result.group(1).split("}")[0]

	print("magiskpolicy --live \"\\\"\\\"allow " + offender + " " +  context + " " + sclass + " " + permission + "\\\"\\\"\"")
