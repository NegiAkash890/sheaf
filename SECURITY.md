# Security policy

## Reporting a vulnerability
Please report security problems **privately**: open [a private security advisory](https://github.com/NegiAkash890/sheaf/security/advisories/new) on this repository. Please do not open a public issue for a vulnerability.

Include what you found, how to reproduce it and which Sheaf version it affects. You will get a reply as soon as possible. Sheaf is maintained by one person, so please allow some time.

## Supported versions
Only the latest release is supported.

## Scope
Sheaf runs locally and makes no network connections other than to the model server on your own Mac and, only if you choose Install Ollama in setup, a one-time download from github.com/ollama/ollama. Reports about how Sheaf reads files, writes its local database, moves files, or handles the change journal are in scope. Vulnerabilities in Ollama or in the models are not: please report those to their projects.
