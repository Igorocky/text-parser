$( demo0.mm  1-Jan-04 $)

$(
                           ~~ PUBLIC DOMAIN ~~
This work is waived of all rights, including copyright, according to the CC0
Public Domain Dedication.  http://creativecommons.org/publicdomain/zero/1.0/

Norman Megill - email: nm at alum.mit.edu

$)


$( This file is the introductory formal system example described
   in Chapter 2 of the Meamath book. $)

$( Declare the constant symbols we will use $)
    $c 0 + = -> ( ) term wff |- $.
$( Declare the metavariables we will use $)
    $v t r s P Q $.
$( Specify properties of the metavariables $)
    tt $f term t $.
    tr $f term r $.
    ts $f term s $.
    wp $f wff P $.
    wq $f wff Q $.
$( Define "term" (part 1) $)
    tze $a term 0 $.
$( Define "term" (part 2) $)
    tpl $a term ( t + r ) $.
$( Define "wff" (part 1) $)
    weq $a wff t = r $.
$( Define "wff" (part 2) $)
    wim $a wff ( P -> Q ) $.
$( State axiom a1 $)
    a1 $a |- ( t = r -> ( t = s -> r = s ) ) $.
$( State axiom a2 $)
    a2 $a |- ( t + 0 ) = t $.
    ${
       min $e |- P $.
       maj $e |- ( P -> Q ) $.
$( Define the modus ponens inference rule $)
       mp  $a |- Q $.
    $}
$( Prove a theorem $)
    th1 $p |- t = t $=
  $( Here is its proof: $)
       tt tze tpl tt weq tt tt weq tt a2 tt tze tpl
       tt weq tt tze tpl tt weq tt tt weq wim tt a2
       tt tze tpl tt tt a1 mp mp
     $.

$( A theorem with invalid proof (two proof steps were swapped in comparison to the previous theorem) $)
    th2 $p |- t = t $=
  $( Here is its proof: $)
       tt tze tpl tt weq tt tt weq tt a2 tt tze tpl
       tt weq tze tt tpl tt weq tt tt weq wim tt a2
       tt tze tpl tt tt a1 mp mp
     $.

$( $t

/* The '$ t' (no space between '$' and 't') token indicates the beginning
    of the typesetting definition section, embedded in a Metamath
    comment.  There may only be one per source file, and the typesetting
    section ends with the end of the Metamath comment.  The typesetting
    section uses C-style comment delimiters.  TODO:  Allow multiple
    typesetting comments */

/* These are the LaTeX and HTML definitions in the order the tokens are
    introduced in $c or $v statements.  See HELP TEX or HELP HTML in the
    Metamath program. */

/* Note that the ALT= fields in htmldefs should be preceded by a space.  This
   ensures that a screen copy from the web page will have a space between
   symbols. */
/* Math font table with XITS and LaTeX defs:
   http://meeting.contextgarden.net/2011/talks/day3_05_ulrik_opentype/Samples/
           unimath-symbols.pdf */


/******* Web page format settings *******/

/* Custom CSS for Unicode fonts */
/* The woff font file was obtained from
   http://fred-wang.github.io/MathFonts/XITS/xits-math.woff 28-Aug-2015 */
htmlcss '<STYLE TYPE="text/css">\n' +
    '<!--\n' +
    '  .setvar { color: red; }\n' +
    '  .wff { color: blue; }\n' +
    '  .class { color: #C3C; }\n' +
    '  .symvar { border-bottom:1px dotted;color:#C3C}\n' +
    '  .typecode { color: gray }\n' +
    '  .hidden { color: gray }\n' +
    '  @font-face {\n' +
    '    font-family: XITSMath-Regular;\n' +
    '    src: url(xits-math.woff);\n' +
    '  }\n' +
    '  .math { font-family: XITSMath-Regular }\n' +
    '-->\n' +
    '</STYLE>\n' +
    '<LINK href="mmset.css" title="mmset"\n' +
    '    rel="stylesheet" type="text/css">\n' +
    '<LINK href="mmsetalt.css" title="mmsetalt"\n' +
    '    rel="alternate stylesheet" type="text/css">';

/* Tag(s) for the main SPAN surrounding all Unicode math */
htmlfont 'CLASS=math';

/* Page title, home page link */
htmltitle "Metamath Proof Explorer";
htmlhome '<A HREF="mmset.html"><FONT SIZE=-2 FACE=sans-serif>' +
    '<IMG SRC="mm.gif" BORDER=0 ALT='  +
    '"Home" HEIGHT=32 WIDTH=32 ALIGN=MIDDLE STYLE="margin-bottom:0px">' +
    'Home</FONT></A>';
/* Optional file where bibliographic references are kept */
/* If specified, e.g. "mmset.html", Metamath will hyperlink all strings of the
   form "[rrr]" (where "rrr" has no whitespace) to "mmset.html#rrr" */
/* A warning will be given if the file "mmset.html" with the bibliographical
   references is not present.  It is read in order to check existence of
   the references. */
htmlbibliography "mmset.html";

/* Page title, home page link */
/* These are the variables used for the Hilbert Space extension to
   set.mm. */
exthtmltitle "Hilbert Space Explorer";
exthtmlhome '<A HREF="mmhil.html"><FONT SIZE=-2 FACE=sans-serif>' +
    '<IMG SRC="atomic.gif" BORDER=0 ALT='  +
    '"Home" HEIGHT=32 WIDTH=32 ALIGN=MIDDLE STYLE="margin-bottom:0px">' +
    'Home</FONT></A>';
/* The variable "exthtmllabel" means that all states including
   and after this label should use the "ext..." variables. */
exthtmllabel "chil";
/* A warning will be given if the file with the bibliographical references
   is not present. */
exthtmlbibliography "mmhil.html";

/* Variable color key at the bottom of each proof table */
htmlvarcolor '<SPAN CLASS=wff STYLE="color:blue;font-style:normal">wff</SPAN> '
    + '<SPAN CLASS=setvar STYLE="color:red;font-style:normal">setvar</SPAN> '
    + '<SPAN CLASS=class STYLE="color:#C3C;font-style:normal">class</SPAN>';

/* GIF and Unicode HTML directories - these are used for the GIF version to
   crosslink to the Unicode version and vice-versa */
htmldir "../mpegif/";
althtmldir "../mpeuni/";


/******* Symbol definitions *******/

htmldef "(" as "<IMG SRC='lp.gif' WIDTH=5 HEIGHT=19 ALT=' (' TITLE='('>";
  althtmldef "(" as "(";
  latexdef "(" as "(";
htmldef ")" as "<IMG SRC='rp.gif' WIDTH=5 HEIGHT=19 ALT=' )' TITLE=')'>";
  althtmldef ")" as ")";
  latexdef ")" as ")";
htmldef "->" as
    " <IMG SRC='to.gif' WIDTH=15 HEIGHT=19 ALT=' -&gt;' TITLE='-&gt;'> ";
  althtmldef "->" as " &rarr; ";
  latexdef "->" as " \rightarrow ";
htmldef "&" as
    " <IMG SRC='amp.gif' WIDTH=12 HEIGHT=19 ALT='&amp;'> ";
  althtmldef "&" as " &amp; ";
  latexdef "&" as " & ";
htmldef "=>" as
  " <IMG SRC='bigto.gif' WIDTH=15 HEIGHT=19 ALT='=&gt;'> ";
  althtmldef "=>" as " &rArr; ";
  latexdef "=>" as " \Rightarrow ";
htmldef "-." as
    "<IMG SRC='lnot.gif' WIDTH=10 HEIGHT=19 ALT=' -.' TITLE='-.'> ";
  althtmldef "-." as '&not; ';
  latexdef "-." as "\lnot";
htmldef "wff" as
    "<IMG SRC='_wff.gif' WIDTH=24 HEIGHT=19 ALT=' wff' TITLE='wff'> ";
  althtmldef "wff" as
    '<SPAN CLASS=typecode STYLE="color:gray">wff </SPAN>'; /* was #00CC00 */
  latexdef "wff" as "{\rm wff}";
htmldef "|-" as
    "<IMG SRC='_vdash.gif' WIDTH=10 HEIGHT=19 ALT=' |-' TITLE='|-'> ";
  althtmldef "|-" as
    '<SPAN CLASS=hidden STYLE="color:gray">&#8866; </SPAN>'; /* &vdash; */
    /* Without sans-serif, way too big in FF3 */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "|-" as "\vdash";
htmldef "ph" as
    "<IMG SRC='_varphi.gif' WIDTH=11 HEIGHT=19 ALT=' ph' TITLE='ph'>";
  /* althtmldef "ph" as '<FONT COLOR="#0000FF">&#x1D711;</SPAN>'; */
  althtmldef "ph" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D711;</SPAN>';
  latexdef "ph" as "\varphi";
htmldef "ps" as "<IMG SRC='_psi.gif' WIDTH=12 HEIGHT=19 ALT=' ps' TITLE='ps'>";
  althtmldef "ps" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D713;</SPAN>';
  latexdef "ps" as "\psi";
htmldef "ch" as "<IMG SRC='_chi.gif' WIDTH=12 HEIGHT=19 ALT=' ch' TITLE='ch'>";
  althtmldef "ch" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D712;</SPAN>';
  latexdef "ch" as "\chi";
htmldef "th" as
    "<IMG SRC='_theta.gif' WIDTH=8 HEIGHT=19 ALT=' th' TITLE='th'>";
  althtmldef "th" as
    '<SPAN CLASS=wff STYLE="color:blue">&#x1D703;</SPAN>';
  latexdef "th" as "\theta";
htmldef "ta" as "<IMG SRC='_tau.gif' WIDTH=10 HEIGHT=19 ALT=' ta' TITLE='ta'>";
  althtmldef "ta" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D70F;</SPAN>';
  latexdef "ta" as "\tau";
htmldef "et" as "<IMG SRC='_eta.gif' WIDTH=9 HEIGHT=19 ALT=' et' TITLE='et'>";
  althtmldef "et" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D702;</SPAN>';
  latexdef "et" as "\eta";
htmldef "ze" as "<IMG SRC='_zeta.gif' WIDTH=9 HEIGHT=19 ALT=' ze' TITLE='ze'>";
  althtmldef "ze" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D701;</SPAN>';
  latexdef "ze" as "\zeta";
htmldef "si" as
    "<IMG SRC='_sigma.gif' WIDTH=10 HEIGHT=19 ALT=' si' TITLE='si'>";
  althtmldef "si" as
    '<SPAN CLASS=wff STYLE="color:blue">&#x1D70E;</SPAN>';
  latexdef "si" as "\sigma";
htmldef "rh" as "<IMG SRC='_rho.gif' WIDTH=9 HEIGHT=19 ALT=' rh' TITLE='rh'>";
  althtmldef "rh" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D70C;</SPAN>';
  latexdef "rh" as "\rho";
htmldef "mu" as "<IMG SRC='_mu.gif' WIDTH=10 HEIGHT=19 ALT=' mu' TITLE='mu'>";
  althtmldef "mu" as '<SPAN CLASS=wff STYLE="color:blue">&#x1D707;</SPAN>';
  latexdef "mu" as "\mu";
htmldef "la" as
    "<IMG SRC='_lambda.gif' WIDTH=9 HEIGHT=19 ALT=' la' TITLE='la'>";
  althtmldef "la" as
    '<SPAN CLASS=wff STYLE="color:blue">&#x1D706;</SPAN>';
  latexdef "la" as "\lambda";
htmldef "ka" as
    "<IMG SRC='_kappa.gif' WIDTH=9 HEIGHT=19 ALT=' ka' TITLE='ka'>";
  althtmldef "ka" as
    '<SPAN CLASS=wff STYLE="color:blue">&#x1D705;</SPAN>';
  latexdef "ka" as "\kappa";
htmldef "<->" as " <IMG SRC='leftrightarrow.gif' WIDTH=15 HEIGHT=19 " +
    "ALT=' &lt;-&gt;' TITLE='&lt;-&gt;'> ";
  althtmldef "<->" as ' &harr; ';
  latexdef "<->" as "\leftrightarrow";
htmldef "\/" as
     " <IMG SRC='vee.gif' WIDTH=11 HEIGHT=19 ALT=' \/' TITLE='\/'> ";
  althtmldef "\/" as ' &or; ' ;
    /* althtmldef "\/" as ' <FONT FACE=sans-serif>&#8897;</FONT> ' ; */
    /* was &or; - changed to match font of &and; replacement */
    /* Changed back 6-Mar-2012 NM */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "\/" as "\vee";
htmldef "/\" as
    " <IMG SRC='wedge.gif' WIDTH=11 HEIGHT=19 ALT=' /\' TITLE='/\'> ";
  althtmldef "/\" as ' &and; ';
    /* althtmldef "/\" as ' <FONT FACE=sans-serif>&#8896;</FONT> '; */
    /* was &and; which is circle in Mozilla on WinXP Pro (but not Home) */
    /* Changed back 6-Mar-2012 NM */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "/\" as "\wedge";
htmldef "-/\" as
    " <IMG SRC='barwedge.gif' WIDTH=9 HEIGHT=19 ALT=' -/\' TITLE='-/\'> ";
  althtmldef "-/\" as ' &#8892; ';
    /*althtmldef "-/\" as " &#8892; "; */ /* too-high font bug in FF */
    /* barwedge, U022BC, alias ISOAMSB barwed, ['nand'] */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "-/\" as "\barwedge";
htmldef "\/_" as
    " <IMG SRC='veebar.gif' WIDTH=9 HEIGHT=19 ALT=' \/_' TITLE='\/_'> ";
  althtmldef "\/_" as " &#8891; ";
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "\/_" as "\veebar";
htmldef "T." as
    " <IMG SRC='top.gif' WIDTH=11 HEIGHT=19 ALT='T.' TITLE='T.'> ";
  althtmldef "T." as '&#x22A4;';
  latexdef "T." as "\top";
htmldef "F." as
    " <IMG SRC='perp.gif' WIDTH=11 HEIGHT=19 ALT='F.' TITLE='F.'> ";
  althtmldef "F." as '&perp;';
  latexdef "F." as "\bot";
htmldef "hadd" as "hadd";
  althtmldef "hadd" as "hadd";
  latexdef "hadd" as "\mbox{hadd}";
htmldef "cadd" as "cadd";
  althtmldef "cadd" as "cadd";
  latexdef "cadd" as "\mbox{cadd}";
htmldef "A." as
    "<IMG SRC='forall.gif' WIDTH=10 HEIGHT=19 ALT=' A.' TITLE='A.'>";
  althtmldef "A." as '&forall;'; /* &#8704; */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "A." as "\forall";
htmldef "setvar" as
    "<IMG SRC='_setvar.gif' WIDTH=40 HEIGHT=19 ALT=' setvar' TITLE='setvar'> ";
  althtmldef
    "setvar" as '<SPAN CLASS=typecode STYLE="color:gray">setvar </SPAN>';
  latexdef "setvar" as "{\rm setvar}";
htmldef "x" as "<IMG SRC='_x.gif' WIDTH=10 HEIGHT=19 ALT=' x' TITLE='x'>";
  /* http://www.unicode.org/charts/PDF/U1D400.pdf has math italic Unicode */
  althtmldef "x" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D465;</SPAN>';
  latexdef "x" as "x";
htmldef "y" as "<IMG SRC='_y.gif' WIDTH=9 HEIGHT=19 ALT=' y' TITLE='y'>";
  althtmldef "y" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D466;</SPAN>';
  latexdef "y" as "y";
htmldef "z" as "<IMG SRC='_z.gif' WIDTH=9 HEIGHT=19 ALT=' z' TITLE='z'>";
  althtmldef "z" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D467;</SPAN>';
  latexdef "z" as "z";
htmldef "w" as "<IMG SRC='_w.gif' WIDTH=12 HEIGHT=19 ALT=' w' TITLE='w'>";
  althtmldef "w" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D464;</SPAN>';
  latexdef "w" as "w";
htmldef "v" as "<IMG SRC='_v.gif' WIDTH=9 HEIGHT=19 ALT=' v' TITLE='v'>";
  althtmldef "v" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D463;</SPAN>';
  latexdef "v" as "v";
htmldef "u" as "<IMG SRC='_u.gif' WIDTH=10 HEIGHT=19 ALT=' u' TITLE='u'>";
  althtmldef "u" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D462;</SPAN>';
  latexdef "u" as "u";
htmldef "t" as "<IMG SRC='_t.gif' WIDTH=7 HEIGHT=19 ALT=' t' TITLE='t'>";
  althtmldef "t" as '<SPAN CLASS=setvar STYLE="color:red">&#x1D461;</SPAN>';
  latexdef "t" as "t";
htmldef "E." as
    "<IMG SRC='exists.gif' WIDTH=9 HEIGHT=19 ALT=' E.' TITLE='E.'>";
  althtmldef "E." as '&exist;'; /* &#8707; */
    /* Without sans-serif, bad in Opera and way too big in FF3 */
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "E." as "\exists";
htmldef "F/" as
    "<IMG SRC='finv.gif' WIDTH=9 HEIGHT=19 ALT=' F/' TITLE='F/'>";
  althtmldef "F/" as "&#8498;";
  latexdef "F/" as "\Finv";
htmldef "class" as
    "<IMG SRC='_class.gif' WIDTH=32 HEIGHT=19 ALT=' class' TITLE='class'> ";
  althtmldef "class" as
    '<SPAN CLASS=typecode STYLE="color:gray">class </SPAN>';
  latexdef "class" as "{\rm class}";
htmldef "=" as " <IMG SRC='eq.gif' WIDTH=12 HEIGHT=19 ALT=' =' TITLE='='> ";
  althtmldef "=" as ' = '; /* &equals; */
  latexdef "=" as "=";
htmldef "e." as " <IMG SRC='in.gif' WIDTH=10 HEIGHT=19 ALT=' e.' TITLE='e.'> ";
  althtmldef "e." as ' &isin; ';
    /* 2-Jan-2016 reverted sans-serif */
  latexdef "e." as "\in";
htmldef "[" as "<IMG SRC='lbrack.gif' WIDTH=5 HEIGHT=19 ALT=' [' TITLE='['>";
  althtmldef "[" as '['; /* &lsqb; */
  latexdef "[" as "[";
htmldef "/" as
    " <IMG SRC='solidus.gif' WIDTH=6 HEIGHT=19 ALT=' /' TITLE='/'> ";
  althtmldef "/" as ' / '; /* &sol; */
  latexdef "/" as "/";
htmldef "]" as "<IMG SRC='rbrack.gif' WIDTH=5 HEIGHT=19 ALT=' ]' TITLE=']'>";
  althtmldef "]" as ']'; /* &rsqb; */
  latexdef "]" as "]";
htmldef "E!" as "<IMG SRC='_e1.gif' WIDTH=12 HEIGHT=19 ALT=' E!' TITLE='E!'>";

/* End of typesetting definition section */
$)

