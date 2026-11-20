# Troubleshooting

## macOS says Sheaf cannot be opened
Expected for unsigned builds. Open Sheaf once and choose **Done**. Then open **System Settings > Privacy & Security**, scroll to **Security**, choose **Open Anyway** next to the Sheaf message and confirm with your password. See [Installing Sheaf](INSTALL.md).

## Sheaf says Ollama is not running
Choose **Start Ollama** in Settings (or **Start It** in first-launch setup). If Ollama is not installed yet, get it from [ollama.com/download](https://ollama.com/download). In Terminal, this starts it as a background service:

```
brew services start ollama
```
To check that it answers, run `curl http://127.0.0.1:11434/api/tags`. It should print a list of installed models. Then choose **Check Again** in Sheaf.

## A model is missing
Sheaf offers **Download Both** in setup and **Download** in Settings. If you would rather use Terminal, run these once and then choose **Check Again**:

```
ollama pull embeddinggemma
ollama pull granite3.3:2b
```
`ollama list` shows what is installed.

## Sheaf cannot read my Desktop, Documents or Downloads
macOS asks for permission the first time. If you declined, choose **Open Privacy Settings** in Sheaf, or open **System Settings > Privacy & Security > Files & Folders** and allow Sheaf to access the folder.

## Reading is slow
On an 8 GB Mac, first-time reading takes 6 to 22 seconds per short document, and longer when other apps are busy. Close memory-heavy apps, leave the Mac plugged in, and let the first run finish: later runs read only what changed. The reasoning model is released from memory three minutes after it was last used. You can press **Stop** at any time and continue later.

## Collections look wrong
- Untick any move you disagree with before applying a plan.
- Rename a collection, or drag a file into another one.
- Orange marks in Collections show files that may be in the wrong group.
- Changing the embedding model re-reads every file and can change the groups.
- Open a **Grouping or naming feedback** issue so the grouping can be improved. Describe the files instead of attaching them.

## I want to undo a move
Open **History** and choose **Undo** for that change. Files you removed are in the Trash.

## Start again from scratch
Use **Rescan Everything…** to read all files again. For a full reset, quit Sheaf and delete `~/Library/Application Support/Sheaf`. Your files are not affected.

## What to include in a bug report
- What you did, what you expected and what happened.
- The Sheaf version.
- Your Mac model and macOS version (`sw_vers` in Terminal).
- The models you use (`ollama list`).
- Roughly how many files were in the folder.

Please do not attach personal files. Describe them instead. Open an issue from the [issue page](../../../issues/new/choose).
