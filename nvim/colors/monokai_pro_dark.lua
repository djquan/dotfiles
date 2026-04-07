vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "monokai_pro_dark"

local palette = {
  bg = "#2d2a2e",
  bg_dark = "#221f22",
  bg_highlight = "#5b595c",
  surface = "#403e41",
  fg = "#fcfcfa",
  fg_dim = "#c1c0c0",
  muted = "#939293",
  red = "#ff6188",
  green = "#a9dc76",
  yellow = "#ffd866",
  orange = "#fc9867",
  purple = "#ab9df2",
  cyan = "#78dce8",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal", { fg = palette.fg, bg = palette.bg })
hi("NormalFloat", { fg = palette.fg, bg = palette.bg_dark })
hi("FloatBorder", { fg = palette.purple, bg = palette.bg_dark })
hi("CursorLine", { bg = palette.bg_dark })
hi("CursorColumn", { bg = palette.bg_dark })
hi("ColorColumn", { bg = palette.bg_dark })
hi("CursorLineNr", { fg = palette.yellow, bold = true })
hi("LineNr", { fg = palette.muted })
hi("SignColumn", { fg = palette.muted, bg = palette.bg })
hi("Visual", { bg = palette.bg_highlight })
hi("Search", { fg = palette.bg, bg = palette.yellow })
hi("IncSearch", { fg = palette.bg, bg = palette.orange })
hi("CurSearch", { fg = palette.bg, bg = palette.orange })
hi("MatchParen", { fg = palette.yellow, bold = true })
hi("Pmenu", { fg = palette.fg, bg = palette.bg_dark })
hi("PmenuSel", { fg = palette.bg, bg = palette.purple })
hi("PmenuSbar", { bg = palette.surface })
hi("PmenuThumb", { bg = palette.muted })
hi("StatusLine", { fg = palette.fg, bg = palette.surface })
hi("StatusLineNC", { fg = palette.muted, bg = palette.bg_dark })
hi("WinSeparator", { fg = palette.bg_highlight })
hi("VertSplit", { fg = palette.bg_highlight })
hi("TabLine", { fg = palette.fg_dim, bg = palette.bg_dark })
hi("TabLineSel", { fg = palette.bg, bg = palette.purple, bold = true })
hi("TabLineFill", { bg = palette.bg_dark })
hi("Directory", { fg = palette.cyan, bold = true })
hi("Title", { fg = palette.green, bold = true })
hi("Question", { fg = palette.green, bold = true })
hi("MoreMsg", { fg = palette.green })
hi("WarningMsg", { fg = palette.yellow })
hi("ErrorMsg", { fg = palette.red })
hi("NonText", { fg = palette.surface })
hi("Whitespace", { fg = palette.surface })
hi("Conceal", { fg = palette.muted })
hi("Folded", { fg = palette.muted, bg = palette.bg_dark })
hi("FoldColumn", { fg = palette.muted, bg = palette.bg })
hi("SpecialKey", { fg = palette.surface })
hi("SpellBad", { undercurl = true, sp = palette.red })
hi("SpellCap", { undercurl = true, sp = palette.yellow })
hi("SpellLocal", { undercurl = true, sp = palette.cyan })
hi("SpellRare", { undercurl = true, sp = palette.purple })

hi("Comment", { fg = palette.muted, italic = true })
hi("Constant", { fg = palette.orange })
hi("String", { fg = palette.yellow })
hi("Character", { fg = palette.yellow })
hi("Number", { fg = palette.orange })
hi("Boolean", { fg = palette.orange, bold = true })
hi("Float", { fg = palette.orange })
hi("Identifier", { fg = palette.fg })
hi("Function", { fg = palette.green })
hi("Statement", { fg = palette.red })
hi("Conditional", { fg = palette.red })
hi("Repeat", { fg = palette.red })
hi("Label", { fg = palette.red })
hi("Operator", { fg = palette.red })
hi("Keyword", { fg = palette.red, italic = true })
hi("Exception", { fg = palette.red })
hi("PreProc", { fg = palette.purple })
hi("Include", { fg = palette.red })
hi("Define", { fg = palette.purple })
hi("Macro", { fg = palette.purple })
hi("PreCondit", { fg = palette.purple })
hi("Type", { fg = palette.cyan })
hi("StorageClass", { fg = palette.red })
hi("Structure", { fg = palette.cyan })
hi("Typedef", { fg = palette.cyan })
hi("Special", { fg = palette.purple })
hi("SpecialChar", { fg = palette.purple })
hi("Tag", { fg = palette.red })
hi("Delimiter", { fg = palette.fg_dim })
hi("Underlined", { fg = palette.cyan, underline = true })
hi("Todo", { fg = palette.bg, bg = palette.yellow, bold = true })
hi("Error", { fg = palette.red, bold = true })

hi("DiffAdd", { bg = "#333f2f" })
hi("DiffChange", { bg = "#3a352e" })
hi("DiffDelete", { fg = palette.red, bg = "#3b272d" })
hi("DiffText", { bg = "#504530" })

hi("DiagnosticError", { fg = palette.red })
hi("DiagnosticWarn", { fg = palette.yellow })
hi("DiagnosticInfo", { fg = palette.cyan })
hi("DiagnosticHint", { fg = palette.purple })
hi("DiagnosticOk", { fg = palette.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = palette.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.cyan })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = palette.purple })

hi("GitSignsAdd", { fg = palette.green })
hi("GitSignsChange", { fg = palette.yellow })
hi("GitSignsDelete", { fg = palette.red })

local links = {
  ["@annotation"] = "PreProc",
  ["@attribute"] = "PreProc",
  ["@boolean"] = "Boolean",
  ["@character"] = "Character",
  ["@character.special"] = "SpecialChar",
  ["@comment"] = "Comment",
  ["@comment.error"] = "DiagnosticError",
  ["@comment.note"] = "DiagnosticInfo",
  ["@comment.todo"] = "Todo",
  ["@comment.warning"] = "DiagnosticWarn",
  ["@conditional"] = "Conditional",
  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@constant.macro"] = "Define",
  ["@constructor"] = "Type",
  ["@diff.delta"] = "DiffChange",
  ["@diff.minus"] = "DiffDelete",
  ["@diff.plus"] = "DiffAdd",
  ["@exception"] = "Exception",
  ["@field"] = "Identifier",
  ["@function"] = "Function",
  ["@function.builtin"] = "Function",
  ["@function.call"] = "Function",
  ["@function.macro"] = "Macro",
  ["@include"] = "Include",
  ["@keyword"] = "Keyword",
  ["@keyword.conditional"] = "Conditional",
  ["@keyword.exception"] = "Exception",
  ["@keyword.function"] = "Keyword",
  ["@keyword.operator"] = "Operator",
  ["@keyword.repeat"] = "Repeat",
  ["@label"] = "Label",
  ["@module"] = "Type",
  ["@namespace"] = "Type",
  ["@number"] = "Number",
  ["@operator"] = "Operator",
  ["@parameter"] = "Identifier",
  ["@parameter.reference"] = "Identifier",
  ["@property"] = "Identifier",
  ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.special"] = "Special",
  ["@string"] = "String",
  ["@string.escape"] = "SpecialChar",
  ["@string.regex"] = "Special",
  ["@string.special"] = "SpecialChar",
  ["@tag"] = "Tag",
  ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@type.definition"] = "Typedef",
  ["@type.qualifier"] = "StorageClass",
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
}

for group, target in pairs(links) do
  hi(group, { link = target })
end

vim.g.terminal_color_0 = palette.bg
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.yellow
vim.g.terminal_color_4 = palette.cyan
vim.g.terminal_color_5 = palette.purple
vim.g.terminal_color_6 = palette.cyan
vim.g.terminal_color_7 = palette.fg
vim.g.terminal_color_8 = "#727072"
vim.g.terminal_color_9 = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.cyan
vim.g.terminal_color_13 = palette.purple
vim.g.terminal_color_14 = palette.cyan
vim.g.terminal_color_15 = palette.fg
