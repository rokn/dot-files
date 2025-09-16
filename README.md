# chezmoi Dotfiles

This repository contains my personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Installation

1. Install chezmoi:
   - On macOS: `brew install chezmoi`
   - On Linux: `sh -c "$(curl -fsLS get.chezmoi.io)"`

2. Initialize chezmoi with this repo:

   ```sh
   chezmoi init rokn/dot-files
   chezmoi apply
   ```

## Configuration

The email address used in the git configuration is configurable. You can set it by running:

```sh
chezmoi init --apply --prompt
```

Or edit the appropriate template variables in the chezmoi configuration.
hjk
