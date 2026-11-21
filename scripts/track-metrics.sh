#!/usr/bin/env bash
# Sheaf launch metrics. The app has no telemetry; this only reads numbers GitHub already keeps
# about the public repo, and files them so they are not lost. Needs: gh (logged in as the repo
# owner) and jq.
#
# Usage: track-metrics.sh [owner/repo] [output.csv]
#
# Writes three CSVs next to the output file:
#   <name>.csv            one row per run: stars, open issues, total DMG downloads, 14-day totals
#   <name>-traffic.csv    one row per DAY: views, unique visitors, clones, unique cloners
#   <name>-releases.csv   one row per run per release file: its download count
#
# GitHub keeps traffic for only 14 days, so run this at least every two weeks (the workflow runs
# it daily). The daily rows are merged by date, so re-running never double counts.
#
# Reading the numbers honestly:
#   - "unique visitors" are unique per day. Adding days together counts a returning visitor once
#     per day they came, so treat the sum as visits by distinct people-days, not distinct people.
#   - GitHub's download_count counts every request for the file, including repeats and bots.
#     It has no unique-downloader figure. Use the checksum file's count as a rough floor for
#     people who verified the download.
set -euo pipefail
REPO="${1:-NegiAkash890/sheaf}"
OUT="${2:-$HOME/sheaf-metrics.csv}"
BASE="${OUT%.csv}"
day=$(date -u +%F)

stars=$(gh api "repos/$REPO" --jq .stargazers_count)
issues=$(gh api "repos/$REPO" --jq .open_issues_count)

# Downloads per release file (checksum files included, listed separately in the releases CSV).
releases_json=$(gh api "repos/$REPO/releases" --paginate | jq -s '[.[][]]')
dl=$(echo "$releases_json" | jq '[.[].assets[] | select(.name|endswith(".dmg")) | .download_count] | add // 0')
REL="${BASE}-releases.csv"
[ -f "$REL" ] || echo "date_utc,release,file,downloads" > "$REL"
echo "$releases_json" | jq -r --arg d "$day" '.[] | .tag_name as $t | .assets[] | [$d,$t,.name,.download_count] | @csv' >> "$REL"

# Traffic needs push access; the columns stay empty if it is not available (for example with the
# default GITHUB_TOKEN). The daily file below is only written when it is.
views14=""; clones14=""; refs=""
if v=$(gh api "repos/$REPO/traffic/views" 2>/dev/null) && c=$(gh api "repos/$REPO/traffic/clones" 2>/dev/null); then
  views14=$(echo "$v" | jq .uniques); clones14=$(echo "$c" | jq .uniques)
  refs=$(gh api "repos/$REPO/traffic/popular/referrers" --jq '[.[]|"\(.referrer):\(.uniques)"]|join(" | ")' 2>/dev/null || echo "")
  TR="${BASE}-traffic.csv"; HDR="date_utc,views,unique_visitors,clones,unique_cloners"
  new=$(jq -rn --argjson v "$v" --argjson c "$c" '
    ([$v.views[] | {k:(.timestamp[0:10]), v:.count, u:.uniques}]) as $vs
    | ([$c.clones[] | {k:(.timestamp[0:10]), c:.count, cu:.uniques}]) as $cs
    | ([$vs[].k] + [$cs[].k] | unique)[] as $d
    | [$d, (($vs[]|select(.k==$d)|.v) // 0), (($vs[]|select(.k==$d)|.u) // 0),
           (($cs[]|select(.k==$d)|.c) // 0), (($cs[]|select(.k==$d)|.cu) // 0)] | @csv' | tr -d '"')
  old=""; [ -f "$TR" ] && old=$(tail -n +2 "$TR")
  # New rows come first so that, for a date seen before, the fresh numbers win.
  { echo "$HDR"; printf '%s\n%s\n' "$new" "$old" | grep -v '^$' | sort -s -t, -k1,1 -u; } > "$TR.tmp" && mv "$TR.tmp" "$TR"
fi

[ -f "$OUT" ] || echo "date_utc,stars,open_issues,dmg_downloads_total,unique_visitors_14d,unique_cloners_14d,top_referrers_14d" > "$OUT"
echo "$day,$stars,$issues,$dl,$views14,$clones14,\"$refs\"" >> "$OUT"
tail -n 1 "$OUT"
