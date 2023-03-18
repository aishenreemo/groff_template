.\" defaults
.ds defpo 0.5i \" page offset
.ds defll 7.2i \" line length
.ds defhm 0.3i \" header margin
.ds deffm 0.i3 \" footer margin
.ds defps 12p  \" point size
.ds defvs 14p  \" vertical point size
.ds defff H    \" font family
.\" settings
.de page_offset
.       ie '\\$1'' .nr PO \\*[defpo]
.       el         .nr PO \\$1
.       po \\n[PO]u
..
.de line_length
.       ie '\\$1'' .nr LL \\*[defll]
.       el         .nr LL \\$1
.       ll \\n[LL]u
..
.de header_margin
.       ie '\\$1'' .nr HM \\*[defhm]
.       el         .nr HM \\$1
..
.de footer_margin
.       ie '\\$1'' .nr FM \\*[deffm]
.       el         .nr FM \\$1
..
.de point_size
.       ie '\\$1'' .nr PS \\*[defps]
.       el         .nr PS \\$1
.       ps \\n[PS]u
..
.de vertical_size
.       ie '\\$1'' .nr VS \\*[defvs]
.       el         .nr VS \\$1
.       vs \\n[VS]u
..
.de font_family
.       ie '\\$1'' .fam \\*[defff]
.       el         .fam \\$1
..
.\" macros
.de title
.       ie '\\$2'' .point_size +3p
.       el         .point_size \\$2
.       vertical_size +8p
.       br
.       SH
\\$1
.       br
.       LP
.       vertical_size
.       point_size
..
.page_offset
.line_length
.header_margin
.footer_margin
.point_size
.vertical_size
.font_family
.nr HY 0
