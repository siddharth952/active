
<p align="center">
  <img width="200" height="200" img src="/logo1.png">
</p>
> zsh/bash script to remind you to stay active.

<img src="/demo1.gif">

# How to use:
zshrc theme locate `PROMPT='$(some_function)'` or `PROMPT_COMMAND='$(some_function)'` and add `'$(start_active)'`
like, in `/.oh-my-zsh/themes/agnoster.zsh-theme` add `PROMPT=' $(start_active)'`
