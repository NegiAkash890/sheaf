# The AI Sheaf uses

Sheaf runs two small AI models on your Mac, through a free model runner that setup installs for you. Nothing is sent anywhere.

| Size | Download | What you get |
|---|---|---|
| Bigger (Recommended) | about 2.4 GB, once | More specific collection names. A little slower and uses more memory. |
| Light (Quicker) | about 1.6 GB, once | The same jobs with a smaller model. Collection names are more general. |

You choose Bigger or Light in setup and can switch in Settings, where the other size downloads on demand. Sheaf does not ship the models; setup downloads them and you accept their licences.

## Memory on smaller Macs

- One file is processed at a time; nothing is batched across files.
- The models are released from memory a few minutes after last use.
- Both models are small enough to be loaded together (about 2.5 GB with Light, 3 GB with Bigger).

Measured on an Apple Silicon Mac: 6 to 22 seconds per short text document for first-time understanding. After that only new or changed files are read again.
