tedit.vim
===

Have you ever wanted to edit or browse the history of shell commands, in the way that you do for Vim commands?
This plugin is devoted to achieve the goal.

Pressing Ctrl-F in terminal mode, just like you do when you edit Vim commands, you can open a mini command history window.
Just like the window for Vim commands, pressing Enter key executes the command immediately, and command editing using Vim's powerful features is supported.
(NOTE: Since Ctrl-F is bound to moving the cursor to right, it will open the window only when the cursor is on the end of line.)

---

* [Requirements](#requirements)
* [Installation](#installation)
* [Configuration](#configuration)
  * [Mandatory Configuration](#mandatory-configuration)
  * [Optional Configuration](#optional-configuration)
* [Screenshots](#screenshots)
* [Feedback and Contribution](#feedback-and-contribution)

---

## Requirements

Currently this plugin supports only Neovim.
If you support this plugin's concept, PRs are always welcomed!

## Installation

Install with your favorite plugin manager like:

```vim
Plug 'gitusp/tedit.vim'
```

## Configuration

Unfortunately, this plugin is not completely battery inside.
Here's what you should go through before the magic happens:

### Mandatory Configuration

| Variable               | Description                                     | Example                                                                                                                                               |
|------------------------|-------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| g:tedit_prompt_regex   | A regex used to remove the prompt sign          | let g:tedit_prompt_regex = '^\$ \?'                                                                                                                   |
| g:tedit_history_loader | An external commands to load your shell history | let g:tedit_history_loader = 'cat ~/.zhistory &#124; ruby -e ''puts STDIN.binmode.read.gsub(/\x83(.)/n){($1.ord^32).chr}'' &#124; sed ''s/[^;]*;//''' |

_Since I use zsh, I cat the history file at first, then convert the stream to fix multibyte issues, trim the timestamps at last._

### Optional Configuration

| Variable              | Description                          | Example                       |
|-----------------------|--------------------------------------|-------------------------------|
| g:tedit_window_height | Height of the command history window | let g:tedit_window_height = 7 |

## Screenshots

TODO: 

## Feedback and Contribution

If you find any bug, please report them on Github Issues.
Feel free to make feature requests or feature proposals.
Thank you!

