# Neovim configuration

Personal [LazyVim](https://www.lazyvim.org/) configuration with Telescope, Neo-tree,
Harpoon 2, Floaterm, Diffview, Git blame, a scrollbar, emoji completion, and a
Cursor-inspired One Dark colors and a pink status bar. The leader key is **Space**.

This lockfile requires Neovim 0.12 or newer, Tree-sitter CLI 0.26.1 or newer,
Git, curl, and a C compiler. Python 3.10 or newer is needed for flake8.

## This Mac

`~/.config/nvim` links to `/Users/nosh/repo/lazy-config`, so changes in this
repository apply directly to Neovim. Keep the repository at this location, or
update the symlink after moving it.

Run `nvim` in a terminal, or `nvim path/to/file` to open a file. The existing
`~/.zshrc` puts `~/.local/bin` on PATH. Open a new terminal if the commands are
not immediately available.

Official Apple Silicon release binaries are installed under `~/.local/opt/`,
with command symlinks in `~/.local/bin/`:

- Neovim 0.12.6
- ripgrep (`rg`), `fd`, Tree-sitter CLI, `fzf`, and `lazygit`

Download URLs, versions, and SHA-256 hashes are recorded in
`~/.local/opt/neovim-install-manifest.json`. Homebrew is not required by this
installation. To upgrade these binaries, download their official macOS arm64
releases into new version directories and update the corresponding symlinks.

Plugins live in `~/.local/share/nvim/lazy/`. Mason manages `stylua`, `shfmt`,
`shellcheck`, `flake8`, and `lua-language-server` under
`~/.local/share/nvim/mason/`. Python linting uses flake8; shell linting uses
ShellCheck. Lua language support comes from LazyVim's default Lua server.
The existing uv installation exposes managed Python 3.12 as `python3.12` for
Mason's Python packages; macOS's system Python is unchanged.

A JetBrains Mono Nerd Font is already installed. Select it in your terminal's
font settings if icons do not display correctly.

## Shortcuts

| Keys | Action |
| --- | --- |
| `Space s`, `Space f s`, or `Ctrl-s` | Save file |
| `Space i` | Close editor group; close the buffer in the final group |
| `Space k` | Close buffer, keeping the window layout |
| `Space t` or `Space f t` | Toggle Floaterm |
| `Space v` / `Space h` | Split right / below, equalizing sizes |
| `Ctrl-h` / `Ctrl-l` | Previous / next editor group, wrapping and skipping sidebars |
| `Ctrl-j` / `Ctrl-k` | Move down / up between windows |
| `Space f f` | Find files |
| `Space f g` | Search file contents |
| `Space f b` | Find buffers |
| `Space f e` | Browse files from the current directory |
| `Space f E` | Browse from the current file's directory |
| `Space e` | Open or focus the explorer on the right |
| `Space c` | Open or focus source control on the right |
| `Space a` | Toggle current file's Harpoon bookmark |
| `Space j` | Open Harpoon bookmarks immediately |
| `Tab` / `Shift-Tab` | Next / previous Harpoon file |
| `Space d o` / `Space d c` | Open / close Diffview |
| `Space g b` / `Space g c` / `Space g s` | Git branches / status / stashes |
| `Space f l` / `Space f r` | Run linter / clear its diagnostics in the current file |
| `Space F` | Format file |
| `Space C` | Code actions |
| `Space r n` | Rename symbol |
| `Esc` in terminal mode | Return to normal mode |

Cursor's `Space s`, `Space c`, and `Space t` act immediately and take priority
over LazyVim's Search, Code, and Test prefixes. Use `Space F` for formatting,
`Space C` for code actions, and the file/search shortcuts above. `Space f r`
matches Cursor's clear-linter shortcut rather than LazyVim's recent-files
shortcut. Other custom shortcuts above intentionally override some LazyVim
defaults. Neovim buffers are shared across windows, so editor groups are
approximated by splits; closing the final group keeps Neovim open.

## Maintenance

- `:Lazy` manages plugins. `:Lazy restore` uses the committed `lazy-lock.json`;
  `:Lazy update` upgrades plugins and changes the lockfile. Review and commit
  lockfile changes together with related configuration changes.
- `:Mason` manages language servers, linters, and formatters.
- `:TSUpdate` updates syntax parsers. LazyVim's default parser list includes
  Lua, Python, JavaScript/TypeScript, shell, HTML, JSON, Markdown, YAML, and more.
- `:checkhealth` checks dependencies; `:ConformInfo` and `:LspInfo` inspect
  formatting and language servers.
- Use `:LazyExtras` to enable additional language configurations. Installing a
  parser alone provides syntax support; it does not install a language server.

One Dark Pro is the default theme on macOS, using Cursor's One Dark Pro Flat
background (`#282c34`), foreground (`#abb2bf`), and pink status bar (`#EF7A85`).
The status bar is flat and remains pink across modes. The explorer sits on the
right and the buffer tab bar stays hidden. One Dark uses an opaque background
to match Cursor; other themes retain the transparent-background behavior.
On Linux with Omarchy installed, its current theme and hot reload are used.

LuaRocks support is disabled because no configured plugin needs it. Health
checks may still report optional runtimes (Go, Rust, PHP, Julia), Mercurial, or
remote plugin hosts (Python, Node, Ruby, Perl) as missing. The configured plugins
do not require those hosts; Node itself is installed and available to Mason.
The pinned Mason release can also report that a newer release is available.
Snacks image previews are disabled. Its healthcheck still lists optional
graphics, ImageMagick, PDF, LaTeX, and Mermaid dependencies; those are only
needed if you enable image rendering in a compatible terminal.

## Elixir

The LazyVim Elixir extra enables ElixirLS for completion, navigation, hover,
refactoring, and diagnostics, plus Elixir, HEEx, and EEx syntax parsers.
ElixirLS is installed through Mason. Open a file inside a Mix project so the
server can find `mix.exs`; its first start may compile the language server and
project dependencies.

`mix format` handles Elixir formatting through Conform, including format on
save and `Space F`. HEEx formatting also uses Mix and needs the Phoenix
project's `.formatter.exs` configured with its HTML formatter plugin. Credo
linting runs only in projects containing `.credo.exs`; Credo must be a dependency
of that project. Existing Python and shell linters remain enabled.

This Mac has Elixir 1.20.4 and Erlang/OTP 28.4 installed using the
[official installer](https://elixir-lang.org/install/), under:

- `~/.elixir-install/installs/elixir/1.20.4-otp-28/`
- `~/.elixir-install/installs/otp/28.4/`

Their `bin` directories are on PATH in `~/.zshrc`. Open a new terminal after
installation. The previous shell configuration is saved as
`~/.zshrc.before-elixir-20261028`. Hex and Rebar are installed in `~/.mix/`.
Check the runtime with `elixir --version` and run a project's tests with
`mix test`. These are machine defaults; projects can use a version manager if
they require a different Elixir/OTP pair.

## Verification

Verified on this Mac on October 28, 2026: clean startup, dashboard, 26 configured
parser entries, Lua language-server attachment, Git blame settings, emoji
completion setup, Telescope file search and extensions, Python/Shell lint
diagnostics, Lua formatting, Floaterm command execution, and theme switching
with the configured background behavior. The terminal healthcheck's remaining errors concern only
the disabled Snacks image feature and its optional dependencies.
Elixir verification also passed: a temporary Mix project's two tests,
ElixirLS initialization and document symbols, Elixir/HEEx/EEx parser queries,
and `mix format` through Conform.
The Cursor-style pass also verified startup colors, pink status highlights,
right-side explorer and Git views, save/format shortcuts, split placement and
equalization, group cycling/closing, bookmark toggling, and `Space t` Floaterm.
