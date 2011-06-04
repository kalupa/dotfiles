" Vim color file
" Converted from Textmate theme 10 Forward using Coloration v0.2.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "10 Forward"

hi Cursor  guifg=NONE guibg=#ffff55 gui=NONE
hi Visual  guifg=NONE guibg=#9aff00 gui=NONE
hi CursorLine  guifg=NONE guibg=#00091f gui=NONE
hi CursorColumn  guifg=NONE guibg=#00091f gui=NONE
hi LineNr  guifg=#676767 guibg=#000000 gui=NONE
hi VertSplit  guifg=#272727 guibg=#272727 gui=NONE
hi MatchParen  guifg=#f800ff guibg=NONE gui=NONE
hi StatusLine  guifg=#cdcdcd guibg=#272727 gui=bold
hi StatusLineNC  guifg=#cdcdcd guibg=#272727 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#9aff00 gui=NONE
hi IncSearch  guifg=NONE guibg=#520054 gui=NONE
hi Search  guifg=NONE guibg=#520054 gui=NONE
hi Directory  guifg=#00ff79 guibg=NONE gui=NONE
hi Folded  guifg=#5555ff guibg=#000000 gui=NONE

hi Normal  guifg=#cdcdcd guibg=#000000 gui=NONE
hi Boolean  guifg=#07ff00 guibg=NONE gui=NONE
hi Character  guifg=#86ff00 guibg=NONE gui=NONE
hi Comment  guifg=#5555ff guibg=#00001a gui=italic
hi Conditional  guifg=#f800ff guibg=#0c001a gui=NONE
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#f800ff guibg=NONE gui=NONE
hi ErrorMsg  guifg=#330000 guibg=#ff0007 gui=bold
hi WarningMsg  guifg=#330000 guibg=#ff0007 gui=bold
hi Float  guifg=#c6ff00 guibg=NONE gui=NONE
hi Function  guifg=#ff0086 guibg=#000000 gui=NONE
hi Identifier  guifg=#ff7900 guibg=#1a0c00 gui=NONE
hi Keyword  guifg=#f800ff guibg=NONE gui=NONE
hi Label  guifg=#fffc80 guibg=#1a0c00 gui=NONE
hi NonText  guifg=#141414 guibg=#00091f gui=NONE
hi Number  guifg=#c6ff00 guibg=NONE gui=NONE
hi Operator  guifg=#da002f guibg=#000000 gui=NONE
hi PreProc  guifg=#f800ff guibg=NONE gui=NONE
hi Special  guifg=#cdcdcd guibg=NONE gui=NONE
hi SpecialKey  guifg=#141414 guibg=#00091f gui=NONE
hi Statement  guifg=#f800ff guibg=#0c001a gui=NONE
hi StorageClass  guifg=#ff7900 guibg=#1a0c00 gui=NONE
hi String  guifg=#fffc80 guibg=#1a0c00 gui=NONE
hi Tag  guifg=#4d4d4d guibg=NONE gui=NONE
hi Title  guifg=#cdcdcd guibg=NONE gui=bold
hi Todo  guifg=#5555ff guibg=#00001a gui=inverse,bold,italic
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#f800ff guibg=#0c001a gui=NONE
hi rubyFunction  guifg=#ff0086 guibg=#000000 gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#00ff79 guibg=NONE gui=NONE
hi rubyConstant  guifg=#ff0007 guibg=#1a0001 gui=NONE
hi rubyStringDelimiter  guifg=#fffc80 guibg=#1a0c00 gui=NONE
hi rubyBlockParameter  guifg=#8083ff guibg=#0c001a gui=NONE
hi rubyInstanceVariable  guifg=#0086ff guibg=NONE gui=NONE
hi rubyInclude  guifg=#7900ff guibg=#0c001a gui=NONE
hi rubyGlobalVariable  guifg=#0086ff guibg=NONE gui=NONE
hi rubyRegexp  guifg=#fff800 guibg=#0d1a00 gui=NONE
hi rubyRegexpDelimiter  guifg=#fff800 guibg=#0d1a00 gui=NONE
hi rubyEscape  guifg=#86ff00 guibg=NONE gui=NONE
hi rubyControl  guifg=#f800ff guibg=#0c001a gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#da002f guibg=#000000 gui=NONE
hi rubyException  guifg=#7900ff guibg=#0c001a gui=NONE
hi rubyPseudoVariable  guifg=#0086ff guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#ff0007 guibg=#1a0001 gui=NONE
hi rubyRailsARAssociationMethod  guifg=#7900ff guibg=#0c001a gui=NONE
hi rubyRailsARMethod  guifg=#7900ff guibg=#0c001a gui=NONE
hi rubyRailsRenderMethod  guifg=#7900ff guibg=#0c001a gui=NONE
hi rubyRailsMethod  guifg=#7900ff guibg=#0c001a gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#5555ff guibg=#00001a gui=italic
hi erubyRailsMethod  guifg=#7900ff guibg=#0c001a gui=NONE
hi htmlTag  guifg=#797979 guibg=#17181e gui=NONE
hi htmlEndTag  guifg=#797979 guibg=#17181e gui=NONE
hi htmlTagName  guifg=#797979 guibg=#17181e gui=NONE
hi htmlArg  guifg=#797979 guibg=#17181e gui=NONE
hi htmlSpecialChar  guifg=#86ff00 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#ff7900 guibg=#1a0c00 gui=NONE
hi javaScriptRailsFunction  guifg=#7900ff guibg=#0c001a gui=NONE
hi javaScriptBraces  guifg=#ffffff guibg=#0d0d0d gui=bold
hi yamlKey  guifg=#4d4d4d guibg=NONE gui=NONE
hi yamlAnchor  guifg=#0086ff guibg=NONE gui=NONE
hi yamlAlias  guifg=#0086ff guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#ffbc80 guibg=NONE gui=NONE
hi cssURL  guifg=#fffc80 guibg=#1a0c00 gui=NONE
hi cssFunctionName  guifg=#7900ff guibg=#0c001a gui=NONE
hi cssColor  guifg=#00ff79 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#7900ff guibg=NONE gui=NONE
hi cssClassName  guifg=#363636 guibg=NONE gui=bold
hi cssValueLength  guifg=#c6ff00 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#00fff8 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
