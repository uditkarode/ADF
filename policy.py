#!/usr/env/python
import re

with open("sedenials") as f:
    content = f.readlines()

content = [x.strip() for x in content]
commands = []

for line in content:
    result = re.search('scontext=u:r:(.*):', line)
    if result is not None:
        offender = result.group(1).split(":")[0]
    else:
        continue

    result = re.search('tcontext=u:object_r:(.*):', line)
    if result is not None:
        context = result.group(1).split(":")[0]
    else:
        continue

    result = re.search('tclass=(.*)', line)
    if result is not None:
        sclass = result.group(1).split(" ")[0]
    else:
        continue

    result = re.search('denied { (.*) }', line)
    if result is not None:
        permission = result.group(1).split("}")[0]
    else:
        continue

    final_command = "allow " + offender + " " + context + ":" + sclass + " {" + permission + "};"

    if final_command not in commands:
        commands.append(final_command)

for command in commands:
    print(command)
