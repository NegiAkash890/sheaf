# Installing Sheaf

## 1. Download and verify
Download `Sheaf-<version>-arm64.dmg` and its `.sha256` file from the Releases page, then check the download:

```
cd ~/Downloads
shasum -a 256 -c Sheaf-<version>-arm64.dmg.sha256
```
It must print `OK`.

## 2. Install
Open the DMG and drag **Sheaf** to **Applications**.

## 3. First launch (important)
Sheaf releases are currently **not signed with an Apple Developer ID and not notarised**. macOS Gatekeeper therefore blocks the first launch. This is expected, and Sheaf does not ask you to switch Gatekeeper off.

1. Open Sheaf once. macOS says it cannot be opened. Choose **Done**.
2. Open **System Settings > Privacy & Security**, scroll to **Security**, and choose **Open Anyway** next to the Sheaf message. Confirm with your password.

Good to know:
- **The Open Anyway button only appears after you have tried to open Sheaf once.** If you do not see it, open Sheaf again, then go back to Privacy & Security and scroll down. It stays available for about an hour.
- On current macOS versions, right-click > Open no longer gets around this. Use **Open Anyway** as above.
- After you choose Open Anyway, macOS asks once more: choose **Open**, then enter your password or use Touch ID.
- The message is about Sheaf not being signed yet. It is not a malware finding. If you are unsure, do not continue: check the download against the checksum in section 1 first.

You only do this once per version. Check the download against the published SHA-256 checksum first (section 1 above), so you know it is the file that was released.

## 4. Set up the local AI
Sheaf uses [Ollama](https://ollama.com), a free model runner, to run the models on your Mac. Sheaf can install it for you:

1. In Sheaf's setup, choose **Install Ollama**. Sheaf downloads it once (about 185 MB) from Ollama's official release page on GitHub, checks it against the checksum published there and against Ollama's developer signature, and keeps it in its own folder. This is the only time Sheaf uses the internet, apart from the model downloads Ollama does itself. If you would rather do it yourself, install Ollama from [ollama.com/download](https://ollama.com/download) or with `brew install ollama`; Sheaf finds either one. Do this before the models step: the download needs Ollama running.
2. Open Sheaf. The first-launch setup finds Ollama on its own. If Ollama is installed but not running, choose **Start It**.
3. Pick the size of the writing model: **Bigger (Recommended)** is Granite 4.1 3B and gives more specific collection names (about 2.4 GB in all, once); **Light (Quicker)** is Granite 3.3 2B, smaller and faster (about 1.6 GB in all). Then choose **Set Up**. Sheaf downloads the models and shows progress. They then work offline. You can switch size any time in Settings.

Prefer Terminal? `ollama pull embeddinggemma-2:270m-q8_0-text` and `ollama pull granite4.1:3b` (Bigger) or `ollama pull hf.co/ibm-granite/granite-3.3-2b-instruct-GGUF:Q3_K_M` (Light) do the same thing. See [MODELS.md](MODELS.md) for other model choices and licences.

## 5. Use it
Choose **Add Folder…** and let Sheaf read it. Look through **Collections** and **Graph**, then open **Organise** to see a proposed plan. Nothing moves until you choose **Move Files**, and **History > Undo** puts everything back.

macOS will ask for permission the first time Sheaf reads Desktop, Documents or Downloads.

## Updating
Download the new DMG and replace the app. If a release enables in-app updates, **Sheaf > Check for Updates…** offers them; updates are never installed without your say-so.

## Uninstalling
Delete `Sheaf.app` and `~/Library/Application Support/Sheaf` (this also removes the copy of Ollama that Install Ollama set up). Your files are untouched. The models live in `~/.ollama`: delete that folder to remove them, or run `ollama rm embeddinggemma-2:270m-q8_0-text hf.co/ibm-granite/granite-3.3-2b-instruct-GGUF:Q3_K_M` if you have the `ollama` command.
