return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("render-markdown").setup({
			render_modes = { "n", "i", "v", "c", "d" }, -- all modes
			completions = { lsp = { enabled = true } },
			checkbox = {
                unchecked = { icon = "" }, -- empty box
                checked   = { icon = "" }, -- regular checked
				enabled = true,
				render_modes = false,
				custom = {
					todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
					cons = { raw = "[c]", rendered = " ", highlight = "RenderMarkdownTableHead", scope_highlight = nil },
					pros = { raw = "[p]", rendered = " ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
					incomplete = { raw = "[/]", rendered = "󰪠 ", highlight = "RenderMarkdownWarn", scope_highlight = nil },
					forwarded = { raw = "[f]", rendered = " ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
					scheduling = { raw = "[<]", rendered = " ", highlight = "RenderMarkdownUnchecked", scope_highlight = nil },
					question = { raw = "[?]", rendered = " ", highlight = "RenderMarkdownH5", scope_highlight = nil },
					important = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownTableRow", scope_highlight = nil },
					star = { raw = "[*]", rendered = " ", highlight = "RenderMarkdownWarn", scope_highlight = nil },
					quote = { raw = '["]', rendered = " ", highlight = "RenderMarkdownH5", scope_highlight = nil },
					location = { raw = '[l]', rendered = " ", highlight = "RenderMarkdownTableHead", scope_highlight = nil },
					bookmark = { raw = '[b]', rendered = " ", highlight = "RenderMarkdownUnchecked", scope_highlight = nil },
					information = { raw = '[i]', rendered = "󰰄 ", highlight = "RenderMarkdownMath", scope_highlight = nil },
					savings = { raw = '[s]', rendered = " ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
					up = { raw = '[u]', rendered = "󰔵 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
					down = { raw = '[d]', rendered = "󰔳 ", highlight = "RenderMarkdownTableHead", scope_highlight = nil },
					idea = { raw = '[z]', rendered = "󰛨 ", highlight = "RenderMarkdownTableRow", scope_highlight = nil },
				},
			},
		})
	end,
}

--
-- Colors
--
-- The table below shows all the highlight groups with their default link
-- Highlight Group 	Default Group 	Description
-- RenderMarkdownH1 	@markup.heading.1.markdown 	H1 icons
-- RenderMarkdownH2 	@markup.heading.2.markdown 	H2 icons
-- RenderMarkdownH3 	@markup.heading.3.markdown 	H3 icons
-- RenderMarkdownH4 	@markup.heading.4.markdown 	H4 icons
-- RenderMarkdownH5 	@markup.heading.5.markdown 	H5 icons
-- RenderMarkdownH6 	@markup.heading.6.markdown 	H6 icons
-- RenderMarkdownH1Bg 	DiffText 	H1 background line
-- RenderMarkdownH2Bg 	DiffAdd 	H2 background line
-- RenderMarkdownH3Bg 	DiffChange 	H3 background line
-- RenderMarkdownH4Bg 	DiffDelete 	H4 background line
-- RenderMarkdownH5Bg 	Visual 	H5 background line
-- RenderMarkdownH6Bg 	CursorColumn 	H6 background line
-- RenderMarkdownCode 	ColorColumn 	Code block background
-- RenderMarkdownCodeInfo 	@label 	Code info, after language
-- RenderMarkdownCodeBorder 	RenderMarkdownCode 	Code border background
-- RenderMarkdownCodeFallback 	Normal 	Fallback for code language
-- RenderMarkdownCodeInline 	RenderMarkdownCode 	Inline code background
-- RenderMarkdownQuote 	@markup.quote 	Default for block quote
-- RenderMarkdownQuote1 	RenderMarkdownQuote 	Level 1 block quote marker
-- RenderMarkdownQuote2 	RenderMarkdownQuote 	Level 2 block quote marker
-- RenderMarkdownQuote3 	RenderMarkdownQuote 	Level 3 block quote marker
-- RenderMarkdownQuote4 	RenderMarkdownQuote 	Level 4 block quote marker
-- RenderMarkdownQuote5 	RenderMarkdownQuote 	Level 5 block quote marker
-- RenderMarkdownQuote6 	RenderMarkdownQuote 	Level 6 block quote marker
-- RenderMarkdownInlineHighlight 	RenderMarkdownCodeInline 	Inline highlights contents
-- RenderMarkdownBullet 	Normal 	List item bullet points
-- RenderMarkdownDash 	LineNr 	Thematic break line
-- RenderMarkdownSign 	SignColumn 	Sign column background
-- RenderMarkdownMath 	@markup.math 	Latex lines
-- RenderMarkdownIndent 	Whitespace 	Indent icon
-- RenderMarkdownHtmlComment 	@comment 	HTML comment inline text
-- RenderMarkdownLink 	@markup.link.label.markdown_inline 	Image & hyperlink icons
-- RenderMarkdownWikiLink 	RenderMarkdownLink 	WikiLink icon & text
-- RenderMarkdownUnchecked 	@markup.list.unchecked 	Unchecked checkbox
-- RenderMarkdownChecked 	@markup.list.checked 	Checked checkbox
-- RenderMarkdownTodo 	@markup.raw 	Todo custom checkbox
-- RenderMarkdownTableHead 	@markup.heading 	Pipe table heading rows
-- RenderMarkdownTableRow 	Normal 	Pipe table body rows
-- RenderMarkdownTableFill 	Conceal 	Pipe table inline padding
-- RenderMarkdownSuccess 	DiagnosticOk 	Success related callouts
-- RenderMarkdownInfo 	DiagnosticInfo 	Info related callouts
-- RenderMarkdownHint 	DiagnosticHint 	Hint related callouts
-- RenderMarkdownWarn 	DiagnosticWarn 	Warning related callouts
-- RenderMarkdownError 	DiagnosticError 	Error related callouts
