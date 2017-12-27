= fugitive usage =


:Gedit      Edit a file in the index and write to it to stage the changes
:Gstatus    Output of `git status`. Press - to add/reset a file's changes, or p to add/reset --patch
:Gcommit    Run `git commit`
:Gblame     Brings up an interactive vertical split with `git blame` output
:Gmove      Does a `git mv` on a file and simultaneously renames the buffer
:Gremove    Does a `git rm` on a file and simultaneously deletes the buffer
:Glog       Loads all previous revisions of a file into the quickfix list so you can iterate over them and watch the file evolve!
:Glog --    Call `git log`
:Glog -- %  Call `git log` with current file relative
:Gbrowse    Open the current file on GitHub, with optional line range (try it in visual mode!)



= Merge Conflict =
run :Gdiff in file
use :diffget //2 to get `left` pane git diff (shortcut `dg`)
use :diffget //3 to get `right` pane git diff
{{{
  my key map
  <leader>dh -> left diffget
  <leader>dl -> right diffget
}}}
use ]c to next conflict(    [c to previous   )
use :ls to list buffer identity
use :only to close all windows apart from the current one
links: `http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/`




links: `http://vimcasts.org/episodes/fugitive-vim-exploring-the-history-of-a-git-repository/`
