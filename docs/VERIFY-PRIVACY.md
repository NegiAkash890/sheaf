# Verifying the privacy claims

Sheaf says that your files never leave your Mac and that its only network traffic is to the model server on your own machine. You do not have to take that on trust. Here are three ways to check.

## 1. Look at Sheaf's network connections
Open Sheaf and start it reading a folder. In Terminal run:

```
lsof -nP -i | grep -i sheaf
```
You should see connections only to `127.0.0.1` (port `11434`, the Ollama server on your Mac). Any other address would be a problem; if you see one, please open an issue.

## 2. Block everything but your own machine
Use a firewall such as [LuLu](https://objective-see.org/products/lulu.html) (free) or Little Snitch. Deny Sheaf all connections except to `127.0.0.1`. Sheaf should keep working normally.

## 3. Go offline
Install Ollama and the two models first, then turn Wi-Fi off and use Sheaf. Reading, search and organising should all work.

## What is not covered
- Ollama and the models are separate software with their own behaviour and policies. Ollama contacts its own library when you download a model.
- Downloading Ollama, a model or a Sheaf release needs a connection by nature.
- If a release enables in-app updates and you choose to check for updates, Sheaf fetches the update feed from the project's release hosting. No identifying information is added.

See the [privacy policy](../PRIVACY.md).
