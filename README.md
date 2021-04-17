# Dotfiles

**My Unix dotfiles.**

To use, simply copy the `src/dotfiles` directory to your home directory, then modify your `.profile` to source `~/dotfiles/.main`:

```sh
sudo tee -a ~/.profile <<EOF
if [ -f ~/dotfiles/.main ]; then
  . ~/dotfiles/.main
fi
EOF
```

---

Copyright © 2021 Kieran Potts \
Distributed under the [MIT License](LICENSE.txt)
