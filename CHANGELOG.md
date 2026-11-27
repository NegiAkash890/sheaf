# Changelog

## 0.1.5 (2026-11-28)

- Compare side by side: when two files would end up with the same name, open both next to each other and keep the one you want.
- History is a simple logbook: put back one file or a whole batch. Files already emptied from the Trash are greyed out.
- Payslips, bank statements, tax papers, bills, insurance, tickets, rent agreements, offer letters and admit cards are named from what is on the page, and Sheaf learns your naming style from your renames.
- A calmer toolbar with one search field (Cmd-F), new icons, and simpler Organise and Settings screens.
- Faster: screens no longer redraw for every file while Sheaf reads, and Collections scrolls more smoothly.
- Fixes: Space previews the right file, Back and Forward bring back searches, and menu icons are no longer black.

## 0.1.4 (2026-11-27)

- Updates: Sheaf checks for new versions and installs them when you say so (Settings > Updates). Nothing installs without a click. Earlier copies have no updater, so 0.1.4 is installed by hand.

## 0.1.3 (2026-11-26)

- Organise: every file in a proposed plan now shows a few words on why it is going where it is, for example "Mentions Suresh Rao, rent" or "About leases". Nothing to expand; it is on the row.

## 0.1.2 (2026-11-23)

- People: open any person, place or organisation and see every file that mentions them, across all your folders. Names are checked in context, so common words are left out.
- Expiry Radar: dates written inside your files (passports, insurance, warranties, leases) are listed by how soon they fall due.
- Downloaded from: Sheaf reads where a file came from (Gmail, WhatsApp, Google Drive, a website) and you can search by it, for example "from WhatsApp".
- List and grid views for People, Radar and the Library. In the grid, folders open like in Finder.
- The Overview's People, Places, Things and Ideas rows open their screens.
- Screens open faster: files and collections load in the background, and the Graph is prepared before you open it.
- Less memory: the writing model is unloaded sooner, and two files are read at a time.
- Shorter wording on the Overview and in empty states. The name pills on the Overview no longer show counts, and Clear Counts is gone.
- Radar cards no longer repeat "Expires" under "Already passed".

## 0.1.1 (2026-11-21)

- New name: Sheaf.
- The highlight behind the Sheaf logo (the Overview) now spans the full sidebar width like the other rows.
- New setting, Leave code files alone (on by default): code and settings files (.js, .py, .json, .xml and similar) are not read, grouped or moved. They stay exactly where they are.
- Search by the people, places, things and ideas inside your files. The collection a result belongs to shows above the results.
- Search matches meaning and exact words together, so names, amounts and invoice numbers work. PDFs open on the page that matched.
- Plain-language filters: "pkg files", "pdfs from last week about rent", "screenshots over 5 MB".
- Every file in a collection gets a fit score. Loose fits are marked; clear misfits are left out instead of forced in.
- Collections recognise the kind of paper (CV, certificate, marksheet, ID, offer letter, receipt) and never use a person's name. Choose Broad or Detailed sorting in Settings.
- Choose the size of the writing model in setup and in Settings: Bigger (Recommended) or Light (Quicker). The other size downloads on demand.
- Collections are grouped with the folders they sit in in mind, a folder of generated files stays one collection, and the kind of file decides names where it is clear (Resumes, Payslips, Screenshots).
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
