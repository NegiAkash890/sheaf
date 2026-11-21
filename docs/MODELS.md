# Models

Sheaf needs two local models, served by Ollama on `127.0.0.1:11434`.

| Role | Default | Size | Licence | What it does |
|---|---|---|---|---|
| Embeddings | `embeddinggemma-2:270m-q8_0-text` (EmbeddingGemma 2, text) | 303 MB | Apache-2.0 | Turns passages and search queries into 768-dimension vectors. `nomic-embed-text` (274 MB, Apache 2.0) can be chosen instead. Each model gets the prompt format it was trained with. Changing the model reads every file again. |
| Reasoning | `hf.co/ibm-granite/granite-3.3-2b-instruct-GGUF:Q3_K_M` (Granite 3.3 2B, compact Q3_K_M build) | 1.25 GB | Apache-2.0 | Summaries, document types, entities, group names, explanations, as JSON |
| Reasoning (alternative) | `phi3.5` | 2.2 GB | MIT | Same role, standard open-source licence |

Sheaf picks the first installed model from `hf.co/ibm-granite/granite-3.3-2b-instruct-GGUF:Q3_K_M`, `granite3.3:2b`, `llama3.2:3b`, `phi3.5`, `phi4-mini`, `qwen2.5:3b`, `gemma3:4b`; change it under **Models**. Any Ollama chat model that supports structured (JSON schema) output should work.

Sheaf does not ship model weights. You download them from the Ollama library and accept each model's licence yourself.

## Memory on an 8 GB Mac
- One file is processed at a time; nothing is batched across files.
- The reasoning model runs with a 4,096-token context and is released from memory three minutes after last use.
- Embedding and reasoning models are small enough to be loaded together (about 2.5 GB), leaving room for macOS and other apps.
- Vectors are stored as 32-bit floats in SQLite: about 3 KB per passage, at most 16 passages per file.

Measured on a MacBook Air M2 (8 GB) with `llama3.2:3b`: 6 to 22 seconds per short text document for first-time understanding, depending on what else the Mac is doing (two runs of the same 20 files took 132 s and 433 s).

## Changing models
Changing the reasoning model affects only files understood afterwards. Changing the embedding model re-reads everything, because vectors from different models cannot be compared.
