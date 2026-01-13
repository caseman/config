" Casey's color scheme
" Thanks to Gerardo Galindez for the template
" https://github.com/ggalindezb/vim_colorscheme_template

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="casey"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=255     ctermbg=233    cterm=none
hi NormalNC        ctermfg=251     ctermbg=233    cterm=none
hi Cursor          ctermfg=247     ctermbg=81      cterm=none
hi TermCursor      ctermfg=255    ctermbg=81    cterm=none
hi TermCursorNC    ctermfg=251    ctermbg=233    cterm=none
hi CursorLine      ctermfg=none    ctermbg=none    cterm=none
hi LineNr          ctermfg=242     ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=252     ctermbg=16      cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=173     ctermbg=52      cterm=none

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=none    ctermbg=none   cterm=standout,bold
hi IncSearch       ctermfg=none    ctermbg=239   cterm=standout,bold
"hi IncSearch       ctermfg=234     ctermbg=228     cterm=bold

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=193    ctermbg=237    cterm=none
hi StatusLineNC    ctermfg=245    ctermbg=235    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none     ctermbg=130     cterm=none
hi Visual          ctermfg=234     ctermbg=81      cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=239     ctermbg=none    cterm=none

hi Todo            ctermfg=123     ctermbg=none    cterm=bold,reverse
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=219     ctermbg=52      cterm=undercurl,bold
hi ErrorMsg        ctermfg=160    ctermbg=none     cterm=bold
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=31    ctermbg=none    cterm=bold
hi String          ctermfg=210     ctermbg=none    cterm=italic
hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
hi Character       ctermfg=71      ctermbg=none    cterm=italic,bold
hi Number          ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=none    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none

hi Identifier      ctermfg=none    ctermbg=none    cterm=bold
hi Function        ctermfg=157     ctermbg=none    cterm=none
hi pythonBuiltin   ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=186     ctermbg=238      cterm=bold
hi Conditional     ctermfg=186     ctermbg=none    cterm=bold
hi Repeat          ctermfg=186     ctermbg=none    cterm=bold
hi Label           ctermfg=253     ctermbg=none     cterm=underline,bold
hi Operator        ctermfg=none     ctermbg=none    cterm=bold
hi Keyword         ctermfg=25     ctermbg=none    cterm=none
hi Exception       ctermfg=186     ctermbg=none    cterm=bold
hi Comment         ctermfg=72      ctermbg=none    cterm=italic

hi Special         ctermfg=225     ctermbg=none    cterm=italic
hi SpecialChar     ctermfg=222    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=225     ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ---------
" - Ocaml -
" ---------
hi ocamlArrow      ctermfg=187     ctermbg=none    cterm=bold
hi ocamlStar       ctermfg=187     ctermbg=none    cterm=bold
hi link ocamlOperator ocamlEqual
hi ocamlEqual      ctermfg=187     ctermbg=none    cterm=bold
hi ocamlKeyChar      ctermfg=33     ctermbg=none    cterm=bold
hi ocamlFloat      ctermfg=193     ctermbg=none    cterm=none
hi ocamlCons      ctermfg=63     ctermbg=17    cterm=bold
hi ocamlEncl        ctermfg=216     ctermbg=none    cterm=bold
hi ocamlEmptyConstructor        ctermfg=193     ctermbg=none    cterm=none
hi ocamlLCIdentifier        ctermfg=51     ctermbg=none    cterm=none

" -------------
" - Markdown  -
" -------------
hi link markdownH1delimiter markdownH1
hi markdownH1      ctermfg=224     ctermbg=88    cterm=bold
"
hi link markdownH2delimiter markdownH2
hi markdownH2      ctermfg=153     ctermbg=55    cterm=bold

hi link markdownH3delimiter markdownH3
hi markdownH3      ctermfg=223     ctermbg=52    cterm=italic

hi markdownCodeDelimiter   ctermfg=194     ctermbg=none    cterm=italic

hi markdownCode    ctermfg=193     ctermbg=17    cterm=italic
hi markdownCodeBlock    ctermfg=193     ctermbg=17

" -------------
" - vimscript -
" -------------
hi vimHighlight    ctermfg=186     ctermbg=none    cterm=bold
hi vimCommand      ctermfg=186     ctermbg=none    cterm=bold
hi vimIsCommand    ctermfg=186     ctermbg=none    cterm=bold
hi vimSetSep       ctermfg=186     ctermbg=none    cterm=bold
hi vimVar          ctermfg=none    ctermbg=none    cterm=none
hi vimHiAttrib     ctermfg=none    ctermbg=none    cterm=bold
hi vimHiNmbr       ctermfg=none    ctermbg=none    cterm=bold
"
" ----------
" - C like -
" ----------
hi PreProc         ctermfg=31      ctermbg=none    cterm=bold,italic
hi Include         ctermfg=31      ctermbg=none    cterm=bold,italic
hi Define          ctermfg=43      ctermbg=none    cterm=none
hi Macro           ctermfg=43      ctermbg=none    cterm=none
hi PreCondit       ctermfg=31      ctermbg=236     cterm=bold,italic
hi cMakeVariable   ctermfg=74      ctermbg=none    cterm=none

hi cDelimiter      ctermfg=none     ctermbg=none    cterm=bold
hi cBraces         ctermfg=none     ctermbg=none    cterm=bold
hi Type            ctermfg=74      ctermbg=none    cterm=none
hi StorageClass    ctermfg=74      ctermbg=none    cterm=bold
hi cStructure      ctermfg=74      ctermbg=17      cterm=bold
hi Structure       ctermfg=none    ctermbg=none    cterm=bold
hi Typedef         ctermfg=74      ctermbg=17      cterm=bold
"
" ----------
" - Golang -
" ----------
hi goImport        ctermfg=31      ctermbg=none    cterm=bold,italic
hi goPackage       ctermfg=31      ctermbg=none    cterm=bold,italic

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=236    ctermbg=28    cterm=none
hi DiffChange      ctermfg=none   ctermbg=24    cterm=none
hi DiffDelete      ctermfg=236    ctermbg=88    cterm=none
hi DiffText        ctermfg=none   ctermbg=none    cterm=undercurl

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=19    cterm=none
hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
