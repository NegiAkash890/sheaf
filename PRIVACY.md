# Privacy policy

Sheaf is built so that there is nothing to collect.

- **Your files stay on your Mac.** Reading, embedding, summarising, searching and organising all happen locally. File contents, names and metadata are never sent anywhere.
- **Network use.** Sheaf connects only to the model server on your own machine (`127.0.0.1:11434`), with one exception that you start yourself: if you choose **Install Ollama** in setup, Sheaf downloads Ollama once from its official release page on GitHub (`github.com/ollama/ollama`), checks it against the checksum published there, and keeps it in its own folder. Nothing about you or your files is part of that request. When you choose to download a model, Sheaf asks that local server (Ollama) to fetch it, and Ollama downloads it from its own model library; nothing about your files is part of that request. If a release has in-app updates enabled and you choose to check for updates, it fetches the update feed from the project's release hosting; no identifying information is added.
- **No telemetry, analytics, crash reporting, accounts, advertising or tracking.** There is no server operated by the Sheaf project.
- **What is stored.** A SQLite database in `~/Library/Application Support/Sheaf` holds file paths, extracted text passages, summaries, vectors, relationships, plans and the change journal. Delete that folder to remove it all.
- **The website** is static, sets no cookies and has no sign-up.

Ollama and the models you install are separate software with their own policies.
