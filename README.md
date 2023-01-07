# biquando's Neovim Config

Adapted from https://github.com/LunarVim/Neovim-from-scratch.

## LSP

See `lua/user/lsp/mason.lua` for a list of configured language servers.

## Keybindings

| Navigation                                    |                      |
| --------------------------------------------- | -------------------- |
| `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`            | Navigate windows     |
| `<C-Up>`, `<C-Down>`, `<C-Left>`, `<C-Right>` | Resize windows       |
| `<S-l>`, `<S-r>`                              | Navigate buffers     |
| `<Leader>c`                                   | Delete buffer        |
| `<Leader>e`                                   | Toggle file explorer |

| Editing          |                                         |
| ---------------- | --------------------------------------- |
| `{num}<Leader>w` | Set tab width to {num}                  |
| `<Leader>s`      | Indent using spaces                     |
| `<Leader>t`      | Indent using tabs                       |
| `<Leader>l`      | Clear search highlight                  |
| `<S-j>`, `<S-k>` | (Visual) Move lines up/down             |
| `S{char}`        | (Visual) Surround selection with {char} |

| Terminal    |                    |
| ----------- | ------------------ |
| `<Esc>`     | Exit terminal mode |
| `<Leader>k` | Toggle terminal    |

| Telescope   |                            |
| ----------- | -------------------------- |
| `<Leader>f` | Find file                  |
| `<Leader>g` | Grep for text in all files |

| LSP  |                      |
| ---- | -------------------- |
| `gD` | Go to declaration    |
| `gd` | Go to definition     |
| `gi` | Go to implementation |
| `gr` | Go to references     |
| `K`  | Hover                |
| `gl` | Open LSP diagnostic  |

| Git         |                |
| ----------- | -------------- |
| `<Leader>d` | View hunk diff |
