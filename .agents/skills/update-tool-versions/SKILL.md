---
name: update-tool-versions
description: Update the dotfiles mise language/runtime versions in home/.tool-versions to the latest current stable releases, then install and verify them.
---

# Update Tool Versions

Use this skill in `/Users/dan/dotfiles` when the user asks to update tool, runtime, language, mise, or `.tool-versions` versions.

## Scope

- Edit `/Users/dan/dotfiles/home/.tool-versions`; this is the repo-owned source for the user's home `.tool-versions`.
- Parse tools from the first non-comment column of every nonblank line. The current known tools are `golang`, `ruby`, `nodejs`, `python`, and `rust`, but do not hard-code the list.
- Preserve the file order and simple column alignment.
- Do not add dependencies.
- Do not commit or push unless the user explicitly asks. If committing, run the verification steps first.

## Workflow

1. Read the current repo instructions and `/Users/dan/dotfiles/home/.tool-versions`.
2. Confirm `mise` is available:

   ```bash
   command -v mise
   ```

3. For each parsed tool, resolve the latest current stable version:

   ```bash
   mise latest <tool>
   ```

4. Treat `mise latest` as the primary source. If it fails, returns a prerelease, or looks inconsistent with the official release channel, verify against the tool's official release or download page before choosing a version.
5. Reject prerelease and development builds unless the user explicitly asks for them. Do not select versions containing markers like `alpha`, `beta`, `rc`, `preview`, `dev`, `nightly`, `canary`, or `snapshot`.
6. Use current stable, not LTS-only, unless the user asks for LTS.
7. Patch only changed versions in `home/.tool-versions`.

## Install And Verify

Run install from the directory that contains `.tool-versions`:

```bash
mise install -C /Users/dan/dotfiles/home
```

Then confirm mise sees the updated tools:

```bash
mise ls --current -C /Users/dan/dotfiles/home
```

Run direct version checks for the known tool commands when present:

```bash
mise exec -C /Users/dan/dotfiles/home golang@<version> -- go version
mise exec -C /Users/dan/dotfiles/home ruby@<version> -- ruby --version
mise exec -C /Users/dan/dotfiles/home nodejs@<version> -- node --version
mise exec -C /Users/dan/dotfiles/home python@<version> -- python --version
mise exec -C /Users/dan/dotfiles/home rust@<version> -- rustc --version
```

If a command runs long or produces too much output, redirect it to a tmp file and read the file in chunks rather than restarting the command.

## Handoff

Report:

- The old and new version for each tool.
- The exact install and verification commands run.
- Any tool that could not be updated or verified, with the concrete error.
