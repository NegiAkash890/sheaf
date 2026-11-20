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

You only do this once per version. Check the download against the published SHA-256 checksum first (section 1 above), so you know it is the file that was released.

## 4. Set up the local AI
Sheaf uses [Ollama](https://ollama.com), a free model runner, to run the models on your Mac. Installing Ollama is the only step you do yourself:

1. Install Ollama from [ollama.com/download](https://ollama.com/download), or in Terminal with `brew install ollama`.
2. Open Sheaf. The first-launch setup finds Ollama on its own. If Ollama is installed but not running, choose **Start It**.
3. Choose **Download Both**. Sheaf downloads the two models it needs (about 2 GB, once) and shows progress. They then work offline.

Prefer Terminal? `ollama pull embeddinggemma` and `ollama pull granite3.3:2b` do the same thing. See [MODELS.md](MODELS.md) for other model choices and licences.

## 5. Use it
Choose **Add Folder…** and let Sheaf read it. Look through **Collections** and **Graph**, then open **Organise** to see a proposed plan. Nothing moves until you choose **Move Files**, and **History > Undo** puts everything back.

macOS will ask for permission the first time Sheaf reads Desktop, Documents or Downloads.

## Updating
Download the new DMG and replace the app. If a release enables in-app updates, **Sheaf > Check for Updates…** offers them; updates are never installed without your say-so.

## Uninstalling
Delete `Sheaf.app` and `~/Library/Application Support/Sheaf`. Your files are untouched. To remove the models: `ollama rm embeddinggemma nomic-embed-text granite3.3:2b`.
