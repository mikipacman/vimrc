require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"



--" ##########[ TODOS AND IDEAS ]###############################################

--" Maybe pyling to ale linters only if a pylintrc
--" file exists in the root of project
--"
--" And add a method to quickly iterate over all ALE warnings and errors
--" for example clicking one button that gets us to next line with an error
--"
--" Sessions in vim (when I come back I want to have the same files)
--"
--" Remap smart comments to <c-/>
--"
--" use LSP for autocompletion and go to
--"
--" figure out how to work with autocompletion
--"
--" Git
--"   - figure out how to do blame
--"   - figure out how to make diffs
--"
--" Special support for python syntax
--"    Python syntax
--"    NOTE: make sure that you run :UpdateRemotePlugins
--"    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
--"
--" ALE
--"   - make it work with envs -> import gin works
--"
--" Migrate to LUA
--" - https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
--"
--"
--" Highliting current line number
