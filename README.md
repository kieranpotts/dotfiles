# Dotfiles

**My Unix dotfiles.**

To use, simply copy the `./src/dotfiles` directory to your home directory, then modify your `.profile` to source `~/dotfiles/main.sh`:

```sh
sudo tee -a ~/.profile <<EOF
if [ -f ~/dotfiles/main.sh ]; then
  . ~/dotfiles/main.sh
fi
EOF
```

---

Copyright © 2021 Kieran Potts \
[MIT License](./LICENSE.txt)
