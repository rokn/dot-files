{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rokn";
  home.homeDirectory = "/home/rokn";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
	htop
	lsd jq ripgrep bat tree fzf
	direnv nix-direnv zoxide
	gh delta lazygit
	fd # vim telescope req
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionPath = [
  	"$HOME/.local/bin"
  ];

  programs.zsh = {
    enable = true;
    history = { size = 10000; save = 8000; path = "$HOME/.zshistory"; };
    autosuggestion.enable = true;          # replaces a zinit plugin
    syntaxHighlighting.enable = true;      # replaces a zinit plugin
    autocd = true;
    defaultKeymap = "viins";
    shellAliases = {
      ls = "lsd";
      ll = "ls -l";
      la = "ls -a";
      l = "ls";
      e = "exit";
      ":q" = "exit";
      ":Q" = "exit";
      ga = "git add -A";
      gc = "git commit";
      gp = "git push";
      "лс" = "ls";
      "е" = "e";
      "цд" = "cd";
      so = "source ~/.zshrc";
      zshrc = "\$EDITOR ~/.zshrc";
      v = "vim";
      dude = "docker compose up -d";
      dud = "docker compose down";
      h = "helm";
      b = ''git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout'';
      ed = "$EDITOR .";
      k = "kubectl";
      c = "clear_and_context";
      ch = "chezmoi";
      ef = ''fzf --preview "less {}" | xargs $EDITOR'';
      cf = "cdf";
    };
    initContent = ''
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word

      # Case insensitive
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

      # Custom funcs
      source "$HOME/.config/zsh/functions.zsh"

	  chpwd() {
	    clear_and_context
	  }
    '';
  };

  programs.starship = {
    enable = true;
  };
  programs.fzf.enable = true;
  programs.direnv = { enable = true; nix-direnv.enable = true; };
  programs.zoxide = {
  	enable = true;
    options = [
	  "--cmd j"
    ];
  };

  programs.tmux = {
    enable = true;
    mouse = true;
  };

  programs.git = {
    enable = true;
    includes = [ { path = "~/.gitconfig"; } ];   # keep editing your existing file
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Core essentials
      nvim-lspconfig
      plenary-nvim
      telescope-nvim
      gitsigns-nvim
      nvim-tree-lua
      nvim-web-devicons

      # UI & workflow
      lualine-nvim
      which-key-nvim
      todo-comments-nvim
      trouble-nvim

      # Formatting & completion
      conform-nvim
      nvim-cmp

      # Colorscheme
      catppuccin-nvim

      # avante.nvim required dependency
      nui-nvim
       {
		   plugin = avante-nvim;
		   type = "lua";
		   config = ''
			   require("avante").setup({
			   	provider = "claude",
			   	providers = {
			   		claude = {
			   			endpoint = "https://api.anthropic.com",
			   			auth_type = "max", -- use Claude Pro/Max subscription (browser OAuth), not an API key
			   			model = "claude-opus-4-8",
			   			extra_request_body = {
			   				max_tokens = 64000,
			   			},
			   		},
			   	},
			   })
		   ''; # or builtins.readFile ./plugins/avante.lua
	   }
      # Optional: if you want a plugin manager inside Neovim
      # lazy-nvim
    ];

    initLua = ''
		vim.g.loaded_netrw = 1
	    vim.g.loaded_netrwPlugin = 1

	    -- optionally enable 24-bit colour
	    vim.opt.termguicolors = true

	    -- empty setup using defaults
		require("nvim-tree").setup()

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<C-t>', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		
		vim.lsp.enable('gopls')
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition)      -- Go to definition
		vim.keymap.set('n', 'gr', vim.lsp.buf.references)       -- Find references
		vim.keymap.set('n', 'K', vim.lsp.buf.hover)             -- Show documentation
		vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename)   -- Rename symbol
		vim.keymap.set('n', '<leader>aa', vim.lsp.buf.code_action) -- Code actions
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)   -- Go to implementation
		vim.keymap.set('n', '<leader>f', function()
				vim.lsp.buf.format({ async = true })
		end)                                                     -- Format file
    '';
    extraConfig = ''
        let mapleader = " "
	    colorscheme catppuccin

		imap jj <ESC>

		nnoremap <tab> %
		vnoremap <tab> %

		nnoremap j gj
		nnoremap k gk

		map <leader>; :NvimTreeToggle<CR>

		"Delete to the void
		map <leader>d "_dd

		" Add empty lines
		nmap <S-Enter> O<Esc>
		nmap <CR> o<Esc>

		noremap <leader>w :w<CR>
		noremap <leader>Q :Bdelete<CR>
		noremap <leader>q :q<CR>

		" Keep only current pane
		nnoremap <leader>bo <c-w>o
		noremap <leader>q :q<CR>

		" Default t
		vmap <Leader>d "+d
		nmap <Leader>y "+y
		nmap <Leader>Y "+Y
		vmap <Leader>y "+y
		vmap <Leader>Y "+Yo clipboard:
		nmap <Leader>p "+p
		nmap <Leader>P "+P
		vmap <Leader>p "+p
		vmap <Leader>P "+Po clipboard:

		" Open window splits in various places
		nmap <leader>sh :leftabove  vnew<CR>
		nmap <leader>sl :rightbelow vnew<CR>
		nmap <leader>sk :leftabove  new<CR>
		nmap <leader>sj :rightbelow new<CR>

		" Allow saving of files as sudo when I forgot to start vim using sudo
		cmap w!! w !sudo tee > /dev/null %

		" Kill the damned Ex mode.
		nnoremap Q <nop>


		"S + R
		nmap <Leader><S-r> :%s/<C-r><C-w>/

		"Buffers
		nmap <leader>bn :bn<CR>
		nmap <leader>bp :bp<CR>

		set autoindent              " copy indent from the current line when starting a new one
		set autoread                " reload files changed outside Vim when unmodified in buffer
		set autowrite               " automatically write the buffer before commands like :next/:make
		set background=dark         " tell Vim the terminal background is dark so colors are tuned for it
		set completeopt-=preview    " don't open the scratch preview window during insert completion
		set copyindent              " mimic the existing indent structure (tabs/spaces) when auto-indenting
		set directory^=$HOME/.vim/tmp//  " put swap files in ~/.vim/tmp, // = full-path names to avoid clashes
		set encoding=utf-8          " use UTF-8 as the internal character encoding
		set foldlevelstart=20       " start editing with folds up to level 20 open (effectively unfolded)
		set foldmethod=syntax       " define folds based on the language's syntax highlighting
		set formatoptions=qrn1      " formatting: allow gq, auto-continue comments, smart numbered lists, no break after 1-char word
		set gdefault                " :substitute replaces all matches on a line by default (flips the /g flag)
		set hidden                  " allow switching away from a modified buffer without saving it
		set history=1000            " remember 1000 command-line and search history entries
		set hlsearch                " highlight all matches of the last search
		set ignorecase              " make searches case-insensitive...
		set incsearch               " jump to / highlight matches incrementally as you type the search
		set laststatus=2            " always show the status line, even with a single window
		set modelines=0             " disable modelines (file-embedded settings) for security
		set mouse=a                 " enable mouse support in all modes
		set number                  " show line numbers
		set relativenumber          " show line numbers relative to the cursor (combines with 'number' for hybrid)
		set scrolloff=9             " keep at least 9 lines visible above/below the cursor
		set shiftwidth=4            " use 4 spaces for each step of (auto)indent
		set smartcase               " ...but become case-sensitive if the search contains uppercase letters
		set smarttab                " let <Tab> at line start insert 'shiftwidth' worth of indent
		set tabstop=4               " render a literal tab as 4 columns wide
		set textwidth=79            " wrap/format text at 79 columns
		set title                   " let Vim set the terminal window title
		set undodir=~/.vimundo      " store persistent undo files in ~/.vimundo
		set undofile                " save undo history to a file so undo persists across sessions
		set undolevels=1000         " keep up to 1000 levels of undo
		set viminfo^=%              " also save and restore the buffer list in the viminfo file
		set wildignore=*.swp,*.bak,*.pyc,*.class  " ignore these file patterns when expanding/completing filenames
		set wrap                    " visually wrap long lines instead of letting them run off-screen
		set wrapscan                " let searches wrap around the end of the file back to the start

		set nobackup                " don't keep a backup copy of a file after overwriting it
		set nowb                    " don't make a backup right before overwriting (nowritebackup)
		set noswapfile              " don't create swap files for buffers

		syntax enable

		set nolist                    " display otherwise-invisible whitespace characters
		" But only interesting whitespace
		if &listchars ==# 'eol:$'
		  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+  " how to render tabs, trailing spaces, off-screen text, and non-breaking spaces
		endif
	'';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rokn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
