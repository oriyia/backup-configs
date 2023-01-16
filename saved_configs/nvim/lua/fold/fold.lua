require('pretty-fold').setup{
    custom_function_arg = '> ',
    sections = {
        left = {
            '> ', 'content', ' •••••• ', 'number_of_folded_lines',
        },
        -- right = {
        --     ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
        --     function(config) return config.fill_char:rep(3) end
        -- }
    },
    fill_char = ' ',

    remove_fold_markers = true,

    -- Keep the indentation of the content of the fold string.
    keep_indentation = true,

    -- Possible values:
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    process_comment_signs = 'spaces',

    -- Comment signs additional to the value of `&commentstring` option.
    comment_signs = {},

    -- List of patterns that will be removed from content foldtext section.
    stop_words = {
        '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
    },

    add_close_pattern = true, -- true, 'last_line' or false

    matchup_patterns = {
        {  '{', '}' },
        { '%(', ')' }, -- % to escape lua pattern char
        { '%[', ']' }, -- % to escape lua pattern char
     },

     ft_ignore = { 'neorg' },
}

require('pretty-fold').ft_setup('tex', {
    custom_function_arg = '> ',
    sections = {
        left = {
            '> ', 'content', ' •••••• ', 'number_of_folded_lines',
        },
        -- right = {
        --     ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
        --     function(config) return config.fill_char:rep(3) end
        -- }
    },
    fill_char = ' ',

    remove_fold_markers = true,

    -- Keep the indentation of the content of the fold string.
    keep_indentation = true,

    -- Possible values:
    -- "delete" : Delete all comment signs from the fold string.
    -- "spaces" : Replace all comment signs with equal number of spaces.
    -- false    : Do nothing with comment signs.
    process_comment_signs = 'spaces',

    -- Comment signs additional to the value of `&commentstring` option.
    comment_signs = {},

    -- List of patterns that will be removed from content foldtext section.
    stop_words = {
        '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
    },

    add_close_pattern = false, -- true, 'last_line' or false

    matchup_patterns = {
      -- { '^%s*do$', 'end' }, -- do ... end blocks
      -- { '^%s*if', 'end' },  -- if ... end
      -- { '^%s*for', 'end' }, -- for
      -- { 'function%s*%(', 'end' }, -- 'function( or 'function (''
        {'^\\begin{document}', '^\\end{document}'},
        {'^\\part{.*}', '^\\(end|part|part%*){.*}'},
        {'^\\section{.*}', '^\\(end|part|part%*|section|section%*){.*}'},
        {'^\\subsection{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*){.*}'},
        {'^\\subsubsection{.*}', '^\\(end%{document%}|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*){.*}'},
        {'^\\paragraph{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*|paragraph|paragraph%*){.*}'},
        {'^\\subparagraph{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*|paragraph|paragraph%*|subparagraph|subparagraph%*){.*}'},
        {'^\\begin{document}', '^\\end{document}'},
        {'^\\part%*{.*}', '^\\(end|part|part%*){.*}'},
        {'^\\section%*{.*}', '^\\(end|part|part%*|section|section%*){.*}'},
        {'^\\subsection%*{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*){.*}'},
        {'^\\subsubsection%*{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*){.*}'},
        {'^\\paragraph%*{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*|paragraph|paragraph%*){.*}'},
        {'^\\subparagraph%*{.*}', '^\\(end|part|part%*|section|section%*|subsection|subsection%*|subsubsection|subsubsection%*|paragraph|paragraph%*|subparagraph|subparagraph%*){.*}'},
    },
})
