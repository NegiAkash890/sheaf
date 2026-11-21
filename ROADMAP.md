# Roadmap

This is a direction, not a promise. Open a Discussion to argue for or against anything here.

## Now (0.1.x)
- First public release: signed checksums, installation guide, website.
- Large-library testing (1,000 to 10,000 files) and the performance work it reveals.
- Background re-scan when a watched folder changes.

## Next (0.2)
- Nested folder proposals (groups inside groups) for big groups.
- Spreadsheet (`.xlsx`), presentation and email (`.eml`) readers.
- "Ask your files": answers with citations, built on the existing search.
- Editable group names and manual moves between groups, remembered across re-indexing.
- Optional in-process model runtime (MLX or llama.cpp) so Ollama is not required.

## Parked for v2: model evals, with early users as the signal
- Build an evaluation for the models Sheaf uses. Define what success means for grouping, search and naming, then score each model against it.
- Decide which of those measures the app shows to the person using it, in plain language.
- Early users are the signal. Corrections and feedback they choose to share (issues and the grouping feedback form) shape the targets. Nothing is collected automatically.

## Later
- Linux and Windows. The approach: make the core portable first, then a command-line release, then a shared interface.
- Duplicate and near-duplicate detection.
- Image understanding with a small local vision model.
- Developer ID signing and notarisation if the project can fund the Apple Developer Program (US$99 per year).
- Intel Macs, if there is demand.

## Not planned
- Mac App Store distribution, accounts, cloud sync, telemetry, paid tiers, rule-based sorting.
