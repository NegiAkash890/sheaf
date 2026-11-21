# Changelog

## 0.1.1 (unreleased)

- New name: Sheaf.
- Search by the people, places, things and ideas inside your files. The collection a result belongs to shows above the results.
- Search matches meaning and exact words together, so names, amounts and invoice numbers work. PDFs open on the page that matched.
- Plain-language filters: "pkg files", "pdfs from last week about rent", "screenshots over 5 MB".
- Every file in a collection gets a fit score. Loose fits are marked; clear misfits are left out instead of forced in.
- Collections recognise the kind of paper (CV, certificate, marksheet, ID, offer letter, receipt) and never use a person's name. Choose Broad or Detailed sorting in Settings.
- Try every screen on a folder of invented sample files, with a step-by-step guide, while the models download.
- As reading goes on, finished steps link straight to Search, the Graph and Collections.
- Highlight one kind of file in Collections and the Graph; a quick panel you can open from any app.
- Report a Problem fills in a GitHub issue for you to read and send. Paths are blanked out; there is no telemetry.
- Collection edits stay in History and can be undone.
- Smaller, faster default models (about 1.6 GB in total), and Sheaf installs Ollama for you if needed.
- On first launch Sheaf copies a library made by an earlier version into its own folder and leaves the old one untouched.

## 0.1.0 (first public build)

- Pick a folder; Sheaf reads it without changing anything.
- Understands text, PDFs, Word documents and text inside images, using small models on your Mac.
- Finds collections of related files and explains why they belong together.
- Search by meaning ("when does my flight leave").
- A graph of your collections and how they connect.
- Organise: a proposed folder structure and clearer file names. Every move is approved by you and can be undone.

Known limitations: unsigned and not notarised; tested on libraries of tens to a few hundred files; Apple Silicon only.
