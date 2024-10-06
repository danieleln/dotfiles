# dotfiles
Collection of my dotfiles!


## Usage
Dotfiles management relies on the [GNU stow](https://www.gnu.org/software/stow/)
utility.
`stow` is a *symlink farm manager*: given a source and a target directory,
it symlinks all the files in the source directory to the target one.
```bash
git clone https://github.com/danieleln/dotfiles.git
cd dotfiles
stow --target="$HOME/.config" .
```

## References
[GNU stow](https://www.gnu.org/software/stow/)
[Managing dotfiles with stow](https://www.youtube.com/watch?v=y6XCebnB9gs)
