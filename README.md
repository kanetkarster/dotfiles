Dotfiles
========
Every branch is treated as a repo for a particular config file

Steps
=====
Setup
-----
1. add new dotfiles to folder <dotfile>
2. `git subtree split --prefix=<dotfile> -b <dotfile>-split`

Changes
-------

1. `git checkout <dotfile>-split`
2. make, commit and push changes
3. `git checkout master`
4. `git subtree pull --prefix=<dotfile> github <dotfile>-split

