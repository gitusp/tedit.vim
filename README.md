tedit.vim
===

Have you ever wanted to edit or browse the history of shell commands, in the way that you do for Vim commands?
This plugin is devoted to achieve the goal.

Pressing Ctrl-F in terminal mode, just like you do when you edit Vim commands, you can open a mini command history window for shell.
Just like the window for Vim commands, pressing Enter key executes the command immediately, and you can edit commands using Vim's powerful feature!
(NOTE: Since Ctrl-F is bound to moving the cursor to right, it opens the window only when the cursor is at the end of line.)

---

* [Requirements](#requirements)
* [Installation](#installation)
  * [Register Plugin](#register-plugin)
  * [Register Shell Prompt Style](#register-shell-prompt-style)
  * [Register Shell History Loading Command](#register-shell-history-loading-command)
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

### Register Plugin

Install with your favorite plugin manager like:

```vim
Plug 'gitusp/tedit.vim'
```

### Register Shell Prompt Style

Since this plugin reads the current command just as a line then remove its prompt, configure `g:tedit_prompt_regex` fits to your shell style like:

```vim
let g:tedit_prompt_regex = '^\$ \?'
```

### Register Shell History Loading Command

Configure `g:tedit_history_loader` to allow this plugin load and show your shell command history.
`g:tedit_history_loader` accepts any shell commands.
Here's some examples for different kinds of shell:

#### Bash

TODO:

#### Zsh

Since zsh history file has an escape char before a multibyte char, the substitution looks a bit complicated:

```vim
let g:tedit_history_loader = 'cat ~/.zhistory | perl -pe ''s/^.*?;//; s/\x83(.)/chr(ord($1)^32)/eg'''
```

## Configuration

### Mandatory Configuration

| Variable               | Description                                  |
|------------------------|----------------------------------------------|
| g:tedit_prompt_regex   | A regex used to remove the prompt sign       |
| g:tedit_history_loader | External commands to load your shell history |

### Optional Configuration

| Variable              | Description                          |
|-----------------------|--------------------------------------|
| g:tedit_window_height | Height of the command history window |

## Screenshots

TODO: 

## Feedback and Contribution

If you find a bug, please report it on Github Issues.
Feel free to make feature requests or feature proposals.
Thank you!

