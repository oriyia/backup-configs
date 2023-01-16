"""
    pygments.styles.my
    ~~~~~~~~~~~~~~~~~~~

    pygments "my" theme.
"""

from pygments.style import Style
from pygments.token import Token, Keyword, Name, Comment, String, Error, \
    Number, Operator, Generic, Whitespace


class MyStyle(Style):
    """
    Minimalistic "my" theme.
    """

    background_color = '#1f2329'
    highlight_color = '#959EAC'
    # default_style = ""

    styles = {
        Token:                     '#959EAC',
        Token.Prompt:              '#959EAC',
        Whitespace:                "#959EAC",        # class: 'w'
        Error:                     "#D14354", # class: 'err'

        Comment:                   "nobold italic #535965", # class: 'c'
        Comment.Multiline:         "",        # class: 'cm'
        Comment.Preproc:           "#959EAC", # class: 'cp'
        Comment.Single:            "",        # class: 'c1'
        Comment.Special:           "",        # class: 'cs'

        Keyword:                   "bold #D14354", # class: 'k'
        Keyword.Constant:          "#00979D", # class: 'kc'
        Keyword.Declaration:       "",        # class: 'kd'
        Keyword.Namespace:         "",        # class: 'kn'
        Keyword.Pseudo:            "#00979D", # class: 'kp'
        Keyword.Reserved:          "#00979D", # class: 'kr'
        Keyword.Type:              "#9165EF", # class: 'kt'

        Operator:                  "#0FA4B9", # class: 'o' (=, +, -)
        Operator.Word:             "",        # class: 'ow'

        Name:                      "#959EAC", # class: 'n'
        Name.Attribute:            "",        # class: 'na'
        Name.Builtin:              "#5389F0", # class: 'nb' (print)
        Name.Builtin.Pseudo:       "",        # class: 'bp'
        Name.Class:                "bold #5389F0",  # class: 'nc'
        Name.Constant:             "#0FA4B9", # class: 'no'
        Name.Decorator:            "",        # class: 'nd'
        Name.Entity:               "",        # class: 'ni'
        Name.Exception:            "",        # class: 'ne'
        Name.Function:             "bold #5389F0", # class: 'nf'
        Name.Property:             "",        # class: 'py'
        Name.Label:                "",        # class: 'nl'
        Name.Namespace:            "",        # class: 'nn'
        Name.Other:                "#5389F0", # class: 'nx'
        Name.Tag:                  "",        # class: 'nt'
        Name.Variable:             "#0FA4B9", # class: 'nv'
        Name.Variable.Class:       "",        # class: 'vc'
        Name.Variable.Global:      "",        # class: 'vg'
        Name.Variable.Instance:    "",        # class: 'vi'

        Number:                    "#E39622", # class: 'm'
        Number.Float:              "",        # class: 'mf'
        Number.Hex:                "",        # class: 'mh'
        Number.Integer:            "",        # class: 'mi'
        Number.Integer.Long:       "",        # class: 'il'
        Number.Oct:                "",        # class: 'mo'

        String:                    "#2B9266", # class: 's'
        String.Backtick:           "",        # class: 'sb'
        String.Char:               "",        # class: 'sc'
        String.Doc:                "",        # class: 'sd'
        String.Double:             "",        # class: 's2'
        String.Escape:             "",        # class: 'se'
        String.Heredoc:            "",        # class: 'sh'
        String.Interpol:           "",        # class: 'si'
        String.Other:              "",        # class: 'sx'
        String.Regex:              "",        # class: 'sr'
        String.Single:             "",        # class: 's1'
        String.Symbol:             "",        # class: 'ss'

        Generic:                   "", # class: 'g'
        Generic.Deleted:           "",        # class: 'gd',
        Generic.Emph:              "",        # class: 'ge'
        Generic.Error:             "",        # class: 'gr'
        Generic.Heading:           "",        # class: 'gh'
        Generic.Inserted:          "",        # class: 'gi'
        Generic.Output:            "#758DB6",        # class: 'go'
        Generic.Prompt:            "#363B45", # class: 'gp' (подсказка)
        Generic.Strong:            "",        # class: 'gs'
        Generic.Subheading:        "",        # class: 'gu'
        Generic.Traceback:         "",        # class: 'gt'
    }

