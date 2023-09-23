--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl
local main_magenta = hsl(330,75,45)
local main_dark_magenta = hsl(294,100,4)
local main_purple = hsl(276,100,44)
local main_green = hsl(137,85,40)
local main_cyan = hsl(185,80,48)
local main_orange = hsl(25,83,51)
local main_yellow = hsl(59,70,60)
local main_red = hsl(5,70,40)
local main_pink = hsl(300,48,70)
local main_blue = hsl(230,70,50)
-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global

local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
	-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
	-- groups, mostly used for styling UI elements.
	-- Comment them out and add your own properties to override the defaults.
	-- An empty definition `{}` will clear all styling, leaving elements looking
	-- like the 'Normal' group.
	-- To be able to link to a group, it must already be defined, so you may have
	-- to reorder items as you go.
	--
	-- See :h highlight-groups
	--
	--Ins
	ColorColumn    {bg=main_dark_magenta.li(10).de(40) }, -- Columns set with 'colorcolumn'
	Conceal        {fg=main_dark_magenta.li(30).de(60) }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor         {fg=main_dark_magenta, bg=main_magenta }, -- Character under the cursor
	CurSearch      {fg=main_dark_magenta, bg=main_purple }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
	-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
	-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
	CursorColumn   {bg=main_dark_magenta.li(10).de(40) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
	CursorLine     {bg=main_dark_magenta.li(10).de(40)}, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
	Directory      {fg=main_purple }, -- Directory names (and other special names in listings)
	DiffAdd        {fg=main_green }, -- Diff mode: Added line |diff.txt|
	DiffChange     {fg=main_yellow }, -- Diff mode: Changed line |diff.txt|
	DiffDelete     {fg=main_red }, -- Diff mode: Deleted line |diff.txt|
	DiffText       {gui="undercurl", sp=main_yellow }, -- Diff mode: Changed text within a changed line |diff.txt|
	EndOfBuffer    {fg=main_magenta.da(15).de(20) }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
	-- TermCursor     { }, -- Cursor in a focused terminal
	-- TermCursorNC   { }, -- Cursor in an unfocused terminal
	ErrorMsg       {fg=main_red.li(20).de(20), bg=main_dark_magenta.ro(50).li(10).sa(20)}, -- Error messages on the command line
	-- VertSplit      { }, -- Column separating vertically split windows
	   Folded         {fg=main_cyan.de(50).da(95), bg=main_purple.da(20).sa(10) }, -- Line used for closed folds
	   FoldColumn     {fg=main_cyan.de(50).da(95), bg=main_purple.da(20).sa(10) }, -- 'foldcolumn'
	SignColumn     {fg=hsl(0,0,100), bg=main_dark_magenta }, -- Column where |signs| are displayed
	-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	Substitute     {fg=main_dark_magenta, bg=main_magenta }, -- |:substitute| replacement text highlighting
	LineNr         {fg=main_magenta.li(40).de(20).ro(15) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
	LineNrAbove    {fg=main_magenta.li(5).de(10).ro(15) }, -- Line number for when the 'relativenumber' option is set, above the cursor line
	LineNrBelow    {LineNrAbove }, -- Line number for when the 'relativenumber' option is set, below the cursor line
	CursorLineNr   {fg=main_magenta.li(20).de(20) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
	CursorLineFold {fg=main_cyan.de(50).da(85), bg=main_purple.li(10).sa(10)}, -- Like FoldColumn when 'cursorline' is set for the cursor line
	-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
	-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
	-- MsgArea        { }, -- Area for messages and cmdline
	-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
	-- MoreMsg        { }, -- |more-prompt|
	NonText        {fg=main_dark_magenta.li(15).de(10) }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	Normal         {fg=main_magenta,bg=main_dark_magenta}, -- Normal text
	-- NormalFloat    { }, -- Normal text in floating windows.
	-- FloatBorder    { }, -- Border of floating windows.
	-- FloatTitle     { }, -- Title of floating windows.
	-- NormalNC       { }, -- normal text in non-current windows
	Pmenu          {fg=main_magenta, bg=main_dark_magenta.li(5).de(10) }, -- Popup menu: Normal item.
	PmenuSel       {bg=main_magenta.da(20), fg=main_dark_magenta.li(5).de(10)}, -- Popup menu: Selected item.
	PmenuKind      {fg=main_orange }, -- Popup menu: Normal item "kind"
	PmenuKindSel   {bg=main_magenta.da(20),fg=main_orange.sa(30)}, -- Popup menu: Selected item "kind"
	-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
	PmenuExtraSel  {PmenuSel }, -- Popup menu: Selected item "extra text"
	-- PmenuSbar      { }, -- Popup menu: Scrollbar.
	-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
	-- Question       { }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine   {fg=main_dark_magenta, bg=main_purple }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	Search         {CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
	-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
	SpellBad       {gui='undercurl', sp=main_red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	SpellCap       {gui='undercurl', sp=main_purple}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal     {gui='undercurl', sp=main_cyan }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	SpellRare      {SpellLocal }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
	-- StatusLine     { }, -- Status line of current window
	-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	-- TabLine        { }, -- Tab pages line, not active tab page label
	-- TabLineFill    { }, -- Tab pages line, where there are no labels
	-- TabLineSel     { }, -- Tab pages line, active tab page label
	Title          {fg=main_purple.li(40) }, -- Titles for output from ":set all", ":autocmd" etc.
	Visual         {fg=main_dark_magenta, bg=main_magenta.da(10).sa(10) }, -- Visual mode selection
	-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
	WarningMsg     {fg=main_yellow }, -- Warning messages
	Whitespace     {fg=main_dark_magenta.li(15).de(10) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
	WildMenu       {fg=main_dark_magenta, bg=main_purple }, -- Current match in 'wildmenu' completion
	-- WinBar         { }, -- Window bar of current window
	-- WinBarNC       { }, -- Window bar of not-current windows
	IndentBlanklineSpaceCharBlankline {Whitespace},
	IndentBlanklineSpaceChar          {IndentBlanklineSpaceCharBlankline},
	IndentBlanklineChar               {IndentBlanklineSpaceCharBlankline},
	IndentBlanklineContextStart       {fg=main_dark_magenta.li(15).de(10), gui='undercurl', sp=main_magenta},


	-- Common vim syntax groups used for all kinds of code and markup.
	-- Commented-out groups should chain up to their preferred (*) group
	-- by default.
	--
	-- See :h group-name
	--
	-- Uncomment and edit if you want more specific syntax highlighting.

	Comment        {fg=main_dark_magenta.li(30).de(60).da(10) }, -- Any comment

	Constant       {fg=main_orange.de(10).da(20) }, -- (*) Any constant
	String         {fg=main_pink }, --   A string constant: "this is a string"
	Character      {String }, --   A character constant: 'c', '\n'
	Number         {fg=main_orange }, --   A number constant: 234, 0xff
	Boolean        {fg=main_purple.li(30).ro(10) }, --   A boolean constant: TRUE, false
	Float          {Number }, --   A floating point constant: 2.3e10

	Identifier     {Normal }, -- (*) Any variable name
	Function       {fg=main_blue.de(30).da(10) }, --   Function name (also: methods for classes)

	Statement      {fg=main_purple.de(30).li(40).ro(-20) }, -- (*) Any statement
	Conditional    {Statement }, --   if, then, else, endif, switch, etc.
	Repeat         {Statement }, --   for, do, while, etc.
	Label          {Statement }, --   case, default, etc.
	Operator       {fg=main_pink.ro(50) }, --   "sizeof", "+", "*", etc.
	Keyword        {Statement }, --   any other keyword
	Exception      {Statement }, --   try, catch, throw

	PreProc        {fg=main_green.ro(10).da(20).de(50) }, -- (*) Generic Preprocessor
	Include        {PreProc }, --   Preprocessor #include
	Define         {PreProc }, --   Preprocessor #define
	Macro          {PreProc }, --   Same as Define
	PreCondit      {PreProc }, --   Preprocessor #if, #else, #endif, etc.

	Type           {fg=main_purple.de(30).li(50)}, -- (*) int, long, char, etc.
	StorageClass   {Type }, --   static, register, volatile, etc.
	Structure      {fg=main_purple}, --   struct, union, enum, etc.
	Typedef        {Statement}, --   A typedef

	Special        {fg=main_red}, -- (*) Any special symbol
	SpecialChar    {Special }, --   Special character in a constant
	Tag            {Special }, --   You can use CTRL-] on this
	Delimiter      {Special }, --   Character that needs attention
	SpecialComment {Special }, --   Special things inside a comment (e.g. '\n')
	Debug          {fg=main_cyan.da(25).sa(20) }, --   Debugging statements

	Underlined     { gui = "underline", fg=main_pink}, -- Text that stands out, HTML links
	-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
	Error          {fg=main_dark_magenta, bg=main_red }, -- Any erroneous construct
	Todo           {fg=main_magenta, bg=main_dark_magenta.li(15) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	-- These groups are for the native LSP client and diagnostic system. Some
	-- other LSP clients may use these groups, or use their own. Consult your
	-- LSP client's documentation.

	-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
	--
	LspReferenceText            { } , -- Used for highlighting "text" references
	-- LspReferenceRead            { } , -- Used for highlighting "read" references
	-- LspReferenceWrite           { } , -- Used for highlighting "write" references
	-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
	-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
	-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

	-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
	--
	   DiagnosticError            {fg=main_red.li(10).sa(30) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	   DiagnosticWarn             {fg=main_orange } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	   DiagnosticInfo             {fg=main_purple } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	   DiagnosticHint             {fg=main_pink } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	   DiagnosticOk               {fg=main_green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
	-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
	-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
	-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
	-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
	-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
	   DiagnosticUnderlineError   {gui="undercurl", sp=main_red } , -- Used to underline "Error" diagnostics.
	   DiagnosticUnderlineWarn    {gui="undercurl", sp=main_orange} , -- Used to underline "Warn" diagnostics.
	   DiagnosticUnderlineInfo    {gui="undercurl", sp=main_purple} , -- Used to underline "Info" diagnostics.
	   DiagnosticUnderlineHint    {gui="undercurl", sp=main_pink} , -- Used to underline "Hint" diagnostics.
	   DiagnosticUnderlineOk      {gui="undercurl", sp=main_green} , -- Used to underline "Ok" diagnostics.
	-- DiagnosticFloatingError    {DiagnosticError} , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
	-- DiagnosticFloatingWarn     {DiagnosticWarn} , -- Used to color "Warn" diagnostic messages in diagnostics float.
	-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
	-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
	-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
	-- DiagnosticSignError        {DiagnosticError} , -- Used for "Error" signs in sign column.
	-- DiagnosticSignWarn         {DiagnosticWarn} , -- Used for "Warn" signs in sign column.
	-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
	-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
	-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

	-- Tree-Sitter syntax groups.
	--
	-- See :h treesitter-highlight-groups, some groups may not be listed,
	-- submit a PR fix to lush-template!
	--
	-- Tree-Sitter groups are defined with an "@" symbol, which must be
	-- specially handled to be valid lua code, we do this via the special
	-- sym function. The following are all valid ways to call the sym function,
	-- for more details see https://www.lua.org/pil/5.html
	--
	-- sym("@text.literal")
	-- sym('@text.literal')
	-- sym"@text.literal"
	-- sym'@text.literal'
	--
	-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

	sym"@text.literal"      {fg=main_green.de(20).da(20) }, -- Comment
	sym"@text.reference"    {fg=main_magenta.li(10).de(20).ro(-20) }, -- Identifier
	sym"@text.title"        {Title }, -- Title
	sym"@text.uri"          {Underlined }, -- Underlined
	sym"@text.underline"    {gui="undercurl" }, -- Underlined
	sym"@text.todo"         {Todo }, -- Todo
	sym"@comment"           {Comment }, -- Comment
	sym"@punctuation"       {Operator }, -- Delimiter
	sym"@constant"          {Constant }, -- Constant
	sym"@constant.builtin"  {Special }, -- Special
	sym"@constant.macro"    {fg=main_purple }, -- Define
	sym"@define"            {Constant }, -- Define
	sym"@macro"             {PreProc }, -- Macro
	sym"@string"            {String }, -- String
	sym"@string.escape"     {SpecialChar }, -- SpecialChar
	sym"@string.special"    {SpecialChar }, -- SpecialChar
	sym"@character"         {Character }, -- Character
	sym"@character.special" {SpecialChar }, -- SpecialChar
	sym"@number"            {Number }, -- Number
	sym"@boolean"           {Boolean }, -- Boolean
	sym"@float"             {Float }, -- Float
	sym"@function"          {Function }, -- Function
	sym"@function.builtin"  {Special }, -- Special
	sym"@function.macro"    {PreProc }, -- Macro
	sym"@parameter"         {fg=main_red }, -- Identifier
	sym"@method"            {Function }, -- Function
	sym"@method.call"       {fg=main_blue.li(30)},
	sym"@field"             {fg=main_magenta.sa(40).ro(-20) }, -- Identifier
	sym"@property"          {fg=main_magenta.li(10).de(20).ro(-20)}, -- Identifier
	sym"@constructor"       {fg=main_orange.de(30) }, -- Special
	sym"@conditional"       {Statement }, -- Conditional
	sym"@repeat"            {Statement }, -- Repeat
	sym"@label"             {Statement }, -- Label
	sym"@operator"          {Operator }, -- Operator
	sym"@keyword"           {Statement }, -- Keyword
	sym"@exception"         {Statement }, -- Exception
	sym"@variable"          {Identifier }, -- Identifier
	sym"@variable.builtin"  {fg=main_cyan}, -- Stuff like this/self
	sym"@type"              {Type }, -- Type
	sym"@type.definition"   {Typedef }, -- Typedef
	sym"@storageclass"      {StorageClass }, -- StorageClass
	sym"@structure"         {Structure }, -- Structure
	sym"@namespace"         {Identifier }, -- Identifier
	sym"@include"           {Include }, -- Include
	sym"@preproc"           {PreProc }, -- PreProc
	sym"@debug"             {Debug }, -- Debug
	sym"@tag"               {Tag }, -- Tag
	-- LSP highlights
	sym"@lsp.type.class"    {Structure},
	sym"@lsp.type.property" {sym"@property"},
	sym"@lsp.type.variable" {sym"@variable"},
	sym"@lsp.type.mehod"    {sym"@method" },
	-- Plugins stuff
	TelescopeSelection      {bg=main_magenta,fg=main_dark_magenta},
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
