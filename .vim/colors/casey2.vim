" Casey's color scheme, based on "desert" circa 2004
" Original URL: http://hans.fugal.net/vim/colors/desert.vim

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="casey"

hi Normal guifg=White guibg=#262626 ctermfg=231 ctermbg=16

" highlight groups
hi Cursor guifg=#262626 guibg=white ctermfg=16 ctermbg=231
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit guifg=#7f7f7f guibg=#c2bfa5 gui=none ctermfg=102 ctermbg=145 cterm=none
hi Folded guifg=#cdb38b guibg=#672720 ctermfg=180 ctermbg=52
hi FoldColumn guifg=tan guibg=#333333 ctermfg=180 ctermbg=59
hi IncSearch guifg=slategrey guibg=khaki ctermfg=66 ctermbg=222
"hi LineNr
hi ModeMsg guifg=goldenrod ctermfg=178
hi MoreMsg guifg=SeaGreen ctermfg=29
hi NonText guifg=#444466 ctermfg=59
hi SpecialKey guifg=#444466 ctermfg=59
hi Question guifg=springgreen ctermfg=48
hi Search guifg=#1a1a1a guibg=khaki ctermfg=16 ctermbg=222
hi StatusLine guifg=black guibg=#c2bfa5 gui=none ctermfg=16 ctermbg=145 cterm=none
hi StatusLineNC guifg=#7f7f7f guibg=#c2bfa5 gui=none ctermfg=102 ctermbg=145 cterm=none
hi Title guifg=indianred ctermfg=167
hi Visual guifg=khaki guibg=olivedrab gui=none ctermfg=222 ctermbg=64 cterm=none
"hi VisualNOS
hi WarningMsg guifg=salmon ctermfg=209
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment guifg=skyblue ctermfg=117
hi Constant guifg=#ffa0a0 ctermfg=217
hi Identifier guifg=palegreen ctermfg=120
hi Statement guifg=khaki gui=bold ctermfg=222 cterm=bold
hi PreProc guifg=indianred ctermfg=167
hi Type guifg=turquoise gui=bold ctermfg=80 cterm=bold
hi Special guifg=wheat ctermfg=223
"hi Underlined
hi Ignore guifg=#666666 ctermfg=59
"hi Error
hi Todo guifg=orangered guibg=#eeee00 ctermfg=202 ctermbg=226
hi String guifg=#ffa0a0 gui=italic ctermfg=217 cterm=italic

" color terminal definitions
hi SpecialKey ctermfg=22
hi NonText ctermfg=18 cterm=bold
hi Directory ctermfg=30
hi ErrorMsg ctermfg=7 ctermbg=1 cterm=bold
hi IncSearch ctermfg=226 ctermbg=28 cterm=NONE
hi Search ctermfg=102 ctermbg=21 cterm=NONE
hi MoreMsg ctermfg=22
hi ModeMsg ctermfg=124 cterm=NONE
hi LineNr ctermfg=145 ctermbg=NONE cterm=NONE
hi Question ctermfg=28
hi StatusLine cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit cterm=reverse
hi Title ctermfg=5
hi Visual cterm=reverse
hi VisualNOS cterm=bold,underline
hi WarningMsg ctermfg=1
hi WildMenu ctermfg=0 ctermbg=3
hi Folded ctermfg=145 ctermbg=NONE
hi FoldColumn ctermfg=145 ctermbg=NONE
hi DiffAdd ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete ctermfg=4 ctermbg=6 cterm=bold
hi DiffText ctermbg=1 cterm=bold
hi Comment ctermfg=30
hi Constant ctermfg=124
hi Special ctermfg=5
hi Identifier ctermfg=6
hi Statement ctermfg=3
hi PreProc ctermfg=5
hi Type ctermfg=2
hi Underlined ctermfg=5 cterm=underline
hi Ignore ctermfg=7 cterm=bold
hi Ignore ctermfg=145
hi Error ctermfg=7 ctermbg=1 cterm=bold

" Popup menu hightLight Group
hi Pmenu guifg=LightBlue ctermfg=152 ctermbg=13
hi PmenuSel guifg=white ctermfg=231 ctermbg=7
hi PmenuSbar ctermbg=7
hi PmenuThumb guibg=Black ctermbg=16

"vim: sw=4
