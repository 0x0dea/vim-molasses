# vim-molasses

Punish yourself (and/or your friends/enemies) for inefficiently using Vim.

## Philosophy

Beginners to Vim are often advised to map their arrow keys to `<nop>` in order to break the bad habit of using them to move around. It's a start, but holding `h`, `j`, `k`, and `l` to move around is scarcely an improvement. Enter **vim-molasses**, a plugin which actively prevents you from using a given key in rapid succession.

## Configuration

**vim-molasses** observes the values of two variables upon initialization:

- `g:molasses_keys` should specify (as either a string or an array) the set of keys to monitor and punish against. *default*: `'hjkl'`

- `g:molasses_wait` should specify (in milliseconds) the duration between acceptable presses of the same key. *default*: `200`

## Installation

Do what you did for the other plugins you have installed.
