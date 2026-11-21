# Frequently asked questions

## Is Sheaf really free?
Yes. You can download and use it for personal or commercial purposes at no charge. There is no subscription, no usage charge and no advertising. The [licence](../LICENSE.txt) says what you may and may not do. The source code is private for now and is planned to go public when the repository reaches 100 GitHub stars.

## Does Sheaf upload my files?
No. Reading, summarising, searching and organising all happen on your Mac, using models served by Ollama on `127.0.0.1`. Sheaf has no account system, no telemetry and no server. You can check this yourself: see [Verifying the privacy claims](VERIFY-PRIVACY.md).

## Will it move my files without asking?
No. Sheaf first reads a folder without changing anything. It then proposes a plan: new folders and clearer file names, with a reason for each move. Nothing happens until you choose to move the files, and every change is written to a journal so **History > Undo** puts it back. Files you remove go to the Trash.

## Which files can it read?
Text files, PDFs, Word documents and text inside images. Files with nothing readable inside are still placed using their names and details, and Sheaf marks them so you know it saw only the name. Spreadsheet, presentation and email readers are on the [roadmap](../ROADMAP.md).

## How big a folder can it handle?
It has been tested on folders of tens to a few hundred files. Larger libraries are on the roadmap for testing and are not yet proven. On an everyday Apple Silicon Mac, first-time reading takes between 6 and 22 seconds per short document, depending on what else the Mac is doing. Later runs only read new and changed files.

## Why do I need Ollama?
Sheaf does not ship model weights. [Ollama](https://ollama.com) is a free, open-source program that runs the models on your Mac. A built-in runtime that removes this requirement is planned. See [Models](MODELS.md) for sizes and licences.

## Does it work offline?
By design, yes. Once Ollama and the two models are installed, Sheaf talks only to your own machine. You need a connection only to download Ollama and the models, and to download a new Sheaf release.

## Why does macOS say Sheaf cannot be opened?
Current releases are not signed with an Apple Developer ID and are not notarised, because the Apple Developer Program costs US$99 a year. macOS therefore blocks the first launch. It is a one-time step per version: see [Installing Sheaf](INSTALL.md). Check the published SHA-256 checksum first so you know the file is the one that was released. Signing and notarisation are planned.

## Does it run on Intel Macs, Windows or Linux?
Not today. Sheaf needs Apple Silicon and macOS 14 or later. Other platforms are on the roadmap as a longer-term goal.

## Where does Sheaf store its data?
In a SQLite database in `~/Library/Application Support/Sheaf`. It holds file paths, extracted text passages, summaries, vectors, relationships, plans and the change journal. Delete that folder to remove everything Sheaf has learned. Your files are never touched.

## Can I change the models?
Yes. The model list is under **Settings**. Changing the reasoning model affects only files read afterwards. Changing the embedding model re-reads everything, because vectors from different models cannot be compared. See [Models](MODELS.md).

## The collections or names are wrong. What can I do?
Untick any move in the plan before applying it, rename a collection, or drag a file into another collection. Then please tell us: open a **Grouping or naming feedback** issue and describe what Sheaf did and what you expected. Describe the files rather than attaching them.

## How can I help?
Use it on a folder you actually have, and open an [issue](../../../issues/new/choose) when something is wrong or missing. Starring the repository helps too, because the source code goes public at 100 stars.
