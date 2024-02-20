local colors = {
-- NORAL&SignColumn bg = #130014
-- PATCH_OPEN
Normal = {fg = "#C91D73", bg = "#120014"},
Identifier = {link = "Normal"},
Boolean = {fg = "#D138FF"},
["@boolean"] = {link = "Boolean"},
["@character"] = {link = "Character"},
ColorColumn = {bg = "#350E39"},
Comment = {fg = "#652E6B"},
["@comment"] = {link = "Comment"},
Conceal = {fg = "#6F3276"},
Constant = {fg = "#B75B1A"},
["@constant"] = {link = "Constant"},
["@define"] = {link = "Constant"},
CurSearch = {fg = "#120014", bg = "#8700E0"},
Search = {link = "CurSearch"},
Cursor = {fg = "#120014", bg = "#C91D73"},
CursorColumn = {bg = "#350E39"},
CursorLine = {bg = "#350E39"},
CursorLineFold = {fg = "#0B1819", bg = "#9900FF"},
CursorLineNr = {fg = "#D24B8F"},
Debug = {fg = "#0F9CA9"},
["@debug"] = {link = "Debug"},
DiagnosticError = {fg = "#D22819"},
DiagnosticHint = {fg = "#D78ED7"},
DiagnosticInfo = {fg = "#8700E0"},
DiagnosticOk = {fg = "#0FBD40"},
DiagnosticUnderlineError = {sp = "#AD2B1F", undercurl = true},
DiagnosticUnderlineHint = {sp = "#D78ED7", undercurl = true},
DiagnosticUnderlineInfo = {sp = "#8700E0", undercurl = true},
DiagnosticUnderlineOk = {sp = "#0FBD40", undercurl = true},
DiagnosticUnderlineWarn = {sp = "#EA711A", undercurl = true},
DiagnosticWarn = {fg = "#EA711A"},
DiffAdd = {fg = "#0FBD40"},
DiffChange = {fg = "#E0DE52"},
DiffDelete = {fg = "#AD2B1F"},
DiffText = {sp = "#E0DE52", undercurl = true},
Directory = {fg = "#8700E0"},
EndOfBuffer = {fg = "#9B2761"},
Error = {fg = "#120014", bg = "#AD2B1F"},
ErrorMsg = {fg = "#C94B40", bg = "#470013"},
["@float"] = {link = "Float"},
FoldColumn = {fg = "#030707", bg = "#6B00B3"},
Folded = {fg = "#030707", bg = "#6B00B3"},
Function = {fg = "#3B4DAB"},
["@function"] = {link = "Function"},
["@method"] = {link = "Function"},
IblScope = {fg = "#4B9173"},
["@namespace"] = {link = "Identifier"},
["@variable"] = {link = "Identifier"},
["@include"] = {link = "Include"},
IndentBlanklineContextStart = {fg = "#4F0557", sp = "#C91D73", undercurl = true},
IndentBlanklineChar = {link = "IndentBlanklineSpaceCharBlankline"},
IndentBlanklineSpaceChar = {link = "IndentBlanklineSpaceCharBlankline"},
LineNr = {fg = "#DD7892"},
LineNrAbove = {fg = "#CE2751"},
LineNrBelow = {link = "LineNrAbove"},
LspReferenceText = {},
NonText = {fg = "#4F0557"},
Number = {fg = "#EA711A"},
Float = {link = "Number"},
["@number"] = {link = "Number"},
Operator = {fg = "#D78E9A"},
["@operator"] = {link = "Operator"},
["@punctuation"] = {link = "Operator"},
Pmenu = {fg = "#C91D73", bg = "#27022C"},
PmenuKind = {fg = "#EA711A"},
PmenuKindSel = {fg = "#F07014", bg = "#A1175C"},
PmenuSel = {fg = "#27022C", bg = "#A1175C"},
PmenuExtraSel = {link = "PmenuSel"},
PreProc = {fg = "#2F754E"},
Define = {link = "PreProc"},
Include = {link = "PreProc"},
Macro = {link = "PreProc"},
PreCondit = {link = "PreProc"},
["@function.macro"] = {link = "PreProc"},
["@macro"] = {link = "PreProc"},
["@preproc"] = {link = "PreProc"},
QuickFixLine = {fg = "#120014", bg = "#8700E0"},
SignColumn = {fg = "#FFFFFF", bg = "#120014"},
Special = {fg = "#AD2B1F"},
Delimiter = {link = "Special"},
SpecialChar = {link = "Special"},
SpecialComment = {link = "Special"},
Tag = {link = "Special"},
["@constant.builtin"] = {link = "Special"},
["@function.builtin"] = {link = "Special"},
["@character.special"] = {link = "SpecialChar"},
["@string.escape"] = {link = "SpecialChar"},
["@string.special"] = {link = "SpecialChar"},
SpellBad = {sp = "#AD2B1F", undercurl = true},
SpellCap = {sp = "#8700E0", undercurl = true},
SpellLocal = {sp = "#18CCDC", undercurl = true},
SpellRare = {link = "SpellLocal"},
Statement = {fg = "#A086EA"},
Conditional = {link = "Statement"},
Exception = {link = "Statement"},
Keyword = {link = "Statement"},
Label = {link = "Statement"},
Repeat = {link = "Statement"},
Typedef = {link = "Statement"},
["@conditional"] = {link = "Statement"},
["@exception"] = {link = "Statement"},
["@keyword"] = {link = "Statement"},
["@label"] = {link = "Statement"},
["@repeat"] = {link = "Statement"},
["@storageclass"] = {link = "StorageClass"},
String = {fg = "#D78ED7"},
Character = {link = "String"},
["@string"] = {link = "String"},
Structure = {fg = "#8700E0"},
["@lsp.type.class"] = {link = "Structure"},
["@structure"] = {link = "Structure"},
Substitute = {fg = "#120014", bg = "#C91D73"},
["@tag"] = {link = "Tag"},
TelescopeSelection = {fg = "#120014", bg = "#C91D73"},
Title = {fg = "#BA52FF"},
["@text.title"] = {link = "Title"},
Todo = {fg = "#C91D73", bg = "#53005C"},
["@text.todo"] = {link = "Todo"},
Type = {fg = "#7A00CC"},
StorageClass = {link = "Type"},
["@type"] = {link = "Type"},
["@type.definition"] = {link = "Typedef"},
Underlined = {fg = "#D78ED7", underline = true},
["@text.uri"] = {link = "Underlined"},
VimwikiBold = {fg = "#AA1824"},
Visual = {fg = "#120014", bg = "#BA1769"},
WarningMsg = {fg = "#E0DE52"},
Whitespace = {fg = "#4F0557"},
IndentBlanklineSpaceCharBlankline = {link = "Whitespace"},
WildMenu = {fg = "#120014", bg = "#8700E0"},
["@constant.macro"] = {fg = "#8700E0"},
["@constructor"] = {fg = "#CB763A"},
["@field"] = {fg = "#D411B4"},
["@method.call"] = {fg = "#677CE4"},
["@lsp.type.mehod"] = {link = "@method"},
["@parameter"] = {fg = "#AD2B1F"},
["@property"] = {fg = "#CD37B4"},
["@lsp.type.property"] = {link = "@property"},
["@text.literal"] = {fg = "#1D863B"},
["@text.reference"] = {fg = "#CD37B4"},
["@text.underline"] = {undercurl = true},
["@variable.builtin"] = {fg = "#10CB93"},
["@lsp.typemod.variable.defaultLibrary"] = {link = "@variable.builtin"},
["@lsp.type.variable"] = {link = "@variable"},
-- PATCH_CLOSE
}

-- apply highlight groups
for group, attrs in pairs(colors) do
  vim.api.nvim_set_hl(0, group, attrs)
end
