email = "seb@gmail.com"
hash = {}
p email[/@(\w+)\./]
p email.match(/@(\w+)\./)
hash[:domain] = email.match(/@\w+\./)[0]
p hash
