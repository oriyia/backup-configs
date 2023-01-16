require'nvim-web-devicons'.setup {
}

local colors = require('colors.colors')
-- Настройки для иконок брал здесь:
-- https://github.com/kyazdani42/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua#L43

require("nvim-web-devicons").set_icon{
  lua = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "74",
    name = "Lua",
  },
  markdown = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "67",
    name = "Markdown",
  },
  md = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "white",
    name = "Md",
  },
  py = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "61",
    name = "Py",
  },
  pyc = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "61",
    name = "Py",
  },
  pyd = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "67",
    name = "Pyo",
  },
  pyo = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "67",
    name = "Pyo",
  },
  rs = {
    icon = "",
    color = colors.icons.orange,
    cterm_color = "180",
    name = "Rlib",
  },
  rlib = {
    icon = "",
    color = colors.icons.orange,
    cterm_color = "180",
    name = "Rlib",
  },
  vim = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "Vim",
  },
  zsh = {
    icon = "",
    color = colors.icons.cyan,
    cterm_color = "113",
    name = "Zsh",
  },
  bashprofile = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "BashProfile",
  },
  bashrc = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bashrc",
  },
  sh = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bashrc",
  },
  sql = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bashrc",
  },
  sqlite3 = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bashrc",
  },
  sqlite = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bashrc",
  },
  styl = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "107",
    name = "Styl",
  },
  v = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "SystemVerilog",
  },
  vhdl = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "SystemVerilog",
  },
  vh = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "SystemVerilog",
  },
  svh = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "SystemVerilog",
  },
  sv = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "SystemVerilog",
  },
  webp = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "140",
    name = "Webp",
  },
  xls = {
    icon = "",
    color = colors.icons.orange,
    cterm_color = "23",
    name = "Xls",
  },
  xml = {
    icon = "謹",
    color = colors.icons.orange,
    cterm_color = "173",
    name = "Xml",
  },
  tex = {
    icon = "𝗟",
    color = colors.icons.purple,
    cterm_color = "58",
    name = "Tex",
  },
  gitattributes = {
    icon = "𝗚",
    color = colors.icons.green,
    cterm_color = "59",
    name = "GitAttributes",
  },
  gitconfig = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "59",
    name = "GitConfig",
  },
  gitignore = {
    icon = "𝗚",
    color = colors.icons.green,
    cterm_color = "59",
    name = "GitIgnore",
  },
  gitmodules = {
    icon = "𝗚",
    color = colors.icons.green,
    cterm_color = "59",
    name = "GitModules",
  },
  npmignore = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "161",
    name = "NPMIgnore",
  },
  npmrc = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "161",
    name = "NPMrc",
  },
  vimrc = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "29",
    name = "Vimrc",
  },
  zprofile = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Zshprofile",
  },
  zshenv = {
    icon = "",
    color = colors.icons.cyan,
    cterm_color = "113",
    name = "Zshenv",
  },
  env = {
    icon = "",
    color = colors.icons.cyan,
    cterm_color = "113",
    name = "Zshenv",
  },
  lock = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "250",
    name = "Lock",
  },
  log = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "white",
    name = "Log",
  },
  txt = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Txt"
  },
  zshrc = {
    icon = "",
    color = colors.icons.cyan,
    cterm_color = "113",
    name = "Zshrc",
  },
  Dockerfile = {
    icon = "🐋",
    color = colors.icons.blue,
    cterm_color = "59",
    name = "Dockerfile",
  },
  awk = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "59",
    name = "Awk",
  },
  bash = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "113",
    name = "Bash",
  },
  bat = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "154",
    name = "Bat",
  },
  bmp = {
    icon = "🖼",
    color = colors.icons.purple,
    cterm_color = "140",
    name = "Bmp",
  },
  c = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "75",
    name = "C",
  },
  cfg = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "231",
    name = "Configuration",
  },
  cmake = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "66",
    name = "CMake",
  },
  makefile = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "66",
    name = "Makefile",
  },
  node_modules = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "161",
    name = "NodeModules",
  },
  pdf = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "124",
    name = "Pdf",
  },
  cob = {
    icon = "⚙",
    color = colors.icons.blue,
    cterm_color = "25",
    name = "Cobol",
  },
  cobol = {
    icon = "⚙",
    color = colors.icons.blue,
    cterm_color = "25",
    name = "Cobol",
  },
  coffee = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "185",
    name = "Coffee",
  },
  conf = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "66",
    name = "Conf",
  },
  cp = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "67",
    name = "Cp",
  },
  cpp = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "67",
    name = "Cpp",
  },
  cpy = {
    icon = "⚙",
    color = colors.icons.blue,
    cterm_color = "25",
    name = "Cobol",
  },
  cr = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "16",
    name = "Crystal",
  },
  cs = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "58",
    name = "Cs",
  },
  csh = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "59",
    name = "Csh",
  },
  cson = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "185",
    name = "Cson",
  },
  css = {
    icon = "",
    color = colors.icons.cyan,
    cterm_color = "39",
    name = "Css",
  },
  csv = {
    icon = "",
    color = colors.icons.green,
    cterm_color = "113",
    name = "Csv",
  },
  db = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "188",
    name = "Db",
  },
  diff = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "59",
    name = "Diff",
  },
  doc = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "25",
    name = "Doc",
  },
  dockerfile = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "59",
    name = "Dockerfile",
  },
  dump = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "188",
    name = "Dump",
  },
  gif = {
    icon = "",
    color = colors.icons.purple,
    cterm_color = "140",
    name = "Gif",
  },
  git = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "202",
    name = "GitLogo",
  },
  html = {
    icon = "",
    color = colors.icons.orange,
    cterm_color = "202",
    name = "Html",
  },
  ico = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "185",
    name = "Ico",
  },
  import = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "231",
    name = "ImportConfiguration",
  },
  ini = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "66",
    name = "Ini",
  },
  java = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "167",
    name = "Java",
  },
  less = {
    icon = "",
    color = colors.icons.purple,
    cterm_color = "60",
    name = "Less",
  },
  luau = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "74",
    name = "Luau",
  },
  png = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "140",
    name = "Jpeg",
  },
  svg = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "140",
    name = "Jpeg",
  },
  jpeg = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "140",
    name = "Jpeg",
  },
  jpg = {
    icon = "",
    color = colors.icons.yellow,
    cterm_color = "140",
    name = "Jpg",
  },
  terminal = {
    icon = "",
    color = colors.icons.grey,
    cterm_color = "67",
    name = "Tor",
  },
  t = {
    icon = "",
    color = colors.icons.blue,
    cterm_color = "67",
    name = "Tor",
  },
  js = {
    icon = "",
    color = colors.icons.red,
    cterm_color = "185",
    name = "Js",
  },
  json = {
    icon = "",
    color = colors.icons.orange,
    cterm_color = "185",
    name = "Json",
  },
  toml = {
    icon = "",
    color = colors.icons.purple,
    cterm_color = "66",
    name = "Toml",
  },
  yaml = {
    icon = "",
    color = colors.icons.purple,
    cterm_color = "66",
    name = "Yaml",
  },
  yml = {
    icon = "",
    color = colors.icons.purple,
    cterm_color = "66",
    name = "Yml",
  },
}
