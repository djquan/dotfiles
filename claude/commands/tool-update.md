Update all language versions in ~/.tool-versions to their latest stable releases.

For each language in the file:
1. Run `mise latest <language>` to get the latest version
2. Update the version in ~/.tool-versions

After updating all versions, run `mise install` to install them.

Show a summary table of what changed (old version -> new version).

If any versions changed, commit the updated .tool-versions file with a message summarizing the updates, then push to origin.
