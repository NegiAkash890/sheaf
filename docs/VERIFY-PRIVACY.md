# Verifying the privacy claims

Sheaf says that your files never leave your Mac and that its only network traffic is to the model server on your own machine, apart from the one-time Ollama download you can choose in setup. You do not have to take that on trust. Here are three ways to check.

## 1. Look at Sheaf's network connections
Open Sheaf and start it reading a folder. In Terminal run:

```
lsof -nP -i | grep -i sheaf
```
You should see connections only to `127.0.0.1` (port `11434`, the Ollama server on your Mac). Any other address would be a problem; if you see one, please open an issue. The one expected exception is `github.com`, only while or just after you choose **Install Ollama** in setup.

## 2. Block everything but your own machine
Use a firewall such as [LuLu](https://objective-see.org/products/lulu.html) (free) or Little Snitch. Deny Sheaf all connections except to `127.0.0.1`. Sheaf should keep working normally.

## 3. Go offline
Install Ollama and the two models first, then turn Wi-Fi off and use Sheaf. Reading, search and organising should all work.

## What is not covered
- Ollama and the models are separate software with their own behaviour and policies. Ollama contacts its own library when you download a model.
- Downloading Ollama, a model or a Sheaf release needs a connection by nature.
- **Install Ollama** in setup downloads Ollama (about 185 MB) from `github.com/ollama/ollama` once, after you click it. Sheaf checks it against the SHA-256 checksum published with the release, which catches a damaged download, and checks that it is signed with Ollama's Apple developer ID (team `3MU9H2V9Y9`), which shows it really is from Ollama. If you would rather not use it, install Ollama yourself (ollama.com or `brew install ollama`) and Sheaf will use that.
- If a release enables in-app updates and you choose to check for updates, Sheaf fetches the update feed from the project's release hosting. No identifying information is added.

See the [privacy policy](../PRIVACY.md).
