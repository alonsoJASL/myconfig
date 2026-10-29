# myconfig

Personal desktop dotfiles for one Linux (Ubuntu/GNOME) workstation. No build,
no tests, no install script. `move_to.md` is the only deployment guide.

## Deployment model

The repo mixes two models. Know which one a file uses before you edit it.

| Repo path | Live location | Model |
|---|---|---|
| `rofi/rofi-goto` | `/usr/local/bin/rofi-goto` | symlink into repo |
| `.bashrc`, `.bash_aliases` | `~/` | copy (has drifted) |
| `starship/starship.toml` | `~/.config/starship.toml` | copy |
| `kitty/*` | `~/.config/kitty/` | copy (`kitty.conf` has drifted) |
| `alacritty/alacritty.yml` | `~/.config/alacritty/` | copy (alacritty not installed) |
| `conky/*` | `~/.config/conky/` | copy |
| `rofi/themes/*` | `~/.config/rofi/themes/` | copy |
| `rofi/config` | none | unused; live rofi reads `~/.config/rofi/config.rasi` |
| `colorscript.patch` | `~/installs/shell-color-scripts` | patch, applied as uncommitted changes |

Edits to a "copy" file do not reach the system. Edits to `rofi/rofi-goto` and
`rofi/roots` take effect at once.

## Components

- `rofi/rofi-goto` -- rofi folder jumper. Lists zoxide entries, then every
  directory under each line of `rofi/roots` (`<dir> [depth]`). Enter opens
  pcmanfm; Alt+t opens kitty in that folder. Finds `roots` through
  `readlink -f "$0"`, so it must be run through a symlink or from the repo.
- `colorscript.patch` -- diff against upstream shell-color-scripts (base
  commit `576735c`). Makes `colorscript.sh` find `colorscripts/` next to its
  real path, so `/usr/local/bin/colorscript` can be a symlink. Also deletes
  some scripts. Apply with `git apply` inside the clone.
- `conky/start_conky.sh` -- start at login (GNOME Startup Applications). It
  hard-codes `$HOME/.config/conky/keybindings.conf`, not the repo path.
- `conky/keybindings.conf` -- desktop cheat sheet. It documents GNOME
  shortcuts that are set by hand; keep it in step with the real shortcuts.

## Gotchas

- Repo `.bashrc` comes from an older machine (user `jsl19`). Many paths
  (`/home/jsl19/...`, anaconda3, carp, FEBio) do not exist here. The live
  `~/.bashrc` uses `jsolisle` and miniconda3. Treat the live file as current.
- `kitty/kitty.conf.bak` is byte-identical to `kitty/kitty.conf`.
- `rofi/config` uses the pre-1.7 `rofi.theme:` format. Installed rofi is 1.7.1.
- `alacritty.yml` is YAML. Alacritty 0.13+ reads only TOML (unverified here,
  because alacritty is not installed).
- Machine-specific paths live in `.bash_aliases` (`ITKSNAPDIR`) and
  `rofi/roots`. Expect them to differ per machine.

## Domain terms

Variables and aliases in `.bashrc` refer to cardiac-imaging research tools:
ITK-SNAP / `c3d` (segmentation viewer), CemrgApp (KCL cardiac imaging app),
openCARP / meshtool (cardiac simulation), segtools, imatools (Python
library), FEBio (finite-element solver).
