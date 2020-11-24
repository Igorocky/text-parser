$( set.mm - Version of 13-Jul-2020 $)
$( To prevent GitHub merge conflicts, please change the above date only if
there are no other pull requests in the queue.

New users:  See http://us.metamath.org/mpeuni/conventions.html to understand
our label naming conventions.  To break this file into smaller modules, in the
metamath program type "read set.mm" followed by "write source set.mm /split";
to recombine, omit "/split".  Feel free to ask questions at
http://groups.google.com/group/metamath .

See "help verify markup" in the metamath program for markup conventions.

Important recent changes:  On 19-Sep-2019, theorems exp3a and imp3a were
renamed expd and impd respectively.  On 20-Jan-2020, labels and token
*sqr* were renamed to *sqrt*.  $)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
            Metamath source file for logic and set theory
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

                           ~~ PUBLIC DOMAIN ~~
This work is waived of all rights, including copyright, according to the CC0
Public Domain Dedication.  http://creativecommons.org/publicdomain/zero/1.0/

Principal curator:  Norman Megill   http://us.metamath.org/email.html

Contributor list:

DA  David Abernethy      JJ  Jerry James           SO  Stefan O'Rear
SA  Stefan Allan         SJ  Szymon Jaroszewicz    JO  Jason Orendorff
TA  Thierry Arnoux       BJ  Benoit Jubin          JPP Jon Pennant
JA  Juha Arpiainen       JK  Jim Kingdon           RP  Richard Penner
JB  Jonathan Ben-Naim    WL  Wolf Lammen           SP  Stanislas Polu
GB  Gregory Bush         GL  Gerard Lang           JP  Josh Purinton
MC  Mario Carneiro       BL  Brendan Leahy         SR  Steve Rodriguez
FC  Filip Cernatescu     RL  Raph Levien           ATS Andrew Salmon
PC  Paul Chapman         FL  Frederic Line         AS  Alan Sare
DF  Drahflow             RFL Roy F. Longton        ES  Eric Schmidt
GD  Georgy Dunaev        GM  Giovanni Mascellani   GS  Glauco Siliprandi
SF  Scott Fenton         JM  Jeff Madsen           SS  Saveliy Skresanov
JGH Jeff Hankins         RM  Rodolfo Medina        JU  Jarvin Udandy
AH  Anthony Hart         NM  Norman Megill         AV  Alexander van der Vekens
DH  David Harvey         MM  Mykola Mostovenko     DAW David A. Wheeler
CH  Chen-Pang He         MO  Mel L. O'Cat          JY  Jonathan Yan
JH  Jeff Hoffman         OA  OpenAI                FZ  Fan Zheng

HTML code for accented names:
  GL G&eacute;rard Lang
  FL Fr&eacute;d&eacute;ric Lin&eacute;

$)

$( (See 'help verify markup' for help with modularization tags.) $)
$( Begin $[ set-header.mm $] $)

$(

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                          Contents of this header
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

1. Recent label changes
2. Quick "How To"
3. Bibliography
4. Metamath syntax summary
5. Other notes
6. Acceptable shorter proofs

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                          1. Recent label changes
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

This is part of an ongoing project to improve naming consistency.  If you have
suggestions for better names, let me know.

To update your mathbox, you can make global substitutions into
your local version by processing the ones WITHOUT "Notes" in REVERSE order.
The ones WITH "Notes" may have to be processed manually.

PROPOSED:
Date      Old       New         Notes
proposed  syl       imtri       (analogous to *bitr*, sstri, etc.)
proposed  sylib     imbitri     etc.
proposed  sylbid    biimtrd     etc.
proposed  sylbird   biimtrrd    etc.
proposed  syl5*     *trid       (syl5bi -> biimtrid; syl5eqel -> eqeltrid;etc.)
proposed  syl6*     *trdi
proposed  *mpt*     *mpf* or *mptf* (maps-to for functions)
proposed  *mpt2*    *mpo* or *mpto* (maps-to for operations)
(Please send any comments on these proposals to Norm Megill.)

DONE:
Date      Old       New         Notes

12-Jul-20 ralnex2   [same]      moved from GS's mathbox to main set.mm
10-Jul-20 [many]    [same]      ax-7d through ax-11d moved from main set.mm to
                                MC's mathbox
10-Jul-20 ax-meredith [same]    Moved from main set.mm to NM's mathbox
10-Jul-20 [many]    [same]      ax-c5 through axc11-o moved from main set.mm to
                                NM's mathbox
 7-Jul-20 modidmul0 mulmod0
27-Jun-20 swrdsymbeq ---        deleted; use swrdeq instead
25-Jun-20 r19.29_2a r19.29vva
25-Jun-20 tghilbert1_2 tghilberti2
25-Jun-20 tghilbert1_1 tghilberti1
21-Jun-20 rtrclreclem.refl rtrclreclem1
21-Jun-20 rtrclreclem.subset rtrclreclem2
21-Jun-20 rtrclreclem.trans rtrclreclem3
21-Jun-20 rtrclreclem.min rtrclreclem4
11-Jun-20 rnlogbcl  relogbcl
11-Jun-20 rnlogbval relogbval
11-Jun-20 relogbcl  relogbzcl
11-Jun-20 relogbcxp [same]      moved from AV's mathbox to main set.mm
11-Jun-20 cxplogb   [same]      moved from AV's mathbox to main set.mm
 9-Jun-20 logbleb   [same]      moved from AV's mathbox to main set.mm
 9-Jun-20 relogbmulexp [same]   moved from AV's mathbox to main set.mm
 9-Jun-20 relogbmul [same]      moved from AV's mathbox to main set.mm
 9-Jun-20 relogbdiv [same]      moved from AV's mathbox to main set.mm
 9-Jun-20 rpcndif0  [same]      moved from AV's mathbox to main set.mm
 9-Jun-20 df-logb   [same]      section "Logarithm laws generalized to an
                                arbitrary base" moved from TA's mathbox to main
                                set.mm
 9-Jun-20 rnlogblem zgt1rpn0n1  moved from TA's mathbox to main set.mm
 7-Jun-20 znnn0nn   [same]      moved from GS's mathbox to main set.mm
 7-Jun-20 bj-lsub   addlsub     moved from BJ's mathbox to main set.mm
 7-Jun-20 bj-rsub   addrsub     moved from BJ's mathbox to main set.mm
 7-Jun-20 bj-msub   subexsub    moved from BJ's mathbox to main set.mm
 7-Jun-20 bj-flbi3  ico01fl0    moved from BJ's mathbox to main set.mm
 5-Jun-20 coss12d   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trrelssd  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 xpcogend  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 xpcoidgend [same]     moved from RP's mathbox to main set.mm
 5-Jun-20 cotr2g    [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 cotr2     [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 cotr3     [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 coemptyd  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 xptrrel   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 0trrel    [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 cleq1lem  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 cleq1     [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 clsslem   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 ctcl      [same]      section "Transitive closure" moved from Guides
                                and Miscellanea to main set.mm
 5-Jun-20 crtcl     [same]      section "Transitive closure" moved from Guides
                                and Miscellanea to main set.mm
 5-Jun-20 df-trcl   [same]      section "Transitive closure" moved from Guides
                                and Miscellanea to main set.mm
 5-Jun-20 df-rtrcl  [same]      section "Transitive closure" moved from Guides
                                and Miscellanea to main set.mm
 5-Jun-20 trcleq1   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclsslem [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trcleq2lem [same]     moved from RP's mathbox to main set.mm
 5-Jun-20 cvbtrcl   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trcleq12lem [same]    moved from RP's mathbox to main set.mm
 5-Jun-20 trclexlem [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclublem [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclubi   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclubgi  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclub    [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclubg   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfv    [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 brintclab [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 brtrclfv  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 brcnvtrclfv [same]    moved from RP's mathbox to main set.mm
 5-Jun-20 brtrclfvcnv [same]    moved from RP's mathbox to main set.mm
 5-Jun-20 brcnvtrclfvcnv [same] moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvss  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvub  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvlb  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvcotr [same]     moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvlb2 [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvlb3 [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 cotrtrclfv [same]     moved from RP's mathbox to main set.mm
 5-Jun-20 trclidm   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclun    [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvg   [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 trclfvcotrg [same]    moved from RP's mathbox to main set.mm
 5-Jun-20 reltrclfv [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 dmtrclfv  [same]      moved from RP's mathbox to main set.mm
 5-Jun-20 crelexp   [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 df-relexp [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp0g  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp0   [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp0d  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucnnr [same]   moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp1g  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucr [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucrd [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp1d  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucnnl [same]   moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucl [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpsucld [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpcnv [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpcnvd [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexp0rel [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexprelg [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexprel [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpreld [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpnndm [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpdmg [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpdm  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpdmd [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpnnrn [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexprng [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexprn  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexprnd [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpfld [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpfldd [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpaddnn [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpuzrel [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpaddg [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpaddd [same]     moved from Drahflow's mathbox to main set.mm
 5-Jun-20 crtrcl    [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 df-rtrclrec [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 dfrtrclrec2 [same]    moved from Drahflow's mathbox to main set.mm
 5-Jun-20 rtrclreclem.refl [same] moved from Drahflow's mathbox to main set.mm
 5-Jun-20 rtrclreclem.subset [same] moved from Drahflow's mathbox to main
                                set.mm
 5-Jun-20 rtrclreclem.trans [same] moved from Drahflow's mathbox to main set.mm
 5-Jun-20 rtrclreclem.min [same] moved from Drahflow's mathbox to main set.mm
 5-Jun-20 dfrtrcl2  [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpindlem [same]   moved from Drahflow's mathbox to main set.mm
 5-Jun-20 relexpind [same]      moved from Drahflow's mathbox to main set.mm
 5-Jun-20 rtrclind  [same]      moved from Drahflow's mathbox to main set.mm
31-May-20 rp-isfinite4 isfinite4 moved from RP's mathbox to main set.mm
24-May-20 fz1ssnn   ---         moved from SO's mathbox to main set.mm
21-May-20 ---       ---         section "The category of extensible structures"
                                moved from AV's mathbox to main set.mm
21-May-20 ---       ---         section "Initial, terminal and zero objects of
                                a category" moved from AV's mathbox to main
                                set.mm
21-May-20 ---       ---         section "Isomorphic objects" moved from AV's
                                mathbox to main set.mm
21-May-20 invisoinvl [same]     moved from AV's mathbox to main set.mm
21-May-20 invisoinvr [same]     moved from AV's mathbox to main set.mm
21-May-20 invcoisoid [same]     moved from AV's mathbox to main set.mm
21-May-20 isocoinvid [same]     moved from AV's mathbox to main set.mm
21-May-20 sectid    [same]      moved from AV's mathbox to main set.mm
21-May-20 invid     [same]      moved from AV's mathbox to main set.mm
21-May-20 idiso     [same]      moved from AV's mathbox to main set.mm
21-May-20 idinv     [same]      moved from AV's mathbox to main set.mm
21-May-20 isofn     [same]      moved from AV's mathbox to main set.mm
21-May-20 isofval   [same]      moved from AV's mathbox to main set.mm
21-May-20 dfiso3    [same]      moved from AV's mathbox to main set.mm
21-May-20 dfiso2    [same]      moved from AV's mathbox to main set.mm
21-May-20 inveq     [same]      moved from AV's mathbox to main set.mm
21-May-20 fnhomeqhomf [same]    moved from AV's mathbox to main set.mm
21-May-20 slotsbhcdif [same]    moved from AV's mathbox to main set.mm
21-May-20 1strstr   [same]      moved from AV's mathbox to main set.mm
21-May-20 1strbas   [same]      moved from AV's mathbox to main set.mm
21-May-20 1strwunbndx [same]    moved from AV's mathbox to main set.mm
21-May-20 1strwun   [same]      moved from AV's mathbox to main set.mm
21-May-20 ressval3d [same]      moved from AV's mathbox to main set.mm
21-May-20 setsidvald [same]     moved from AV's mathbox to main set.mm
21-May-20 strndxid  [same]      moved from AV's mathbox to main set.mm
21-May-20 rcaninv   [same]      moved from AV's mathbox to main set.mm
21-May-20 tpres     [same]      moved from AV's mathbox to main set.mm
21-May-20 mptrcl    [same]      moved from AV's mathbox to main set.mm
21-May-20 euelss    [same]      moved from AV's mathbox to main set.mm
 8-May-20 wrdeqswrdlsw ---      deleted; duplicate of 2swrd1eqwrdeq
 2-May-20 swrdvalodm swrdnd2
 2-May-20 swrdvalodm2 ---       deleted; duplicate of swrdnd
 2-May-20 mptrel    [same]      moved from SF's mathbox to main set.mm
 2-May-20 iswrdbi   iswrdb
26-Apr-20 ---       ---         math token "(++)" changed to "/_\"
12-Apr-20 r19.27av  r19.27v
12-Apr-20 r19.28av  r19.28v
12-Apr-20 r19.36av  r19.36v
12-Apr-20 r19.37av  r19.37v
12-Apr-20 r19.44av  r19.44v
12-Apr-20 r19.45av  r19.45v
12-Apr-20 19.36aiv  19.36iv
12-Apr-20 19.37aiv  19.37iv
 5-Apr-20 nn0indd   [same]      moved from TA's mathbox to main set.mm
 5-Apr-20 dgrnznn   [same]      moved from SO's mathbox to main set.mm
31-Mar-20 pnpncand  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fzp1nel   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodf     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 clim2prod [same]      moved from SF's mathbox to main set.mm
31-Mar-20 clim2div  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodfmul  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodf1    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodf1f   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodfclim1 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prodfn0   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodfrec  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodfdiv  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvg  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvgn0 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvgfvn0 [same]   moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvgtail [same]   moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvgmullem [same] moved from SF's mathbox to main set.mm
31-Mar-20 ntrivcvgmul [same]    moved from SF's mathbox to main set.mm
31-Mar-20 df-prod   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodex    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq1f  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq1   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 nfcprod1  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 nfcprod   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2w  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2ii [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 cbvprod   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 cbvprodv  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 cbvprodi  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq1i  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2i  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq12i [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq1d  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2d  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2dv [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodeq2sdv [same]     moved from SF's mathbox to main set.mm
31-Mar-20 2cprodeq2dv [same]    moved from SF's mathbox to main set.mm
31-Mar-20 prodeq12dv [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prodeq12rdv [same]    moved from SF's mathbox to main set.mm
31-Mar-20 prod2id   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodrblem [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodcvg  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodrblem2 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prodrb    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodmolem3 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prodmolem2a [same]    moved from SF's mathbox to main set.mm
31-Mar-20 prodmolem2 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prodmo    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 zprod     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 iprod     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 zprodn0   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 iprodn0   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprod     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodntriv [same]     moved from SF's mathbox to main set.mm
31-Mar-20 prod0     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prod1     [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodfc    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodf1o  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodss    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodss   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodser  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodcl2lem [same]    moved from SF's mathbox to main set.mm
31-Mar-20 fprodcllem [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprodcl   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodrecl [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodzcl  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodnncl [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodrpcl [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodnn0cl [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprodmul  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fproddiv  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodsn    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprod1    [same]      moved from SF's mathbox to main set.mm
31-Mar-20 climprod1 [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodsplit [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprodm1   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprod1p   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodp1   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodm1s  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodp1s  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 prodsns   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodfac  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodabs  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodefsum [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprodeq0  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodshft [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodrev  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodconst [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprodn0   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprod2dlem [same]     moved from SF's mathbox to main set.mm
31-Mar-20 fprod2d   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodxp   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodcnv  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodcom2 [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprodcom  [same]      moved from SF's mathbox to main set.mm
31-Mar-20 fprod0diag [same]     moved from SF's mathbox to main set.mm
31-Mar-20 iprodclim [same]      moved from SF's mathbox to main set.mm
31-Mar-20 iprodclim2 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 iprodclim3 [same]     moved from SF's mathbox to main set.mm
31-Mar-20 iprodcl   [same]      moved from SF's mathbox to main set.mm
31-Mar-20 iprodrecl [same]      moved from SF's mathbox to main set.mm
31-Mar-20 iprodmul  [same]      moved from SF's mathbox to main set.mm
14-Mar-20 3ax4VD    al2imVD
14-Mar-20 3ax4      al2im       moved from AS's mathbox to main set.mm
12-Mar-20 cdivides  cdvds
 7-Mar-20 thema4b   stoic4b
 7-Mar-20 thema4a   stoic4a
 7-Mar-20 thema3    stoic3
 7-Mar-20 thema2b   stoic2b
 7-Mar-20 thema2a   stoic2a
 7-Mar-20 thema1b   stoic1b
 7-Mar-20 thema1a   stoic1a
 4-Mar-20 ssrexf    [same]      moved from GS's mathbox to main set.mm
28-Feb-20 ffzohash  ffzo0hash
28-Feb-20 drngrng   drngring
28-Feb-20 rngidval  ringidval
28-Feb-20 gsumvallem1 mgmidsssn0
28-Feb-20 proplem3  oveqdr
28-Feb-20 proplem2  ovrspc2v
28-Feb-20 proplem   oveqrspc2v
28-Feb-20 isnmnd    [same]      moved from AV's mathbox to main set.mm
28-Feb-20 idmhm     [same]      moved from AV's mathbox to main set.mm
28-Feb-20 idrhm     [same]      moved from AV's mathbox to main set.mm
28-Feb-20 resiexd   [same]      moved from AV's mathbox to main set.mm
25-Feb-20 sbceq1ddi2 ---        deleted; use sbceq1ddi instead
25-Feb-20 vdgfrgra0 ---         deleted; use vdfrgra0 instead
25-Feb-20 symgfixfvh ---        deleted; use fvtresfn instead
25-Feb-20 fseq0hash ---         deleted; use ffzohash instead
25-Feb-20 gsumsndf  ---         deleted; use gsumsnfd instead
25-Feb-20 gsumsn2   ---         deleted; use gsumsnd instead
17-Feb-20 ringrng0  ringrng
13-Feb-20 mgmnsgrpex [same]     moved from AV's mathbox to main set.mm
13-Feb-20 sgrpnmndex [same]     moved from AV's mathbox to main set.mm
13-Feb-20 sgrpssmgm [same]      moved from AV's mathbox to main set.mm
13-Feb-20 mndsssgrp [same]      moved from AV's mathbox to main set.mm
13-Feb-20 mgm2nsgrplem1 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 mgm2nsgrplem2 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 mgm2nsgrplem3 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 mgm2nsgrplem4 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 mgm2nsgrp [same]      moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmndlem1 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmndlem2 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmndlem3 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2rid2 [same]      moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2rid2ex [same]    moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmndlem4 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmndlem5 [same]  moved from AV's mathbox to main set.mm
13-Feb-20 sgrp2nmnd [same]      moved from AV's mathbox to main set.mm
13-Feb-20 opifismgm [same]      moved from AV's mathbox to main set.mm
13-Feb-20 hashprdifel [same]    moved from AV's mathbox to main set.mm
13-Feb-20 pr0hash2ex [same]     moved from AV's mathbox to main set.mm
13-Feb-20 prhash2ex [same]      moved from AV's mathbox to main set.mm
13-Feb-20 ovmpt2elrn [same]     moved from AV's mathbox to main set.mm
13-Feb-20 ssexnelpss [same]     moved from AV's mathbox to main set.mm
 9-Feb-20 erngrng-rN erngring-rN
 9-Feb-20 erngrng   eringring
 9-Feb-20 mendrng   mendring
 9-Feb-20 lnrrng    lnrring
 9-Feb-20 orngrng   orngring
 9-Feb-20 rnginvval ringinvval
 9-Feb-20 rngon0    rngone0
 9-Feb-20 clmrng    clmring
 9-Feb-20 nrgrng    nrgring
 9-Feb-20 tdrgrng   tdrgring
 9-Feb-20 trgrng    trgring
 9-Feb-20 pmatrng   pmatring
 9-Feb-20 matrng    matring
 9-Feb-20 rngvcl    ringvcl
 9-Feb-20 zringrng  zringring
 9-Feb-20 cnrng     cnring
 9-Feb-20 ply1rng   ply1ring
 9-Feb-20 psr1rng   psr1ring
 9-Feb-20 opsrrng   opsrring
 9-Feb-20 mplrng    mplring
 9-Feb-20 psrrng    psrring
 9-Feb-20 assarng   assaring
 9-Feb-20 domnrng   domnring
 9-Feb-20 rng1zr    ring1zr
 9-Feb-20 0rng01eqbi 0ring01eqbi
 9-Feb-20 01eq0rng  01eq0ring
 9-Feb-20 0rng01eq  0ring01eq
 9-Feb-20 0rng      0ring
 9-Feb-20 0rngnnzr  0ringnnzr
 9-Feb-20 rngelnzr  ringelnzr
 9-Feb-20 nzrrng    nzrring
 9-Feb-20 lpirrng   lpirring
 9-Feb-20 qusrng    qusring
 9-Feb-20 lmodrng   lmodring
 9-Feb-20 srngrng   srngring
 9-Feb-20 subrgrng  subrgring
 9-Feb-20 rnginvdv  ringinvdv
 9-Feb-20 rnginvcl  ringinvcl
 9-Feb-20 opprrngb  opprringb
 9-Feb-20 opprrng   opprring
 9-Feb-20 qusrng2   qusring2
 9-Feb-20 imasrng   imasring
 9-Feb-20 pwsrng    pwsring
 9-Feb-20 prdsrngd  prdsringd
 9-Feb-20 rngrghm   ringrghm
 9-Feb-20 rnglghm   ringlghm
 9-Feb-20 rngn0     ringn0
 9-Feb-20 rng1      ring1
 9-Feb-20 rngsubdi  ringsubdi
 9-Feb-20 rngm2neg  ringm2neg
 9-Feb-20 rngmneg2  ringmneg2
 9-Feb-20 rngmneg1  ringmneg1
 9-Feb-20 rngnegl   ringnegl
 9-Feb-20 rng1ne0   ring1ne0
 9-Feb-20 rng1eq0   ring1eq0
 9-Feb-20 rngsrg    ringsrg
 9-Feb-20 rngrz     ringrz
 9-Feb-20 rnglz     ringlz
 9-Feb-20 isrngd    isringd
 9-Feb-20 rngprop   ringprop
 9-Feb-20 rngpropd  ringpropd
 9-Feb-20 rngcmn    ringcmn
 9-Feb-20 rngabl    ringabl
 9-Feb-20 rngcom    ringcom
 9-Feb-20 rngacl    ringacl
 9-Feb-20 rngidss   ringidss
 9-Feb-20 isrngid   isringid
 9-Feb-20 rngridm   ringridm
 9-Feb-20 rnglidm   ringlidm
 9-Feb-20 rngidmlem ringidmlem
 9-Feb-20 rng0cl    ring0cl
 9-Feb-20 rngidcl   ringidcl
 9-Feb-20 rngdir    ringdir
 9-Feb-20 rngdi     ringdi
 9-Feb-20 rngideu   ringideu
 9-Feb-20 rngass    ringass
 9-Feb-20 rngcl     ringcl
 9-Feb-20 rngi      ringi
 9-Feb-20 crngrng   crngring
 9-Feb-20 rngmnd    ringmnd
 9-Feb-20 rngmgp    ringmgp
 9-Feb-20 rnggrp    ringgrp
 9-Feb-20 isrng     isring
 9-Feb-20 df-rng    df-ring
 8-Feb-20 xrsmgm    [same]      moved from AV's mathbox to main set.mm
 8-Feb-20 xrsnsgrp  [same]      moved from AV's mathbox to main set.mm
 8-Feb-20 xrsmgmdifsgrp [same]  moved from AV's mathbox to main set.mm
 8-Feb-20 gsummgmpropd [same]   moved from AV's mathbox to main set.mm
 8-Feb-20 ringmgm   [same]      moved from AV's mathbox to main set.mm
 7-Feb-20 ismndALT  ismnd
 6-Feb-20 ismndALT  [same]      moved from AV's mathbox to main set.mm
 6-Feb-20 df-mndALT df-mnd      moved from AV's mathbox to main set.mm
 3-Feb-20 mndsgrp   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 mndmgm    [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 issgrp    [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 issgrpv   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 issgrpn0  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 isnsgrp   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 sgrpmgm   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 sgrpass   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 df-sgrp   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 ismgm     [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 ismgmn0   [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 mgmcl     [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 isnmgm    [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 mgmplusf  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 df-mgm    [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 fveqressseq [same]    moved from AV's mathbox to main set.mm
 3-Feb-20 fvn0ssdmfun [same]    moved from AV's mathbox to main set.mm
 3-Feb-20 nelrnfvne [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 fveqdmss  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 elnelne1  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 elnelne2  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 nelcon3d  [same]      moved from AV's mathbox to main set.mm
 3-Feb-20 rexnal2   [same]      moved from GS's mathbox to main set.mm
 3-Feb-20 ---       ---         swapped definition of Ref
27-Jan-20 df-divs   df-qus
27-Jan-20 divsval   qusval
27-Jan-20 divslem   quslem
27-Jan-20 divsin    qusin
27-Jan-20 divsbas   qusbas
27-Jan-20 divssca   qussca
27-Jan-20 divsaddvallem qusaddvallem
27-Jan-20 divsaddflem qusaddflem
27-Jan-20 divsaddval qusaddval
27-Jan-20 divsaddf  qusaddf
27-Jan-20 divsadd   qusadd
27-Jan-20 divsmulval qusmulval
27-Jan-20 divsmulf  qusmulf
27-Jan-20 divsgrp  qusgrp
27-Jan-20 divsgrp2  qusgrp2
27-Jan-20 divseccl  quseccl
27-Jan-20 divs0     qus0
27-Jan-20 divsinv   qusinv
27-Jan-20 divssub   qussub
27-Jan-20 divsghm   qusghm
27-Jan-20 divsabl   qusabl
27-Jan-20 divsrng2  qusrng2
27-Jan-20 divsrng   qusrng
27-Jan-20 divs1     qus1
27-Jan-20 divsrhm   qusrhm
27-Jan-20 divscrng  quscrng
27-Jan-20 divstgpopn qustgpopn
27-Jan-20 divstgplem qustgplem
27-Jan-20 divstgp qustgp
27-Jan-20 divstgphaus qustgphaus
25-Jan-20 ---       ---         sections "Refinements"
                                moved from JGH's mathbox to main set.mm
24-Jan-20 0rng      [same]      moved from AV's mathbox to main set.mm
24-Jan-20 0rng01eq  [same]      moved from AV's mathbox to main set.mm
24-Jan-20 01eq0rng  [same]      moved from AV's mathbox to main set.mm
23-Jan-20 rng1ne0   [same]      moved from AV's mathbox to main set.mm
23-Jan-20 rng1      [same]      moved from AV's mathbox to main set.mm
23-Jan-20 rngn0     [same]      moved from AV's mathbox to main set.mm
23-Jan-20 isnzr2hash [same]     moved from AV's mathbox to main set.mm
23-Jan-20 0rngnnzr  [same]      moved from AV's mathbox to main set.mm
23-Jan-20 rng1nnzr  [same]      moved from AV's mathbox to main set.mm
23-Jan-20 rng1nfld  [same]      moved from AV's mathbox to main set.mm
23-Jan-20 mnd1      [same]      moved from AV's mathbox to main set.mm
23-Jan-20 mnd1id    [same]      moved from AV's mathbox to main set.mm
23-Jan-20 grp1      [same]      moved from AV's mathbox to main set.mm
23-Jan-20 abl1      [same]      moved from AV's mathbox to main set.mm
23-Jan-20 abln0     [same]      moved from AV's mathbox to main set.mm
21-Jan-20 sqxpex    sqxpexg     moved from AV's mathbox to main set.mm
21-Jan-20 sqxpeqd   [same]      moved from AV's mathbox to main set.mm
20-Jan-20 lxflflp1  flflp1      moved from BL's mathbox to main set.mm
20-Jan-20 zabscl    [same]      moved from SO's mathbox to main set.mm
20-Jan-20 nn0sqcl   [same]      moved from SO's mathbox to main set.mm
19-Jan-20 csqr      csqrt       mass rename of 'sqr' to 'sqrt'
19-Jan-20 df-sqr    df-sqrt
19-Jan-20 sqrval    sqrtval
19-Jan-20 sqr0      sqrt0
19-Jan-20 resqrcl   resqrtcl
19-Jan-20 resqrthlem resqrtthlem
19-Jan-20 resqrth   resqrtth
19-Jan-20 remsqsqr  remsqsqrt
19-Jan-20 sqrge0    sqrtge0
19-Jan-20 sqrgt0    sqrtgt0
19-Jan-20 sqrmul    sqrtmul
19-Jan-20 sqrle     sqrtle
19-Jan-20 sqrlt     sqrtlt
19-Jan-20 sqr11     sqrt11
19-Jan-20 sqr00     sqrt00
19-Jan-20 rpsqrcl   rpsqrtcl
19-Jan-20 sqrdiv    sqrtdiv
19-Jan-20 sqrneglem sqrtneglem
19-Jan-20 sqrneg    sqrtneg
19-Jan-20 sqrsq2    sqrtsq2
19-Jan-20 sqrsq     sqrtsq
19-Jan-20 sqrmsq    sqrtmsq
19-Jan-20 sqr1      sqrt1
19-Jan-20 sqr4      sqrt4
19-Jan-20 sqr9      sqrt9
19-Jan-20 sqr2gt1lt2 sqrt2gt1lt2
19-Jan-20 sqrm1     sqrtm1
19-Jan-20 sqreulem.1 sqrteulem.1
19-Jan-20 sqrcl     sqrtcl
19-Jan-20 sqrthlem  sqrtthlem
19-Jan-20 sqrf      sqrtf
19-Jan-20 sqrth     sqrtth
19-Jan-20 sqrrege0  sqrtrege0
19-Jan-20 eqsqror   eqsqrtor
19-Jan-20 eqsqrd    eqsqrtd
19-Jan-20 eqsqr2d   eqsqrt2d
19-Jan-20 sqrthi    sqrtthi
19-Jan-20 sqrcli    sqrtcli
19-Jan-20 sqrgt0i   sqrtgt0i
19-Jan-20 sqrmsqi   sqrtmsqi
19-Jan-20 sqrsqi    sqrtsqi
19-Jan-20 sqsqri    sqsqrti
19-Jan-20 sqrge0i   sqrtge0i
19-Jan-20 sqrpclii  sqrtpclii
19-Jan-20 sqrgt0ii  sqrtgt0ii
19-Jan-20 sqr11i    sqrt11i
19-Jan-20 sqrmuli   sqrtmuli
19-Jan-20 sqrmulii  sqrtmulii
19-Jan-20 sqrmsq2i  sqrtmsq2i
19-Jan-20 sqrlei    sqrtlei
19-Jan-20 sqrlti    sqrtlti
19-Jan-20 rpsqrcld  rpsqrtcld
19-Jan-20 sqrgt0d   sqrtgt0d
19-Jan-20 resqrcld  resqrtcld
19-Jan-20 sqrmsqd   sqrtmsqd
19-Jan-20 sqrsqd    sqrtsqd
19-Jan-20 sqrge0d   sqrtge0d
19-Jan-20 sqrnegd   sqrtnegd
19-Jan-20 sqrdivd   sqrtdivd
19-Jan-20 sqrmuld   sqrtmuld
19-Jan-20 sqrsq2d   sqrtsq2d
19-Jan-20 sqrled    sqrtled
19-Jan-20 sqrltd    sqrtltd
19-Jan-20 sqr11d.5  sqrt11d.5
19-Jan-20 sqrcld    sqrtcld
19-Jan-20 sqrrege0d sqrtrege0d
19-Jan-20 sqsqrd    sqsqrtd
19-Jan-20 msqsqrd   msqsqrtd
19-Jan-20 sqr00d.2  sqrt00d.2
19-Jan-20 sqr2irrlem.3 sqrt2irrlem.3
19-Jan-20 sqr2irr   sqrt2irr
19-Jan-20 sqr2re    sqrt2re
19-Jan-20 zsqrelqelz zsqrtelqelz
19-Jan-20 cphsqrcl  cphsqrtcl
19-Jan-20 cphsqrcl2 cphsqrtcl2
19-Jan-20 cphsqrcl3 cphsqrtcl3
19-Jan-20 cxpsqrlem cxpsqrtlem
19-Jan-20 cxpsqr    cxpsqrt
19-Jan-20 logsqr    logsqrt
19-Jan-20 dvsqr     dvsqrt
19-Jan-20 resqrcn   resqrtcn
19-Jan-20 sqrcn     sqrtcn
19-Jan-20 loglesqr  loglesqrt
19-Jan-20 sqrlim    sqrtlim
19-Jan-20 divsqrsum.2 divsqrtsum.2
19-Jan-20 divsqrsumlem divsqrtsumlem
19-Jan-20 divsqrsum.2 divsqrtsum.2
19-Jan-20 divsqrsum.2 divsqrtsum.2
19-Jan-20 divsqrsum.2 divsqrtsum.2
19-Jan-20 divsqrsum2 divsqrtsum2
19-Jan-20 divsqrsum.2 divsqrtsum.2
19-Jan-20 divsqrsumo1 divsqrtsumo1
19-Jan-20 dvcnsqr   dvcnsqrt
19-Jan-20 rmspecsqrnq rmspecsqrtnq
18-Jan-20 cabel     cabl
15-Jan-20 pgrple2abel pgrple2abl
15-Jan-20 pgrpgt2nabel pgrpgt2nabl
15-Jan-20 ---       ---         subsection "Huneke's Proof of the Friendship
                                Theorem" moved from AV's mathbox to main set.mm
14-Jan-20 ---       ---         section "The Friendship Theorem"
                                moved from AV's mathbox to main set.mm
14-Jan-20 ---       ---         subsection "Regular graphs" (2. part)
                                moved from AV's mathbox to main set.mm
14-Jan-20 ---       ---         subsection "Walks/paths of length 2 as ordered
                                triples" moved from AV's mathbox to main set.mm
14-Jan-20 rusgranumwlkl1lem1 rusgranumwwlkl1 moved from AV's mathbox
                                to main set.mm
14-Jan-20 usgra2wlkspth [same]  moved from AV's mathbox to main set.mm
14-Jan-20 usgfiregdegfi [same]  moved from AV's mathbox to main set.mm
14-Jan-20 nbfiusgrafi [same]    moved from AV's mathbox to main set.mm
14-Jan-20 wrd2f1tovbij [same]   moved from AV's mathbox to main set.mm
14-Jan-20 hashrabrex [same]     moved from AV's mathbox to main set.mm
14-Jan-20 f1oexbi   [same]      moved from AV's mathbox to main set.mm
14-Jan-20 elfvmptrab [same]     moved from AV's mathbox to main set.mm
14-Jan-20 elfvmptrab1 [same]    moved from AV's mathbox to main set.mm
14-Jan-20 otiunsndisj [same]    moved from AV's mathbox to main set.mm
14-Jan-20 otsndisj  [same]      moved from AV's mathbox to main set.mm
14-Jan-20 otthg     [same]      moved from AV's mathbox to main set.mm
14-Jan-20 rabasiun  [same]      moved from AV's mathbox to main set.mm
13-Jan-20 usg2wlk   [same]      moved from AV's mathbox to main set.mm
13-Jan-20 usg2wlkon [same]      moved from AV's mathbox to main set.mm
13-Jan-20 usgra2adedgspth[same] moved from AV's mathbox to main set.mm
13-Jan-20 usgra2adedgwlk [same] moved from AV's mathbox to main set.mm
13-Jan-20 usgra2adedgwlkon [same] moved from AV's mathbox to main set.mm
13-Jan-20 ccat2s1fst [same]     moved from AV's mathbox to main set.mm
13-Jan-20 ccatw2s1len [same]    moved from AV's mathbox to main set.mm
13-Jan-20 ccat2s1fvw [same]     moved from AV's mathbox to main set.mm
13-Jan-20 ccatw2s1p1 [same]     moved from AV's mathbox to main set.mm
13-Jan-20 ccatw2s1p2 [same]     moved from AV's mathbox to main set.mm
13-Jan-20 ccat2s1p2 [same]      moved from AV's mathbox to main set.mm
13-Jan-20 ccat2s1len [same]     moved from AV's mathbox to main set.mm
13-Jan-20 ccat2s1cl [same]      moved from AV's mathbox to main set.mm
13-Jan-20 reuccats1 [same]      moved from AV's mathbox to main set.mm
13-Jan-20 ccats1swrdeqrex [same] moved from AV's mathbox to main set.mm
13-Jan-20 zpnn0elfzo1 [same]    moved from AV's mathbox to main set.mm
13-Jan-20 zpnn0elfzo [same]     moved from AV's mathbox to main set.mm
12-Jan-20 prmn2uzge3 [same]     moved from AV's mathbox to main set.mm
12-Jan-20 powm2modprm [same]    moved from AV's mathbox to main set.mm
12-Jan-20 m1dvdsndvds [same]    moved from AV's mathbox to main set.mm
12-Jan-20 mulmoddvds [same]     moved from AV's mathbox to main set.mm
12-Jan-20 modfsummod [same]     moved from AV's mathbox to main set.mm
12-Jan-20 modfsummods [same]    moved from AV's mathbox to main set.mm
12-Jan-20 fzosplitprm1 [same]   moved from AV's mathbox to main set.mm
12-Jan-20 fsummsnunz [same]     moved from AV's mathbox to main set.mm
12-Jan-20 fsumsplitsnun [same]  moved from AV's mathbox to main set.mm
12-Jan-20 fsumz fsumzcl2        moved from AV's mathbox to main set.mm
12-Jan-20 zadd2cl   [same]      moved from AV's mathbox to main set.mm
12-Jan-20 cnm2m1cnm3 [same]     moved from AV's mathbox to main set.mm
11-Jan-20 hash1to3  [same]      moved from AV's mathbox to main set.mm
11-Jan-20 hash3tr   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 uzsubfz0  [same]      moved from AV's mathbox to main set.mm
11-Jan-20 eluzge2nn0 [same]     moved from AV's mathbox to main set.mm
11-Jan-20 eluzge3nn [same]      moved from AV's mathbox to main set.mm
11-Jan-20 ige3m2fz  [same]      moved from AV's mathbox to main set.mm
11-Jan-20 uz3m2nn   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 nn0pzuz   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 nn01to3   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 uzuzle23  [same]      moved from AV's mathbox to main set.mm
11-Jan-20 kcnktkm1cn [same]     moved from AV's mathbox to main set.mm
11-Jan-20 mulsubfacd [same]     moved from AV's mathbox to main set.mm
11-Jan-20 f13idfv   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 f13dfv    [same]      moved from AV's mathbox to main set.mm
11-Jan-20 f12dfv    [same]      moved from AV's mathbox to main set.mm
11-Jan-20 ff14b     [same]      moved from AV's mathbox to main set.mm
11-Jan-20 dff14a    [same]      moved from AV's mathbox to main set.mm
11-Jan-20 raldifsnb [same]      moved from AV's mathbox to main set.mm
11-Jan-20 3xpfi     [same]      moved from AV's mathbox to main set.mm
11-Jan-20 3xpexg    [same]      moved from AV's mathbox to main set.mm
11-Jan-20 el2xptp0  [same]      moved from AV's mathbox to main set.mm
11-Jan-20 el2xptp   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 oteqimp   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 otel3xp   [same]      moved from AV's mathbox to main set.mm
11-Jan-20 ornld     [same]      moved from AV's mathbox to main set.mm
 9-Jan-20 usisuhgra [same]      moved from AV's mathbox to main set.mm
 8-Jan-20 Lemma2    clwwlknscsh
 8-Jan-20 ---       ---         subsection "Closed walks" (2. part)
                                moved from AV's mathbox to main set.mm
 8-Jan-20 erclwwlksym0 cshwcshid moved from AV's mathbox to main set.mm
 8-Jan-20 erclwwlktr0 cshwcsh2id moved from AV's mathbox to main set.mm
 7-Jan-20 wlklenpislenfp1 wlklenvp1 moved from AV's mathbox to main set.mm
 7-Jan-20 wlkp1lenfislenp wlklenvclwlk moved from AV's mathbox to main set.mm
 7-Jan-20 elfzelfzadd  elfz0add
 7-Jan-20 elfzelfzelfz elfz0ubfz0
 7-Jan-20 cshwlemma1 2cshwcshw  moved from AV's mathbox to main set.mm
 7-Jan-20 scshwfzeqfzo [same]   moved from AV's mathbox to main set.mm
 7-Jan-20 wrdnval   [same]      moved from AV's mathbox to main set.mm
 7-Jan-20 hashwrdn  [same]      moved from AV's mathbox to main set.mm
 7-Jan-20 wrdlenfi  wrdnfi
 7-Jan-20 fzisfzounsn [same]    moved from AV's mathbox to main set.mm
 7-Jan-20 elfzonlteqm1 [same]   moved from AV's mathbox to main set.mm
 7-Jan-20 difelfzle [same]      moved from AV's mathbox to main set.mm
 7-Jan-20 difelfznle [same]     moved from AV's mathbox to main set.mm
 7-Jan-20 uz2nn     eluz2nn     moved from AV's mathbox to main set.mm
 5-Jan-20 ---       ---         subsection "Closed walks" (1. part)
                                moved from AV's mathbox to main set.mm
 5-Jan-20 wlk0      [same]      moved from AV's mathbox to main set.mm
 5-Jan-20 wlkv0     [same]      moved from AV's mathbox to main set.mm
 5-Jan-20 lswccats1fst [same]   moved from AV's mathbox to main set.mm
 5-Jan-20 ige2m1fz  [same]      moved from AV's mathbox to main set.mm
 5-Jan-20 ige2m2fzo [same]      moved from AV's mathbox to main set.mm
 5-Jan-20 eluzgtdifelfzo [same] moved from AV's mathbox to main set.mm
 5-Jan-20 elfzom1elfzo [same]   moved from AV's mathbox to main set.mm
 5-Jan-20 elfzom1elp1fzo [same] moved from AV's mathbox to main set.mm
 5-Jan-20 elfzubelfz [same]     moved from AV's mathbox to main set.mm
 5-Jan-20 cnm1cn    peano2cnm   moved from AV's mathbox to main set.mm
 5-Jan-20 nn0lt2    [same]      moved from AV's mathbox to main set.mm
 5-Jan-20 3an4anass [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 uzletr    eluzuzle
 4-Jan-20 ---       ---         subsection "Walks as words"
                                moved from AV's mathbox to main set.mm
 4-Jan-20 usg2wlkeq2 [same]     moved from AV's mathbox to main set.mm
 4-Jan-20 usg2wlkeq [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 2wlkeq    [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wlkcompim [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 elopaelxp [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 2ffzeq    [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wlklenfislenpm1 wlklenvm1 moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt2wrd [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 elovmptnn0wrd [same]  moved from AV's mathbox to main set.mm
 4-Jan-20 edgwlk    [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 ovmpt3rab1 [same]     moved from AV's mathbox to main set.mm
 4-Jan-20 ovmpt3rabdm [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt3rab1 [same]   moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt3rab [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt3imp [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt2rab [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 elovmpt2rab1 [same]   moved from AV's mathbox to main set.mm
 4-Jan-20 wlkelwrd  [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wlkcpr    [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wlkop     [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wlkn0     [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 relwlk    [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 wrdlen1   [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 fvelrnfvelrnressn fvrnressn moved from AV's mathbox to main set.mm
 4-Jan-20 fvressn   [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 fvn0fvelrn [same]     moved from AV's mathbox to main set.mm
 4-Jan-20 dmressnsn [same]      moved from AV's mathbox to main set.mm
 4-Jan-20 eldmressnsn [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 eldmeldmressn [same]  moved from AV's mathbox to main set.mm
 4-Jan-20 elfzom1p1elfzo [same] moved from AV's mathbox to main set.mm
 4-Jan-20 fzonn0p1p1 [same]     moved from AV's mathbox to main set.mm
 4-Jan-20 nn0ge2m1nn0 [same]    moved from AV's mathbox to main set.mm
 4-Jan-20 nn0ge2m1nn [same]     moved from AV's mathbox to main set.mm
 3-Jan-20 ---       ---         subsection "Regular graphs" (1. part)
                                moved from AV's mathbox to main set.mm
 2-Jan-20 vdiscusgra [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 usgrauvtxvdbi [same]  moved from AV's mathbox to main set.mm
 2-Jan-20 uvtxhashnb [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 nbhashuvtx [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 nbhashuvtx1 [same]    moved from AV's mathbox to main set.mm
 2-Jan-20 nbgrassvwo2 [same]    moved from AV's mathbox to main set.mm
 2-Jan-20 nbgrassvwo [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 nbhashnn0 [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 usgfidegfi [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 uvtxnb    [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 usgravd00 [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 hash2prv  [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 hash2sspr [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 elss2pr   [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 exprelprel [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 hashrabsn01 [same]    moved from AV's mathbox to main set.mm
 2-Jan-20 hashrabsn1 [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 difpr     [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 f0rn0     [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 oprabv    [same]      moved from AV's mathbox to main set.mm
 2-Jan-20 opelopabgf [same]     moved from AV's mathbox to main set.mm
 2-Jan-20 csbprg    [same]      moved from AV's mathbox to main set.mm
31-Dec-19 telescfzgsum telgsumfzs
31-Dec-19 telescfzgsumis telgsumfz
31-Dec-19 telescfzgsum0 telgsumfz0s
31-Dec-19 telescfzgsum0is telgsumfz0
31-Dec-19 telescgsum telgsums
31-Dec-19 fsumtscopo telfsumo
31-Dec-19 fsumtscopo2 telfsumo2
31-Dec-19 fsumtscop telfsum
31-Dec-19 fsumtscop2 telfsum2
30-Dec-19 smatvscl  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatlss  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatstrbas [same]    moved from AV's mathbox to main set.mm
30-Dec-19 scmatrhmval [same]    moved from AV's mathbox to main set.mm
30-Dec-19 scmatrhmcl [same]     moved from AV's mathbox to main set.mm
30-Dec-19 scmatf    [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatfo   [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatf1   [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatf1o  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatghm  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatmhm  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatrhm  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 scmatrngiso [same]    moved from AV's mathbox to main set.mm
30-Dec-19 scmatric  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 brric     [same]      moved from AV's mathbox to main set.mm
30-Dec-19 brric2    [same]      moved from AV's mathbox to main set.mm
30-Dec-19 ricgic    [same]      moved from AV's mathbox to main set.mm
30-Dec-19 rimgim    [same]      moved from AV's mathbox to main set.mm
30-Dec-19 df-ric    [same]      moved from AV's mathbox to main set.mm,
                                symbol ~=R swapped with ~=r of JM's mathbox
30-Dec-19 df-plpr   ---         deleted; usage in addsrpr replaced
30-Dec-19 df-mpr    ---         deleted; usage in mulsrpr replaced
30-Dec-19 th3qcor   ---         deleted; was unused
30-Dec-19 th3qlem2  ---         deleted; only usage was ovec
30-Dec-19 th3qlem1  ---         deleted; only usage was ovec
30-Dec-19 th3q      ---         deleted; only usage was ovec
30-Dec-19 ovec      ---         deleted; usage in addsrpr and mulsrpr replaced
30-Dec-19 coeq0     [ same ]    moved from SO's mathbox to main set.mm
30-Dec-19 ---       ---         section "The characteristic polynomial"
                                moved from AV's mathbox to main set.mm
30-Dec-19 grpsubadd0sub [same]  moved from AV's mathbox to main set.mm
30-Dec-19 add1p1    [same]      moved from AV's mathbox to main set.mm
30-Dec-19 nn0disj   [same]      moved from AV's mathbox to main set.mm
30-Dec-19 grpnpncan0 [same]     moved from AV's mathbox to main set.mm
30-Dec-19 telescfzgsum [same]   moved from AV's mathbox to main set.mm
30-Dec-19 telescfzgsumis [same] moved from AV's mathbox to main set.mm
30-Dec-19 telescfzgsum0 [same]  moved from AV's mathbox to main set.mm
30-Dec-19 telescfzgsum0is [same] moved from AV's mathbox to main set.mm
30-Dec-19 telescgsum [same]     moved from AV's mathbox to main set.mm
30-Dec-19 a2and     [same]      moved from AV's mathbox to main set.mm
30-Dec-19 asclinvg  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 lply1binomsc [same]   moved from AV's mathbox to main set.mm
30-Dec-19 lmodvsmmulgdi [same]  moved from AV's mathbox to main set.mm
30-Dec-19 lply1binom [same]     moved from AV's mathbox to main set.mm
30-Dec-19 lply1binomsc [same]   moved from AV's mathbox to main set.mm
30-Dec-19 gsumply1eq [same]     moved from AV's mathbox to main set.mm
30-Dec-19 gsummptfidmsub [same] moved from AV's mathbox to main set.mm
30-Dec-19 assa2ass  [same]      moved from AV's mathbox to main set.mm
30-Dec-19 assamulgscm [same]    moved from AV's mathbox to main set.mm
24-Dec-19 ---       ---         section "Polynomial matrices"
                                moved from AV's mathbox to main set.mm
24-Dec-19 mptcoe1fsupp [same]   moved from AV's mathbox to main set.mm
23-Dec-19 gsumsmonply1 [same]   moved from AV's mathbox to main set.mm
23-Dec-19 gsummoncoe1 [same]    moved from AV's mathbox to main set.mm
23-Dec-19 coe1ae0   [same]      moved from AV's mathbox to main set.mm
23-Dec-19 ply10s0   [same]      moved from AV's mathbox to main set.mm
23-Dec-19 ply1idvr1 [same]      moved from AV's mathbox to main set.mm
23-Dec-19 fsfnn0gsumfsffz  [same] moved from AV's mathbox to main set.mm
23-Dec-19 nn0gsumfz [same]      moved from AV's mathbox to main set.mm
23-Dec-19 nn0gsumfz0 [same]     moved from AV's mathbox to main set.mm
23-Dec-19 gsummptnn0fz  [same]  moved from AV's mathbox to main set.mm
23-Dec-19 gsummptnn0fzv  [same] moved from AV's mathbox to main set.mm
23-Dec-19 gsummptnn0fzfv  [same] moved from AV's mathbox to main set.mm
23-Dec-19 fsuppmapnn0ub  [same] moved from AV's mathbox to main set.mm
23-Dec-19 fsuppmapnn0fz  [same] moved from AV's mathbox to main set.mm
23-Dec-19 mptnn0fsupp  [same]   moved from AV's mathbox to main set.mm
23-Dec-19 mptnn0fsuppd  [same]  moved from AV's mathbox to main set.mm
23-Dec-19 mptnn0fsuppr [same]   moved from AV's mathbox to main set.mm
23-Dec-19 suppssfz  [same]      moved from AV's mathbox to main set.mm
23-Dec-19 rabssnn0fi [same]     moved from AV's mathbox to main set.mm
23-Dec-19 ssnn0fi   [same]      moved from AV's mathbox to main set.mm
23-Dec-19 matgsum   [same]      moved from AV's mathbox to main set.mm
23-Dec-19 cply1coe0bi [same]    moved from AV's mathbox to main set.mm
23-Dec-19 cply1coe0 [same]      moved from AV's mathbox to main set.mm
23-Dec-19 cply1mul  [same]      moved from AV's mathbox to main set.mm
23-Dec-19 coe1fzgsumd [same]    moved from AV's mathbox to main set.mm
23-Dec-19 ply1coe1eq [same]     moved from AV's mathbox to main set.mm
23-Dec-19 eqcoe1ply1eq [same]   moved from AV's mathbox to main set.mm
23-Dec-19 mpt2matmul [same]     moved from AV's mathbox to main set.mm
23-Dec-19 coe1fvalcl [same]     moved from AV's mathbox to main set.mm
23-Dec-19 coe1fsupp [same]      moved from AV's mathbox to main set.mm
23-Dec-19 supgtoreq [same]      moved from AV's mathbox to main set.mm
23-Dec-19 supfirege [same]      moved from AV's mathbox to main set.mm
23-Dec-19 suprfinzcl [same]     moved from AV's mathbox to main set.mm
23-Dec-19 fsuppmapnn0fiub [same] moved from AV's mathbox to main set.mm
23-Dec-19 fsuppmapnn0fiubex [same] moved from AV's mathbox to main set.mm
23-Dec-19 fsuppmapnn0fiub0 [same] moved from AV's mathbox to main set.mm
22-Dec-19 neneqad   neqned
21-Dec-19 ---       ---         section "The subalgebras of diagonal and scalar
                                matrices" moved from AV's mathbox to main
                                set.mm
21-Dec-19 ---       ---         section "Matrices of dimension 0 and 1" moved
                                from AV's mathbox to main set.mm
21-Dec-19 matsubg   [same]      moved from AV's mathbox to main set.mm
21-Dec-19 matplusgcell [same]   moved from AV's mathbox to main set.mm
21-Dec-19 matsubgcell [same]    moved from AV's mathbox to main set.mm
21-Dec-19 matinvgcell [same]    moved from AV's mathbox to main set.mm
21-Dec-19 matmulcell [same]     moved from AV's mathbox to main set.mm
21-Dec-19 matvscacell [same]    moved from AV's mathbox to main set.mm
21-Dec-19 eqmat     [same]      moved from AV's mathbox to main set.mm
21-Dec-19 gsumdifsnd [same]     moved from AV's mathbox to main set.mm
21-Dec-19 f1o2sn    [same]      moved from AV's mathbox to main set.mm
21-Dec-19 mpt2sn    [same]      moved from AV's mathbox to main set.mm
21-Dec-19 fmptsnd   [same]      moved from AV's mathbox to main set.mm
20-Dec-19 dmatcomp  mat1comp
20-Dec-19 mamudiagcl mamumat1cl
19-Dec-19 resabs1d  [same]      moved from GS's mathbox to main set.mm
19-Dec-19 fssresd   [same]      moved from GS's mathbox to main set.mm
19-Dec-19 fssd      [same]      moved from GS's mathbox to main set.mm
19-Dec-19 resmptd   [same]      moved from GS's mathbox to main set.mm
19-Dec-19 dmmptid   dmmptd      moved from GS's mathbox to main set.mm
19-Dec-19 neqned    [same]      moved from GS's mathbox to main set.mm
19-Dec-19 iffalsed  [same]      moved from GS's mathbox to main set.mm
19-Dec-19 iftrued   [same]      moved from GS's mathbox to main set.mm
19-Dec-19 rspan     rspa        moved from GS's mathbox to main set.mm
15-Dec-19 elovimad  [same]      moved from TA's mathbox to main set.mm
12-Dec-19 gsummptf1o [same]     moved from TA's mathbox to main set.mm
12-Dec-19 gsummptun [same]      moved from TA's mathbox to main set.mm
12-Dec-19 gsumunsnf [same]      moved from TA's mathbox to main set.mm
12-Dec-19 gsumsnf   [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 icossicc  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 iocssicc  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 ioossico  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 iocssioo  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 icossioo  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 ioossioo  [same]      moved from TA's mathbox to main set.mm
 7-Dec-19 volss     [same]      moved from TA's mathbox to main set.mm
30-Nov-19 axc11nlem axc11nlem   reworked to be more flexible
30-Nov-19 cbvequv   cbvaev      ae is the shorthand for A. x x = y
25-Nov-19 mdet0     [same]      moved from AV's mathbox to main set.mm
25-Nov-19 m1detdiag [same]      moved from AV's mathbox to main set.mm
25-Nov-19 mdetdiaglem [same]    moved from AV's mathbox to main set.mm
25-Nov-19 mdetdiag  [same]      moved from AV's mathbox to main set.mm
25-Nov-19 mdetdiagid [same]     moved from AV's mathbox to main set.mm
25-Nov-19 psgnsn    [same]      moved from AV's mathbox to main set.mm
25-Nov-19 pmtrsn    [same]      moved from AV's mathbox to main set.mm
25-Nov-19 hashen1   [same]      moved from AV's mathbox to main set.mm
25-Nov-19 snnen2o   [same]      moved from AV's mathbox to main set.mm
25-Nov-19 ply1moncl [same]      moved from AV's mathbox to main set.mm
25-Nov-19 psrass23l [same]      moved from AV's mathbox to main set.mm
25-Nov-19 iffv      [same]      moved from TA's mathbox to main set.mm
25-Nov-19 ifov      [same]      moved from AV's mathbox to main set.mm
25-Nov-19 3anim2i   [same]      moved from AV's mathbox to main set.mm
24-Oct-19 kerf1hrm  [same]      moved from TA's mathbox to main set.mm
20-Oct-19 ax10e     axc7e
29-Sep-19 ply1coefsupp [same]   moved from AV's mathbox to main set.mm
29-Sep-19 mptscmfsuppd [same]   moved from AV's mathbox to main set.mm
22-Sep-19 sp2       2sp
22-Sep-19 stdpc4-2  2stdpc4
22-Sep-19 stdpc5-2  2stdpc5
22-Sep-19 ax52                  deleted; use 2ax5
22-Sep-19 gsumpropd2 [same]     moved from TA's mathbox to main set.mm
21-Sep-19 2sb6rflem2 2ax6e
21-Sep-19 2sb6rflem1 2ax6elem
20-Sep-19 dfbi1gb   dfbi1ALT
19-Sep-19 con3and   con3dimp
19-Sep-19 imp3a     impd
19-Sep-19 exp3a     expd
19-Sep-19 exp3acom23 expcomd
19-Sep-19 exp3acom3r expdcom
19-Sep-19 ancomsimp ancomst
 8-Sep-19 ---       ---         section "The binomial theorem for semirings"
                                moved from AV's mathbox to main set.mm
 8-Sep-19 srglz     [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 srglmhm   [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 srgrmhm   [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 srgsummulcr [same]    moved from AV's mathbox to main set.mm
 8-Sep-19 srgsummulcl [same]    moved from AV's mathbox to main set.mm
 8-Sep-19 srgmulgass [same]     moved from AV's mathbox to main set.mm
 8-Sep-19 srgpcomp  [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 srgpcompp [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 srgpcomppsc [same]    moved from AV's mathbox to main set.mm
 8-Sep-19 fzpreddisj[same]      moved from AV's mathbox to main set.mm
 8-Sep-19 fzdifsuc  [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 fzpred    [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 gsummptshft [same]    moved from AV's mathbox to main set.mm
 8-Sep-19 mptfzshft [same]      moved from AV's mathbox to main set.mm
 8-Sep-19 ---       ---         section "Semirings" moved from TA's mathbox to
                                main set.mm
 8-Sep-19 rge0ssre  [same]      moved from TA's mathbox to main set.mm
 8-Sep-19 sbceqbid  [same]      moved from TA's mathbox to main set.mm
 8-Sep-19 fmptdf    [same]      moved from GS's mathbox to main set.mm
 8-Sep-19 gsumconstf [same]     moved from TA's mathbox to main set.mm
 8-Sep-19 gsummptmhm [same]     revised/ moved from TA's mathbox to main set.mm
 7-Sep-19 axc16ALT2             deleted; use axc16
24-Jul-19 ee21      syl6ci
24-Jul-19 ee23      syl10
24-Jul-19 ee10      mpisyl
24-Jul-19 ee12an    syl6an
22-Jul-19 rabfsupp  ---         deleted; usage in rrxbase replaced
21-Jul-19 ellspd    [same]      revised using ` finSupp `
21-Jul-19 frlmbas   [same]      revised using ` finSupp `
21-Jul-19 frlmelbas [same]      revised using ` finSupp `
21-Jul-19 frlmgsum  [same]      revised using ` finSupp `
21-Jul-19 frlmsslsp [same]      revised using ` finSupp `
21-Jul-19 frlmsslss2 [same]     revised using ` finSupp `
21-Jul-19 frlmssuvc1 [same]     revised using ` finSupp `
21-Jul-19 frlmssuvc2 [same]     revised using ` finSupp `
20-Jul-19 rabsnif   [same]      moved from AV's mathbox to main set.mm
20-Jul-19 suppsnop  [same]      moved from AV's mathbox to main set.mm
20-Jul-19 elmapfun  [same]      moved from SO's mathbox to main set.mm
20-Jul-19 elmapfn   [same]      moved from AV's mathbox to main set.mm
18-Jul-19 coe1sfi   [same]      revised using ` finSupp `
18-Jul-19 evlslem4  [same]      revised using ` finSupp `
18-Jul-19 mpllsslem [same]      revised using ` finSupp `
18-Jul-19 mplsubglem [same]     revised using ` finSupp `
18-Jul-19 psrbagev1 [same]      revised using ` finSupp `
18-Jul-19 mplsubrglem [same]    revised using ` finSupp `
18-Jul-19 psrbagsuppfi psrbagfsupp renamed and revised using ` finSupp `
18-Jul-19 funsnfsup funsnfsupp  renamed and revised using ` finSupp `
18-Jul-19 lcomfsup  lcomfsupp   renamed and revised using ` finSupp `
 9-Jul-19 fsuppmptdm [same]     moved from AV's mathbox to main set.mm
 9-Jul-19 fsuppco2  [same]      moved from AV's mathbox to main set.mm
 9-Jul-19 fsuppmptif [same]     moved from AV's mathbox to main set.mm
 9-Jul-19 fsuppun   [same]      moved from AV's mathbox to main set.mm
 9-Jul-19 suppun    [same]      moved from AV's mathbox to main set.mm
 9-Jul-19 f1oexrnex [same]      moved from AV's mathbox to main set.mm
 9-Jul-19 supp0cosupp0 [same]   moved from AV's mathbox to main set.mm
 9-Jul-19 imacosupp [same]      moved from AV's mathbox to main set.mm
 8-Jul-19 mvridlem  snifpsrbag
 7-Jul-19 enfixsn   [same]      moved from SO's mathbox to main set.mm
 7-Jul-19 mapfien2  [same]      moved from SO's mathbox to main set.mm
 7-Jul-19 cantnffval [same]     using ` finSupp `
 7-Jul-19 cantnfdm  [same]      using ` finSupp `
 7-Jul-19 cantnfs   [same]      using ` finSupp `
 7-Jul-19 cantnfcl  [same]      using ` finSupp `
 7-Jul-19 cantnfval [same]      using ` finSupp `
 7-Jul-19 cantnfval2 [same]     using ` finSupp `
 7-Jul-19 cantnfsuc [same]      using ` finSupp `
 7-Jul-19 cantnfle  [same]      using ` finSupp `
 7-Jul-19 cantnflt  [same]      using ` finSupp `
 7-Jul-19 cantnflt2 [same]      using ` finSupp `
 7-Jul-19 cantnfp1lem1 [same]   using ` finSupp `
 7-Jul-19 cantnfp1lem2 [same]   using ` finSupp `
 7-Jul-19 cantnfp1lem3 [same]   using ` finSupp `
 7-Jul-19 cantnfp1  [same]      using ` finSupp `
 7-Jul-19 cantnflem1a [same]    using ` finSupp `
 7-Jul-19 cantnflem1b [same]    using ` finSupp `
 7-Jul-19 cantnflem1c [same]    using ` finSupp `
 7-Jul-19 cantnflem1d [same]    using ` finSupp `
 7-Jul-19 cantnflem1 [same]     using ` finSupp `
 7-Jul-19 cantnflem3 [same]     using ` finSupp `
 7-Jul-19 cantnflem4 [same]     using ` finSupp `
 7-Jul-19 cantnf    [same]      using ` finSupp `
 7-Jul-19 oemapwe   [same]      using ` finSupp `
 7-Jul-19 cantnffval2 [same]    using ` finSupp `
 7-Jul-19 wemapwe   [same]      using ` finSupp `
 7-Jul-19 oef1o     [same]      using ` finSupp `
 7-Jul-19 cnfcomlem [same]      using ` finSupp `
 7-Jul-19 cnfcom    [same]      using ` finSupp `
 7-Jul-19 cnfcom2lem [same]     using ` finSupp `
 7-Jul-19 cnfcom2   [same]      using ` finSupp `
 7-Jul-19 cnfcom3lem [same]     using ` finSupp `
 7-Jul-19 cnfcom3   [same]      using ` finSupp `
 7-Jul-19 cnfcom3clem [same]    using ` finSupp `
 7-Jul-19 cnfcom3c  [same]      using ` finSupp `
 7-Jul-19 df-cnf    [same]      using ` finSupp `
 6-Jul-19 fsuppsssupp [same]    moved from AV's mathbox to main set.mm
 6-Jul-19 fvn0elsupp [same]     moved from AV's mathbox to main set.mm
 6-Jul-19 relfsupp  [same]      moved from AV's mathbox to main set.mm
 6-Jul-19 relprcnfsupp [same]   moved from AV's mathbox to main set.mm
 6-Jul-19 suppeqfsuppbi [same]  moved from AV's mathbox to main set.mm
 6-Jul-19 cantnfreslem  extmptsuppeq renamed and ` supp ` used
 6-Jul-19 fczsupp0  [same]      moved from AV's mathbox to main set.mm
 6-Jul-19 fczfsuppd [same]      moved from AV's mathbox to main set.mm
 5-Jul-19 wemapso2  [same]      using ` finSupp `
 5-Jul-19 mapfien   [same]      using ` finSupp `
 5-Jul-19 xpexcnv   [same]      moved from ATS's mathbox to main set.mm
 5-Jul-19 fsuppcor  [same]      moved from AV's mathbox to main set.mm
 5-Jul-19 fsuppimpd [same]      moved from AV's mathbox to main set.mm
 5-Jul-19 fsuppunfi [same]      moved from AV's mathbox to main set.mm
30-Jun-19 csbren    [same]      moved from JM's mathbox to main set.mm
30-Jun-19 trirn     [same]      moved from JM's mathbox to main set.mm
30-Jun-19 ---       ---         ( CCfld |`s RR ) replaced by RRfld
30-Jun-19 recms     [same]      moved from TA's mathbox to main set.mm
30-Jun-19 reust     [same]      moved from TA's mathbox to main set.mm
30-Jun-19 recusp    [same]      moved from TA's mathbox to main set.mm
30-Jun-19 exlimddv  [same]      moved from TA's mathbox to main set.mm
30-Jun-19 adantl*r  [same]      moved from TA's mathbox to main set.mm
23-Jun-19 gsummptfsadd [same]   moved from AV's mathbox to main set.mm
21-Jun-19 frlmbassup frlmbasfsupp renamed and revised using ` finSupp `
21-Jun-19 ---       ---         changed math token from "om" to "_om"
21-Jun-19 ---       ---         changed math token from "pi" to "_pi"
21-Jun-19 ---       ---         changed math token from "tau" to "_tau"
18-Jun-19 axc11nlem1 cbvequv
18-Jun-19 axc11nlem2 axc11nlem
16-Jun-19 re*       [same]      moved from TA's mathbox to main set.mm
16-Jun-19 snnzb     [same]      moved from SF's mathbox to main set.mm
16-Jun-19 df-sra    [same]      Revised - added inner product
16-Jun-19 df-imas   [same]      Revised - added inner product
16-Jun-19 df-prds   [same]      Revised - added inner product
13-Jun-19 df-zrh    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 df-zlm    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 df-zn     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 mulgghm2  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 mulgrhm   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 mulgrhm2  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zrhval    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zrhval2   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zrhmulg   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zrhrhmb   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zrhrhm    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zlmval    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zlmsca    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znlidl    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zncrng2   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znle      [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znval2    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znbaslem  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znbas2    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znadd     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znmul     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znzrh     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znbas     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znzrh2    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znzrhval  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znf1o     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zzngim    [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znle2     [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znleval   [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 znleval2  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zntoslem  [same]      ( CCfld |`s ZZ ) replaced by ZZring
13-Jun-19 zzsnm     [same]      ( CCfld |`s ZZ ) replaced by ZZring (MB TA)
13-Jun-19 mzpmfp    [same]      ( CCfld |`s ZZ ) replaced by ZZring (MB SO)
11-Jun-19 zlpirlem1 zringlpirlem1 ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zlpirlem2 zringlpirlem2 ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zlpirlem3 zringlpirlem3 ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zlpir     zringlpir   ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 prmirred  [same]      ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 prmirredlem [same]    ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 expghm    [same]      ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 dfprm2    [same]      ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrngbas   zringbas    ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrngplusg zringplusg  ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrngmulg  zringmulg   ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrngmulr  zringmulr   ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrng0     zring0      ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrng1     zring1      ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zrngunit  zringngunit ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 dvdsrz    dvdsrzring  ( CCfld |`s ZZ ) replaced by ZZring
11-Jun-19 zcyg      zringcyg    ( CCfld |`s ZZ ) replaced by ZZring
10-Jun-19 axc9lem3  axc9lem2    fill gap in numbering
10-Jun-19 axc9lem2  axc9lem1    fill gap in numbering
10-Jun-19 axc9lem1  equviniv    used in more than one context
10-Jun-19 bnj1153   elind       moved from JB's mathbox to main set.mm
 8-Jun-19 snunioc   [same]      moved from TA's mathbox to main set.mm
 8-Jun-19 fdmrn     [same]      moved from TA's mathbox to main set.mm
 8-Jun-19 mptcnv    [same]      moved from TA's mathbox to main set.mm
 8-Jun-19 nvof1o    [same]      moved from TA's mathbox to main set.mm
 8-Jun-19 nvocnv    [same]      moved from TA's mathbox to main set.mm
 6-Jun-19 eumo0     --          deleted; use eumo + mo2
30-May-19 ioovolcl  [same]      moved from GS's mathbox to main set.mm
30-May-19 expcncf   [same]      moved from GS's mathbox to main set.mm
28-May-19 suppfif1  fsuppcolem
28-May-19 df-fsupp  [same]      moved from AV's mathbox to main set.mm
28-May-19 isfsupp   [same]      moved from AV's mathbox to main set.mm
28-May-19 funisfsupp [same]     moved from AV's mathbox to main set.mm
28-May-19 fsuppimp  [same]      moved from AV's mathbox to main set.mm
28-May-19 fdmfisuppfi [same]    moved from AV's mathbox to main set.mm
28-May-19 fdmfifsupp [same]     moved from AV's mathbox to main set.mm
28-May-19 fndmfisuppfi [same]   moved from AV's mathbox to main set.mm
28-May-19 fndmfifsupp [same]    moved from AV's mathbox to main set.mm
28-May-19 ressuppfi [same]      moved from AV's mathbox to main set.mm
28-May-19 df-supp   [same]      moved from AV's mathbox to main set.mm
28-May-19 suppval   [same]      moved from AV's mathbox to main set.mm
28-May-19 suppvalbr [same]      moved from AV's mathbox to main set.mm
28-May-19 supp0     [same]      moved from AV's mathbox to main set.mm
28-May-19 suppval1  [same]      moved from AV's mathbox to main set.mm
28-May-19 suppvalfn [same]      moved from AV's mathbox to main set.mm
28-May-19 cnvimadfsn [same]     moved from AV's mathbox to main set.mm
28-May-19 suppimacnvss [same]   moved from AV's mathbox to main set.mm
28-May-19 suppimacnv [same]     moved from AV's mathbox to main set.mm
28-May-19 ressuppss [same]      moved from AV's mathbox to main set.mm
28-May-19 ressuppssdif [same]   moved from AV's mathbox to main set.mm
28-May-19 mptsuppd  [same]      moved from AV's mathbox to main set.mm
28-May-19 suppfnss  [same]      moved from AV's mathbox to main set.mm
25-May-19 zrngrng   [same]      moved from AV's mathbox to main set.mm
25-May-19 zzsinvg   zrnginvg    moved from AV's mathbox to main set.mm
25-May-19 zzsbase   zrngbas     moved from TA's mathbox to main set.mm
25-May-19 zzsplusg  zrngplusg   moved from TA's mathbox to main set.mm
25-May-19 zzsmulg   zrngmulg    moved from TA's mathbox to main set.mm
25-May-19 zzsmulr   zrngmulr    moved from TA's mathbox to main set.mm
25-May-19 zzs0      zrng0       moved from TA's mathbox to main set.mm
25-May-19 zzs1      zrng1       moved from TA's mathbox to main set.mm
25-May-19 ress0g    [same]      moved from TA's mathbox to main set.mm
25-May-19 mul2lt0rlt0 [same]    moved from TA's mathbox to main set.mm
25-May-19 mul2lt0rgt0 [same]    moved from TA's mathbox to main set.mm
25-May-19 mul2lt0llt0 [same]    moved from TA's mathbox to main set.mm
25-May-19 mul2lt0lgt0 [same]    moved from TA's mathbox to main set.mm
25-May-19 mul2lt0bi [same]      moved from TA's mathbox to main set.mm
25-May-19 iccgelb   [--same--]  moved from TA's mathbox to main set.mm
13-May-19 a5d       ax5d
13-May-19 a6ev      ax6ev
13-May-19 a6e       ax6e
13-May-19 a6e2eq    ax6e2eq
13-May-19 a6e2nd    ax6e2nd
13-May-19 a6e2ndeq  ax6e2ndeq
13-May-19 a6e2eqVD  ax6e2eqVD
13-May-19 a6e2ndVD  ax6e2ndVD
13-May-19 a6e2ndeqVD ax6e2ndeqVD
13-May-19 a6e2ndALT ax6e2ndALT
13-May-19 a6e2ndeqALT ax6e2ndeqALT
13-May-19 a6er      ax6er
13-May-19 a10e      ax10e
13-May-19 a16nf     ax16nf
13-May-19 a16gb     ax16gb
13-May-19 a16nfALT  ax16nfALT
13-May-19 a16gALT   ax16gALT
13-May-19 a16g-o    ax16g-o
 6-May-19 fznatpl1  [same]      moved from TA's mathbox to main set.mm
 6-May-19 sbcies2   [same]      moved from TA's mathbox to main set.mm
 6-May-19 sbcies3   [same]      moved from TA's mathbox to main set.mm
 6-May-19 raltpd    [same]      moved from TA's mathbox to main set.mm
 6-May-19 mpjao3dan [same]      moved from TA's mathbox to main set.mm
 6-May-19 an3andi   [same]      moved from TA's mathbox to main set.mm
 6-May-19 an33rean  [same]      moved from TA's mathbox to main set.mm
 6-May-19 tpnzd     [same]      moved from TA's mathbox to main set.mm
 6-May-19 divelunit [same]      moved from SF's mathbox to main set.mm
 6-May-19 mulcan1g  [same]      moved from SF's mathbox to main set.mm
 6-May-19 mulcan2g  [same]      moved from SF's mathbox to main set.mm
 6-May-19 mulge0b   [same]      moved from SF's mathbox to main set.mm
 6-May-19 mulle0b   [same]      moved from SF's mathbox to main set.mm
 6-May-19 mulsuble0b [same]     moved from SF's mathbox to main set.mm
 6-May-19 subeqrev  [same]      moved from SF's mathbox to main set.mm
 6-May-19 dedekind  [same]      moved from SF's mathbox to main set.mm
 6-May-19 dedekindle [same]     moved from SF's mathbox to main set.mm
 6-May-19 pm2.61iine [same]     moved from SF's mathbox to main set.mm
 1-May-19 alexeq    ---         deleted; use alexeqg
25-Apr-19 fzonn0p1  [same]      moved from AV's mathbox to main set.mm
25-Apr-19 fzossfzop1 [same]     moved from AV's mathbox to main set.mm
25-Apr-19 fzo0ssnn0 [same]      moved from TA's mathbox to main set.mm
20-Apr-19 mpto1     mptnan      make the connective explicit
20-Apr-19 mpto2     mptxor      make the connective explicit
20-Apr-19 mtp-or    mtpor       remove the dash
20-Apr-19 mtp-xor   mtpxor      remove the dash
17-Apr-19 eldifvsn  [same]      moved from AV's mathbox to main set.mm
17-Apr-19 nabbi     [same]      moved from AV's mathbox to main set.mm
17-Apr-19 bnj926    bianir      moved from JB's mathbox to main set.mm
17-Mar-19 rspn0     [same]      moved from AV's mathbox to main set.mm
17-Mar-19 nelprd    [same]      moved from AV's mathbox to main set.mm
16-Mar-19 pncan3oi  [same]      moved from DAW's mathbox to main set.mm
16-Mar-19 mvlladdi  [same]      moved from DAW's mathbox to main set.mm
16-Mar-19 pgrpsubgsymgbi [same] moved from AV's mathbox to main set.mm
16-Mar-19 pgrpsubgsymg [same]   moved from AV's mathbox to main set.mm
16-Mar-19 grpissubg [same]      moved from AV's mathbox to main set.mm
16-Mar-19 resgrpisgrp [same]    moved from AV's mathbox to main set.mm
16-Mar-19 grpidssd  [same]      moved from AV's mathbox to main set.mm
16-Mar-19 grpinvssd [same]      moved from AV's mathbox to main set.mm
16-Mar-19 grpidlcan [same]      moved from AV's mathbox to main set.mm
16-Mar-19 grpidrcan [same]      moved from AV's mathbox to main set.mm
16-Mar-19 funsnfsup [same]      moved from SO's mathbox to main set.mm
16-Mar-19 ralxpmap  [same]      moved from SO's mathbox to main set.mm
16-Mar-19 ralxpxfr2d [same]     moved from SO's mathbox to main set.mm
16-Mar-19 raldifsni [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 mrcmndind [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 issubmd   [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 pwssplit3 [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 pwssplit2 [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 pwssplit1 [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 pwssplit0 [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 gsumvsmul [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 lcomf     [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 lcomfsup  [same]      moved from SO's mathbox to main set.mm
 9-Mar-19 symg1hash [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symg1bas  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symg2hash [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symg2bas  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgbas0  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgmov1  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgmov2  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgfix2  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgextf  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgextfv [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgextfve [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgextf1 [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgextfo [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgextf1o [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgextres [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 gsumccatsymgsn [same] moved from AV's mathbox to main set.mm
 9-Mar-19 gsmsymgrfix [same]    moved from AV's mathbox to main set.mm
 9-Mar-19 fvcosymgeq [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 gsmsymgreq [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixelq [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixels [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixelsi [same]    moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixfvh [same]     moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixf  [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixf1 [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixfo [same]      moved from AV's mathbox to main set.mm
 9-Mar-19 symgfixf1o [same]     moved from AV's mathbox to main set.mm
 8-Mar-19 fnmptfvd  [same]      moved from AV's mathbox to main set.mm
 8-Mar-19 rexraleqim [same]     moved from AV's mathbox to main set.mm
 8-Mar-19 gsummgp0  [same]      moved from AV's mathbox to main set.mm
 8-Mar-19 gsumunsnd [same]      moved from AV's mathbox to main set.mm
 8-Mar-19 gsumsnd   [same]      moved from AV's mathbox to main set.mm
 8-Mar-19 cntzcmnss [same]      moved from AV's mathbox to main set.mm
 8-Mar-19 mpt2difsnif [same]    moved from AV's mathbox to main set.mm
 8-Mar-19 mpt2snif  [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 opthne    [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 opthneg   [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 gsumprval [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 gsumpr12val [same]    moved from AV's mathbox to main set.mm
 7-Mar-19 gsummptfzcl [same]    moved from AV's mathbox to main set.mm
 7-Mar-19 gsummptcl [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 pr2pwpr   [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 hash2prd  [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 hash2pwpr [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 prel12g   [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 restidsing [same]     moved from FL's mathbox to main set.mm
 7-Mar-19 fmptsng   [same]      moved from AV's mathbox to main set.mm
 7-Mar-19 ofmpteq   [same]      moved from SO's mathbox to main set.mm
 7-Mar-19 elmapssres [same]     moved from SO's mathbox to main set.mm
 5-Mar-19 gsummptif1n0 [same]   moved from AV's mathbox to main set.mm
 5-Mar-19 cnvimamptfin [same]   moved from AV's mathbox to main set.mm
 5-Mar-19 ixpsnbasval [same]    moved from AV's mathbox to main set.mm
 5-Mar-19 ixpsnval  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 zrhcofipsgn [same]    moved from AV's mathbox to main set.mm
 4-Mar-19 fvreseq1  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 r19.29imd [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 gsumccatsymgsn [same] moved from AV's mathbox to main set.mm
 4-Mar-19 gsumccatsn [same]     moved from AV's mathbox to main set.mm
 4-Mar-19 fvcofneq  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 vtocl4ga  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 vtocl4g   [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 wrd2ind   [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 difsnexi  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 symgbasf  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 symgfv    [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 symgfvne  [same]      moved from AV's mathbox to main set.mm
 4-Mar-19 fninfp    [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 fnelfp    [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 fnelnfp   [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 fndifnfp  [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 fnnfpeq0  [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 en2eleq   [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 en2other2 [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 en2other2 [same]      moved from SO's mathbox to main set.mm
 4-Mar-19 en1uniel  [same]      moved from SO's mathbox to main set.mm
 3-Mar-19 fnmpt2ovd [same]      moved from AV's mathbox to main set.mm
 3-Mar-19 rlmval2   [same]      moved from AV's mathbox to main set.mm
 3-Mar-19 funresdfunsn  [same]  moved from AV's mathbox to main set.mm
 3-Mar-19 resindm   [same]      moved from FL's mathbox to main set.mm
 3-Mar-19 resdmdfsn [same]      moved from AV's mathbox to main set.mm
 3-Mar-19 fvtresfn  [same]      moved from SO's mathbox to main set.mm
 3-Mar-19 f0dom0    [same]      moved from AV's mathbox to main set.mm
 3-Mar-19 nelss     [same]      moved from SO's mathbox to main set.mm
 1-Mar-19 f0bi      [same]      moved from AV's mathbox to main set.mm
 1-Mar-19 dmmpt2ga  [same]      moved from AV's mathbox to main set.mm
 1-Mar-19 dmmpt2g   [same]      moved from AV's mathbox to main set.mm
21-Feb-19 ovif      [same]      moved from TA's mathbox to main set.mm
21-Feb-19 ovif2     [same]      moved from TA's mathbox to main set.mm
21-Feb-19 ovif12    [same]      moved from TA's mathbox to main set.mm
 8-Feb-19 fvsetsid  [same]      moved from SO's mathbox to main set.mm
 8-Feb-19 fsets     [same]      moved from SO's mathbox to main set.mm
 8-Feb-19 ifcomnan  [same]      moved from SO's mathbox to main set.mm
 6-Feb-19 tposconst [same]      moved from SO's mathbox to main set.mm
 6-Feb-19 fconstmpt2 [same]     moved from SO's mathbox to main set.mm
 6-Feb-19 findcard2d [same]     moved from SO's mathbox to main set.mm
 6-Feb-19 offval22  [same]      moved from SO's mathbox to main set.mm
 6-Feb-19 mpt2eq3dv [same]      moved from SO's mathbox to main set.mm
 6-Feb-19 ifcld     [same]      moved from SO's mathbox to main set.mm
 2-Feb-19 symgbasf1o [same]     moved from SO's mathbox to main set.mm
 2-Feb-19 symgbasfi [same]      moved from SO's mathbox to main set.mm
29-Dec-18 fnpr      fnprb       Revised - eliminated unnecessary antecedent
29-Dec-18 bnj145    fnsnb       Revised - added reverse implication
26-Dec-18 a4i-o     axc4i-o
26-Dec-18 a4i       axc4i
26-Dec-18 ax13lem3  axc9lem3
26-Dec-18 ax13lem2  axc9lem2
26-Dec-18 ax13lem1  axc9lem1
26-Dec-18 ax16ALT2  axc16ALT2
26-Dec-18 ax16ALT   axc16ALT
26-Dec-18 ax16      axc16
26-Dec-18 ax16i     axc16i
26-Dec-18 ax16b     axc16b
26-Dec-18 a16g      axc16g
22-Dec-18 xxxax13w  ax13w
22-Dec-18 xxxax13v  ax13v
22-Dec-18 xxxax13b  ax13b
22-Dec-18 xxxax13   ax13
22-Dec-18 xxxax-13  ax-13
22-Dec-18 ax13wlem  ax12wlem
22-Dec-18 ax13wdemo ax12wdemo
22-Dec-18 ax13w     ax12w
22-Dec-18 ax13vALT  ax12vALT
22-Dec-18 ax13v2-o  ax12v2-o
22-Dec-18 ax13v2    ax12v2
22-Dec-18 ax13v     ax12v
22-Dec-18 ax13indn  ax12indn
22-Dec-18 ax13indi  ax12indi
22-Dec-18 ax13indalem ax12indalem
22-Dec-18 ax13inda2ALT ax12inda2ALT
22-Dec-18 ax13inda2 ax12inda2
22-Dec-18 ax13inda  ax12inda
22-Dec-18 ax13i     ax12i
22-Dec-18 ax13f     ax12f
22-Dec-18 ax13eq    ax12eq
22-Dec-18 ax13el    ax12el
22-Dec-18 ax13dgen  ax12dgen
22-Dec-18 ax13b     ax12b
22-Dec-18 ax13a2-o  ax12a2-o
22-Dec-18 ax13a2    ax12a2
22-Dec-18 ax13      ax12
22-Dec-18 ax-13     ax-12
22-Dec-18 ax12w     xxxax13w
22-Dec-18 ax12v     xxxax13v
22-Dec-18 ax12lem3  ax13lem3
22-Dec-18 ax12lem2  ax13lem2
22-Dec-18 ax12lem1  ax13lem1
22-Dec-18 ax12fromc9 ax13fromc9
22-Dec-18 ax12dgen4 ax13dgen4
22-Dec-18 ax12dgen3 ax13dgen3
22-Dec-18 ax12dgen2 ax13dgen2
22-Dec-18 ax12dgen1 ax13dgen1
22-Dec-18 ax12b     xxxax13b
22-Dec-18 ax12      xxxax13
22-Dec-18 ax-12     xxxax-13
22-Dec-18 morimv    ---         deleted (use moimi applied to ax-1)
22-Dec-18 fmptapd   [same]      moved from TA's mathbox to main set.mm
22-Dec-18 fmptpr    [same]      moved from TA's mathbox to main set.mm
22-Dec-18 2eluzge1  [same]      moved from AV's mathbox to main set.mm
22-Dec-18 2eluzge0  [same]      moved from AV's mathbox to main set.mm
21-Dec-18 ax12from12o ax12fromc9
20-Dec-18 a11s      alcoms
19-Dec-18 xxxax6    ax6
19-Dec-18 xxxax11w  ax11w
19-Dec-18 xxxax11dgen ax11dgen
19-Dec-18 xxxax10   ax10
19-Dec-18 xxxax4    ax4
19-Dec-18 xxxax-13  ax-13
19-Dec-18 xxxax-11  ax-11
19-Dec-18 xxxax-10  ax-10
19-Dec-18 ra5       ra4
19-Dec-18 ax9vsep   ax6vsep
19-Dec-18 ax9v      ax6v
19-Dec-18 ax9o      axc10
19-Dec-18 ax9from9o ax6fromc10
19-Dec-18 ax9dgen   ax6dgen
19-Dec-18 ax9       xxxax6
19-Dec-18 ax7w      xxxax11w
19-Dec-18 ax7dgen   xxxax11dgen
19-Dec-18 ax7-pm2   ax11-pm2
19-Dec-18 ax7-pm    ax11-pm
19-Dec-18 ax6w      ax10w
19-Dec-18 ax6o      axc7
19-Dec-18 ax67to7   axc711to11
19-Dec-18 ax67to6   axc711toc7
19-Dec-18 ax67      axc711
19-Dec-18 ax6       xxxax10
19-Dec-18 ax5o      axc4
19-Dec-18 ax5       xxxax4
19-Dec-18 ax4sp1    axc5sp1
19-Dec-18 ax46to6   axc5c7toc7
19-Dec-18 ax46to4   axc5c7toc5
19-Dec-18 ax467to7  axc5c711to11
19-Dec-18 ax467to6  axc5c711toc7
19-Dec-18 ax467to4  axc5c711toc5
19-Dec-18 ax467     axc5c711
19-Dec-18 ax46      axc5c7
19-Dec-18 ax4567to7 axc5c4c711to11
19-Dec-18 ax4567to6 axc5c4c711toc7
19-Dec-18 ax4567to5 axc5c4c711toc4
19-Dec-18 ax4567to4 axc5c4c711toc5
19-Dec-18 ax4567    axc5c4c711
19-Dec-18 ax4       axc5
19-Dec-18 ax17o     ax5ALT
19-Dec-18 ax17eq    ax5eq
19-Dec-18 ax17el    ax5el
19-Dec-18 ax17e     ax5e
19-Dec-18 ax172     ax52
19-Dec-18 ax15      axc14
19-Dec-18 ax13dfeq  ax8dfeq
19-Dec-18 ax12o     axc9
19-Dec-18 ax11wlem  ax13wlem
19-Dec-18 ax11wdemo ax13wdemo
19-Dec-18 ax11w     ax13w
19-Dec-18 ax11vALT  ax13vALT
19-Dec-18 ax11v2-o  ax13v2-o
19-Dec-18 ax11v2    ax13v2
19-Dec-18 ax11v     ax13v
19-Dec-18 ax11o     axc15
19-Dec-18 ax11indn  ax13indn
19-Dec-18 ax11indi  ax13indi
19-Dec-18 ax11indalem ax13indalem
19-Dec-18 ax11inda2ALT ax13inda2ALT
19-Dec-18 ax11inda2 ax13inda2
19-Dec-18 ax11inda  ax13inda
19-Dec-18 ax11i     ax13i
19-Dec-18 ax11f     ax13f
19-Dec-18 ax11eq    ax13eq
19-Dec-18 ax11el    ax13el
19-Dec-18 ax11dgen  ax13dgen
19-Dec-18 ax11b     ax13b
19-Dec-18 ax11a2-o  ax13a2-o
19-Dec-18 ax11a2    ax13a2
19-Dec-18 ax11      ax13
19-Dec-18 ax10o2    axc112
19-Dec-18 ax10o-o   axc11-o
19-Dec-18 ax10o     axc11
19-Dec-18 ax10lem2  axc11nlem2
19-Dec-18 ax10lem1  axc11nlem1
19-Dec-18 ax10from10o axc11nfromc11
19-Dec-18 ax10ext   axc11next
19-Dec-18 ax10-16   axc11n-16
19-Dec-18 ax10      axc11n
19-Dec-18 a9ev      a6ev
19-Dec-18 a9er      a6er
19-Dec-18 a9e2ndeqVD a6e2ndeqVD
19-Dec-18 a9e2ndeqALT a6e2ndeqALT
19-Dec-18 a9e2ndeq  a6e2ndeq
19-Dec-18 a9e2ndVD  a6e2ndVD
19-Dec-18 a9e2ndALT a6e2ndALT
19-Dec-18 a9e2nd    a6e2nd
19-Dec-18 a9e2eqVD  a6e2eqVD
19-Dec-18 a9e2eq    a6e2eq
19-Dec-18 a9e       a6e
19-Dec-18 a7s       a11s
19-Dec-18 a6e       a10e
19-Dec-18 a5i-o     a4i-o
19-Dec-18 a5i       a4i
19-Dec-18 a17d      a5d
19-Dec-18 3ax5VD    3ax4VD
19-Dec-18 3ax5      3ax4
19-Dec-18 2ax17     2ax5
19-Dec-18 ax-17     ax-5
19-Dec-18 ax-16     ax-c16
19-Dec-18 ax-15     ax-c14
19-Dec-18 ax-14     ax-9
19-Dec-18 ax-13     ax-8
19-Dec-18 ax-12o    ax-c9
19-Dec-18 ax-11o    ax-c15
19-Dec-18 ax-11     xxxax-13
19-Dec-18 ax-10o    ax-c11
19-Dec-18 ax-10     ax-c11n
19-Dec-18 ax-9o     ax-c10
19-Dec-18 ax-9      ax-6
19-Dec-18 ax-8      ax-7
19-Dec-18 ax-7      xxxax-11
19-Dec-18 ax-6o     ax-c7
19-Dec-18 ax-6      xxxax-10
19-Dec-18 ax-5o     ax-c4
19-Dec-18 ax-5      ax-4
19-Dec-18 ax-4      ax-c5
 1-Dec-18 hashimarn [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 hashimarni [same]     moved from AV's mathbox to main set.mm
 1-Dec-18 hashfzdm  [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 fz0hash   [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 hashss    [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 euhash1   [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 hashfz0   [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 ffzohash  [same]      moved from AV's mathbox to main set.mm
 1-Dec-18 hashresfn [same]      moved from TA's mathbox to main set.mm
 1-Dec-18 dmhashres [same]      moved from TA's mathbox to main set.mm
 1-Dec-18 fneq12    [same]      moved from TA's mathbox to main set.mm
30-Nov-18 ceilingval ceilval    moved from DAW's mathbox to main set.mm
30-Nov-18 ceilingcl ceilcl      moved from DAW's mathbox to main set.mm
30-Nov-18 df-ceiling df-ceil    moved from DAW's mathbox to main set.mm
30-Nov-18 modvalr   [same]      moved from AV's mathbox to main set.mm
30-Nov-18 flpmodeq  [same]      moved from AV's mathbox to main set.mm
30-Nov-18 modvalp1  [same]      moved from AV's mathbox to main set.mm
30-Nov-18 modm1p1mod0 [same]    moved from AV's mathbox to main set.mm
30-Nov-18 modltm1p1mod [same]   moved from AV's mathbox to main set.mm
30-Nov-18 modifeq2int [same]    moved from AV's mathbox to main set.mm
30-Nov-18 2txmodxeq0 [same]     moved from AV's mathbox to main set.mm
30-Nov-18 nn0nndivcl [same]     moved from AV's mathbox to main set.mm
30-Nov-18 nn0ge0div [same]      moved from AV's mathbox to main set.mm
30-Nov-18 fldivnn0  [same]      moved from AV's mathbox to main set.mm
30-Nov-18 refldivcl [same]      moved from AV's mathbox to main set.mm
30-Nov-18 fldivle   [same]      moved from AV's mathbox to main set.mm
30-Nov-18 fldivnn0le [same]     moved from AV's mathbox to main set.mm
30-Nov-18 flltdivnn0lt [same]   moved from AV's mathbox to main set.mm
30-Nov-18 tdifltdiv [same]      moved from AV's mathbox to main set.mm
30-Nov-18 npcan1    [same]      moved from AV's mathbox to main set.mm
25-Nov-18 swrdvalodmlem ssfzoulel
24-Nov-18 modprm1div [same]     moved from AV's mathbox to main set.mm
24-Nov-18 modprminv [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modprminveq [same]    moved from AV's mathbox to main set.mm
24-Nov-18 reumodprminv [same]   moved from AV's mathbox to main set.mm
24-Nov-18 modprm0   [same]      moved from AV's mathbox to main set.mm
24-Nov-18 nnnn0modprm0 [same]   moved from AV's mathbox to main set.mm
24-Nov-18 modprmn0modprm0 [same] moved from AV's mathbox to main set.mm
24-Nov-18 cshco     [same]      moved from AV's mathbox to main set.mm
24-Nov-18 swrdco    [same]      moved from AV's mathbox to main set.mm
24-Nov-18 lswco     [same]      moved from AV's mathbox to main set.mm
24-Nov-18 repsco    [same]      moved from AV's mathbox to main set.mm
24-Nov-18 df-csh    [same]      moved (together with corresponding theorems)
                                      from AV's mathbox to main set.mm
24-Nov-18 prmgt1    [same]      moved from AV's mathbox to main set.mm
24-Nov-18 prmm2nn0  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modaddmulmod [same]   moved from AV's mathbox to main set.mm
24-Nov-18 modeqmodmin [same]    moved from AV's mathbox to main set.mm
24-Nov-18 modmulmod [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modaddmodlo [same]    moved from AV's mathbox to main set.mm
24-Nov-18 modaddmodup [same]    moved from AV's mathbox to main set.mm
24-Nov-18 2submod   [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modsubmodmod [same]   moved from AV's mathbox to main set.mm
24-Nov-18 modsubmod [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modadd2mod [same]      moved from AV's mathbox to main set.mm
24-Nov-18 addmodid  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modaddmod [same]      moved from AV's mathbox to main set.mm
24-Nov-18 zmodidfzoimp [same]   moved from AV's mathbox to main set.mm
24-Nov-18 zmodidfzo [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modidmul0 [same]      moved from AV's mathbox to main set.mm
24-Nov-18 modid0    [same]      moved from AV's mathbox to main set.mm
24-Nov-18 zmodfzp1  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 fzonfzoufzol [same]   moved from AV's mathbox to main set.mm
24-Nov-18 fzo0sn0fzo1 [same]    moved from AV's mathbox to main set.mm
24-Nov-18 elfzodifsumelfzo [same] moved from AV's mathbox to main set.mm
24-Nov-18 ubmelfzo  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 fzofzim   [same]      moved from AV's mathbox to main set.mm
24-Nov-18 fzonmapblen [same]    moved from AV's mathbox to main set.mm
24-Nov-18 fzo1fzo0n0 [same]     moved from AV's mathbox to main set.mm
24-Nov-18 fzossnn0  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 fzo0ss1   [same]      moved from AV's mathbox to main set.mm
24-Nov-18 elfz1b    [same]      moved from AV's mathbox to main set.mm
24-Nov-18 cnambmcpb nnpcan      moved from AV's mathbox to main set.mm
24-Nov-18 eqneqall  [same]      moved from AV's mathbox to main set.mm
24-Nov-18 swdeq     swrdsymbeq
24-Nov-18 swrdltnd  swrdlend
24-Nov-18 wrdsymb   wrdsymbcl
23-Nov-18 swrd0len0 [same]      moved from AV's mathbox to main set.mm
23-Nov-18 swrd0fv0  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 swrdtrcfv [same]      moved from AV's mathbox to main set.mm
23-Nov-18 swrdtrcfv0 [same]     moved from AV's mathbox to main set.mm
23-Nov-18 wrdcctswrd [same]     moved from AV's mathbox to main set.mm
23-Nov-18 lencctswrd [same]     moved from AV's mathbox to main set.mm
23-Nov-18 lenrevcctswrd [same]  moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatwrd [same]    moved from AV's mathbox to main set.mm
23-Nov-18 ccats1swrdeq [same]   moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatfn [same]     moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin1 [same]    moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem1 [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem2a [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem2b [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin2 [same]    moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem2c [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem2 [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12lem3 [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12 [same]   moved from AV's mathbox to main set.mm
23-Nov-18 swrdccat3 [same]      moved from AV's mathbox to main set.mm
23-Nov-18 swrdccat  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 swrdccat3a [same]     moved from AV's mathbox to main set.mm
23-Nov-18 swrdccat3blem [same]  moved from AV's mathbox to main set.mm
23-Nov-18 swrdccat3b [same]     moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatid [same]     moved from AV's mathbox to main set.mm
23-Nov-18 ccats1swrdeqbi [same] moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin1d [same]   moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin2d [same]   moved from AV's mathbox to main set.mm
23-Nov-18 swrdccatin12d [same]  moved from AV's mathbox to main set.mm
23-Nov-18 ccatws1lenrev [same]  moved from AV's mathbox to main set.mm
23-Nov-18 ccatws1n0 [same]      moved from AV's mathbox to main set.mm
23-Nov-18 ccatws1ls [same]      moved from AV's mathbox to main set.mm
23-Nov-18 lswccatn0lsw [same]   moved from AV's mathbox to main set.mm
23-Nov-18 lswccat0lsw [same]    moved from AV's mathbox to main set.mm
23-Nov-18 lswccats1 [same]      moved from AV's mathbox to main set.mm
23-Nov-18 ccatw2s1ccatws2 [same] moved from AV's mathbox to main set.mm
23-Nov-18 ccatw2s1ass [same]    moved from AV's mathbox to main set.mm
23-Nov-18 wrdlenccats1lenm1 [same] moved from AV's mathbox to main set.mm
23-Nov-18 ccatval1lsw [same]    moved from AV's mathbox to main set.mm
23-Nov-18 ccatfv0   [same]      moved from AV's mathbox to main set.mm
23-Nov-18 ccatsymb  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 ccatvalfn [same]      moved from AV's mathbox to main set.mm
23-Nov-18 elfzelfzccat [same]   moved from AV's mathbox to main set.mm
23-Nov-18 lswlgt0cl [same]      moved from AV's mathbox to main set.mm
23-Nov-18 wrdlenge2n0 [same]    moved from AV's mathbox to main set.mm
23-Nov-18 elfz0fzfz0 [same]     moved from AV's mathbox to main set.mm
23-Nov-18 elfzonelfzo [same]    moved from AV's mathbox to main set.mm
23-Nov-18 elfzomelpfzo [same]   moved from AV's mathbox to main set.mm
23-Nov-18 elfzmlbm  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 elfzmlbp  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 fzmmmeqm  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 fz0fzelfz0 [same]     moved from AV's mathbox to main set.mm
23-Nov-18 fz0fzdiffz0 [same]    moved from AV's mathbox to main set.mm
23-Nov-18 ltleletr  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 leaddle0  [same]      moved from AV's mathbox to main set.mm
23-Nov-18 pncan1    [same]      moved from AV's mathbox to main set.mm
23-Nov-18 2if2      [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdf     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdrn    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdn0    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdltnd  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdnd    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrd0     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdrlen  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 addlenrevswrd [same]  moved from AV's mathbox to main set.mm
18-Nov-18 addlenswrd [same]     moved from AV's mathbox to main set.mm
18-Nov-18 swrdvalfn [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdvalodmlem [same]  moved from AV's mathbox to main set.mm
18-Nov-18 swrdvalodm2 [same]    moved from AV's mathbox to main set.mm
18-Nov-18 swrdvalodm [same]     moved from AV's mathbox to main set.mm
18-Nov-18 swrd0fv   [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrd0fvlsw [same]     moved from AV's mathbox to main set.mm
18-Nov-18 swrdeq    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swdeq     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdspsleq [same]     moved from AV's mathbox to main set.mm
18-Nov-18 wrdeqswrdlsw [same]   moved from AV's mathbox to main set.mm
18-Nov-18 swrdtrcfvl [same]     moved from AV's mathbox to main set.mm
18-Nov-18 swrdlsw   [same]      moved from AV's mathbox to main set.mm
18-Nov-18 2swrdeqwrdeq [same]   moved from AV's mathbox to main set.mm
18-Nov-18 2swrd1eqwrdeq [same]  moved from AV's mathbox to main set.mm
18-Nov-18 disjxwrd  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdswrdlem [same]    moved from AV's mathbox to main set.mm
18-Nov-18 swrdswrd  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrd0swrd [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrdswrd0 [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrd0swrd0 [same]     moved from AV's mathbox to main set.mm
18-Nov-18 swrd0swrdid [same]    moved from AV's mathbox to main set.mm
18-Nov-18 s2eq2s1eq [same]      moved from AV's mathbox to main set.mm
18-Nov-18 s2eq2seq  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 swrd2lsw  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 2swrd2eqwrdeq [same]  moved from AV's mathbox to main set.mm
18-Nov-18 hashgt0n0 [same]      moved from AV's mathbox to main set.mm
18-Nov-18 fzonlt0   [same]      moved from AV's mathbox to main set.mm
18-Nov-18 elfzo0le  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 fzoshftral [same]     moved from AV's mathbox to main set.mm
18-Nov-18 fzosplitsnm1 [same]   moved from AV's mathbox to main set.mm
18-Nov-18 elfzo0z   [same]      moved from AV's mathbox to main set.mm
18-Nov-18 uzsubsubfz [same]     moved from AV's mathbox to main set.mm
18-Nov-18 uzsubsubfz1 [same]    moved from AV's mathbox to main set.mm
18-Nov-18 ige2m1fz1 [same]      moved from AV's mathbox to main set.mm
18-Nov-18 1eluzge0  [same]      moved from AV's mathbox to main set.mm
18-Nov-18 zletr     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 elfzelfzelfz [same]   moved from AV's mathbox to main set.mm
18-Nov-18 0elfz     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 uzletr    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 sub1m1    [same]      moved from AV's mathbox to main set.mm
18-Nov-18 jaoi3     [same]      moved from AV's mathbox to main set.mm
18-Nov-18 bcxmaslem2 add32r     moved from PC's mathbox to main set.mm
16-Nov-18 reps      [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsundef [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsconst [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsf     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswsymb [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswlen  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsw0    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsdf2   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswsymball [same]   moved from AV's mathbox to main set.mm
16-Nov-18 repswsymballbi [same] moved from AV's mathbox to main set.mm
16-Nov-18 repswfsts [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswlsw  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsw1    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswswrd [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswccat [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repswrevw [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsw2    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 repsw3    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lsw       [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lsw0      [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lsw0g     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lsw1      [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lsws1     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 lswcl     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 csbwrdg   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 0wrd0     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 iswrddm0  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 ffz0iswrd [same]      moved from AV's mathbox to main set.mm
16-Nov-18 iswrdbi   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdlenfi  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdsymb0  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdlenge1n0 [same]    moved from AV's mathbox to main set.mm
16-Nov-18 wrdsymb1  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 fstwrdne  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 fstwrdne0 [same]      moved from AV's mathbox to main set.mm
16-Nov-18 eqwrd     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdl1s1   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdlen2i  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrd2pr2op [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdlen2   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 wrdlen2s2 [same]      moved from AV's mathbox to main set.mm
16-Nov-18 fseq0hash [same]      moved from AV's mathbox to main set.mm
16-Nov-18 ssfzo12   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 ssfzo12bi [same]      moved from AV's mathbox to main set.mm
16-Nov-18 ifeqda    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 nn0readdcl [same]     moved from AV's mathbox to main set.mm
16-Nov-18 nn0p1gt0  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 nnm1ge0   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 elfzonn0  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 ubmelm1fzo [same]     moved from AV's mathbox to main set.mm
16-Nov-18 opth1g    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 fz0       [same]      moved from AV's mathbox to main set.mm
16-Nov-18 hashneq0  [same]      moved from AV's mathbox to main set.mm
16-Nov-18 hashfirdm [same]      moved from AV's mathbox to main set.mm
16-Nov-18 zgt0ge1   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 sbcrel    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 sbcfung   [same]      moved from AV's mathbox to main set.mm
16-Nov-18 sbcfng    [same]      moved from AV's mathbox to main set.mm
16-Nov-18 sbcfg     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 csbdm     [same]      moved from AV's mathbox to main set.mm
16-Nov-18 0mnnnnn0  [same]      moved from AV's mathbox to main set.mm
15-Nov-18 fzocatel  [same]      moved from TA's mathbox to main set.mm
18-Oct-18 elfzomin  [same]      moved from AV's mathbox to main set.mm
14-Oct-18 wrdfn     [same]      moved from AV's mathbox to main set.mm
14-Oct-18 wrdsymb   [same]      moved from AV's mathbox to main set.mm
14-Oct-18 ccatws1cl [same]      moved from AV's mathbox to main set.mm
14-Oct-18 ccatws1len [same]     moved from AV's mathbox to main set.mm
14-Oct-18 ccats1val1 [same]     moved from AV's mathbox to main set.mm
14-Oct-18 ccats1val2 [same]     moved from AV's mathbox to main set.mm
12-Oct-18 eldifpr   [same]      moved from TA's mathbox to main set.mm
12-Oct-18 eldiftp   [same]      moved from TA's mathbox to main set.mm
12-Oct-18 2ndnpr    [same]      moved from TA's mathbox to main set.mm
12-Oct-18 1stnpr    [same]      moved from TA's mathbox to main set.mm
12-Oct-18 rnpropg   [same]      moved from TA's mathbox to main set.mm
12-Oct-18 r19.41vv  [same]      moved from TA's mathbox to main set.mm
12-Oct-18 eluzelcn  [same]      moved from GS's mathbox to main set.mm
12-Oct-18 modaddabs [same]      moved from PC's mathbox to main set.mm
12-Oct-18 zmodid2   [same]      moved from PC's mathbox to main set.mm
12-Oct-18 3mix1d    [same]      moved from SF's mathbox to main set.mm
12-Oct-18 3mix2d    [same]      moved from SF's mathbox to main set.mm
12-Oct-18 3mix3d    [same]      moved from SF's mathbox to main set.mm
12-Oct-18 2nexaln   [same]      moved from ATS's mathbox to main set.mm
12-Oct-18 2exnaln   [same]      moved from ATS's mathbox to main set.mm
11-Oct-18 csbeq     csbeq2      moved from GM's mathbox to main set.mm
11-Oct-18 sbcbi2    [same]      moved from GM's mathbox to main set.mm
11-Oct-18 elrab3t   [same]      moved from TA's mathbox to main set.mm
11-Oct-18 rabbidva2 [same]      moved from TA's mathbox to main set.mm
11-Oct-18 elfzp1b   [same]      moved from PC's mathbox to main set.mm
11-Oct-18 frabbijd  f1oresrab   moved from TA's mathbox to main set.mm
11-Oct-18 dveeq2-o16 ---        deleted; use dveeq2
25-Sep-18 pm11.07   [same]      revised to match PM
24-Sep-18 supval2   [same]      revised for new df-riota (eliminated a $e hyp)
24-Sep-18 sgnmnf    [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgnn      [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgnpnf    [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgn1      [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgnrrp    [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgnp      [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgn0      [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 sgnval    [same]      moved from DAW's mathbox to main set.mm
24-Sep-18 df-sgn    [same]      moved from DAW's mathbox to main set.mm
22-Sep-18 sbcom3    [same]      moved from GM's mathbox; revised by WL
16-Sep-18 riotasvd  [same]      moved from main set.mm to NM's mathbox
16-Sep-18 riotasv2d [same]      moved from main set.mm to NM's mathbox
16-Sep-18 riotasv2s [same]      moved from main set.mm to NM's mathbox
16-Sep-18 riotasv   [same]      moved from main set.mm to NM's mathbox
16-Sep-18 riotasv3d [same]      moved from main set.mm to NM's mathbox
15-Sep-18 tosglblem [same]      revised for new df-riota
15-Sep-18 toslublem [same]      revised for new df-riota
14-Sep-18 isatl     [same]      revised for new df-riota
14-Sep-18 df-atl    [same]      revised for new df-riota
13-Sep-18 csbuni2   ---         deleted; use csbun
13-Sep-18 csbung    ---         deleted; use csbun
13-Sep-18 sbcopg    csbopg      moved from DF's mathbox to main set.mm
13-Sep-18 sbcuni    csbuni2     moved from DF's mathbox to main set.mm
13-Sep-18 sbcung    csbung      moved from DF's mathbox to main set.mm
13-Sep-18 riotaundb riotaund    revised for new df-riota
13-Sep-18 riotaclb  [same]      revised for new df-riota
13-Sep-18 riotaprc  ---         deleted
13-Sep-18 isclati   ---         deleted; use isclat
13-Sep-18 df-oposet [same]      revised for new df-riota
13-Sep-18 ple1      [same]      revised for new df-riota
13-Sep-18 p0le      [same]      revised for new df-riota
12-Sep-18 islati    ---         deleted; use islat
12-Sep-18 isclat    [same]      revised for new df-riota
12-Sep-18 df-clat   [same]      revised for new df-riota
12-Sep-18 islat     [same]      revised for new df-riota
12-Sep-18 df-lat    [same]      revised for new df-riota
12-Sep-18 meetcom   [same]      revised for new df-riota
12-Sep-18 joincom   [same]      revised for new df-riota
12-Sep-18 meetle    [same]      revised for new df-riota
12-Sep-18 lemeet2   [same]      revised for new df-riota
12-Sep-18 lemeet1   [same]      revised for new df-riota
12-Sep-18 meetlem   [same]      revised for new df-riota
12-Sep-18 joinlem   [same]      revised for new df-riota
11-Sep-18 meetval2  [same]      revised for new df-riota
11-Sep-18 joinval2  [same]      revised for new df-riota
 9-Sep-18 meetfval2 [same]      revised for new df-riota
 9-Sep-18 meetfval  [same]      revised for new df-riota
 9-Sep-18 joinfval2 [same]      revised for new df-riota
 9-Sep-18 joinfval  [same]      revised for new df-riota
 9-Sep-18 glbval    [same]      revised for new df-riota
 9-Sep-18 lubval    [same]      revised for new df-riota
 8-Sep-18 df-meet   [same]      revised for new df-riota
 8-Sep-18 df-join   [same]      revised for new df-riota
 7-Sep-18 lubid     [same]      revised - put in deduction form
 7-Sep-18 glble     [same]      revised for new df-riota
 7-Sep-18 lubid     [same]      revised for new df-riota
 7-Sep-18 luble     [same]      revised for new df-riota
 7-Sep-18 lubprop   [same]      revised for new df-riota
 6-Sep-18 glbfval   [same]      revised for new df-riota
 6-Sep-18 lubfval   [same]      revised for new df-riota
 6-Sep-18 df-glb    [same]      revised for new df-riota
 6-Sep-18 df-lub    [same]      revised for new df-riota
 2-Sep-18 riotaprc  ---         deleted; use df-riota
 2-Sep-18 csbriotag ---         deleted; use csbriota
 2-Sep-18 riotaiota ---         deleted; use df-riota
 2-Sep-18 csbriota  [same]      revised for new df-riota
 2-Sep-18 df-riota  [same]      revised
28-Aug-18 laps      ---         deleted
28-Aug-18 lanfwcl   ---         deleted
28-Aug-18 laspwcl   ---         deleted
28-Aug-18 isla      ---         deleted
28-Aug-18 spweu     ---         deleted
28-Aug-18 spwpr4c   ---         deleted
28-Aug-18 spwpr4    ---         deleted
28-Aug-18 spwcl     ---         deleted
28-Aug-18 spwex     ---         deleted
28-Aug-18 spwval    ---         deleted
28-Aug-18 spwval2   ---         deleted
28-Aug-18 df-lar    ---         deleted
28-Aug-18 df-nfw    ---         deleted
28-Aug-18 df-spw    ---         deleted
28-Aug-18 cla       ---         deleted
28-Aug-18 cinf      ---         deleted
28-Aug-18 cspw      ---         deleted (use df-poset functions)
28-Aug-18 riotassuni ---        deleted
25-Aug-18 sbcf      sbcfg
25-Aug-18 sbcfn     sbcfng
25-Aug-18 sbcfun    sbcfung
25-Aug-18 sbcssVD   sbcssgVD
24-Aug-18 sbc3org   ---         deleted; use sbc3or
24-Aug-18 csbdmg    ---         deleted; use csbdm
24-Aug-18 sbc4rexg  ---         deleted; use sbc4rex
24-Aug-18 sbc2rexg  ---         deleted; use sbc2rex
24-Aug-18 2sbcrex   [same]      revised - removed redundant hypotheses
24-Aug-18 csbdmg    ---         deleted; use csbdm
24-Aug-18 sbc3org   ---         deleted; use sbc3or
23-Aug-18 sbcssg    [same]      renamed variables
23-Aug-18 sbcss     sbcssg
23-Aug-18 csbov12g  [same]      renamed variables
23-Aug-18 csbov2g   [same]      renamed variables
23-Aug-18 csbov1g   [same]      renamed variables
23-Aug-18 csbovg    ---         deleted; use csbov123
23-Aug-18 xp0r      0xp
23-Aug-18 fv01      0fv
23-Aug-18 csbiotag  ---         deleted; use csbiota
23-Aug-18 csbresg   ---         deleted; use csbres
23-Aug-18 csbxpg    ---         deleted; use csbxp
23-Aug-18 csbrng    ---         deleted; use csbrn
23-Aug-18 csbrn     csbren
23-Aug-18 csbcnvg   ---         deleted; use csbcnv
23-Aug-18 breqn0    brne0       moved from AV's mathbox to main set.mm
23-Aug-18 csbopabg  ---         deleted; use csbopab
22-Aug-18 csbunig   ---         deleted; use csbuni
22-Aug-18 sbcbr2g   [same]      renamed variables
22-Aug-18 sbcbr1g   [same]      renamed variables
22-Aug-18 sbcbr12g  [same]      renamed variables
22-Aug-18 sbcbrg     ---        deleted; use sbcbr123
22-Aug-18 sbcsng    ---         deleted; use ralsnsg
22-Aug-18 ralsns    ralsnsg
22-Aug-18 rexsns    [same]      revised - removed unnecessary antecent
22-Aug-18 csbcnvg   [same]      moved from AV's mathbox to main set.mm
20-Aug-18 csbima12gALT ---      deleted; use csbima12
20-Aug-18 csbima12g ---         deleted; use csbima12
20-Aug-18 csbfvg    ---         deleted; use csbfv
20-Aug-18 csbfv12gALT ---       deleted; use csbfv12
20-Aug-18 csbfv12g  ---         deleted; use csbfv12
19-Aug-18 csbifg    ---         deleted; use csbif
19-Aug-18 exan3     exsimpr     moved from RM's mathbox to main set.mm
19-Aug-18 iuneq12df [same]      moved from TA's mathbox to main set.mm
19-Aug-18 rexeqbid  [same]      moved from TA's mathbox to main set.mm
19-Aug-18 raleqbid  [same]      moved from TA's mathbox to main set.mm
19-Aug-18 csbabg    ---         deleted; use csbab
18-Aug-18 sbccsb2g  ---         deleted; use sbccsb2
18-Aug-18 sbccsbg   ---         deleted; use sbccsb
18-Aug-18 csbidmg   ---         deleted; use csbidm
18-Aug-18 csbing    ---         deleted; use csbin
18-Aug-18 csbcomg   ---         deleted; use csbcom
18-Aug-18 sbcel2g   ---         deleted; use sbcel2
18-Aug-18 sbcne12g  ---         deleted; use sbcne12
18-Aug-18 sbcel12g  ---         deleted; use sbcel12
18-Aug-18 sbcreug   ---         deleted; use sbcreu
18-Aug-18 sbcrexg   ---         deleted; use sbcrex
18-Aug-18 sbcrext   [same]      revised - removed unnecessary antecedent
17-Aug-18 sbcimdv   [same]      revised - removed unnecessary antecedent
17-Aug-18 sbc3ang   ---         deleted; use sbc3an
17-Aug-18 sbcel1gv  ---         deleted; use sbcel1v
17-Aug-18 eqsbc3r   [same]      renamed variables
17-Aug-18 sbcexg    ---         deleted; use sbcex
17-Aug-18 sbcalg    ---         deleted; use sbcal
17-Aug-18 csbex     [same]      revised - removed unnecessary hypothesis
17-Aug-18 csbexg    [same]      revised - removed unnecessary antecedent
17-Aug-18 sbcorg    ---         deleted; use sbcor
17-Aug-18 sbcang    ---         deleted; use sbcan
 5-Aug-18 undifv    unvdif
30-Jun-18 sbceq1dd  [same]      revised
30-Jun-18 sbceq1d   [same]      revised
 9-Jun-18 elnn0fz0  nn0fz0      moved from SF's mathbox to main set.mm
12-May-18 intn3an1d [same]      moved from FL's mathbox to main set.mm
12-May-18 intn3an2d [same]      moved from FL's mathbox to main set.mm
12-May-18 intn3an3d [same]      moved from FL's mathbox to main set.mm
12-May-18 negcmpprcal1 nrexralim moved from FL's mathbox to main set.mm
12-May-18 islp3     [same]      moved from FL's mathbox to main set.mm
12-May-18 isunscov  infssuni    moved from FL's mathbox to main set.mm
12-May-18 bwt2      bwth        moved from FL's mathbox to main set.mm
22-Apr-18 ax10lem3  ax10o2
 8-Apr-18 elfzo1    [same]      moved from TA's mathbox to main set.mm
 8-Apr-18 fzossnn   [same]      moved from TA's mathbox to main set.mm
22-Mar-18 df-spthon [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
22-Mar-18 is2wlk    [same]      moved from AV's mathbox to main set.mm
22-Mar-18 2wlklem   [same]      moved from AV's mathbox to main set.mm
22-Mar-18 fz0tp     [same]      moved from AV's mathbox to main set.mm
22-Mar-18 tpssi     [same]      moved from AV's mathbox to main set.mm
22-Mar-18 fzo12sn   [same]      moved from AV's mathbox to main set.mm
22-Mar-18 usgranloopv [same]    moved from AV's mathbox to main set.mm
22-Mar-18 fvfundmfvn0 [same]    moved from AV's mathbox to main set.mm
22-Mar-18 f1o2ndf1  [same]      moved from AV's mathbox to main set.mm
22-Mar-18 fo2ndf    [same]      moved from AV's mathbox to main set.mm
22-Mar-18 f2ndf     [same]      moved from AV's mathbox to main set.mm
22-Mar-18 dfiunv2   [same]      moved from FL's mathbox to main set.mm
 6-Mar-18 ax10lem3  aevlem1
 6-Mar-18 ax10lem4  ax10lem3
17-Feb-18 ax10lem6  ax10lem4
17-Feb-18 ax10lem5  ax10lem3
17-Feb-18 ax10lem4  ax10lem2
17-Feb-18 ax10lem3  ---         deleted; use ax10
17-Feb-18 ax10lem2  ---         deleted; use ax10
23-Jan-18 ftp       [same]      moved from SO's mathbox to main set.mm
23-Jan-18 df-conngra [same]     moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-pthon  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-trlon  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-wlkon  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-cycl   [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-crct   [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-spth   [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-pth    [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-trail  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
23-Jan-18 df-wlk    [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
21-Jan-18 df-eupa   [same]      moved (together with corresponding theorems)
                                from MC's mathbox to main set.mm
21-Jan-18 df-vdgr   [same]      revised and moved (together with corresponding
                                theorems) from MC's mathbox to main set.mm
21-Jan-18 df-uvtx   [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
21-Jan-18 df-cusgra [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
21-Jan-18 df-nbgra  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
20-Jan-18 df-usgra  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
20-Jan-18 df-uslgra [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
20-Jan-18 df-umgra  [same]      moved (together with corresponding theorems)
                                from MC's mathbox to main set.mm
20-Jan-18 df-uhgra  [same]      moved (together with corresponding theorems)
                                from AV's mathbox to main set.mm
20-Jan-18 s4dom     [same]      moved from AV's mathbox to main set.mm
20-Jan-18 s4f1o     [same]      moved from AV's mathbox to main set.mm
20-Jan-18 f1oun2prg [same]      moved from AV's mathbox to main set.mm
20-Jan-18 s2f1o     [same]      moved from AV's mathbox to main set.mm
20-Jan-18 s4prop    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 s2prop    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 brfi1ind  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 brfi1uzind [same]     moved from AV's mathbox to main set.mm
20-Jan-18 brfi1indlem [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashtpg   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hash2prb  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hash2prde [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hash2pr   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashgt12el2 [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashgt12el [same]     moved from AV's mathbox to main set.mm
20-Jan-18 hash1snb  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashdifsn [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashgt0elexb [same]   moved from AV's mathbox to main set.mm
20-Jan-18 hashgt0elex [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashle00  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashprb   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 elprchashprn2 [same]  moved from AV's mathbox to main set.mm
20-Jan-18 hashnn0n0nn [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashunx   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashinfxadd [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashrabrsn[same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashnfinnn0 [same]    moved from AV's mathbox to main set.mm
20-Jan-18 hashvnfin [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashf1rn  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hasheqf1oi [same]     moved from AV's mathbox to main set.mm
20-Jan-18 fiinfnf1o [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hasheqf1o [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashv01gt1 [same]     moved from AV's mathbox to main set.mm
20-Jan-18 hashnemnf [same]      moved from AV's mathbox to main set.mm
20-Jan-18 hashnnn0genn0 [same]  moved from AV's mathbox to main set.mm
20-Jan-18 hashnn0pnf[same]      moved from AV's mathbox to main set.mm
20-Jan-18 bcn2p1    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 bcn2m1    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 bc0k      [same]      moved from AV's mathbox to main set.mm
20-Jan-18 injresinj [same]      moved from AV's mathbox to main set.mm
20-Jan-18 injresinjlem [same]   moved from AV's mathbox to main set.mm
20-Jan-18 elfznelfzob [same]    moved from AV's mathbox to main set.mm
20-Jan-18 elfznelfzo [same]     moved from AV's mathbox to main set.mm
20-Jan-18 fzo0to42pr [same]     moved from AV's mathbox to main set.mm
20-Jan-18 fzo0to3tp [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fzo0to2pr [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fzossrbm1 [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fzon      [same]      moved from AV's mathbox to main set.mm
20-Jan-18 4fvwrd4   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 1fv       [same]      moved from AV's mathbox to main set.mm
20-Jan-18 xadd4d    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 nn0pnfge0 [same]      moved from AV's mathbox to main set.mm
20-Jan-18 nn0n0n1ge2b [same]    moved from AV's mathbox to main set.mm
20-Jan-18 nn0n0n1ge2 [same]     moved from AV's mathbox to main set.mm
20-Jan-18 nfielex   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 finresfin [same]      moved from AV's mathbox to main set.mm
20-Jan-18 isprmpt2  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 sprmpt2   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 brovmpt2ex [same]     moved from AV's mathbox to main set.mm
20-Jan-18 brovex    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 mpt2ndm0  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopoveqd [same]   moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopovel [same]    moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopoveq [same]    moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopynvov0 [same]  moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopxprcov0 [same] moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopx0ov0 [same]   moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopxnop0 [same]   moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopynvov0g [same] moved from AV's mathbox to main set.mm
20-Jan-18 mpt2xopn0yelv [same]  moved from AV's mathbox to main set.mm
20-Jan-18 bropopvvv [same]      moved from AV's mathbox to main set.mm
20-Jan-18 nssdmovg  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 brabv     [same]      moved from AV's mathbox to main set.mm
20-Jan-18 0neqopab  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 opabbrex  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 f1ocnvfvrneq [same]   moved from AV's mathbox to main set.mm
20-Jan-18 f1veqaeq  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fvtp3g    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fvtp2g    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fvtp1g    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fvpr2g    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fvpr1g    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 ftpg      [same]      moved from AV's mathbox to main set.mm
20-Jan-18 eldmrexrnb [same]     moved from AV's mathbox to main set.mm
20-Jan-18 eldmrexrn [same]      moved from AV's mathbox to main set.mm
20-Jan-18 elrnrexdmb [same]     moved from AV's mathbox to main set.mm
20-Jan-18 elrnrexdm [same]      moved from AV's mathbox to main set.mm
20-Jan-18 f1oprg    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 fntpg     [same]      moved from AV's mathbox to main set.mm
20-Jan-18 funtpg    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 prnebg    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 prneimg   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 tppreqb   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 tpprceq3  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 tppreq3   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 rabrsn    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 disjpr2   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 exsnrex   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 difrab0eq [same]      moved from AV's mathbox to main set.mm
20-Jan-18 raldifb   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 ssrabeq   [same]      moved from AV's mathbox to main set.mm
20-Jan-18 elrabi    [same]      moved from AV's mathbox to main set.mm
20-Jan-18 nnel      [same]      moved from AV's mathbox to main set.mm
20-Jan-18 3biant1d  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 3bior2fd  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 3bior1fand [same]     moved from AV's mathbox to main set.mm
20-Jan-18 3bior1fd  [same]      moved from AV's mathbox to main set.mm
20-Jan-18 jaoi2     [same]      moved from AV's mathbox to main set.mm
18-Jan-18 prsspwg   [same]      changed _V in antecedents to variables
18-Jan-18 prsspwg   [same]      moved from TA's mathbox to main set.mm
18-Jan-18 pwundif2  ---         deleted from TA's mathbox; same as pwundif
18-Jan-18 prelpwi   [same]      moved from TA's mathbox to main set.mm
18-Jan-18 hashge1   [same]      moved from TA's mathbox to main set.mm
18-Jan-18 hashgt0   [same]      moved from TA's mathbox to main set.mm
18-Jan-18 hashge0   [same]      moved from TA's mathbox to main set.mm
30-Dec-17 rabfi     [same]      moved from TA's mathbox to main set.mm
30-Dec-17 infi      [same]      moved from TA's mathbox to main set.mm
26-Dec-17 addccncf  [same]      moved from JM's mathbox to main set.mm
16-Dec-17 opabex3d  [same]      moved from AV's mathbox to main set.mm
10-Dec-17 fnpr      [same]      changed hypotheses to "e. _V" instead of "e. V"
10-Dec-17 3m1e2     [same]      swapped equality arguments
10-Dec-17 repfuntw  fnpr        moved from FL's mathbox to main set.mm
10-Dec-17 uninqs    uniinqs     moved from FL's mathbox to main set.mm
10-Dec-17 rngoridfz [same]      moved from FL's mathbox to main set.mm
10-Dec-17 zerdivemp1 [same]     moved from FL's mathbox to main set.mm
10-Dec-17 neleq12d  [same]      moved from FL's mathbox to main set.mm
10-Dec-17 feq123    [same]      moved from FL's mathbox to main set.mm
10-Dec-17 fprg      [same]      moved from FL's mathbox to main set.mm
10-Dec-17 2eq3m1    3m1e2       moved from FL's mathbox to main set.mm
10-Dec-17 trcrm     truan       moved from FL's mathbox to main set.mm
 8-Dec-17 ---       ---         changed math symbol from "cprod_" to "prod_"
 8-Dec-17 ---       ---         changed math symbol from "prod_" to "gprod_"
 1-Dec-17 diftpsneq diftpsn3    moved from AV's mathbox to main set.mm
 1-Dec-17 difprsng  ---         (in AV's mathbox) deleted; use difprsn1
 1-Dec-17 difprsneq difprsn2    moved from AV's mathbox to main set.mm
 1-Dec-17 difprsn2  difprsn1    moved from TA's mathbox to main set.mm
 1-Dec-17 difprsn   difprsnss
 1-Dec-17 difsneq   difsnb
 7-Oct-17 fv4       df-fv
 7-Oct-17 df-fv     dffv4
 6-Oct-17 cnveq3    cnveq0      moved from FL's mathbox to main set.mm
22-Sep-17 wunexALT  wunex3
22-Sep-17 pwuninelALT pwuninel2
20-Sep-17 dveeq1ALT dveeq1-o16
20-Sep-17 dveeq2ALT dveeq2-o16
20-Sep-17 dvelimfALT2 ---       deleted; use dvelimh
20-Sep-17 dvelimfALT2 dvelimhw
17-Sep-17 hbaes     ---         deleted; use hbae + syl (ae = all equals)
17-Sep-17 alequcom  aecom
17-Sep-17 alequcoms aecoms
17-Sep-17 nalequcoms naecoms
17-Sep-17 alequcom-o aecom-o
17-Sep-17 alequcoms-o aecoms-o
17-Sep-17 nalequcoms-o naecoms-o
26-Aug-17 cmpfun    funmpt2     moved from FL's mathbox to main set.mm
26-Aug-17 xrre3     [--same--]  moved from FL's mathbox to main set.mm
21-Aug-17 nd5       ---         deleted; use dveeq2
19-Aug-17 ax4       sp
16-Aug-17 ax10lem8  ax10lem5
16-Aug-17 ax10lem7  ax10lem4
16-Aug-17 ax10lem4  ax10lem6
16-Aug-17 ax10lem6  ---         deleted; use dveeq2
16-Aug-17 ax10lem5  dvelimv
16-Aug-17 dvelimv   dvelimnf
 5-Aug-17 ax12dgen4w ax12dgen4
 5-Aug-17 ax12dgen3w ax12dgen3
 5-Aug-17 ax12dgen2w ax12dgen2
 5-Aug-17 ax12dgen1w ax12dgen1
 5-Aug-17 ax11dgenw ax11dgen
 5-Aug-17 ax7dgenw  ax7dgen
 5-Aug-17 ax9dgenw  ax9dgen
 5-Aug-17 ax11demow ax11wdemo
 5-Aug-17 ax11wlemw ax11wlem
 3-Aug-17 hbalwK    hbalw
 3-Aug-17 hbe1wK    hbe1w
 3-Aug-17 hba1wK    hba1w
 3-Aug-17 ax11wdemoK ax11demow
 3-Aug-17 ax11dgenK ax11dgenw
 3-Aug-17 ax11wK    ax11w
 3-Aug-17 ax11wlemK ax11wlemw
 3-Aug-17 ax12dgen4K ax12dgen4w
 3-Aug-17 ax12dgen3K ax12dgen3w
 3-Aug-17 ax12dgen2K ax12dgen2w
 3-Aug-17 ax12dgen1K ax12dgen1w
 3-Aug-17 ax12wK    ax12w
 3-Aug-17 ax7dgenK  ax7dgenw
 3-Aug-17 ax7wK     ax7w
 3-Aug-17 ax6wK     ax6w
 3-Aug-17 ax6wfK    ax6fw
 3-Aug-17 ax9dgenK  ax9dgenw
 3-Aug-17 cbvexvK   cbvexvw
 3-Aug-17 cbvalvK   cbvalvw
 3-Aug-17 cbvalK    cbvalw
 3-Aug-17 spfalK    spfalw
 3-Aug-17 sptruK    sptruw
 3-Aug-17 spvK      spvw
 3-Aug-17 spwK      spw
 3-Aug-17 19.8wK    19.8w
 3-Aug-17 spnwfK    spnfw
 3-Aug-17 spwfK     spfw
 3-Aug-17 cbvalivK  cbvalivw
 3-Aug-17 cbvaliK   cbvaliw
 3-Aug-17 spimvK    spimvw
 3-Aug-17 spimK     spimw
 3-Aug-17 spimfK    spimfw
 3-Aug-17 speimfK   speimfw
 2-Aug-17 ax-9v     ax9v        now a theorem instead of an axiom
 1-Aug-17 dvelimfALT2 [--same--] revised hypotheses
 1-Aug-17 equcomi-o ---         deleted; use equcomi instead
 1-Aug-17 cbv3ALT   cbv3h
 1-Aug-17 19.2      19.2g
 1-Aug-17 equidxx   equid
 1-Aug-17 equid     equid1
 1-Aug-17 equid1    equidxx
28-Jul-17 a4i       spi
28-Jul-17 a4s       sps
28-Jul-17 a4sd      spsd
28-Jul-17 a4imt     spimt
28-Jul-17 a4im      spim
28-Jul-17 a4ime     spime
28-Jul-17 a4imed    spimed
28-Jul-17 a4imv     spimv
28-Jul-17 a4sbe     spsbe
28-Jul-17 a4sbim    spsbim
28-Jul-17 a4sbbi    spsbbi
28-Jul-17 a4v       spv
28-Jul-17 a4imev    spimev
28-Jul-17 a4eiv     speiv
28-Jul-17 ra4       rsp
28-Jul-17 ra4e      rspe
28-Jul-17 ra42      rsp2
28-Jul-17 ra42e     rsp2e
28-Jul-17 cla4imgft spcimgft
28-Jul-17 cla4gft   spcgft
28-Jul-17 cla4imgf  spcimgf
28-Jul-17 cla4imegf spcimegf
28-Jul-17 cla4gf    spcgf
28-Jul-17 cla4egf   spcegf
28-Jul-17 cla4imdv  spcimdv
28-Jul-17 cla4dv    spcdv
28-Jul-17 cla4imedv spcimedv
28-Jul-17 cla4gv    spcgv
28-Jul-17 cla4egv   spcegv
28-Jul-17 cla42egv  spc2egv
28-Jul-17 cla42gv   spc2gv
28-Jul-17 cla43egv  spc3egv
28-Jul-17 cla43gv   spc3gv
28-Jul-17 cla4v     spcv
28-Jul-17 cla4ev    spcev
28-Jul-17 cla42ev   spc2ev
28-Jul-17 rcla4t    rspct
28-Jul-17 rcla4     rspc
28-Jul-17 rcla4e    rspce
28-Jul-17 rcla4v    rspcv
28-Jul-17 rcla4cv   rspccv
28-Jul-17 rcla4va   rspcva
28-Jul-17 rcla4cva  rspccva
28-Jul-17 rcla4ev   rspcev
28-Jul-17 rcla4imdv rspcimdv
28-Jul-17 rcla4imedv rspcimedv
28-Jul-17 rcla4dv   rspcdv
28-Jul-17 rcla4edv  rspcedv
28-Jul-17 rcla42    rspc2
28-Jul-17 rcla42v   rspc2v
28-Jul-17 rcla42va  rspc2va
28-Jul-17 rcla42ev  rspc2ev
28-Jul-17 rcla43v   rspc3v
28-Jul-17 rcla43ev  rspc3ev
28-Jul-17 a4sbc     spsbc
28-Jul-17 a4sbcd    spsbcd
28-Jul-17 ra4sbc    rspsbc
28-Jul-17 ra4sbca   rspsbca
28-Jul-17 ra4esbca  rspesbca
28-Jul-17 a4esbc    spesbc
28-Jul-17 a4esbcd   spesbcd
28-Jul-17 ra4csbela rspcsbela
28-Jul-17 rcla4eov  rspceov
28-Jul-17 rcla42edv rspc2edv
28-Jul-17 isibg1a4a isibg1spa
28-Jul-17 a4sbce-2  spsbce-2
28-Jul-17 rcla4egf  rspcegf
28-Jul-17 ra4sbc2   rspsbc2
28-Jul-17 ra4sbc2VD rspsbc2VD
23-Jul-17 df-n      df-nn
23-Jul-17 sbcss     [--same--]  moved from AS's mathbox to main set.mm
22-Jul-17 dfprime2  dfprm2
22-Jul-17 df-divides df-dvds
22-Jul-17 divides2  dvdsval2
22-Jul-17 divides3  dvdsval3
22-Jul-17 nndivdivides nndivdvds
22-Jul-17 df-prime  df-prm
19-Jul-17 df-ring   df-rng
19-Jul-17 df-plus   df-add
29-Jun-17 2m1e1     [--same--]  moved from DAW's mathbox to main set.mm
24-Jun-17 imrmo     rmoim
24-Jun-17 immoi     moimi
24-Jun-17 immo      moim
24-Jun-17 moimv     morimv
17-Jun-17 2ndcdisj2 [--same--]  revised to use df-rmo
17-Jun-17 2ndcdisj  [--same--]  revised to use df-rmo
17-Jun-17 mgmidmo   [--same--]  revised to use df-rmo
17-Jun-17 lspextmo  [--same--]  revised to use df-rmo
17-Jun-17 ply1divmo [--same--]  revised to use df-rmo
17-Jun-17 sqrmo     [--same--]  revised to use df-rmo
17-Jun-17 cvmliftmo [--same--]  revised to use df-rmo
17-Jun-17 hilbert1.2 [--same--] revised to use df-rmo
17-Jun-17 idomsubgmo [--same--] revised to use df-rmo
16-Jun-17 spwmo     [--same--]  revised to use df-rmo
16-Jun-17 poslubmo  [--same--]  revised to use df-rmo
16-Jun-17 brdom7disj [--same--] revised to use df-rmo
16-Jun-17 brdom4    [--same--]  revised to use df-rmo
16-Jun-17 iunmapdisj [--same--] revised to use df-rmo
16-Jun-17 moriotass [--same--]  revised to use df-rmo
16-Jun-17 supmo     [--same--]  revised to use df-rmo
16-Jun-17 dffun9    [--same--]  revised to use df-rmo
16-Jun-17 reuxfr2   [--same--]  revised to use df-rmo
16-Jun-17 reuxfr2d  [--same--]  revised to use df-rmo
16-Jun-17 somo      [--same--]  revised to use df-rmo
16-Jun-17 df-disj   [--same--]  revised to use df-rmo
16-Jun-17 rmoi      [--same--]  revised to use df-rmo
16-Jun-17 rmob      [--same--]  revised to use df-rmo
16-Jun-17 rmo3      [--same--]  revised to use df-rmo
16-Jun-17 2reuswap  [--same--]  revised to use df-rmo
16-Jun-17 rmo4      [--same--]  revised to use df-rmo
16-Jun-17 reu5      [--same--]  revised to use df-rmo
18-May-17 fsnunfv   [--same--]  revised
28-Apr-17 copab2    coprab
 7-Jan-17 df-sbc    [--same--]  df-sbc and 521 uses modified (statement and/or
                                  proof) to use separate notation from df-sb.
31-Dec-16 elabsbc   ---         deleted; use df-sbc instead
31-Dec-16 elabsg    ---         deleted; use df-sbc instead
31-Dec-16 elabs2    ---         deleted; use df-sbc instead
26-Dec-16 faclt2exp 2expltfac
24-Dec-16 reuunineg riotaneg    revised
24-Dec-16 supsn     [--same--]  revised
24-Dec-16 suppr     [--same--]  revised
24-Dec-16 supeut    ---         deleted; see supeu
24-Dec-16 supmax    [--same--]  revised
24-Dec-16 supnubi   ---         deleted; see supnub
24-Dec-16 suplubi   ---         deleted; see suplub
24-Dec-16 supubi    ---         deleted; see supub
24-Dec-16 supcli    ---         deleted; see supcl
24-Dec-16 supeui    ---         deleted; see supeu
24-Dec-16 supnub    [--same--]  revised
24-Dec-16 suplub2   [--same--]  revised
24-Dec-16 suplub    [--same--]  revised
24-Dec-16 supub     [--same--]  revised
24-Dec-16 supcl     [--same--]  revised
24-Dec-16 eqsup     [--same--]  revised
24-Dec-16 supeu     [--same--]  revised
24-Dec-16 supmo     [--same--]  revised
24-Dec-16 reiotass2 riotass2    revised
24-Dec-16 reiota2   riota2      revised
24-Dec-16 reiota2f  riota2f     revised
24-Dec-16 reiota2df riota2df    revised
24-Dec-16 reiota1   riota1      revised
24-Dec-16 reiotasbc riotasbc    revised
24-Dec-16 reiotacl  riotacl     revised
24-Dec-16 iota2df   [--same--]  revised
24-Dec-16 reiotacl2 riotacl2    revised
24-Dec-16 f1ocnvfv3 [--same--]  revised
24-Dec-16 reuunixfr riotaxfrd   revised
24-Dec-16 eusvobj1  [--same--]  revised
24-Dec-16 reuunisn  snriota     revised
24-Dec-16 reusni    rabsneu     revised
24-Dec-16 reuuniss2 riotass2    revised
24-Dec-16 mouniss   moriotass   revised
24-Dec-16 reuuniss  riotass     revised
24-Dec-16 reuuni3   ---         deleted; see riotauni, riotasbc, sbcie2g
24-Dec-16 reuunisbc riotasbc    revised
24-Dec-16 reucl     riotacl     revised
24-Dec-16 reucl2    riotacl2    revised
24-Dec-16 euuni2    iota2       revised
24-Dec-16 reuuni2   riota2      revised
24-Dec-16 reuuni2f  riota2f     revised
24-Dec-16 reuuni1   riota1a     revised
24-Dec-16 euuni     iotauni     revised
24-Dec-16 iotaequ   iotauni
24-Dec-16 iota2     iotaequ
20-Dec-16 ---       ---         Renames below prevent ax-XXX vs. axXXX conflict
20-Dec-16 axreg     axreg2
20-Dec-16 axac      axac3
20-Dec-16 axhilex   axhilex-zf
20-Dec-16 axhfvadd  axhfvadd-zf
20-Dec-16 axhvcom   axhvcom-zf
20-Dec-16 axhvass   axhvass-zf
20-Dec-16 axhv0cl   axhv0cl-zf
20-Dec-16 axhvaddid axhvaddid-zf
20-Dec-16 axhfvmul  axhfvmul-zf
20-Dec-16 axhvmulid axhvmulid-zf
20-Dec-16 axhvmulass axhvmulass-zf
20-Dec-16 axhvdistr1 axhvdistr1-zf
20-Dec-16 axhvdistr2 axhvdistr2-zf
20-Dec-16 axhvmul0  axhvmul0-zf
20-Dec-16 axhfi     axhfi-zf
20-Dec-16 axhis1    axhis1-zf
20-Dec-16 axhis2    axhis2-zf
20-Dec-16 axhis3    axhis3-zf
20-Dec-16 axhis4    axhis4-zf
20-Dec-16 axhcompl  axhcompl-zf
20-Dec-16 axlll     axlll2      (in FL's mathbox)
 4-Dec-16 hbmpt2    [same]      removed unnecessary $d restriction
17-Sep-16 ssdifeq0  [same]      moved from SR's mathbox to main set.mm
 4-Sep-16 bnj232    anim12ci    moved from JB's mathbox to main set.mm
 4-Sep-16 bnj186    anbi12ci    moved from JB's mathbox to main set.mm
 4-Sep-16 bnj1540   neneqd      moved from JB's mathbox to main set.mm
 4-Sep-16 bnj169    3anan32     moved from JB's mathbox to main set.mm
 4-Sep-16 bnj176    3anan12     moved from JB's mathbox to main set.mm
 4-Sep-16 bnj1295   ssind       moved from JB's mathbox to main set.mm
 4-Sep-16 bnj184    anbi2ci     moved from JB's mathbox to main set.mm
 4-Sep-16 bnj2      con3dimp     moved from JB's mathbox to main set.mm
 4-Sep-16 c-bnj16   ---         deleted
 4-Sep-16 bnj536    ---         deleted; also deleted 744 other unused bnj*
28-May-16 recld     recld2
28-May-16 expmwordi leexp1a
28-May-16 expword2i leexp2r
28-May-16 expord2   ltexp2r
28-May-16 expwordi  leexp2a
28-May-16 expword   leexp2
28-May-16 expord    ltexp2
28-May-16 expordi   ltexp2a
22-May-16 anim12    ---         deleted (use prth instead)
 6-Apr-16 AneBC     nelpri      moved from DAW's mathbox to main set.mm
 6-Apr-16 ixpfn     [same]      moved from FL's mathbox to main set.mm
 6-Apr-16 oveq123i  [same]      moved from FL's mathbox to main set.mm
 6-Apr-16 2on0      [same]      moved from SF's mathbox to main set.mm
 6-Apr-16 sqsubswap [same]      moved from SF's mathbox to main set.mm
 6-Apr-16 anass1rs  [same]      moved from JM's mathbox to main set.mm
 6-Apr-16 eltids    opelresi    moved from FL's mathbox to main set.mm; revised
 6-Apr-16 ref4w     issref      moved from FL's mathbox to main set.mm; revised
 5-Apr-16 relexpex  ---         (in DF's mathbox) obsolete; deleted - use ovex
 5-Apr-16 mplvscafval ---       obsolete; deleted - use mplvsca2
 5-Apr-16 ply1rcl   ---         obsolete; deleted - use elbasfv
 5-Apr-16 psr1rcl   ---         obsolete; deleted - use elbasfv
 5-Apr-16 lbicc2a   lbicc2      moved from FL's mathbox to main set.mm
 5-Apr-16 ubicc2a   ubicc2      moved from FL's mathbox to main set.mm
 5-Apr-16 anymptr   a1tru       moved from FL's mathbox to main set.mm
 5-Apr-16 fampany   falim       moved from FL's mathbox to main set.mm
 5-Apr-16 predbrg   [same]      revised - eliminated antecedent
 5-Apr-16 predbr    ---         obsolete; deleted - use elpredim
 5-Apr-16 mueq0     ---         obsolete; deleted - use isnsqf
 5-Apr-16 resiundi  ---         obsolete; deleted - use resiun2
 5-Apr-16 trsuc2    ---         obsolete; deleted - use suctr
 5-Apr-16 tru2      ---         obsolete; deleted - use tru
29-Jan-16 .le       c.le
29-Jan-16 .lt       c.lt
29-Jan-16 .pl       c.pl
29-Jan-16 .an       c.an
29-Jan-16 .or       c.or
21-Dec-15 ax12conj  ax12        revised
21-Dec-15 ax12      ---         obsolete; deleted
21-Dec-15 ax12-2    ---         obsolete; deleted
21-Dec-15 ax12-3    ---         obsolete; deleted
21-Dec-15 ax12o     [same]      revised
21-Dec-15 ax-12     [same]      revised
 2-Dec-15 ax9seplem ax9vsep
 2-Dec-15 ax9sep    ---         obsolete (moved to NM's mathbox; to be deleted)
 2-Dec-15 ax9ALT    ax9
 2-Dec-15 ax9       ax9OLD      obsolete (moved to NM's mathbox; to be deleted)
 2-Dec-15 ax9vax9   ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 dvelimfALT2 ---       obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12stdy1  ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12stdy2  ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12stdy3  ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12stdy4  ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12lem1   ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12lem2   ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12study  ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12studyALT ---       obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12study2 ---         obsolete (moved to NM's mathbox; to be deleted)
30-Nov-15 a12study3 ---         obsolete (moved to NM's mathbox; to be deleted)
29-Nov-15 ax-12     ax-12o
10-Nov-15 a9wa9     ax9vax9
10-Nov-15 ax10      [--same--]  proved from new ax-9v instead of ax-9
 2-Nov-15 hlhil     hlathil     (in NM's mathbox)
 2-Nov-15 df-ocomp  [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 ishil     ishil2      moved from NM's mathbox to main set.mm
 2-Nov-15 iscsubsp  iscss       moved from NM's mathbox to main set.mm; revised
 2-Nov-15 csubspset cssval      moved from NM's mathbox to main set.mm; revised
 2-Nov-15 ocvval    [--same--]  moved from NM's mathbox to main set.mm; revised
 2-Nov-15 ocvfval   [--same--]  moved from NM's mathbox to main set.mm; revised
 2-Nov-15 df-hil    [--same--]  moved from NM's mathbox to main set.mm; revised
 2-Nov-15 df-csubsp df-css      moved from NM's mathbox to main set.mm; revised
 2-Nov-15 df-ocv    [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 isphild   isphld      moved from NM's mathbox to main set.mm
 2-Nov-15 isphil    isphl       moved from NM's mathbox to main set.mm; revised
 2-Nov-15 df-prehil df-phl      moved from NM's mathbox to main set.mm; revised
 2-Nov-15 phlfn     phlstr      moved from NM's mathbox to main set.mm
 2-Nov-15 phllem    ---         (in NM's mathbox) deleted; see phlfn
 2-Nov-15 ipid      [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 df-inprod df-ip       moved from NM's mathbox to main set.mm
 2-Nov-15 issrngd   [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 issrng    [--same--]  moved from NM's mathbox to main set.mm; revised
 2-Nov-15 df-starrng df-srng    moved from NM's mathbox to main set.mm; revised
 2-Nov-15 srngfn    [--same--]  moved from NM's mathbox to main set.mm; revised
 2-Nov-15 srnglem   ---         (in NM's mathbox) deleted; see srngfn
 2-Nov-15 starvid   [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 df-starv  [--same--]  moved from NM's mathbox to main set.mm
 2-Nov-15 ldualsmul [--same--]  (in NM's mathbox) hypothesis eliminated
 2-Nov-15 lsatset   [--same--]  (in NM's mathbox) revised
 2-Nov-15 df-lsatoms [--same--] (in NM's mathbox) revised
 2-Nov-15 df-mulvval [--same--] (in ATS's mathbox) revised
 2-Nov-15 df-subrval [--same--] (in ATS's mathbox) revised
 2-Nov-15 df-addrval [--same--] (in ATS's mathbox) revised
 2-Nov-15 df-mulv   [--same--]  (in ATS's mathbox) revised
 2-Nov-15 df-subr   [--same--]  (in ATS's mathbox) revised
 2-Nov-15 df-addr   [--same--]  (in ATS's mathbox) revised
 2-Nov-15 fveqsb    [--same--]  (in ATS's mathbox) hypothesis eliminated
 2-Nov-15 fvsb      [--same--]  (in ATS's mathbox) hypothesis eliminated
 2-Nov-15 hausgraph [--same--]  (in SO's mathbox) hypothesis eliminated
 2-Nov-15 prdminvgd2 prdsinvgd2 (in SO's mathbox) revised
 2-Nov-15 dfac21i   dfac21      (in SO's mathbox) revised
 2-Nov-15 nndivdivides [--same--] moved from SO's mathbox to main set.mm
 2-Nov-15 df-dioph  [--same--]  (in SO's mathbox) revised
 2-Nov-15 mzpcl34   [--same--]  (in SO's mathbox) hypothesis eliminated
 2-Nov-15 mzpcl2    [--same--]  (in SO's mathbox) hypothesis eliminated
 2-Nov-15 mzpcl1    [--same--]  (in SO's mathbox) hypothesis eliminated
 2-Nov-15 elmzpcl   [--same--]  (in SO's mathbox) hypothesis eliminated
 2-Nov-15 mzpclval  [--same--]  (in SO's mathbox) revised
 2-Nov-15 df-mzpcl  [--same--]  (in SO's mathbox) revised
 2-Nov-15 fcompt    [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 ---       ---         isipodrs ~ lidlacs moved from SO's mathbox to
                                main set.mm
 2-Nov-15 iscldtop  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 cldmreon  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 toponmre  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 mretopd   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 istopon   [--same--]  moved from SO's mathbox to main set.mm; revised
 2-Nov-15 df-topon  [--same--]  moved from SO's mathbox to main set.mm; revised
 2-Nov-15 ptcldmpt  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 ptcld     [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 ptunimpt  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 cldopn2   cldopn      moved from SO's mathbox to main set.mm; revised
 2-Nov-15 cldss3    cldss       moved from SO's mathbox to main set.mm; revised
 2-Nov-15 cldrcl    [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 ptopn2    [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 riinint   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 boxcutc   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 boxriin   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 baspartn  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 fncld     [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 reslmhm2b [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 reslmhm2  [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 islmhmd   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 lmodvsinv [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 fissuni   [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 fmptsn    [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 intsng    [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 rexss     [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 ralss     [--same--]  moved from SO's mathbox to main set.mm
 2-Nov-15 elfpw     [--same--]  moved from SO's mathbox to main set.mm; revised
 2-Nov-15 prter3    [--same--]  (in RM's mathbox) revised
 2-Nov-15 prter2    [--same--]  (in RM's mathbox) revised
 2-Nov-15 prtex     [--same--]  (in RM's mathbox) revised
 2-Nov-15 prter1    [--same--]  (in RM's mathbox) revised
 2-Nov-15 erex2     erexb       moved from RM's mathbox to main set.mm; revised
 2-Nov-15 erex      [--same--]  moved from RM's mathbox to main set.mm; revised
 2-Nov-15 erreft2   ---         (in RM's mathbox) deleted; see erref,erdm
 2-Nov-15 erreft    ---         (in RM's mathbox) deleted; see erref,erdm,errn
 2-Nov-15 ersymb2   ---         (in RM's mathbox) deleted; see ersymb
 2-Nov-15 ertr2     ---         (in RM's mathbox) deleted; see ertr
 2-Nov-15 ersym2    ---         (in RM's mathbox) deleted; see ersym
 2-Nov-15 df-maxidl [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-pridl  [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-idl    [--same--]  (in JM's mathbox) revised
 2-Nov-15 rngoisoval [--same--] (in JM's mathbox) revised
 2-Nov-15 df-rngoiso [--same--] (in JM's mathbox) revised
 2-Nov-15 rngohomval [--same--] (in JM's mathbox) revised
 2-Nov-15 df-rngohom [--same--] (in JM's mathbox) revised
 2-Nov-15 reheibor  [--same--]  (in JM's mathbox) revised
 2-Nov-15 ismrer1   [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrnheibor [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrntotbnd [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrncms    [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrndstprj2 [--same--] (in JM's mathbox) revised
 2-Nov-15 rrndstprj1 [--same--] (in JM's mathbox) revised
 2-Nov-15 rrnmet    [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrndm     ---         (in JM's mathbox) deleted; see rrnmet
 2-Nov-15 rrnmval   [--same--]  (in JM's mathbox) revised
 2-Nov-15 rrnval    [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-rrn    [--same--]  (in JM's mathbox) revised
 2-Nov-15 recms     recmet      moved from JM's mathbox to main set.mm
 2-Nov-15 ismtyhmeo [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-ismty  [--same--]  (in JM's mathbox) revised
 2-Nov-15 isbnd3    isbnd2      (in JM's mathbox)
 2-Nov-15 isbnd2    ---         (in JM's mathbox) deleted; see isbnd
 2-Nov-15 isbnd     [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-bnd    [--same--]  (in JM's mathbox) revised
 2-Nov-15 totbndss  [--same--]  (in JM's mathbox) hypothesis eliminated
 2-Nov-15 istotbnd  [--same--]  (in JM's mathbox) revised
 2-Nov-15 df-totbnd [--same--]  (in JM's mathbox) revised
 2-Nov-15 hmeocld   [--same--]  moved from JM's mathbox to main set.mm; revised
 2-Nov-15 hmeoopn   [--same--]  moved from JM's mathbox to main set.mm; revised
 2-Nov-15 cncfres   [--same--]  (in JM's mathbox) revised
 2-Nov-15 sub2cncf  [--same--]  (in JM's mathbox) revised
 2-Nov-15 sub1cncf  [--same--]  (in JM's mathbox) revised
 2-Nov-15 idcncf    [--same--]  (in JM's mathbox) revised
 2-Nov-15 addccncf  [--same--]  (in JM's mathbox) revised
 2-Nov-15 constcncf [--same--]  (in JM's mathbox) revised
 2-Nov-15 metf1o    [--same--]  (in JM's mathbox) revised
 2-Nov-15 absrdbnd  [--same--]  moved from JM's mathbox to main set.mm
 2-Nov-15 rddif     [--same--]  moved from JM's mathbox to main set.mm
 2-Nov-15 upixp     [--same--]  (in JM's mathbox) revised
 2-Nov-15 fvopabf4g [--same--]  (in JM's mathbox) revised
 2-Nov-15 supfil    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 opnfbas   [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 metnrm    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 nrmsep2   [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 nrmsep    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 nrmtop    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 isnrm2    isnrm3      moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 isnrm     isnrm3      moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 regsep    regsep2     moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 regtop    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 isreg     isreg2      moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 t1t0      [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 t1sep     [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 t1sncld   [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 t1top     [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 ist1-3    [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 ist1-2    [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 t0dist    [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 t0top     [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 ist0-2    ist0-3      moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 ist0      [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 df-nrm    [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 df-reg    [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 df-t0ALT  df-t0       moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 fnejoin2  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 fnejoin1  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 fnemeet2  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 fnemeet1  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 topjoin   [--same--]  (in JGH's mathbox) revised
 2-Nov-15 topmeet   [--same--]  (in JGH's mathbox) revised
 2-Nov-15 topmtcl   [--same--]  (in JGH's mathbox) revised
 2-Nov-15 neibastop3 [--same--] (in JGH's mathbox) revised
 2-Nov-15 neibastop2 [--same--] (in JGH's mathbox) revised
 2-Nov-15 neibastop1 [--same--] (in JGH's mathbox) revised
 2-Nov-15 locfincf  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 locfindsc locfindis   (in JGH's mathbox) revised
 2-Nov-15 locfincomp locfincmp  (in JGH's mathbox) revised
 2-Nov-15 islocfin  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 refssfne  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 fnessref  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 topfneec  [--same--]  (in JGH's mathbox) revised
 2-Nov-15 topfne    [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 topbasfne isfne4b     (in JGH's mathbox) revised
 2-Nov-15 fneerdm   ---         (in JGH's mathbox) deleted; see fneer
 2-Nov-15 reftr     [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 fneer     [--same--]  (in JGH's mathbox) revised
 2-Nov-15 fnetr     [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 refssex   [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 refbas    [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 fneint    [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 fneuni    [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 fnessex   [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 fnebas    [--same--]  (in JGH's mathbox) hypothesis eliminated
 2-Nov-15 df-locfin [--same--]  (in JGH's mathbox) revised
 2-Nov-15 cnntr     [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 cncls     [--same--]  moved from JGH's mathbox to main set.mm;revised
 2-Nov-15 clscmp    clsdif      moved from JGH's mathbox to main set.mm
 2-Nov-15 ntrcmp    ntrdif      moved from JGH's mathbox to main set.mm
 2-Nov-15 ssdifin0  [--same--]  moved from JGH's mathbox to main set.mm
 2-Nov-15 plibgax4b [--same--]  (in FL's mathbox) revised
 2-Nov-15 plibgax4a [--same--]  (in FL's mathbox) revised
 2-Nov-15 plibgax3  [--same--]  (in FL's mathbox) revised
 2-Nov-15 plibgax2  [--same--]  (in FL's mathbox) revised
 2-Nov-15 plibgax1  [--same--]  (in FL's mathbox) revised
 2-Nov-15 isplibg   [--same--]  (in FL's mathbox) revised
 2-Nov-15 isplibg4b [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-plibg4b [--same--] (in FL's mathbox) revised
 2-Nov-15 isplibg4a [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-plibg4a [--same--] (in FL's mathbox) revised
 2-Nov-15 isplibg3  [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-plibg3 [--same--]  (in FL's mathbox) revised
 2-Nov-15 isplibg2  [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-plibg2 [--same--]  (in FL's mathbox) revised
 2-Nov-15 isplibg1  [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-plibg1 [--same--]  (in FL's mathbox) revised
 2-Nov-15 isseg1    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-seg    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-line   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-trcls  [--same--]  (in FL's mathbox) revised
 2-Nov-15 vtarsu    [--same--]  (in FL's mathbox) revised
 2-Nov-15 valtar    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-tar    [--same--]  (in FL's mathbox) revised
 2-Nov-15 issubcat  [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-subcat   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-isof   [--same--]  (in FL's mathbox) revised
 2-Nov-15 isfunb    [--same--]  (in FL's mathbox) hypothesis eliminated
 2-Nov-15 isfuna    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-funcOLD   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-cinv   [--same--]  (in FL's mathbox) revised
 2-Nov-15 isepib    [--same--]  (in FL's mathbox) hypothesis eliminated
 2-Nov-15 isepia    [--same--]  (in FL's mathbox) revised
 2-Nov-15 ismonb    [--same--]  (in FL's mathbox) hypothesis eliminated
 2-Nov-15 ismona    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-isoc   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-epiOLD    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-monOLD    [--same--]  (in FL's mathbox) revised
 2-Nov-15 ishomb    [--same--]  (in FL's mathbox) revised
 2-Nov-15 ishoma    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-homOLD    [--same--]  (in FL's mathbox) revised
 2-Nov-15 dualcat2  [--same--]  (in FL's mathbox) revised
 2-Nov-15 dualded   [--same--]  (in FL's mathbox) revised
 2-Nov-15 dualalg   [--same--]  (in FL's mathbox) revised
 2-Nov-15 mamb      xnegeq      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 mreal     rexneg      moved from FL's mathbox to main set.mm
 2-Nov-15 miminf    xnegmnf     moved from FL's mathbox to main set.mm
 2-Nov-15 mpinf     xnegpnf     moved from FL's mathbox to main set.mm
 2-Nov-15 df-adde   df-xadd     moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-nege   df-xneg     moved from FL's mathbox to main set.mm
 2-Nov-15 lteqttos  letsr       moved from FL's mathbox to main set.mm
 2-Nov-15 fldleqt   lefld       moved from FL's mathbox to main set.mm; revised
 2-Nov-15 ranleqt   lern        moved from FL's mathbox to main set.mm; revised
 2-Nov-15 domleqt   ledm        moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-topvs  df-tvc      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-toprngo df-trg     moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-opfn   [--same--]  (in FL's mathbox) revised
 2-Nov-15 topgrpsubcn tgpsubcn  moved from FL's mathbox to main set.mm
 2-Nov-15 istpsbas  tpsuni      moved from FL's mathbox to main set.mm
 2-Nov-15 istpstp   tpstop      moved from FL's mathbox to main set.mm
 2-Nov-15 topgrpinv tgpinv      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 topgrpcn  tgpcn       moved from FL's mathbox to main set.mm; revised
 2-Nov-15 topgrptop tgptps      moved from FL's mathbox to main set.mm
 2-Nov-15 topgrpgrp tgpgrp      moved from FL's mathbox to main set.mm
 2-Nov-15 istopgrp  istgp       moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-topgrp df-tgp      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 intopcon  indiscon    moved from FL's mathbox to main set.mm
 2-Nov-15 t2t1      haust1      moved from FL's mathbox to main set.mm
 2-Nov-15 df-unif   [--same--]  moved from FL's mathbox to main set.mm
 2-Nov-15 islimrs   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-flimfrs [--same--] (in FL's mathbox) revised
 2-Nov-15 iscnp3    iscnp4      (in FL's mathbox) revised
 2-Nov-15 homindlem3 hmphindis  moved from FL's mathbox to main set.mm; revised
 2-Nov-15 homindlem2 hmph0      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 top2usne  ---         (in FL's mathbox) deleted; see en2top
 2-Nov-15 top2ind   en2top      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 top1      en1top      moved from FL's mathbox to main set.mm
 2-Nov-15 eqindhome indishmph   moved from FL's mathbox to main set.mm; revised
 2-Nov-15 homcardus hmphen2     moved from FL's mathbox to main set.mm; revised
 2-Nov-15 homcard   hmphen      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 hmphsymv  ---         (in FL's mathbox) deleted; see hmphsymb
 2-Nov-15 hmpher    [--same--]  moved from FL's mathbox to main set.mm; revised
 2-Nov-15 rnhmpha   hmphtop2    moved from FL's mathbox to main set.mm; revised
 2-Nov-15 dmhmpha   hmphtop1    moved from FL's mathbox to main set.mm; revised
 2-Nov-15 hmphtr    [--same--]  moved from FL's mathbox to main set.mm; revised
 2-Nov-15 hmphre    hmphref     moved from FL's mathbox to main set.mm
 2-Nov-15 hmphsyma  hmphsym     moved from FL's mathbox to main set.mm; revised
 2-Nov-15 hmphsym   hmphsymb    moved from FL's mathbox to main set.mm; revised
 2-Nov-15 cnvhmph   hmeocnvb    moved from FL's mathbox to main set.mm; revised
 2-Nov-15 idhme     idhmeo      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 cmphmp    hmeoco      moved from FL's mathbox to main set.mm; revised
 2-Nov-15 df-mmat   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-smat   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-amat   [--same--]  (in FL's mathbox) revised
 2-Nov-15 svs3      [--same--]  (in FL's mathbox) revised
 2-Nov-15 svs2      [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-svs    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-gsmhom [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-subsmg [--same--]  (in FL's mathbox) revised
 2-Nov-15 fnopabco2b [--same--] (in FL's mathbox) revised
 2-Nov-15 expus     [--same--]  (in FL's mathbox) revised
 2-Nov-15 expm      [--same--]  (in FL's mathbox) revised
 2-Nov-15 expmiz    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-expsg  [--same--]  (in FL's mathbox) revised
 2-Nov-15 tostos    tsrss       moved from FL's mathbox to main set.mm
 2-Nov-15 rngsubpos psssdm2     moved from FL's mathbox to main set.mm
 2-Nov-15 pospos    psss        moved from FL's mathbox to main set.mm
 2-Nov-15 istoset2  istsr2      moved from FL's mathbox to main set.mm
 2-Nov-15 dutos2    ---         (in FL's mathbox) revised; see cnvtsr
 2-Nov-15 dutos1    cnvtsr      moved from FL's mathbox to main set.mm
 2-Nov-15 df-lb     [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-ub     [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-ler    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-ge     [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-mnl    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-mxl    [--same--]  (in FL's mathbox) revised
 2-Nov-15 dupos2    cnvpsb      moved from FL's mathbox to main set.mm
 2-Nov-15 dupos1    cnvps       moved from FL's mathbox to main set.mm
 2-Nov-15 valcurfn2 [--same--]  (in FL's mathbox) revised
 2-Nov-15 cur1vald  [--same--]  (in FL's mathbox) revised
 2-Nov-15 cur1val   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-cur2   [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-cur1   [--same--]  (in FL's mathbox) revised
 2-Nov-15 iscst3    [--same--]  (in FL's mathbox) hypothesis removed
 2-Nov-15 iscst2    [--same--]  (in FL's mathbox) revised
 2-Nov-15 iscst1    [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-cst    [--same--]  (in FL's mathbox) revised
 2-Nov-15 fopab2g   [--same--]  (in FL's mathbox) revised
 2-Nov-15 elovdm2   elmpt2cl2   moved from FL's mathbox to main set.mm; revised
 2-Nov-15 elovdm    elmpt2cl1   moved from FL's mathbox to main set.mm; revised
 2-Nov-15 ov4gc     [--same--]  (in FL's mathbox) revised
 2-Nov-15 ov2gc     [--same--]  (in FL's mathbox) revised
 2-Nov-15 en2eqpr   set2elt     moved from FL's mathbox to main set.mm
 2-Nov-15 df-rtrcl  [--same--]  (in FL's mathbox) revised
 2-Nov-15 df-trcl   [--same--]  (in FL's mathbox) revised
 2-Nov-15 tricptr   trinxp      moved from FL's mathbox to main set.mm
 2-Nov-15 inttr     trin2       moved from FL's mathbox to main set.mm
 2-Nov-15 sqpeq     xpider      moved from FL's mathbox to main set.mm
 2-Nov-15 cpref     xpidtr      moved from FL's mathbox to main set.mm
 2-Nov-15 fldsqcp2  unixpid     moved from FL's mathbox to main set.mm
 2-Nov-15 dfoprab4spop dfoprab4pop (in FL's mathbox) revised
 2-Nov-15 frsucmptn [--same--]  moved from SF's mathbox to main set.mm; revised
 2-Nov-15 frsucopabn ---        (in SF's mathbox) deleted; see frsucmptn
 2-Nov-15 fvmptgf   fvmptf      moved from SF's mathbox to main set.mm
 2-Nov-15 pjf       pjhf
 2-Nov-15 pjfo      pjhfo
 2-Nov-15 pjpjthi   pjpjhthi
 2-Nov-15 pjpjth    pjpjhth
 2-Nov-15 pjtheu2   pjhtheu2
 2-Nov-15 pjfval    pjhfval
 2-Nov-15 df-pj     df-pjh
 2-Nov-15 pjtheu    pjhtheu
 2-Nov-15 pjth      pjhth
 2-Nov-15 pjthmo    pjhthmo
 2-Nov-15 hhssmetba ---         deleted; see hhssmet
 2-Nov-15 hilmetba  ---         deleted; see hilmet
 2-Nov-15 hhmetba   ---         deleted; see hhmet
 2-Nov-15 h2hmetba  ---         deleted; see hhmet
 2-Nov-15 cpj       cpjh
 2-Nov-15 ---       ---         math token "proj" changed to "projh"
 2-Nov-15 cnhl      cnchl
 2-Nov-15 hlcms     hlcmet
 2-Nov-15 hlbn      hlobn
 2-Nov-15 ishl      ishlo
 2-Nov-15 df-hl     df-hlo
 2-Nov-15 chl       chlo
 2-Nov-15 ---       ---         math token "CHil" changed to "CHilOLD"
 2-Nov-15 minvec    minveco
 2-Nov-15 bncms     cbncms
 2-Nov-15 isbn      iscbn
 2-Nov-15 df-bn     df-cbn
 2-Nov-15 cbn       ccbn
 2-Nov-15 ajval     [--same--]  hypothesis removed
 2-Nov-15 ipsubdi   dipsubdi
 2-Nov-15 ipsubdir  dipsubdir
 2-Nov-15 ipassr2   dipassr2
 2-Nov-15 ipassr    dipassr
 2-Nov-15 ipass     dipass
 2-Nov-15 ipdi      dipdi
 2-Nov-15 ipdir     dipdir
 2-Nov-15 cnph      cncph
 2-Nov-15 cphl      ccphlo
 2-Nov-15 ---       ---         math token "CPreHil" changed to "CPreHilOLD"
 2-Nov-15 nmo0      nmoo0
 2-Nov-15 nmolb     nmoolb
 2-Nov-15 nmoge0    nmooge0
 2-Nov-15 nmoval    nmooval
 2-Nov-15 nmofval   nmoofval
 2-Nov-15 df-nmo    df-nmoo
 2-Nov-15 cnmo      cnmoo
 2-Nov-15 ---       ---         math token "normOp" changed to "normOpOLD"
 2-Nov-15 ipcn      dipcn
 2-Nov-15 ip0l      dip0l
 2-Nov-15 ip0r      dip0r
 2-Nov-15 iporthcom diporthcom
 2-Nov-15 ipcj      dipcj
 2-Nov-15 ipcl      dipcl
 2-Nov-15 ipfval    dipfval
 2-Nov-15 df-ip     df-dip
 2-Nov-15 cip       cdip
 2-Nov-15 nmcn      nmcvcn
 2-Nov-15 imsbai    ---         deleted; see imsmet
 2-Nov-15 imsba     ---         deleted; see imsmet
 2-Nov-15 nmfval    nmcvfval
 2-Nov-15 df-nm     df-nmcv
 2-Nov-15 cnm       cnmcv
 2-Nov-15 ---       ---         math token "norm" changed to "normCV"
 2-Nov-15 ---       ---         math token "CVec" changed to "CVecOLD"
 2-Nov-15 df-giso   [--same--]  (in PC's mathbox) revised
 2-Nov-15 df-ghom   [--same--]  (in PC's mathbox) revised
 2-Nov-15 mdegpropd [--same--]  hypothesis removed
 2-Nov-15 deg1fval  [--same--]  hypothesis removed
 2-Nov-15 mdegcl    [--same--]  hypothesis removed
 2-Nov-15 mdegxrf   [--same--]  hypothesis removed
 2-Nov-15 mdegxrcl  [--same--]  hypothesis removed
 2-Nov-15 mdeglt    [--same--]  hypothesis removed
 2-Nov-15 mdegleb   [--same--]  hypothesis removed
 2-Nov-15 mdegval   [--same--]  hypothesis removed
 2-Nov-15 mdegfval  [--same--]  hypothesis removed
 2-Nov-15 cncms     cncmet
 2-Nov-15 cmsss     cmetss
 2-Nov-15 iscms3i   iscmet3i
 2-Nov-15 iscms3    iscmet3
 2-Nov-15 cmsmeti   cmetmeti
 2-Nov-15 cmsmet    cmetmet
 2-Nov-15 cmscvg2   ---         deleted; see cmetcau
 2-Nov-15 iscms2    ---         deleted; see iscmet2
 2-Nov-15 cmscvg    cmetcau
 2-Nov-15 iscms     iscmet2
 2-Nov-15 df-cmet   [--same--]  revised
 2-Nov-15 om1opn    [--same--]  revised
 2-Nov-15 om1plusg  [--same--]  revised
 2-Nov-15 topgrpfun topgrpstr   revised
 2-Nov-15 om1val    [--same--]  hypothesis removed
 2-Nov-15 pcophtb   [--same--]  hypothesis removed
 2-Nov-15 pcorev2   [--same--]  hypothesis removed
 2-Nov-15 pcorev    [--same--]  hypothesis removed
 2-Nov-15 pcorevcl  [--same--]  hypothesis removed
 2-Nov-15 pcoass    [--same--]  hypothesis removed
 2-Nov-15 pcopt2    [--same--]  hypothesis removed
 2-Nov-15 pcopt     [--same--]  hypothesis removed
 2-Nov-15 pcoptcl   [--same--]  revised
 2-Nov-15 pcohtpy   [--same--]  hypothesis removed
 2-Nov-15 copco     [--same--]  hypothesis removed
 2-Nov-15 pcocn     [--same--]  hypothesis removed
 2-Nov-15 pcoval2   [--same--]  hypothesis removed
 2-Nov-15 pco1      [--same--]  hypothesis removed
 2-Nov-15 pco0      [--same--]  hypothesis removed
 2-Nov-15 pcoval1   [--same--]  hypothesis removed
 2-Nov-15 pcovalg   [--same--]  hypothesis removed
 2-Nov-15 pcoval    [--same--]  hypothesis removed
 2-Nov-15 pcofval   [--same--]  hypothesis removed
 2-Nov-15 phtpcco2  [--same--]  hypothesis removed
 2-Nov-15 reparpht  [--same--]  hypothesis removed
 2-Nov-15 reparphti [--same--]  hypothesis removed
 2-Nov-15 phtpc01   [--same--]  hypothesis removed
 2-Nov-15 phtpcer   [--same--]  hypothesis removed
 2-Nov-15 isphtpc   [--same--]  hypothesis removed
 2-Nov-15 phtpycc   [--same--]  hypothesis removed
 2-Nov-15 phtpyco2  [--same--]  hypothesis removed
 2-Nov-15 phtpyid   [--same--]  hypothesis removed
 2-Nov-15 phtpy01   [--same--]  hypothesis removed
 2-Nov-15 phtpyi    [--same--]  hypothesis removed
 2-Nov-15 phtpycn   [--same--]  hypothesis removed
 2-Nov-15 phtpyhtpy [--same--]  hypothesis removed
 2-Nov-15 isphtpy   [--same--]  hypothesis removed
 2-Nov-15 htpycc    [--same--]  revised
 2-Nov-15 htpyco2   [--same--]  hypothesis removed
 2-Nov-15 htpyco1   [--same--]  revised
 2-Nov-15 htpyid    [--same--]  revised
 2-Nov-15 htpycom   [--same--]  revised
 2-Nov-15 ishtpyd   [--same--]  revised
 2-Nov-15 htpyi     [--same--]  revised
 2-Nov-15 htpycn    [--same--]  revised
 2-Nov-15 ishtpy    [--same--]  revised
 2-Nov-15 cnmpt2pc  [--same--]  revised
 2-Nov-15 metdscn   [--same--]  revised
 2-Nov-15 metdseq0  [--same--]  revised
 2-Nov-15 metds0    [--same--]  revised
 2-Nov-15 metdsf    [--same--]  revised
 2-Nov-15 metdsval  [--same--]  revised
 2-Nov-15 blcvx     [--same--]  revised
 2-Nov-15 ioo2blex  [--same--]  hypothesis removed
 2-Nov-15 ioo2bl    [--same--]  hypothesis removed
 2-Nov-15 bl2ioo    [--same--]  revised
 2-Nov-15 remetba   ---         deleted; see remet
 2-Nov-15 txcc      ---         deleted; see cnfldtps, xpstopn
 2-Nov-15 cn2met    ---         deleted; see cnfldms, xpsms
 2-Nov-15 cnmetba   ---         deleted; see cnmet
 2-Nov-15 txmet     ---         deleted; see xpstopn, xpsms, xpsdsval
 2-Nov-15 metidcn   ---         deleted; see idcn, cnrest, metrest
 2-Nov-15 metcnss2  ---         deleted; see cnrest, metrest
 2-Nov-15 metcnss   ---         deleted; see cnrest2r, metrest
 2-Nov-15 metcnco   ---         deleted; see cnco
 2-Nov-15 metcni2   ---         deleted; see metcnpi3
 2-Nov-15 metcni    ---         deleted; see metcnpi
 2-Nov-15 metcnpi4  ---         deleted; see metcnpi3
 2-Nov-15 metcnconst ---        deleted; see cnconst
 2-Nov-15 metcnf    ---         deleted; see cnf
 2-Nov-15 metcnpf   ---         deleted; see cnpf
 2-Nov-15 methausi  ---         deleted; see methaus
 2-Nov-15 opn0      mopn0
 2-Nov-15 opnin     mopnin
 2-Nov-15 opnuni    unimopn
 2-Nov-15 opni3     mopni3
 2-Nov-15 opni2     mopni2
 2-Nov-15 opni      mopni
 2-Nov-15 msdmdm    ---         deleted; see msmet
 2-Nov-15 ismsg     isms2       revised
 2-Nov-15 opnss     mopnss
 2-Nov-15 isopn4    elmopn2
 2-Nov-15 opnm      mopnm
 2-Nov-15 opnfss    mopnfss
 2-Nov-15 isopn     elmopn
 2-Nov-15 uniopn2   mopnuni
 2-Nov-15 opntop    mopntop
 2-Nov-15 opnval    mopnval
 2-Nov-15 metxp     ---         deleted; see xpsmet
 2-Nov-15 metss     ---         deleted; see dmss
 2-Nov-15 metssba2  ---         deleted; see metres2
 2-Nov-15 metssba   ---         deleted; see metres
 2-Nov-15 ismet     [--same--]  revised
 2-Nov-15 df-met    [--same--]  changed "D e. Met" to "D e. (Met`X)",
                                affecting all df-met theorems
 2-Nov-15 df-tsms   [--same--]  revised
 2-Nov-15 cnflf2    [--same--]  revised
 2-Nov-15 cnflf     [--same--]  revised
 2-Nov-15 cnpflf    [--same--]  revised
 2-Nov-15 cnpflf2   [--same--]  revised
 2-Nov-15 cnpflfi   [--same--]  revised
 2-Nov-15 flfelbas  [--same--]  revised
 2-Nov-15 isflf     [--same--]  revised
 2-Nov-15 flfnei    [--same--]  revised
 2-Nov-15 flfval    [--same--]  revised
 2-Nov-15 flffval   [--same--]  revised
 2-Nov-15 flimcls   [--same--]  revised
 2-Nov-15 flimcf    [--same--]  revised
 2-Nov-15 fbflim2   [--same--]  revised
 2-Nov-15 fbflim    [--same--]  revised
 2-Nov-15 flimopn   [--same--]  revised
 2-Nov-15 neiflim   [--same--]  revised
 2-Nov-15 flimss2   [--same--]  revised
 2-Nov-15 elflim    [--same--]  revised
 2-Nov-15 trnei     [--same--]  revised
 2-Nov-15 trfil3    [--same--]  revised
 2-Nov-15 trfil2    [--same--]  revised
 2-Nov-15 trfil1    [--same--]  revised
 2-Nov-15 neifil    [--same--]  revised
 2-Nov-15 qtophmeo  [--same--]  revised
 2-Nov-15 xkohmeo   [--same--]  revised
 2-Nov-15 xkocnv    [--same--]  revised
 2-Nov-15 pt1hmeo   [--same--]  revised
 2-Nov-15 txswaphmeo [--same--] revised
 2-Nov-15 contoppr  conhmph     revised
 2-Nov-15 cmptoppr  cmphmph     revised
 2-Nov-15 hmph      [--same--]  hypothesis removed
 2-Nov-15 hmeores   [--same--]  hypothesis removed
 2-Nov-15 hmeocnv   [--same--]  hypothesis removed
 2-Nov-15 hmeobc    ishmeo      hypothesis removed
 2-Nov-15 hmeoima   [--same--]  revised
 2-Nov-15 hmeocnb   ---         deleted; see hmeoima
 2-Nov-15 hmeocna   ---         deleted; see hmeocn, cnima
 2-Nov-15 hmeof1o   [--same--]  hypothesis removed
 2-Nov-15 ishmeo    [--same--]  revised
 2-Nov-15 hmeofval  [--same--]  revised
 2-Nov-15 df-hmph   [--same--]  revised
 2-Nov-15 df-hmeo   [--same--]  revised
 2-Nov-15 qtopcmap  [--same--]  revised
 2-Nov-15 qtopomap  [--same--]  revised
 2-Nov-15 qtoprest  [--same--]  revised
 2-Nov-15 qtopeu    [--same--]  revised
 2-Nov-15 qtopss    [--same--]  revised
 2-Nov-15 qtopcn    [--same--]  revised
 2-Nov-15 qtopcld   [--same--]  revised
 2-Nov-15 qtopid    [--same--]  revised
 2-Nov-15 ---       ---         cnmptid ~ cnmpt2k revised
 2-Nov-15 xkoco2cn  [--same--]  hypothesis removed
 2-Nov-15 xkoco1cn  [--same--]  hypothesis removed
 2-Nov-15 lmcn2     [--same--]  revised
 2-Nov-15 txlm      [--same--]  revised
 2-Nov-15 hauseqlcld [--same--] hypothesis removed
 2-Nov-15 txrest    [--same--]  revised
 2-Nov-15 ptcn      [--same--]  revised
 2-Nov-15 txcnmpt   [--same--]  hypothesis removed
 2-Nov-15 txcn      [--same--]  hypothesis removed
 2-Nov-15 uptx      [--same--]  revised
 2-Nov-15 ptcnp     [--same--]  revised
 2-Nov-15 txcnp     [--same--]  revised
 2-Nov-15 xkoccn    [--same--]  revised
 2-Nov-15 tx2cn     [--same--]  revised
 2-Nov-15 tx1cn     [--same--]  revised
 2-Nov-15 txbasval  [--same--]  revised
 2-Nov-15 txcld     [--same--]  hypothesis removed
 2-Nov-15 txopn     [--same--]  hypothesis removed
 2-Nov-15 eltpt2    eltx        revised
 2-Nov-15 eltpt     ---         deleted; see eltg3
 2-Nov-15 txbas2    txbas       revised
 2-Nov-15 txval     [--same--]  revised
 2-Nov-15 df-tx     [--same--]  revised
 2-Nov-15 kgen2cn   [--same--]  hypothesis removed
 2-Nov-15 kgencn2   [--same--]  revised
 2-Nov-15 kgencn    [--same--]  revised
 2-Nov-15 kgen2ss   [--same--]  revised
 2-Nov-15 elkgen    [--same--]  revised
 2-Nov-15 kgenval   [--same--]  revised
 2-Nov-15 2ndcomap  [--same--]  hypothesis removed
 2-Nov-15 concompcld [--same--] revised
 2-Nov-15 concompid [--same--]  revised
 2-Nov-15 clscon    [--same--]  revised
 2-Nov-15 uncon     [--same--]  revised
 2-Nov-15 iuncon    [--same--]  revised
 2-Nov-15 concn     [--same--]  hypothesis removed
 2-Nov-15 conima    [--same--]  hypothesis removed
 2-Nov-15 consubclo [--same--]  hypothesis removed
 2-Nov-15 nconsubb  [--same--]  revised
 2-Nov-15 cnconn    [--same--]  hypothesis removed
 2-Nov-15 connsub   [--same--]  revised
 2-Nov-15 consuba   [--same--]  revised
 2-Nov-15 dfcon2    [--same--]  revised
 2-Nov-15 alexsub   alexsubALT
 2-Nov-15 cmpfii    [--same--]  revised
 2-Nov-15 sscmp     [--same--]  revised
 2-Nov-15 imacmp    [--same--]  hypothesis removed
 2-Nov-15 rncmp     [--same--]  hypothesis removed
 2-Nov-15 cncmp     [--same--]  hypothesis removed
 2-Nov-15 sshaus    [--same--]  revised
 2-Nov-15 dnsconst  [--same--]  revised
 2-Nov-15 ishausi   ---         deleted; see ishaus
 2-Nov-15 hausnei2  [--same--]  revised
 2-Nov-15 lmcn      [--same--]  hypothesis removed
 2-Nov-15 lmcnp     [--same--]  hypothesis removed
 2-Nov-15 lmff      [--same--]  revised
 2-Nov-15 lmres     [--same--]  revised
 2-Nov-15 lmcl      [--same--]  revised
 2-Nov-15 lmfss     [--same--]  revised
 2-Nov-15 lmfpm     [--same--]  revised
 2-Nov-15 paste     [--same--]  revised
 2-Nov-15 cnindis   [--same--]  revised
 2-Nov-15 cndis     [--same--]  revised
 2-Nov-15 cnprest2  [--same--]  hypothesis removed
 2-Nov-15 cnprest   [--same--]  hypothesis removed
 2-Nov-15 cnpresti  [--same--]  hypothesis removed
 2-Nov-15 cnrest2r  [--same--]  hypothesis removed
 2-Nov-15 cnrest2   [--same--]  hypothesis removed
 2-Nov-15 cnrest    [--same--]  revised
 2-Nov-15 cnconst   [--same--]  revised
 2-Nov-15 cnconst2  [--same--]  revised
 2-Nov-15 cncnp2    [--same--]  revised
 2-Nov-15 cncnp     [--same--]  revised
 2-Nov-15 cncnpi    [--same--]  hypothesis removed
 2-Nov-15 cnsscnp   [--same--]  hypothesis removed
 2-Nov-15 cnss2     [--same--]  revised
 2-Nov-15 cnss1     [--same--]  revised
 2-Nov-15 cnclima   [--same--]  hypothesis removed
 2-Nov-15 iscncl    [--same--]  revised
 2-Nov-15 cnpco     [--same--]  hypothesis removed
 2-Nov-15 cnco      [--same--]  hypothesis removed
 2-Nov-15 cnima     [--same--]  hypothesis removed
 2-Nov-15 ---       ---         lmbr ~ lmcvg revised
 2-Nov-15 idcn      [--same--]  revised
 2-Nov-15 cnpimaex  [--same--]  hypothesis removed
 2-Nov-15 ssidcn    [--same--]  revised
 2-Nov-15 subbascn  [--same--]  revised
 2-Nov-15 tgcn      [--same--]  revised
 2-Nov-15 tgcnp     [--same--]  revised
 2-Nov-15 cnpcl     [--same--]  hypothesis removed
 2-Nov-15 cnpf      [--same--]  hypothesis removed
 2-Nov-15 cnf       [--same--]  hypothesis removed
 2-Nov-15 iscnp2    [--same--]  revised
 2-Nov-15 iscnp     [--same--]  revised
 2-Nov-15 cnpval    [--same--]  revised
 2-Nov-15 iscn      [--same--]  revised
 2-Nov-15 cnpfval   [--same--]  revised
 2-Nov-15 cnfval    [--same--]  revised
 2-Nov-15 lmfval    [--same--]  revised
 2-Nov-15 restsubbas ---        deleted; see firest, tgrest
 2-Nov-15 tgrest    [--same--]  revised
 2-Nov-15 restcldr  [--same--]  revised
 2-Nov-15 restcldi  [--same--]  revised
 2-Nov-15 restsn2   [--same--]  revised
 2-Nov-15 opncldf3  [--same--]  hypothesis removed
 2-Nov-15 opncldf1  [--same--]  revised
 2-Nov-15 elcls3    [--same--]  revised
 2-Nov-15 clsss2    [--same--]  hypothesis removed
 2-Nov-15 incld     [--same--]  hypothesis removed
 2-Nov-15 cldcls    [--same--]  hypothesis removed
 2-Nov-15 uncld     [--same--]  hypothesis removed
 2-Nov-15 intcld    [--same--]  hypothesis removed
 2-Nov-15 iincld    [--same--]  hypothesis removed
 2-Nov-15 difopn    [--same--]  hypothesis removed
 2-Nov-15 cldopn    [--same--]  hypothesis removed
 2-Nov-15 cldss2    [--same--]  hypothesis removed
 2-Nov-15 cldss     [--same--]  hypothesis removed
 2-Nov-15 cctop     [--same--]  revised
 2-Nov-15 fctop2    [--same--]  revised
 2-Nov-15 fctop     [--same--]  revised
 2-Nov-15 subtop    resttop     revised
 2-Nov-15 subtopbas restbas     revised
 2-Nov-15 bastop2   [--same--]  revised; see also tgclb
 2-Nov-15 bastop1   [--same--]  revised; see also tgclb
 2-Nov-15 2basgen   [--same--]  hypothesis removed
 2-Nov-15 basgen2   [--same--]  revised; see also tgclb
 2-Nov-15 tgss3     [--same--]  revised; see also eltg, dfss3
 2-Nov-15 tgss2     [--same--]  hypothesis removed
 2-Nov-15 tgidm     [--same--]  hypothesis removed
 2-Nov-15 tpsstr    ---         deleted; see tpspropd
 2-Nov-15 tpsprop   tpspropd    revised
 2-Nov-15 eltopsp   ---         deleted; see toptopon, eltpsg
 2-Nov-15 eltopspg  ---         deleted; see toptopon, eltpsg
 2-Nov-15 eltpsg    [--same--]  revised
 2-Nov-15 eltps     ---         deleted; see eltpsg
 2-Nov-15 top2tps   ---         deleted; see tpstop
 2-Nov-15 istps5    ---         deleted; see istps
 2-Nov-15 istps4    ---         deleted; see istps
 2-Nov-15 istps3    ---         deleted; see istps
 2-Nov-15 istps2    ---         deleted; see istps
 2-Nov-15 istps     [--same--]  revised
 2-Nov-15 topsn     [--same--]  revised
 2-Nov-15 topgele   [--same--]  revised
 2-Nov-15 df-topsp  [--same--]  revised
 2-Nov-15 znz2rfo   znzrhfo
 2-Nov-15 znz2rval  znzrhval
 2-Nov-15 znz2r2    znzrh2
 2-Nov-15 znz2r     znzrh
 2-Nov-15 z2rpropd  zrhpropd
 2-Nov-15 z2rrhm    zrhrhm
 2-Nov-15 z2rrhmb   zrhrhmb
 2-Nov-15 z2rmulg   zrhmulg
 2-Nov-15 z2rval2   zrhval2
 2-Nov-15 z2rval    zrhval
 2-Nov-15 df-z2r    df-zrh
 2-Nov-15 cz2r      czrh
 2-Nov-15 ---       ---         math token "Z2Ring" changed to "ZRHom"
 2-Nov-15 df-cnfld  [--same--]  revised
 2-Nov-15 ply1ascl  [--same--]  hypothesis removed
 2-Nov-15 ply1mpl1  [--same--]  hypothesis removed
 2-Nov-15 ply1mpl0  [--same--]  hypothesis removed
 2-Nov-15 mplbaspropd [--same--] hypothesis removed
 2-Nov-15 psrplusgpropd [--same--] hypothesis removed
 2-Nov-15 psrbaspropd [--same--] hypothesis removed
 2-Nov-15 ply1mulr  [--same--]  hypothesis removed
 2-Nov-15 ply1vsca  [--same--]  hypothesis removed
 2-Nov-15 ply1plusg [--same--]  hypothesis removed
 2-Nov-15 psr1mulr  [--same--]  hypothesis removed
 2-Nov-15 psr1vsca  [--same--]  hypothesis removed
 2-Nov-15 psr1plusg [--same--]  hypothesis removed
 2-Nov-15 mplmulr   [--same--]  hypothesis removed
 2-Nov-15 mplvscafval [--same--] hypothesis removed
 2-Nov-15 mplplusg  [--same--]  hypothesis removed
 2-Nov-15 opsr1     [--same--]  hypothesis removed
 2-Nov-15 opsr0     [--same--]  hypothesis removed
 2-Nov-15 ply1bas   [--same--]  hypothesis removed
 2-Nov-15 ply1val   [--same--]  hypothesis removed
 2-Nov-15 psr1bas   [--same--]  hypothesis removed
 2-Nov-15 psr1bas2  [--same--]  hypothesis removed
 2-Nov-15 psr1val   [--same--]  hypothesis removed
 2-Nov-15 opsrvsca  [--same--]  hypothesis removed
 2-Nov-15 opsrmulr  [--same--]  hypothesis removed
 2-Nov-15 opsrplusg [--same--]  hypothesis removed
 2-Nov-15 opsrbas   [--same--]  hypothesis removed
 2-Nov-15 opsrle    [--same--]  hypothesis removed
 2-Nov-15 mplvscaval [--same--] hypothesis removed
 2-Nov-15 mplvsca   [--same--]  hypothesis removed
 2-Nov-15 mplvsca2  [--same--]  hypothesis removed
 2-Nov-15 mplmul    [--same--]  hypothesis removed
 2-Nov-15 mpladd    [--same--]  hypothesis removed
 2-Nov-15 mplelf    [--same--]  hypothesis removed
 2-Nov-15 mplbasss  [--same--]  hypothesis removed
 2-Nov-15 mplval2   [--same--]  hypothesis removed
 2-Nov-15 mplelbas  [--same--]  hypothesis removed
 2-Nov-15 mplbas    [--same--]  revised
 2-Nov-15 mplval    [--same--]  hypothesis removed
 2-Nov-15 resspsrbas [--same--] hypothesis removed
 2-Nov-15 psrvscacl [--same--]  hypothesis removed
 2-Nov-15 psrvscaval [--same--] hypothesis removed
 2-Nov-15 psrvsca   [--same--]  hypothesis removed
 2-Nov-15 psrvscafval [--same--] hypothesis removed
 2-Nov-15 psrmulcl  [--same--]  hypothesis removed
 2-Nov-15 psrmulval [--same--]  hypothesis removed
 2-Nov-15 psrmulfval [--same--] hypothesis removed
 2-Nov-15 psrmulr   [--same--]  hypothesis removed
 2-Nov-15 psraddcl  [--same--]  hypothesis removed
 2-Nov-15 psradd    [--same--]  hypothesis removed
 2-Nov-15 psrplusg  [--same--]  hypothesis removed
 2-Nov-15 psrelbas  [--same--]  hypothesis removed
 2-Nov-15 psrbas    [--same--]  hypothesis removed
 2-Nov-15 psrvalfun psrvalstr   revised
 2-Nov-15 psrval    [--same--]  revised
 2-Nov-15 rlm0      [--same--]  hypothesis removed
 2-Nov-15 sralmod0  [--same--]  hypothesis removed
 2-Nov-15 sraval    [--same--]  revised
 2-Nov-15 df-sra    [--same--]  revised
 2-Nov-15 islvec2   islvec
 2-Nov-15 islmhm3   ---         deleted; see islmhm
 2-Nov-15 df-lmic   [--same--]  revised
 2-Nov-15 prdmlmodd prdslmodd
 2-Nov-15 prdmvscacl prdsvscacl
 2-Nov-15 lmodvsubid lmodsubid
 2-Nov-15 lmodvsubeq0 lmodsubeq0
 2-Nov-15 lmodvsubdi2 lmodsubdir
 2-Nov-15 lmodvsubdi1 lmodsubdi
 2-Nov-15 lmodvsass [--same--]  revised
 2-Nov-15 lmodvsdi2 lmodvsdir   revised
 2-Nov-15 lmodvsdi1 lmodvsdi    revised
 2-Nov-15 invrpropd [--same--]  hypothesis removed
 2-Nov-15 rngidpropd [--same--] hypothesis removed
 2-Nov-15 rngdvcan3 dvrcan3
 2-Nov-15 rngdvcan1 dvrcan1
 2-Nov-15 rngdvass  dvrass
 2-Nov-15 rngdv1    dvr1
 2-Nov-15 rngdvid   dvrid
 2-Nov-15 rngdvcl   dvrcl
 2-Nov-15 rngdvval  dvrval
 2-Nov-15 rngdvfval dvrfval
 2-Nov-15 df-rngdv  df-dvr
 2-Nov-15 opprmul   [--same--]  hypothesis removed
 2-Nov-15 opprmulfval [--same--] revised
 2-Nov-15 opprval   [--same--]  revised
 2-Nov-15 df-oppr   [--same--]  revised
 2-Nov-15 prdm1     prds1
 2-Nov-15 prdmcrngd prdscrngd
 2-Nov-15 prdmrngd  prdsrngd
 2-Nov-15 prdmmulrcl prdsmulrcl
 2-Nov-15 prdmmgp2  prdsmgp     revised
 2-Nov-15 prdmmgp1  prdsmgp     revised
 2-Nov-15 dfur2     [--same--]  hypothesis removed
 2-Nov-15 rngidval  [--same--]  hypothesis removed
 2-Nov-15 mgpval    [--same--]  hypothesis removed
 2-Nov-15 prdmgsum  prdsgsum
 2-Nov-15 prdmabld  prdsabld
 2-Nov-15 prdmcmnd  prdscmnd
 2-Nov-15 dfod2     [--same--]  revised
 2-Nov-15 odf1      [--same--]  revised
 2-Nov-15 oddvds    [--same--]  hypothesis removed
 2-Nov-15 odid      [--same--]  revised
 2-Nov-15 odxrcl    ---         deleted; see odcl
 2-Nov-15 odcl      [--same--]  revised
 2-Nov-15 odval     [--same--]  revised
 2-Nov-15 odfval    [--same--]  revised
 2-Nov-15 df-od     [--same--]  revised
 2-Nov-15 symgval   [--same--]  revised
 2-Nov-15 df-symg   [--same--]  revised
 2-Nov-15 df-gic    [--same--]  revised
 2-Nov-15 divsgrp   [--same--]  revised
 2-Nov-15 prdminvgd prdsinvgd
 2-Nov-15 prdmgrpd  prdsgrpd
 2-Nov-15 mulgfval  [--same--]  hypothesis removed
 2-Nov-15 grpinvval [--same--]  hypothesis removed
 2-Nov-15 grpinvfval [--same--] hypothesis removed
 2-Nov-15 grpstr    grppropstr
 2-Nov-15 prdmpjmhm prdspjmhm
 2-Nov-15 prdm0g    prds0g
 2-Nov-15 prdmmndd  prdspmndd
 2-Nov-15 prdmplusgcl prdsplusgcl
 2-Nov-15 grpidpropd [--same--] hypothesis removed
 2-Nov-15 grpidval  [--same--]  revised
 2-Nov-15 df-0g     [--same--]  revised
 2-Nov-15 istoset3  istsr2      revised
 2-Nov-15 istoset   istsr       revised
 2-Nov-15 posreltr  pstr2
 2-Nov-15 posanref  psref2
 2-Nov-15 df-la     df-lar      revised
 2-Nov-15 df-nfw    [--same--]  revised
 2-Nov-15 df-ts     df-tsr      revised
 2-Nov-15 ipoval    [--same--]  revised
 2-Nov-15 df-ipo    [--same--]  revised
 2-Nov-15 erlecpbl  [--same--]  revised
 2-Nov-15 ercpbl    [--same--]  revised
 2-Nov-15 imasvscaf [--same--]  revised
 2-Nov-15 imasopn   imastset    revised
 2-Nov-15 imasvsca  [--same--]  revised
 2-Nov-15 imassca   [--same--]  revised
 2-Nov-15 imasdist  imasds      revised
 2-Nov-15 imasval   [--same--]  revised
 2-Nov-15 prdmbasmpt2 prdsbasmpt2
 2-Nov-15 prdmvscafval prdsvscafval
 2-Nov-15 prdmvscaval prdsvscaval
 2-Nov-15 prdmmulrfval prdsmulrfval
 2-Nov-15 prdmmulrval prdsmulrval
 2-Nov-15 prdmplusgfval prdsplusgfval
 2-Nov-15 prdmplusgval prdsplusgval
 2-Nov-15 prdmvsca  prdsvsca
 2-Nov-15 prdmbasprj prdsbasprj
 2-Nov-15 prdmbasfn prdsbasfn
 2-Nov-15 prdmbasmpt prdsbasmpt
 2-Nov-15 prdmbas2  prdsbas2
 2-Nov-15 prdmvsca  prdsvsca
 2-Nov-15 prdmmulr  prdsmulr
 2-Nov-15 prdmplusg prdsplusg
 2-Nov-15 prdmsca   prdssca
 2-Nov-15 prdmbas   prdsbas
 2-Nov-15 prdmval   prdsval
 2-Nov-15 prdmvalfun prdsvalstr
 2-Nov-15 reldmprdm reldmprds
 2-Nov-15 prdmbasex prdsbasex
 2-Nov-15 df-prdm   df-prds
 2-Nov-15 ---       ---         math token "Xm_" changed to "Xs_"
 2-Nov-15 cprdm     cprds
 2-Nov-15 posle     ---         deleted; see 2strop
 2-Nov-15 posbase   ---         deleted; see 2strbas
 2-Nov-15 posfn     ---         deleted; see 2strstr
 2-Nov-15 tpstopset ---         deleted; see 2strop
 2-Nov-15 tpsbase   ---         deleted; see 2strbas
 2-Nov-15 tpsfn     ---         deleted; see 2strstr
 2-Nov-15 algfn     algstr      revised
 2-Nov-15 lmodfn    lmodstr     revised
 2-Nov-15 rngfn     rngstr      revised
 2-Nov-15 rnglem    ---         deleted; see rngstr
 2-Nov-15 grpfn     grpstr      revised
 2-Nov-15 grplem    ---         deleted; see grpstr
 2-Nov-15 ---       ---         math token "ip" changed to ".i"
 2-Nov-15 ---       ---         math token ".i" changed to ".iOLD"
 2-Nov-15 ---       ---         math token "vsca" changed to ".s"
 2-Nov-15 ---       ---         math token ".s" changed to ".sOLD"
 2-Nov-15 ---       ---         df-base ~ basendx, resslem, df-plusg ~ df-ds
                                revised
 2-Nov-15 leisorel  [--same--]  revised
 2-Nov-15 nnesqi    nnesq       revised
 2-Nov-15 nnlesqi   nnlesq      revised
 2-Nov-15 nnsqcli   nnsqcl      revised
 2-Nov-15 icoshftf1oii ---      deleted; see icoshftf1o
 2-Nov-15 ubicc2    [--same--]  revised
 2-Nov-15 lbicc2    [--same--]  revised
 2-Nov-15 ltneii    gtneii      revised
 2-Nov-15 ltne      [--same--]  revised
 2-Nov-15 iundom    [--same--]  revised
 2-Nov-15 unidomg   unidom      revised
 2-Nov-15 unidom    [--same--]  revised
 2-Nov-15 trcl      [--same--]  revised
 2-Nov-15 fipwuni   [--same--]  hypothesis removed
 2-Nov-15 fi0       fieq0
 2-Nov-15 unifi     [--same--]  revised
 2-Nov-15 dmen      ---         deleted; see ener
 2-Nov-15 f1oen2g   f1oen3g     variables renamed
 2-Nov-15 fvopabf4  fvmptmap    revised
 2-Nov-15 ereldmb   ereldm
 2-Nov-15 ereldm    [--same--]  revised
 2-Nov-15 iser2d    iserd       revised
 2-Nov-15 iser      iserd       revised
 2-Nov-15 erdmrn    ---         deleted; see erdm, errn
 2-Nov-15 errtr     ---         deleted; see ertr
 2-Nov-15 errsym    ---         deleted; see ersym
 2-Nov-15 df-er     [--same--]  revised
 2-Nov-15 wer       [--same--]  changed "Er R" to "R Er A", affecting all df-er
                                theorems
 2-Nov-15 frsucopab frsucmpt    revised
 2-Nov-15 rdgsucopabn rdgsucmptnf revised
 2-Nov-15 rdgsucopab rdgsucmptf revised
 2-Nov-15 fv4       [--same--]  hypothesis removed
 2-Nov-15 fsplit    [--same--]  revised
 2-Nov-15 fpar      [--same--]  revised
 2-Nov-15 curry2    [--same--]  revised
 2-Nov-15 curry1    [--same--]  revised
 2-Nov-15 iunfoprab dfmpt2      revised
 2-Nov-15 oprab2co  [--same--]  revised
 2-Nov-15 oprabco   [--same--]  revised
 2-Nov-15 elrnoprab elrnmpt2    revised
 2-Nov-15 elrnoprabg elrnmpt2g  revised
 2-Nov-15 dmoprab2  dmmpt2      revised
 2-Nov-15 fnoprab2  fnmpt2i     revised
 2-Nov-15 fnoprab2g ---         deleted; see fmpt2, dffn2
 2-Nov-15 foprab    ---         deleted; see fmpt2
 2-Nov-15 foprab2   fmpt2       revised
 2-Nov-15 elopaba   [--same--]  variables renamed
 2-Nov-15 copsex2gb [--same--]  variables renamed
 2-Nov-15 copsex2ga [--same--]  variables renamed
 2-Nov-15 oprabopab dfoprab4    revised
 2-Nov-15 oprabopabf dfoprab4f  revised
 2-Nov-15 dfopab5sf ---         deleted; see mpt2mpt
 2-Nov-15 dfopab5s  ---         deleted; see mpt2mpt
 2-Nov-15 dfopab4s  dfopab4     revised
 2-Nov-15 dfopab3s  dfopab3     revised
 2-Nov-15 dfopab3   dfopab3s
 2-Nov-15 dfopab2   [--same--]  revised
 2-Nov-15 csbopeq1a [--same--]  revised
 2-Nov-15 sbcopeq1a [--same--]  revised
 2-Nov-15 caofdir   [--same--]  variables renamed
 2-Nov-15 caofdi    [--same--]  variables renamed
 2-Nov-15 caovdird  [--same--]  variables renamed
 2-Nov-15 caovdirg  [--same--]  variables renamed
 2-Nov-15 caovdid   [--same--]  variables renamed
 2-Nov-15 caovdig   [--same--]  variables renamed
 2-Nov-15 ov5       ovmpt2      revised
 2-Nov-15 ov2       ovmpt2      revised
 2-Nov-15 ov2g      ovmpt2g     revised
 2-Nov-15 ov2ag     ovmpt2ga    revised
 2-Nov-15 ov4g      ovmpt4g     revised
 2-Nov-15 ov2gf     [--same--]  revised
 2-Nov-15 oprabex2  mpt2ex      revised
 2-Nov-15 oprabex2g mpt2exg     revised
 2-Nov-15 fov       ---         deleted; see fnov, ffnov
 2-Nov-15 fnov2     fnov
 2-Nov-15 brwitnlem [--same--]  revised
 2-Nov-15 fopabap   fmptap      revised
 2-Nov-15 fopabsn   fmptsn      revised
 2-Nov-15 fopabcos  fmptcos     revised
 2-Nov-15 fopabco   fmptco      revised
 2-Nov-15 fopabfv   ---         deleted; see dffn5, ffnfv
 2-Nov-15 fopab     fmpti       revised
 2-Nov-15 fopab3    ---         deleted; see df-f, fnmpti
 2-Nov-15 rnssopab  ---         deleted; see fmpt, frn
 2-Nov-15 fopabssxp ---         deleted; see fmpt, fssxp
 2-Nov-15 fopab2    ---         deleted; see fmpt
 2-Nov-15 fopabex2  ---         deleted; see mptex
 2-Nov-15 opabex2g  ---         deleted; see mptexg
 2-Nov-15 opabex2   ---         deleted; see mptex
 2-Nov-15 fnasrn    [--same--]  revised
 2-Nov-15 elrnopab  ---         deleted; see elrnmpti
 2-Nov-15 elrnopabg ---         deleted; see elrnmptg
 2-Nov-15 eqfnfv2   eqfnfv
 2-Nov-15 eqfnfv    eqfnfv2
 2-Nov-15 fvopab5   [--same--]  revised
 2-Nov-15 fvopabs   ---         deleted; see fvmpts
 2-Nov-15 fvopab2   ---         deleted; see fvmpt2
 2-Nov-15 fvopab    ---         deleted; see fvmpt
 2-Nov-15 fvopabf   ---         deleted; see fvmptf
 2-Nov-15 fvopabnf  ---         deleted; see fvmptnf
 2-Nov-15 fvopabgf  ---         deleted; see fvmptf
 2-Nov-15 fvopabn   ---         deleted; see fvmptn
 2-Nov-15 fvopabg   ---         deleted; see fvmptg
 2-Nov-15 fvopab4sf ---         deleted; see fvmpts
 2-Nov-15 fvopab4f  fvmpts      revised
 2-Nov-15 fvopab4gf fvmptf      revised
 2-Nov-15 fvopab4   fvmpt       revised
 2-Nov-15 fvopab4g  fvmptg      revised
 2-Nov-15 fvopab4t  fvmptt      revised
 2-Nov-15 dffn5     [--same--]  revised
 2-Nov-15 tz6.12c   [--same--]  hypothesis removed
 2-Nov-15 tz6.12f   [--same--]  variables renamed
 2-Nov-15 tz6.12    [--same--]  hypothesis removed
 2-Nov-15 tz6.12-1  [--same--]  hypothesis removed
 2-Nov-15 fv3       [--same--]  hypothesis removed
 2-Nov-15 elfv      [--same--]  hypothesis removed
 2-Nov-15 fv2       [--same--]  hypothesis removed
 2-Nov-15 dmopab2   ---         deleted; see dmmpti
 2-Nov-15 fnopab2   ---         deleted; see fnmpti
 2-Nov-15 fnopab2g  ---         deleted; see mptfng
 2-Nov-15 iunfopab  dfmpt       revised
 2-Nov-15 funeu2    [--same--]  variables renamed
 2-Nov-15 funeu     [--same--]  variables renamed
 2-Nov-15 funmo     [--same--]  variables renamed
 2-Nov-15 dffun6    [--same--]  variables renamed
 2-Nov-15 opswap    [--same--]  hypothesis removed
 2-Nov-15 rnopab2   ---         deleted; see rnmpt
 2-Nov-15 fconstopab ---        deleted; see fconstmpt
 2-Nov-15 elomg     ---         deleted; see elom
 2-Nov-15 elom      [--same--]  revised
 2-Nov-15 df-om     [--same--]  revised
 2-Nov-15 rexxfr2d  [--same--]  revised
 2-Nov-15 ralxfr2d  [--same--]  revised
 2-Nov-15 hbcsb1    hbcsb1f
 2-Nov-15 csbeq2i   [--same--]  hypothesis removed
 2-Nov-15 csbeq2dv  [--same--]  hypothesis removed
 2-Nov-15 hbsbc1v   hbsbc1      hypothesis removed
 2-Nov-15 hbsbc1    hbsbc1f
 2-Nov-15 rexrab    [--same--]  variables renamed
 2-Nov-15 rexab     [--same--]  variables renamed
 2-Nov-15 ceqsralv  [--same--]  hypothesis removed
16-Aug-15 dif1en    [--same--]  hypothesis removed
11-Aug-15 df-sgm    [--same--]  revised
11-Aug-15 pi1xfrf1o pi1xfrgim   revised
11-Aug-15 pi1xfr    [--same--]  revised
11-Aug-15 pi1id     [--same--]  revised
11-Aug-15 pi1gp     pi1grp
11-Aug-15 pi1pval   pi1addval   revised
11-Aug-15 pi1f      pi1addf     revised
11-Aug-15 pi1fval   ---         deleted; see pi1addval
11-Aug-15 pi1bvalqs pi1bas      revised
11-Aug-15 elpi1i    [--same--]  revised
11-Aug-15 elpi1     [--same--]  revised
11-Aug-15 pi1bval   ---         deleted; see pi1bas
11-Aug-15 pi1val    [--same--]  revised
11-Aug-15 pcohtpy   [--same--]  hypothesis removed
11-Aug-15 pcoloopf  om1addcl    revised
11-Aug-15 df-pi1    [--same--]  revised
11-Aug-15 phtpc01   [--same--]  hypothesis removed
11-Aug-15 phtpcdm   ---         deleted; see phtpcer
11-Aug-15 isphtpc   [--same--]  hypothesis removed
11-Aug-15 conntoppr contoppr
11-Aug-15 cnvhmpha  hmeocnv
11-Aug-15 hmeomap   hmeof1o
11-Aug-15 ishomeo   ishmeo
11-Aug-15 homeofval hmeofval
11-Aug-15 df-homeo  df-hmeo
11-Aug-15 chomeo    chmph
11-Aug-15 chomeosm  chmeo
11-Aug-15 ---       ---         df-imas, df-qus theorems: hypothesis revised
11-Aug-15 pcadd2    [--same--]  hypothesis removed
11-Aug-15 pcadd     [--same--]  hypothesis removed
11-Aug-15 pcz       [--same--]  hypothesis removed
11-Aug-15 pc11      [--same--]  revised
11-Aug-15 pc2dvds   [--same--]  revised
11-Aug-15 pcabs     [--same--]  hypothesis removed
11-Aug-15 pcneg     [--same--]  hypothesis removed
11-Aug-15 pcdvdsb   [--same--]  revised
11-Aug-15 df-pc     [--same--]  revised
11-Aug-15 dmenr     ---         deleted; see enrer
11-Aug-15 dmenq     ---         deleted; see enqer
11-Aug-15 ---       ---         otoscl ~ otosen deleted; see df-oi
11-Aug-15 r0weon    [--same--]  revised
11-Aug-15 hta       [--same--]  revised
11-Aug-15 onssr1    [--same--]  revised
11-Aug-15 uniwf     [--same--]  revised
11-Aug-15 unwf      [--same--]  revised
11-Aug-15 pwwf      [--same--]  revised
11-Aug-15 rankr1ag  [--same--]  revised
11-Aug-15 r1val1    [--same--]  revised
11-Aug-15 oieu      [--same--]  revised
11-Aug-15 oicl      [--same--]  revised
11-Aug-15 ordtype   [--same--]  revised
11-Aug-15 oiex      oiexg       revised
11-Aug-15 df-oi     [--same--]  revised
11-Aug-15 domssex2  [--same--]  hypothesis added
11-Aug-15 domss2    [--same--]  hypothesis added
11-Aug-15 en3       [--same--]  hypothesis added
11-Aug-15 en2       [--same--]  hypothesis added
11-Aug-15 en3d      [--same--]  hypothesis added
11-Aug-15 en2d      [--same--]  hypothesis added
11-Aug-15 ixpssmapg [--same--]  variables renamed
11-Aug-15 qsss      [--same--]  revised
11-Aug-15 uniqs2    [--same--]  revised
11-Aug-15 ereldmb   [--same--]  revised
11-Aug-15 ereldm    [--same--]  revised
11-Aug-15 erth2     [--same--]  revised
11-Aug-15 erth      [--same--]  revised
11-Aug-15 ecss      [--same--]  revised
11-Aug-15 erref     [--same--]  revised
11-Aug-15 tz7.44-3  [--same--]  revised
11-Aug-15 tz7.44-2  [--same--]  revised
11-Aug-15 tz7.44-1  [--same--]  revised
11-Aug-15 smoge     [--same--]  deleted; use smogt
11-Aug-15 fnwe      [--same--]  revised
11-Aug-15 weniso    [--same--]  revised
11-Aug-15 epne3     [--same--]  revised
11-Aug-15 fr3nr     [--same--]  revised
11-Aug-15 wereucl   ---         deleted; use wereu and reucl
11-Aug-15 efrn2lp   [--same--]  revised
11-Aug-15 fr2nr     [--same--]  revised
11-Aug-15 frirr     [--same--]  revised
11-Aug-15 frc       [--same--]  revised
11-Aug-15 dffr2     [--same--]  revised
 9-Aug-15 ---       ---         df-fbas, df-fg, df-fil, and df-fm revised.
                                Individual changes not noted; version with *OLD
                                is set.mm@5db2041
29-Jul-15 ax10      ax10from10o
29-Jul-15 ax9       ax9from9o
19-Jun-15 uvcf1     [--same--]  (in SO's mathbox) revised
19-Jun-15 pwssnf1o  [--same--]  moved from SO's mathbox to main set.mm
19-Jun-15 mapsnf1o  [--same--]  moved from SO's mathbox to main set.mm
19-Jun-15 ixpsnf1o  [--same--]  moved from SO's mathbox to main set.mm
19-Jun-15 elixpsn   [--same--]  moved from SO's mathbox to main set.mm
19-Jun-15 ---       ---         df-gim ~ lmicsym moved from SO's mathbox
                                to main set.mm
19-Jun-15 isfld     isfldOLD
19-Jun-15 df-zn     [--same--]  moved from MC's mathbox to main set.mm; revised
19-Jun-15 df-q2r    df-z2r      moved from MC's mathbox to main set.mm; revised
19-Jun-15 ---       ---         df-lgs ~ lgssq2 moved from MC's mathbox
                                to main set.mm
19-Jun-15 evlval    [--same--]  hypothesis removed
19-Jun-15 vr1val    [--same--]  hypothesis removed
19-Jun-15 df-evl1   [--same--]  revised
19-Jun-15 abvn0b    [--same--]  revised
19-Jun-15 isdomn2   [--same--]  revised
19-Jun-15 isdomn    [--same--]  revised
19-Jun-15 df-idom   [--same--]  revised
19-Jun-15 df-domn   [--same--]  revised
19-Jun-15 lsppropd  [--same--]  revised
19-Jun-15 lsspropd  [--same--]  revised
19-Jun-15 isrhmd    [--same--]  hypothesis reordered
19-Jun-15 unitdvcl  [--same--]  hypothesis removed
19-Jun-15 rngel1ne0 rngelznr    revised
19-Jun-15 eqgval    [--same--]  hypothesis removed
19-Jun-15 eqgval    [--same--]  hypothesis removed
19-Jun-15 mhmpropd  [--same--]  revised
19-Jun-15 fznn      [--same--]  revised
13-Jun-15 ---       ---         rlmfn ~ ply1pid moved from SO's mathbox
                                to main set.mm
13-Jun-15 ---       ---         strfvi ~ grpsubpropd moved from SO's mathbox
                                to main set.mm
13-Jun-15 ---       ---         pwsdiagel ~ pwsdiagrhm moved from SO's mathbox
                                to main set.mm
13-Jun-15 pwselbasb [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 ---       ---         sraval ~ issubrngd2 moved from SO's mathbox
                                to main set.mm
13-Jun-15 ---       ---         df-odu ~ mreclatdemo moved from SO's mathbox
                                to main set.mm
13-Jun-15 ---       ---         subsubrg2 ~ dvdsr02 moved from SO's mathbox
                                to main set.mm
13-Jun-15 gsumpt    [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 rngel1ne0 [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 suppfif1  [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 ---       ---         nnfi ~ suppssof1 moved from SO's mathbox
                                to main set.mm
13-Jun-15 ---       ---         fco2 ~ fvco4i moved from SO's mathbox
                                to main set.mm
13-Jun-15 fnfvof    [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 ---       ---         fneqeql ~ fncoeqres moved from SO's mathbox
                                to main set.mm
13-Jun-15 fnimaeq0  [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 supxrss   [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 rabun2    [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 elin3     [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 elin2     [--same--]  moved from SO's mathbox to main set.mm
13-Jun-15 ---       ---         rint0 ~ elrint2 moved from SO's mathbox
                                to main set.mm
13-Jun-15 wilth     [--same--]  moved from MC's mathbox to main set.mm
13-Jun-15 ---       ---         df-od ~ sylow3 moved from MC's mathbox
                                to main set.mm
13-Jun-15 grpinvpropd [--same--] revised
13-Jun-15 grpsubfval [--same--] revised
13-Jun-15 cardval2  [--same--]  revised
13-Jun-15 cardsdomel [--same--] revised
13-Jun-15 cardsdomel2 cardsdomel revised
13-Jun-15 coires1   [--same--]  revised
 4-Jun-15 tpaaa     tpidm       moved from DAW's mathbox to main set.mm
 4-Jun-15 tpabb     tpidm23     moved from DAW's mathbox to main set.mm
 4-Jun-15 tpaba     tpidm13     moved from DAW's mathbox to main set.mm
 4-Jun-15 tpaab     tpidm12     moved from DAW's mathbox to main set.mm
 4-Jun-15 ifnefalse [--same--]  moved from DAW's mathbox to main set.mm
 4-Jun-15 ptolemy   [--same--]  moved from DAW's mathbox to main set.mm
 4-Jun-15 cosmul    [--same--]  moved from DAW's mathbox to main set.mm
 4-Jun-15 sinmul    [--same--]  moved from DAW's mathbox to main set.mm
 4-Jun-15 dfac1     dfac3       moved from SO's mathbox to main set.mm
 4-Jun-15 dfac3     dfac9       moved from SO's mathbox to main set.mm
 4-Jun-15 dfaccard  dfac10      moved from SO's mathbox to main set.mm
 4-Jun-15 dfac10b   [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 axac      [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 dfac10    dfac10c     moved from SO's mathbox to main set.mm
 4-Jun-15 df-ac     [--same--]  moved from SO's mathbox to main set.mm; revised
 4-Jun-15 df-recs   [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 marypha2  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 marypha1  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 ---       ---         df-har ~ hsmex3 moved from SO's mathbox
                                to main set.mm
 4-Jun-15 domunfican [--same--] moved from SO's mathbox to main set.mm
 4-Jun-15 domunsncan [--same--] moved from SO's mathbox to main set.mm
 4-Jun-15 domdifsn  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 wemoiso2  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 wemoiso   [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 weniso    [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 fodomfi2  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 fipreimaNEW fipreima  moved from SO's mathbox to main set.mm
 4-Jun-15 imafi     [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 f1ssr     [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 imainrect [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 f1eqcocnv [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 foeqcnvco [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 fococnv2  [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 fnunirn   [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 fvmpt3    [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 mpt20     [--same--]  moved from SO's mathbox to main set.mm; revised
 4-Jun-15 iunopab   [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 pwidg     [--same--]  moved from SO's mathbox to main set.mm
 4-Jun-15 uffixfr   [--same--]  moved from JGH's mathbox to main set.mm;revised
 4-Jun-15 ---       ---         df-ufil ~ ufildr moved from JH's mathbox
                                to main set.mm
 4-Jun-15 filfinnfr [--same--]  moved from JH's mathbox to main set.mm
 4-Jun-15 csdfil    [--same--]  moved from FL's mathbox to main set.mm
 4-Jun-15 rcfpfil   cfinfil     moved from FL's mathbox to main set.mm
 4-Jun-15 excxor    [--same--]  moved from FL's mathbox to main set.mm
 4-Jun-15 assxor    [--same--]  moved from FL's mathbox to main set.mm
 4-Jun-15 df-xor    [--same--]  moved from FL's mathbox to main set.mm
 4-Jun-15 ---       ---         lukshef-ax1 ~ re2luk3 moved from AH's mathbox
                                to main set.mm
 4-Jun-15 FFSid     falnanfal   moved from AH's mathbox to main set.mm
 4-Jun-15 FTSid     falnantru   moved from AH's mathbox to main set.mm
 4-Jun-15 TFSid     trunanfal   moved from AH's mathbox to main set.mm
 4-Jun-15 TTSid     trunantru   moved from AH's mathbox to main set.mm
 4-Jun-15 FFBid     falbifal    moved from AH's mathbox to main set.mm
 4-Jun-15 FTBid     falbitru    moved from AH's mathbox to main set.mm
 4-Jun-15 TFBid     trubifal    moved from AH's mathbox to main set.mm
 4-Jun-15 TTBid     trubitru    moved from AH's mathbox to main set.mm
 4-Jun-15 FNid      notfal      moved from AH's mathbox to main set.mm
 4-Jun-15 TNid      nottru      moved from AH's mathbox to main set.mm
 4-Jun-15 FFIid     falimfal    moved from AH's mathbox to main set.mm
 4-Jun-15 FTIid     falimtru    moved from AH's mathbox to main set.mm
 4-Jun-15 TFIid     truimfal    moved from AH's mathbox to main set.mm
 4-Jun-15 TTIid     truimtru    moved from AH's mathbox to main set.mm
 4-Jun-15 FFOid     falorfal    moved from AH's mathbox to main set.mm
 4-Jun-15 FTOid     falortru    moved from AH's mathbox to main set.mm
 4-Jun-15 TFOid     truorfal    moved from AH's mathbox to main set.mm
 4-Jun-15 TTOid     truortru    moved from AH's mathbox to main set.mm
 4-Jun-15 FFAid     falanfal    moved from AH's mathbox to main set.mm
 4-Jun-15 FTAid     falantru    moved from AH's mathbox to main set.mm
 4-Jun-15 TFAid     truanfal    moved from AH's mathbox to main set.mm
 4-Jun-15 TTAid     truantru    moved from AH's mathbox to main set.mm
 4-Jun-15 AiT       a1tru       moved from AH's mathbox to main set.mm
 4-Jun-15 FiA       falim       moved from AH's mathbox to main set.mm
 4-Jun-15 falvar    nbfal       moved from AH's mathbox to main set.mm
 4-Jun-15 truvar    tbtru       moved from AH's mathbox to main set.mm
 4-Jun-15 ordsucuniel [--same--] moved from SF's mathbox to main set.mm
 4-Jun-15 mpt2fun   [--same--]  moved from SF's mathbox to main set.mm
 4-Jun-15 ccnf      ccnfn
 4-Jun-15 ltbval    [--same--]  revised
 4-Jun-15 df-ltbag  [--same--]  revised
 4-Jun-15 pwcfsdom  [--same--]  revised
 4-Jun-15 zornn0    [--same--]  revised
 4-Jun-15 zorn      [--same--]  revised
 4-Jun-15 aceqkm    dfackm      revised
 4-Jun-15 aceq8     dfac8       revised
 4-Jun-15 aceq7     dfac7       revised
 4-Jun-15 aceq6     dfac2       revised
 4-Jun-15 aceq6a    dfac2a      revised
 4-Jun-15 aceq5     dfac5       revised
 4-Jun-15 aceq4     dfac4       revised
 4-Jun-15 aceq3     dfac3       revised
 4-Jun-15 alephfp   [--same--]  revised
 4-Jun-15 aceq8c    dfac8c
 4-Jun-15 aceq8b    dfac8b
 4-Jun-15 aceq8a    dfac8a
 4-Jun-15 ondomcard harcard     revised
 4-Jun-15 df-aleph  [--same--]  revised
 4-Jun-15 finsschain [--same--] revised
 4-Jun-15 fipreima  [--same--]  hypothesis removed
 4-Jun-15 oeworde   [--same--]  revised
 4-Jun-15 oeword    [--same--]  revised
 4-Jun-15 oecan     [--same--]  revised
 4-Jun-15 oeord     [--same--]  revised
 4-Jun-15 oeordi    [--same--]  revised
 4-Jun-15 omeu      [--same--]  revised
 4-Jun-15 oarec     [--same--]  revised
 4-Jun-15 rdgval    [--same--]  revised
 4-Jun-15 df-rdg    [--same--]  revised
 4-Jun-15 tfr3      [--same--]  revised
 4-Jun-15 tfr2      [--same--]  revised
 4-Jun-15 tfr1      [--same--]  revised
 4-Jun-15 notfal    fal
 4-Jun-15 nic-justbi nanbi
 4-Jun-15 nic-justneg nannot
 4-Jun-15 nic-justim nanim
 4-Jun-15 nic-justlem nannan
 4-Jun-15 df-nand   df-nan
 4-Jun-15 wnand     wnan
23-May-15 grpinvnzcl [--same--] moved from SO's mathbox to main set.mm
23-May-15 grpinvnz  [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 dihopellsm [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 xihopellsmN [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 dihopcl   [--same--]  (in NM's mathbox) hypothesis removed
 7-May-15 dihopelvalbN [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 diblsmopel [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 dibopelval3 [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 dibopelval2 [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 dibopelvalN [--same--] (in NM's mathbox) hypothesis removed
 7-May-15 df-ocomp  [--same--]  (in NM's mathbox) revised
 7-May-15 phlfun    [--same--]  (in NM's mathbox) revised
 7-May-15 phlfn     [--same--]  (in NM's mathbox) revised
 7-May-15 srngfn    [--same--]  (in NM's mathbox) revised
 7-May-15 bnj96     [--same--]  (in JB's mathbox) hypothesis added
 7-May-15 bnj536    [--same--]  (in JB's mathbox) hypothesis removed
 7-May-15 bnj142    [--same--]  (in JB's mathbox) hypothesis removed
 7-May-15 bnj136    [--same--]  (in JB's mathbox) hypothesis removed
 7-May-15 addcomgi  [--same--]  (in AS's mathbox) hypothesis removed
 7-May-15 lmiclbs   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmimlbs   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmmmlem   ---         (in SO's mathbox) deleted; use lmhmlmod2
 7-May-15 lnmlmic   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lnmepi    [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmhmfgima [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 kercvrlsm [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmicsym   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmimcnv   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmimf1o   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 islmim    [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 gicsubgen [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 gicen     [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 gimcnv    [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 lmhmf1o   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 subggim   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 gimf1o    [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 isgim     [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 gimlem2   ---         (in SO's mathbox) deleted
 7-May-15 elovmpt2  [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 infpssALT [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 infpssen1 [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 infpssr   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 fidomtri2 [--same--]  moved from SO's mathbox to main set.mm; revised
 7-May-15 pw2f1oval2 [--same--] (in SO's mathbox) hypothesis removed
 7-May-15 pw2f1oval [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 mapfzcons2 [--same--] (in SO's mathbox) hypothesis removed
 7-May-15 mapfzcons1cl [--same--] (in SO's mathbox) hypothesis removed
 7-May-15 mapfzcons1 [--same--] (in SO's mathbox) hypothesis removed
 7-May-15 elmapssres [--same--] (in SO's mathbox) hypothesis removed
 7-May-15 mapco2    [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 mapco2g   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 elmapex2  ---         (in SO's mathbox) deleted
 7-May-15 constmap  [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 xpwdomg   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 unwdomg   [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 brwdom3i  [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 wdomndom  ---         (in SO's mathbox) deleted; use brrelex12
 7-May-15 brwdomn0  [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 numth3    [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 isnum2    [--same--]  moved from SO's mathbox to main set.mm; hyp rem
 7-May-15 isghmd    [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 difsnen   [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fsnunres  [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fsnunfv   [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fsnunf2   [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fsnunf    [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fnsnsplit [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 ralxpmap  [--same--]  (in SO's mathbox) hypothesis removed
 7-May-15 reldmmap  [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fconst6g  [--same--]  moved from SO's mathbox to main set.mm
 7-May-15 fconst6   [--same--]  moved from JM's mathbox to main set.mm
 7-May-15 xrletr2   [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 mlteqer   [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 csdfil    [--same--]  (in FL's mathbox) revised
 7-May-15 curgrpact [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 rngapm    [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 gapm2     [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 nfwpr4c   [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 prltub    [--same--]  (in FL's mathbox) hypothesis removed
 7-May-15 domtri2   domtri3     (in FL's mathbox)
 7-May-15 brtxp2    [--same--]  (in SF's mathbox) hypothesis removed
 7-May-15 predfz    [--same--]  (in SF's mathbox) hypothesis removed
 7-May-15 brtp      [--same--]  (in SF's mathbox) hypothesis removed
 7-May-15 epelg     [--same--]  moved from SF's mathbox to main set.mm
 7-May-15 epelcNEW  epelc       moved from SF's mathbox to main set.mm
 7-May-15 eupath    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupath2   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupap1    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupares   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupaseg   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupapf    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupafi    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupaf1o   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupacl    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 eupai     [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 iseupa    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgraun   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgrares  [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgraex   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgrafi   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgrale   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgran0   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgrass   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgraf    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 umgraf2   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmfo     [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmlift   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmliftmo [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmliftmoi [--same--] (in MC's mathbox) hypothesis removed
 7-May-15 cvmsiota  [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmseu    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmscld   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmsf1o   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmcov    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 cvmtop2   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 iscvm     [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 sylow2    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 slwhash   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 slwpgp    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 slwpss    [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 slwispgp  [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 slwsubg   [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 isslw     [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 ispgp     [--same--]  (in MC's mathbox) hypothesis removed
 7-May-15 hlimunii  hlimuni     hypothesis removed
 7-May-15 hlimadd   [--same--]  hypothesis removed
 7-May-15 hvsubopr  hbsubf
 7-May-15 bpos1     [--same--]  revised
 7-May-15 logcnss   logdmss
 7-May-15 itgulm    [--same--]  hypothesis removed
 7-May-15 mbfulm    [--same--]  hypothesis removed
 7-May-15 ulmdv     [--same--]  hypothesis removed
 7-May-15 ulmcn     [--same--]  hypothesis removed
 7-May-15 ulmbdd    [--same--]  hypothesis removed
 7-May-15 ulmss     [--same--]  hypothesis removed
 7-May-15 ulmshft   [--same--]  hypothesis removed
 7-May-15 ulmres    [--same--]  hypothesis removed
 7-May-15 ulmclm    [--same--]  hypothesis removed
 7-May-15 ulmi      [--same--]  hypothesis removed
 7-May-15 ulmcl     [--same--]  hypothesis removed
 7-May-15 ulmval    [--same--]  revised
 7-May-15 dvlm      [--same--]  hypothesis removed
 7-May-15 dvcl      [--same--]  hypothesis removed
 7-May-15 eldv      [--same--]  hypothesis removed
 7-May-15 mbflim    [--same--]  hypothesis removed
 7-May-15 cncfco    [--same--]  hypothesis removed
 7-May-15 climcncf  [--same--]  hypothesis removed
 7-May-15 cncffvrn  [--same--]  revised
 7-May-15 rescncf   [--same--]  hypothesis removed
 7-May-15 cncfi     [--same--]  hypothesis removed
 7-May-15 cncff     [--same--]  hypothesis removed
 7-May-15 cncfrss2  [--same--]  hypothesis removed
 7-May-15 nvlmcl    [--same--]  hypothesis removed
 7-May-15 nvvcop    [--same--]  revised
 7-May-15 nvss      [--same--]  revised
 7-May-15 caublcls  [--same--]  hypothesis removed
 7-May-15 metelcls  [--same--]  hypothesis removed
 7-May-15 lmclimf   [--same--]  hypothesis removed
 7-May-15 lmclim    [--same--]  hypothesis removed
 7-May-15 lmle      [--same--]  hypothesis removed
 7-May-15 lmmbrf    [--same--]  hypothesis removed
 7-May-15 lmmcvg    [--same--]  hypothesis removed
 7-May-15 lmmbr3    [--same--]  hypothesis removed
 7-May-15 lmmbr2    [--same--]  hypothesis removed
 7-May-15 lmmbr     [--same--]  hypothesis removed
 7-May-15 lincmb01icc icccvx
 7-May-15 resubtop  rerest
 7-May-15 subtopmet metrest
 7-May-15 qtopsubsp qtoprest
 7-May-15 lmcn2     [--same--]  hypothesis removed
 7-May-15 txlm      [--same--]  hypothesis removed
 7-May-15 txsubsp   txrest
 7-May-15 hauspwdom [--same--]  revised
 7-May-15 1stcelcls [--same--]  hypothesis removed
 7-May-15 lly1stc   [--same--]  revised
 7-May-15 nllyidm   [--same--]  revised
 7-May-15 llyidm    [--same--]  revised
 7-May-15 nllysubsp nllyrest
 7-May-15 llysubsp  llyrest
 7-May-15 subsplly  restlly
 7-May-15 subspnlly restnlly
 7-May-15 2ndcsubsp 2ndcrest
 7-May-15 1stcsubsp 1stcrest
 7-May-15 lmmo      [--same--]  hypothesis removed
 7-May-15 subsphaus resthaus
 7-May-15 lmcn      [--same--]  hypothesis removed
 7-May-15 lmcld     [--same--]  hypothesis removed
 7-May-15 lmcls     [--same--]  hypothesis removed
 7-May-15 lmres     [--same--]  hypothesis removed
 7-May-15 lmcl      [--same--]  hypothesis removed
 7-May-15 lmfss     [--same--]  hypothesis removed
 7-May-15 lmfpm     [--same--]  hypothesis removed
 7-May-15 cnpsubsp2 cnprest2
 7-May-15 cnpsubsp  cnprest
 7-May-15 cnpsubspi cnpresti
 7-May-15 cnsubsp2r cnrest2r
 7-May-15 cnsubsp2  cnrest2
 7-May-15 cnsubsp   cnrest
 7-May-15 lmbrf     [--same--]  hypothesis removed
 7-May-15 lmbr2     [--same--]  hypothesis removed
 7-May-15 lmbr      [--same--]  hypothesis removed
 7-May-15 subntr    restntr
 7-May-15 subcls    restcls
 7-May-15 subspdis  restdis
 7-May-15 subspsubbas restsubbas
 7-May-15 tgsubsp   tgrest
 7-May-15 subspopn2 restopn2
 7-May-15 sssubsp   ssrest      hypothesis removed
 7-May-15 subspopnb restopnb
 7-May-15 subspcld2 restcldr
 7-May-15 subspcld  restcldi
 7-May-15 subcld    restcld
 7-May-15 subspsn2  restsn2
 7-May-15 subspsn   restsn
 7-May-15 subsp0    rest0
 7-May-15 subspuni2 restuni2
 7-May-15 subspint  restin      hypothesis generalized
 7-May-15 subsubtop restabs     hypothesis generalized
 7-May-15 subspco   restco      revised
 7-May-15 stoig     [--same--]  revised
 7-May-15 subspuni  restuni     revised
 7-May-15 subsptop  resttop
 7-May-15 subsprcl  restrcl     revised
 7-May-15 subspid   restid      hypothesis generalized
 7-May-15 elsubspr  elrestr     hypothesis generalized
 7-May-15 elsubsp   elrest      hypothesis generalized
 7-May-15 subspval  restval     hypothesis generalized
 7-May-15 df-subsp  df-rest     arguments were swapped; revisions due to the
                                new form factor are not noted
 7-May-15 csubsp    crest
 7-May-15 reslmhm   [--same--]  hypothesis removed
 7-May-15 lmhmkerlss [--same--] hypothesis removed
 7-May-15 lmhmrnlss [--same--]  hypothesis removed
 7-May-15 lmhmlsp   [--same--]  hypothesis removed
 7-May-15 lmhmima   [--same--]  hypothesis removed
 7-May-15 lmhmlin   [--same--]  hypothesis removed
 7-May-15 lmhmf     [--same--]  hypothesis removed
 7-May-15 lmhmlmod2 [--same--]  hypothesis removed
 7-May-15 lmhmsca   [--same--]  hypothesis removed
 7-May-15 islmhm2   [--same--]  hypothesis removed
 7-May-15 islmhm    [--same--]  hypothesis removed
 7-May-15 dvdsrneg  [--same--]  revised
 7-May-15 dvdsrmul1 [--same--]  revised
 7-May-15 dvdsrid   [--same--]  revised
 7-May-15 dvdsr2    [--same--]  hypothesis removed
 7-May-15 dvdsr     [--same--]  hypothesis removed
 7-May-15 dvdsrval  [--same--]  hypothesis removed
 7-May-15 gsumhomo  ---         deleted; use gsummhm
 7-May-15 lactghmga [--same--]  hypothesis removed
 7-May-15 galactghm [--same--]  hypothesis removed
 7-May-15 orbsta2   [--same--]  hypothesis removed
 7-May-15 orbsta    [--same--]  hypothesis removed
 7-May-15 orbstaval [--same--]  hypothesis removed
 7-May-15 orbstaeu  [--same--]  hypothesis removed
 7-May-15 gastacos  [--same--]  hypothesis removed
 7-May-15 gastacl   [--same--]  hypothesis removed
 7-May-15 gaorber   [--same--]  hypothesis removed
 7-May-15 gaorb     [--same--]  hypothesis removed
 7-May-15 gapm      [--same--]  hypothesis removed
 7-May-15 gacan     [--same--]  hypothesis removed
 7-May-15 galcan    [--same--]  hypothesis removed
 7-May-15 gasubg    [--same--]  hypothesis removed
 7-May-15 gass      [--same--]  hypothesis removed
 7-May-15 gaass     [--same--]  hypothesis removed
 7-May-15 gafo      [--same--]  hypothesis removed
 7-May-15 gaf       [--same--]  hypothesis removed
 7-May-15 gagrpid   [--same--]  hypothesis removed
 7-May-15 isga      [--same--]  hypothesis removed
 7-May-15 ghmf1o    [--same--]  hypothesis removed
 7-May-15 ghmf1     [--same--]  hypothesis removed
 7-May-15 ghmeqker  [--same--]  hypothesis removed
 7-May-15 ghmker    [--same--]  hypothesis removed
 7-May-15 ghmsub    [--same--]  hypothesis removed
 7-May-15 ghmima    [--same--]  hypothesis removed
 7-May-15 resghm    [--same--]  hypothesis removed
 7-May-15 ghmrn     [--same--]  hypothesis removed
 7-May-15 ghminv    [--same--]  hypothesis removed
 7-May-15 ghmid     [--same--]  hypothesis removed
 7-May-15 ghmlin    [--same--]  hypothesis removed
 7-May-15 ghmgrp2   [--same--]  hypothesis removed
 7-May-15 ghmf      [--same--]  hypothesis removed
 7-May-15 isghm2    ---         deleted; use isghm
 7-May-15 isghm     [--same--]  hypothesis removed
 7-May-15 spwpr4c   [--same--]  hypothesis removed
 7-May-15 spwpr4    [--same--]  hypothesis removed
 7-May-15 prdmvalfun [--same--] revised
 7-May-15 posfn     [--same--]  revised
 7-May-15 tpsfn     [--same--]  revised
 7-May-15 ressvsca  [--same--]  hypothesis added
 7-May-15 resssca   [--same--]  hypothesis added
 7-May-15 algfun    [--same--]  revised
 7-May-15 algfn     [--same--]  revised
 7-May-15 lmodfun   [--same--]  revised
 7-May-15 lmodfn    [--same--]  revised
 7-May-15 ressmulr  [--same--]  hypothesis added
 7-May-15 rngfn     [--same--]  revised
 7-May-15 ressplusg [--same--]  hypothesis added
 7-May-15 grpfn     [--same--]  revised
 7-May-15 strlemor3 [--same--]  revised
 7-May-15 strlemor2 [--same--]  revised
 7-May-15 strlemor1 [--same--]  revised
 7-May-15 strlemor0 [--same--]  revised
 7-May-15 df-ds     [--same--]  revised
 7-May-15 resslem2  ---         deleted
 7-May-15 resslem   [--same--]  revised
 7-May-15 strfvd    [--same--]  hypothesis removed
 7-May-15 strfv     [--same--]  hypothesis removed
 7-May-15 setscom   [--same--]  hypothesis added
 7-May-15 setsabs   [--same--]  hypothesis added
 7-May-15 setsval   [--same--]  hypothesis added
 7-May-15 --        ---         11prm ~ 4001prm revised for base 10
 7-May-15 gcdi      [--same--]  revised
 7-May-15 modsubi   [--same--]  revised
 7-May-15 mod2xnegi [--same--]  revised
 7-May-15 modxp1i   [--same--]  revised
 7-May-15 mod2xi    [--same--]  revised
 7-May-15 modxai    [--same--]  revised
 7-May-15 --        ---         dec2dvds1 ~ dec2nprm revised for base 10
 7-May-15 iserodd   [--same--]  revised
 7-May-15 maxprmfct [--same--]  revised
 7-May-15 nprmi     [--same--]  revised
 7-May-15 1nprm     [--same--]  revised
 7-May-15 algrflem  [--same--]  hypothesis added
 7-May-15 ndvdsi    [--same--]  revised
 7-May-15 climfsum  [--same--]  hypothesis removed
 7-May-15 cvgcmpub  [--same--]  hypothesis removed
 7-May-15 iserabs   [--same--]  hypothesis removed
 7-May-15 isumclim  [--same--]  hypothesis removed
 7-May-15 climim    [--same--]  hypothesis removed
 7-May-15 climre    [--same--]  hypothesis removed
 7-May-15 climcj    [--same--]  hypothesis removed
 7-May-15 climabs   [--same--]  hypothesis removed
 7-May-15 isercoll2 [--same--]  hypothesis removed
 7-May-15 isercoll  [--same--]  hypothesis removed
 7-May-15 isershft  [--same--]  hypothesis removed
 7-May-15 iserle    [--same--]  hypothesis removed
 7-May-15 isermulc2 [--same--]  hypothesis removed
 7-May-15 iserex    [--same--]  hypothesis removed
 7-May-15 clim2ser2 [--same--]  hypothesis removed
 7-May-15 clim2ser  [--same--]  hypothesis removed
 7-May-15 rlimdiv   [--same--]  hypothesis removed
 7-May-15 rlimmul   [--same--]  hypothesis removed
 7-May-15 rlimsub   [--same--]  hypothesis removed
 7-May-15 rlimadd   [--same--]  hypothesis removed
 7-May-15 climsqz2  [--same--]  hypothesis removed
 7-May-15 climsqz   [--same--]  hypothesis removed
 7-May-15 climle    [--same--]  hypothesis removed
 7-May-15 climsubc2 [--same--]  hypothesis removed
 7-May-15 climsubc1 [--same--]  hypothesis removed
 7-May-15 climmulc2 [--same--]  hypothesis removed
 7-May-15 climaddc2 [--same--]  hypothesis removed
 7-May-15 climaddc1 [--same--]  hypothesis removed
 7-May-15 climsub   [--same--]  hypothesis removed
 7-May-15 climmul   [--same--]  hypothesis removed
 7-May-15 climadd   [--same--]  hypothesis removed
 7-May-15 climrecl  [--same--]  hypothesis removed
 7-May-15 climshft2 [--same--]  hypothesis removed
 7-May-15 climshft  [--same--]  hypothesis removed
 7-May-15 climres   [--same--]  hypothesis removed
 7-May-15 climmpt2  [--same--]  hypothesis removed
 7-May-15 2clim     [--same--]  hypothesis removed
 7-May-15 climmpt   [--same--]  hypothesis removed
 7-May-15 rlimeq    [--same--]  hypothesis removed
 7-May-15 climeq    [--same--]  hypothesis removed
 7-May-15 rlimuni   [--same--]  hypothesis removed
 7-May-15 rlimresb  [--same--]  hypothesis removed
 7-May-15 rlimres2  [--same--]  hypothesis removed
 7-May-15 rlimres   [--same--]  hypothesis removed
 7-May-15 climreu   [--same--]  hypothesis removed
 7-May-15 climeu    [--same--]  hypothesis removed
 7-May-15 climuni   [--same--]  hypothesis removed
 7-May-15 rlimi     [--same--]  hypothesis removed
 7-May-15 climi2    [--same--]  hypothesis removed
 7-May-15 climi     [--same--]  hypothesis removed
 7-May-15 clim2     [--same--]  hypothesis removed
 7-May-15 rlimcl    [--same--]  hypothesis removed
 7-May-15 climcl    [--same--]  hypothesis removed
 7-May-15 rlim      [--same--]  hypothesis removed
 7-May-15 clim      [--same--]  hypothesis removed
 7-May-15 seqcoll2  [--same--]  hypothesis removed
 7-May-15 hashfacen [--same--]  hypothesis removed
 7-May-15 hashdom   [--same--]  hypothesis generalized
 7-May-15 hasheni   [--same--]  hypothesis removed
 7-May-15 hashinf   [--same--]  revised
 7-May-15 permnn    [--same--]  hypothesis removed
 7-May-15 bccl2     [--same--]  hypothesis removed
 7-May-15 bcp1nk    [--same--]  hypothesis removed
 7-May-15 bcp1n     [--same--]  hypothesis removed
 7-May-15 bcm1k     [--same--]  hypothesis removed
 7-May-15 bcrpcl    [--same--]  hypothesis removed
 7-May-15 bcval2    [--same--]  hypothesis removed
 7-May-15 fseqsupubi [--same--] hypothesis removed
 7-May-15 fsequb2   [--same--]  hypothesis removed
 7-May-15 fsequb    [--same--]  hypothesis removed
 7-May-15 fznuz     [--same--]  hypothesis removed
 7-May-15 fz2ex     ---         deleted
 7-May-15 fzrev3i   [--same--]  hypothesis removed
 7-May-15 fzrev3    [--same--]  hypothesis removed
 7-May-15 fzrev2i   [--same--]  hypothesis removed
 7-May-15 fzp1disj  [--same--]  hypothesis removed
 7-May-15 fzelp1i   ---         deleted; use fzelp1
 7-May-15 fzp1elp1  [--same--]  hypothesis removed
 7-May-15 fzelp1    [--same--]  hypothesis removed
 7-May-15 fzp1ss    [--same--]  hypothesis removed
 7-May-15 fzssp1    [--same--]  hypothesis removed
 7-May-15 fzss1     [--same--]  hypothesis removed
 7-May-15 fzopth    [--same--]  hypothesis removed
 7-May-15 fznn0sub2 [--same--]  hypothesis removed
 7-May-15 fznn0sub  [--same--]  hypothesis removed
 7-May-15 elfz3nn0  [--same--]  hypothesis removed
 7-May-15 elfz2nn0  [--same--]  hypothesis removed
 7-May-15 fzdisj    [--same--]  hypothesis removed
 7-May-15 fzsplit   [--same--]  hypothesis removed
 7-May-15 fzn0      [--same--]  revised
 7-May-15 peano2fzr [--same--]  hypothesis removed
 7-May-15 elfzuz2   [--same--]  hypothesis removed
 7-May-15 elfzle3   [--same--]  hypothesis removed
 7-May-15 elfzel2g  ---         deleted; use elfzel2
 7-May-15 elfzel2i  elfzel2     hypothesis removed
 7-May-15 elfzuz3   [--same--]  hypothesis removed
 7-May-15 elfzuzb   [--same--]  hypothesis removed
 7-May-15 elfz2     [--same--]  hypothesis removed
 7-May-15 iccss2    [--same--]  hypothesis removed
 7-May-15 iccssioo  [--same--]  hypothesis removed
 7-May-15 iccss     [--same--]  hypothesis removed
 7-May-15 elioo4g   [--same--]  hypothesis removed
 7-May-15 iooss2    [--same--]  hypothesis removed
 7-May-15 iooss1    [--same--]  hypothesis removed
 7-May-15 elioo3g   [--same--]  hypothesis removed
 7-May-15 ixxss12   [--same--]  hypothesis removed
 7-May-15 ixxss2    [--same--]  hypothesis removed
 7-May-15 ixxss1    [--same--]  hypothesis removed
 7-May-15 ixxssixx  [--same--]  revised
 7-May-15 elixx3g   [--same--]  hypothesis removed
 7-May-15 uzsupss   [--same--]  revised
 7-May-15 0p1e1     1e0p1
 7-May-15 ---       ---         deccl ~ decbin3 revised for base 10
 7-May-15 znn0sub2  ---         deleted; use znn0sub or uznn0sub
 7-May-15 lt01      0lt1
 7-May-15 subopr    subf
 7-May-15 ax-ltxr   [--same--]  revised
 7-May-15 ax-mulopr ax-mulf
 7-May-15 ax-addopr ax-addf
 7-May-15 axmulopr  axmulf
 7-May-15 axaddopr  axaddf
 7-May-15 ---       ---         addcompi ~ ltresr: hypothesis removed
 7-May-15 fodomnumg ---         deleted; use fodomnum
 7-May-15 tskwe2    [--same--]  revised
 7-May-15 unictb    [--same--]  hypothesis removed
 7-May-15 iunctb    [--same--]  hypothesis removed
 7-May-15 infpss    [--same--]  hypothesis removed
 7-May-15 infmap1   [--same--]  deleted; use mappwen
 7-May-15 infxpidm  [--same--]  hypothesis removed
 7-May-15 carddomi  ---         deleted; use carddomi2 or carddom
 7-May-15 cardid    [--same--]  hypothesis added
 7-May-15 cardval   [--same--]  hypothesis added
 7-May-15 brdom4    [--same--]  hypothesis removed
 7-May-15 brdom5    [--same--]  hypothesis removed
 7-May-15 brdom3    [--same--]  hypothesis removed
 7-May-15 fodomb    [--same--]  hypothesis removed
 7-May-15 numth2    [--same--]  hypothesis added
 7-May-15 infmap2   infmap      hypothesis removed
 7-May-15 infxp     [--same--]  revised
 7-May-15 csdfillem infunsdom1  revised
 7-May-15 infxpabs  [--same--]  revised
 7-May-15 infxpdom  [--same--]  revised
 7-May-15 infdif2   [--same--]  revised
 7-May-15 infdif    [--same--]  revised
 7-May-15 infcda    [--same--]  revised
 7-May-15 infunabs  [--same--]  revised
 7-May-15 infcdaabs [--same--]  revised
 7-May-15 cardacda  [--same--]  revised
 7-May-15 cdainf    [--same--]  hypothesis removed
 7-May-15 cdadom3   [--same--]  revised: sethood antecedent
 7-May-15 cdadom2   [--same--]  hypothesis removed
 7-May-15 cdadom1   [--same--]  hypothesis removed
 7-May-15 mapcdaen  [--same--]  revised: sethood antecedent
 7-May-15 xpcdaen   [--same--]  revised: sethood antecedent
 7-May-15 cdaassen  [--same--]  revised: sethood antecedent
 7-May-15 cdacomen  [--same--]  hypothesis removed
 7-May-15 xp2cda    [--same--]  revised: sethood antecedent
 7-May-15 xp1en     [--same--]  revised: sethood antecedent
 7-May-15 cda0en    [--same--]  revised: sethood antecedent
 7-May-15 cdaeng    ---         deleted; use cdaen
 7-May-15 cdaen     [--same--]  hypothesis removed
 7-May-15 cdaung    cdaun
 7-May-15 cdaung    cdaun
 7-May-15 cda2en    [--same--]  revised: sethood antecedent
 7-May-15 cdaun     [--same--]  revised: sethood antecedent
 7-May-15 uncdadom  [--same--]  revised: sethood antecedent
 7-May-15 cdavali   [--same--]  deleted; use cdaval
 7-May-15 fodomnum  [--same--]  revised
 7-May-15 onssnum   [--same--]  revised
 7-May-15 ondomen   [--same--]  revised
 7-May-15 ween      [--same--]  revised
 7-May-15 aceq8b    [--same--]  revised
 7-May-15 aceq8a    [--same--]  revised
 7-May-15 mappwen   [--same--]  revised
 7-May-15 infxpidm2 [--same--]  revised
 7-May-15 fidomtri  [--same--]  hypothesis added
 7-May-15 ficardsdom cardsdom2  revised
 7-May-15 ficarddom carddom2    revised
 7-May-15 ficarden  carden2     revised
 7-May-15 carddom2  [--same--]  revised
 7-May-15 carddomi2 [--same--]  revised
 7-May-15 carden2b  [--same--]  hypothesis removed
 7-May-15 cardnueq0 [--same--]  revised
 7-May-15 cardid2   [--same--]  revised
 7-May-15 cardval3b ---         deleted; use ndmfv
 7-May-15 cardval3a ---         deleted; use cardval3
 7-May-15 cardval3  [--same--]  revised
 7-May-15 isfinite3 isfinite
 7-May-15 card2inf  [--same--]  hypothesis added
 7-May-15 fisup2g   fisupcl
 7-May-15 unbnn2    [--same--]  revised
 7-May-15 unbnn     [--same--]  revised
 7-May-15 f1finf1o  [--same--]  revised
 7-May-15 isfinite1 isfiniteg   revised
 7-May-15 omsdomnn  nnsdomg     revised
 7-May-15 unxpdom2  [--same--]  hypothesis removed
 7-May-15 0sdom1dom [--same--]  hypothesis removed
 7-May-15 sucdom    [--same--]  hypothesis removed
 7-May-15 sucdom2   [--same--]  hypothesis removed
 7-May-15 ssenen    [--same--]  hypothesis removed
 7-May-15 mapunen   [--same--]  revised: sethood antecedent
 7-May-15 mapxpen   [--same--]  revised: sethood antecedent
 7-May-15 mapdom2   [--same--]  hypothesis removed
 7-May-15 mapdom1   [--same--]  hypothesis removed
 7-May-15 mapen     [--same--]  hypothesis removed
 7-May-15 xpnum     [--same--]  revised
 7-May-15 xpeng     [--same--]  deleted; use xpen
 7-May-15 xpen      [--same--]  hypothesis removed
 7-May-15 tskwe     [--same--]  revised
 7-May-15 domssex   [--same--]  hypothesis removed
 7-May-15 fodomr    [--same--]  hypothesis removed
 7-May-15 onenon    [--same--]  revised
 7-May-15 sdomen2   [--same--]  hypothesis removed
 7-May-15 sdomen1   [--same--]  hypothesis removed
 7-May-15 domen2    [--same--]  hypothesis removed
 7-May-15 domen1    [--same--]  hypothesis removed
 7-May-15 enen2     [--same--]  hypothesis removed
 7-May-15 enen1     [--same--]  hypothesis removed
 7-May-15 sdomex    ---         deleted; use brrelex12
 7-May-15 sdomentr  [--same--]  hypothesis removed
 7-May-15 sdomdomtr [--same--]  hypothesis removed
 7-May-15 0dom      [--same--]  hypothesis added
 7-May-15 sbthbg    sbthb       hypothesis removed
 7-May-15 xpdom3    [--same--]  hypothesis added
 7-May-15 xpdom1    [--same--]  hypothesis removed
 7-May-15 xpdom1g   [--same--]  hypothesis removed
 7-May-15 xpdom2    [--same--]  hypothesis removed
 7-May-15 undom     [--same--]  hypothesis removed
 7-May-15 finnum    [--same--]  revised
 7-May-15 map1      [--same--]  revised: sethood antecedent
 7-May-15 mapsnen   [--same--]  hypothesis added
 7-May-15 2dom      [--same--]  hypothesis removed
 7-May-15 entr4i    [--same--]  hypothesis removed
 7-May-15 entr3i    [--same--]  hypothesis removed
 7-May-15 entr2i    [--same--]  hypothesis removed
 7-May-15 ensymi    [--same--]  hypothesis removed
 7-May-15 ensym     [--same--]  hypothesis removed
 7-May-15 ensymg    ---         deleted; use ensym
 7-May-15 ssdom2g   ssdomg
 7-May-15 ssdomg    [--same--]  revised
 7-May-15 dom3      dom2
 7-May-15 dom2      [--same--]  revised
 7-May-15 dom3d     dom2d
 7-May-15 dom2d     [--same--]  revised
 7-May-15 f1dom     [--same--]  revised
 7-May-15 f1dom2g   f1domg
 7-May-15 f1domg    [--same--]  revised
 7-May-15 bren      [--same--]  hypothesis removed
 7-May-15 breng     ---         deleted; use bren
 7-May-15 ixpssmap  [--same--]  hypothesis removed
 7-May-15 ixpssmapg [--same--]  hypothesis removed
 7-May-15 mapss     [--same--]  revised: sethood antecedent
 7-May-15 map0b     [--same--]  hypothesis removed
 7-May-15 map0e     [--same--]  revised: sethood antecedent
 7-May-15 mapsspw   [--same--]  hypothesis removed
 7-May-15 pmresg    [--same--]  hypothesis removed
 7-May-15 elmapi    [--same--]  hypothesis removed
 7-May-15 elmapex1  elmapex     revised
 7-May-15 eceqoveq  [--same--]  hypothesis removed
 7-May-15 ecopovtrn [--same--]  hypothesis removed
 7-May-15 ecopovsym [--same--]  hypothesis removed
 7-May-15 brecop2   [--same--]  hypothesis removed
 7-May-15 errsym    [--same--]  hypothesis removed
 7-May-15 curry2val [--same--]  hypothesis removed
 7-May-15 curry1val [--same--]  hypothesis removed
 7-May-15 eqop      [--same--]  hypothesis removed
 7-May-15 ot2ndg    [--same--]  hypothesis added
 7-May-15 ot1stg    [--same--]  hypothesis added
 7-May-15 op1stg    [--same--]  hypothesis added
 7-May-15 op1st     [--same--]  hypothesis added
 7-May-15 caovmo    [--same--]  hypothesis removed
 7-May-15 ndmovordi [--same--]  hypothesis removed
 7-May-15 ndmovord  [--same--]  hypothesis removed
 7-May-15 ndmovdistr [--same--] hypothesis removed
 7-May-15 ndmovass  [--same--]  hypothesis removed
 7-May-15 ndmovcom  [--same--]  hypothesis removed
 7-May-15 ndmovrcl  [--same--]  hypothesis removed
 7-May-15 ndmov     [--same--]  hypothesis removed
 7-May-15 ndmovcl   [--same--]  revised
 7-May-15 ndmovg    [--same--]  hypothesis removed
 7-May-15 fnopovb   fnotovb     revised; hypothesis removed
 7-May-15 ovprc2if  ---         deleted
 7-May-15 ovprc2    [--same--]  revised
 7-May-15 fvopab3   fvopab3g    revised: sethood antecedent
 7-May-15 fniniseg  [--same--]  hypothesis removed
 7-May-15 funbrfv2bg funbrfv2b  hypothesis removed
 7-May-15 funbrfvbg ---         deleted; use funbrfvb
 7-May-15 funopfvb  [--same--]  hypothesis removed
 7-May-15 funbrfvb  [--same--]  hypothesis removed
 7-May-15 fnbrfvb   [--same--]  hypothesis removed
 7-May-15 fnbrfvbg  ---         deleted; use fnbrfvb
 7-May-15 funopfvg  ---         deleted; use funopfv
 7-May-15 funopfv   [--same--]  hypothesis removed
 7-May-15 funbrfv   [--same--]  hypothesis removed
 7-May-15 opelf     [--same--]  hypothesis added
 7-May-15 fnunsn    [--same--]  hypothesis added; deduction form
 7-May-15 fntp      [--same--]  hypothesis added
 7-May-15 fnprg     [--same--]  hypothesis added
 7-May-15 fnsn      [--same--]  hypothesis added
 7-May-15 funtp     [--same--]  hypothesis added
 7-May-15 funpr     [--same--]  hypothesis added
 7-May-15 funprg    [--same--]  hypothesis added
 7-May-15 funsng    [--same--]  hypothesis added
 7-May-15 funsn     [--same--]  hypothesis added
 7-May-15 funopg    [--same--]  hypothesis added
 7-May-15 rnsnop    [--same--]  hypothesis removed
 7-May-15 cnvsn     [--same--]  hypothesis added
 7-May-15 op1sta    [--same--]  hypothesis added
 7-May-15 dmtpop    [--same--]  hypothesis added
 7-May-15 dmprop    [--same--]  hypothesis added
 7-May-15 dmsnop    [--same--]  hypothesis added
 7-May-15 irrexi    ---         deleted; use brrelex12
 7-May-15 relelrng  [--same--]  hypothesis removed
 7-May-15 breldmg   [--same--]  hypothesis added
 7-May-15 breldm    [--same--]  hypothesis added
 7-May-15 opeldm    [--same--]  hypothesis added
 7-May-15 issetid   [--same--]  revised
 7-May-15 opelxpex2 ---         deleted; use opelxp2
 7-May-15 opeliunxp2 [--same--] hypothesis removed
 7-May-15 relsnop   [--same--]  hypothesis added
 7-May-15 brinxp2   [--same--]  hypothesis removed
 7-May-15 opeliunxpg opeliunxp  hypothesis removed
 7-May-15 brel      [--same--]  hypothesis removed
 7-May-15 brelg     ---         deleted; use brel
 7-May-15 opprc4b   ---         deleted
 7-May-15 opelvv    [--same--]  hypothesis added
 7-May-15 opelxpv   ---         deleted
 7-May-15 brxp      [--same--]  hypothesis removed
 7-May-15 opelxpg   ---         deleted; use opelxp
 7-May-15 opelxp    [--same--]  hypothesis removed
 7-May-15 vtoclribr ---         deleted; use vtoclr
 7-May-15 vtoclrbr  ---         deleted; use vtoclr
 7-May-15 vtoclr    [--same--]  hypothesis removed
 7-May-15 op1stb    [--same--]  hypothesis added
 7-May-15 wereucl   [--same--]  revised: sethood antecedent
 7-May-15 wereu     [--same--]  revised: sethood antecedent
 7-May-15 epelc     [--same--]  hypothesis removed
 7-May-15 uniopel   [--same--]  hypothesis added
 7-May-15 uniop     [--same--]  hypothesis added
 7-May-15 euop2     [--same--]  hypothesis added
 7-May-15 opeqpr    [--same--]  hypothesis added
 7-May-15 moop2     [--same--]  hypothesis added
 7-May-15 opcom     [--same--]  hypothesis added
 7-May-15 opth2     ---         deleted; use opth or opth2
 7-May-15 oteqex    [--same--]  revised
 7-May-15 opeqex    [--same--]  revised
 7-May-15 opprc3    ---         deleted
 7-May-15 opprc1b   0nelop      revised
 7-May-15 opnz      [--same--]  hypothesis added; revised (use opnz or opnzi)
 7-May-15 otthg     otth        hypothesis removed
 7-May-15 otthg2    otth2       hypothesis removed
 7-May-15 opthgg    opthg       hypothesis removed
 7-May-15 opthg2    ---         deleted; use opth2
 7-May-15 opthg     ---         deleted; use opth
 7-May-15 opth      [--same--]  hypothesis removed
 7-May-15 opth1     [--same--]  hypothesis added
 7-May-15 opi2      [--same--]  hypothesis added
 7-May-15 opi1      [--same--]  hypothesis added
 7-May-15 elop      [--same--]  hypothesis added
 7-May-15 brprc     ---         deleted
 7-May-15 opprc2if  ---         deleted
 7-May-15 opprc2    [--same--]  revised
 7-May-15 opprc1    [--same--]  revised
 7-May-15 opid      [--same--]  hypothesis added
 7-May-15 ralsng    ralsns
 7-May-15 ralsn     [--same--]  revised
 7-May-15 raltp     [--same--]  revised
 7-May-15 rexpr     [--same--]  revised
 7-May-15 ralpr     [--same--]  revised
 7-May-15 rexprg    [--same--]  revised
 7-May-15 ralprg    [--same--]  revised
 7-May-15 df-op     [--same--]  revised; see dfop or dfopg
14-Apr-15 mptiniseg [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 mptcnvima mptpreima   moved from SO's mathbox to main set.mm
14-Apr-15 resmpt3   [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 fidomtri  [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 ficardsdom [--same--] moved from SO's mathbox to main set.mm
14-Apr-15 euen1     [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 reuen1    [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 dvdsadd2b [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 riincld   [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 cmpfii    [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 tgdom     [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 eltg4i    [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 fopwdom   [--same--]  moved from SO's mathbox to main set.mm
14-Apr-15 fclsfcn   cnfcf       (in JGH's mathbox)
14-Apr-15 fclsfcnp  cnpfcf      (in JGH's mathbox)
14-Apr-15 fclsfneii fcfneii     (in JGH's mathbox)
14-Apr-15 fclsfelbas fcfelbas   (in JGH's mathbox)
14-Apr-15 fclusfnei fcfnei      (in JGH's mathbox)
14-Apr-15 isfclusf  isfcf       (in JGH's mathbox)
14-Apr-15 sfclusf   fcfval      (in JGH's mathbox) revised
14-Apr-15 fclusff   ---         (in JGH's mathbox) deleted; use fcfval
14-Apr-15 ufcomp    ufilcmp     (in JGH's mathbox) revised
14-Apr-15 fcluscomp fclscmp     (in JGH's mathbox) revised
14-Apr-15 fcluscn   fclscn      (in JGH's mathbox) revised
14-Apr-15 fcluscnp  fclscnp     (in JGH's mathbox) revised
14-Apr-15 uffclsflim [--same--] (in JGH's mathbox) revised
14-Apr-15 flimfnfcls [--same--] (in JGH's mathbox) revised
14-Apr-15 fclsfnflim [--same--] (in JGH's mathbox) revised
14-Apr-15 flimfcls  [--same--]  (in JGH's mathbox) revised
14-Apr-15 fcluscf   fclscf      (in JGH's mathbox)
14-Apr-15 fclusss   fclsss2     (in JGH's mathbox) revised
14-Apr-15 fclusbas  fclsopn     (in JGH's mathbox) revised
14-Apr-15 fclusneii fclsneii    (in JGH's mathbox) revised
14-Apr-15 fclselbas [--same--]  (in JGH's mathbox) revised
14-Apr-15 fclusnei  fclsnei     (in JGH's mathbox)
14-Apr-15 isfclus   isfcls      (in JGH's mathbox) revised
14-Apr-15 filclus   fclsval     (in JGH's mathbox) revised
14-Apr-15 sfcls     ---         (in JGH's mathbox) deleted; use fclsval
14-Apr-15 flimfcn   cnflf       moved from JGH's mathbox to main set.mm;revised
14-Apr-15 flimfcnp  cnpflf      moved from JGH's mathbox to main set.mm;revised
14-Apr-15 flimfbas  [--same--]  (in JGH's mathbox) revised
14-Apr-15 fmfnfm    [--same--]  (in JGH's mathbox) revised
14-Apr-15 rnelfmlem [--same--]  (in JGH's mathbox) revised
14-Apr-15 imaelfm   [--same--]  moved from JGH's mathbox to main set.mm
14-Apr-15 cnfillim  cnflf       moved from JGH's mathbox to main set.mm;revised
14-Apr-15 cnpfillim cnpflf      moved from JGH's mathbox to main set.mm;revised
14-Apr-15 flimcls   [--same--]  moved from JGH's mathbox to main set.mm;revised
14-Apr-15 limfilcf  flimcf      moved from JGH's mathbox to main set.mm;revised
14-Apr-15 neiplim   neiflim     moved from JGH's mathbox to main set.mm;revised
14-Apr-15 df-fclusf df-fcf      (in JGH's mathbox)
14-Apr-15 df-fclus  df-fcls     (in JGH's mathbox)
14-Apr-15 cfclusf   cfcf        (in JGH's mathbox)
14-Apr-15 cfclus    cfcls       (in JGH's mathbox)
14-Apr-15 ---       ---         df-1stc ~ 2ndcctbss moved from JGH's mathbox to
                                main set.mm
14-Apr-15 fictb     [--same--]  moved from JGH's mathbox to main set.mm
14-Apr-15 uncon     [--same--]  moved from FL's mathbox to main set.mm
14-Apr-15 iuncon    [--same--]  moved from FL's mathbox to main set.mm
14-Apr-15 flimfneicn flfneicn   (in FL's mathbox)
14-Apr-15 flimfneic flfneic     (in FL's mathbox)
14-Apr-15 flimfnein flfnein     (in FL's mathbox)
14-Apr-15 clindistop indiscld   moved from FL's mathbox to main set.mm
14-Apr-15 clsingemp sn0cld      moved from FL's mathbox to main set.mm
14-Apr-15 dtt2      dishaus     moved from FL's mathbox to main set.mm; revised
14-Apr-15 dtopcl    discld      moved from FL's mathbox to main set.mm; revised
14-Apr-15 flimfnei2 flfnei2     (in FL's mathbox)
14-Apr-15 cnpfillim4 cnpflf4    (in FL's mathbox) revised
14-Apr-15 conttnf   cnpflf2     moved from FL's mathbox to main set.mm; revised
14-Apr-15 flimfneih flfneih     (in FL's mathbox)
14-Apr-15 trnei     [--same--]  moved from FL's mathbox to main set.mm; revised
14-Apr-15 trfil     ---         moved from FL's mathbox to main set.mm; revised
                                (split into trfil1, trfil2)
14-Apr-15 fbfgss2   fil2ss      (in FL's mathbox)
14-Apr-15 fbaslim2  fbflim2     moved from FL's mathbox to main set.mm; revised
14-Apr-15 elfilnemp fileln0     moved from FL's mathbox to main set.mm
14-Apr-15 distopg   distop      moved from FL's mathbox to main set.mm
14-Apr-15 neindisj2 [--same--]  moved from FL's mathbox to main set.mm
14-Apr-15 surjsec   fcofo       moved from FL's mathbox to main set.mm
14-Apr-15 injrec    fcof1       moved from FL's mathbox to main set.mm
14-Apr-15 pw2eng    [--same--]  moved from FL's mathbox to main set.mm
14-Apr-15 surrc2    cocan2      moved from FL's mathbox to main set.mm
14-Apr-15 njtlc     cocan1      moved from FL's mathbox to main set.mm; revised
14-Apr-15 tanord    [--same--]  revised
14-Apr-15 dvmptco   [--same--]  revised
14-Apr-15 dvmptim   [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptre   [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptcj   [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptsub  [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptneg  [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptcmul [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptres  [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptres2 [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptmul  [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptadd  [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmptcl   [--same--]  revised: eliminated hypothesis
14-Apr-15 dvcof     [--same--]  revised
14-Apr-15 dvco      [--same--]  revised
14-Apr-15 dvcobr    [--same--]  revised
14-Apr-15 dvcmulf   [--same--]  revised: eliminated hypothesis
14-Apr-15 dvmulf    [--same--]  revised: eliminated hypothesis
14-Apr-15 dvaddf    [--same--]  revised: eliminated hypothesis
14-Apr-15 ovolmgt0  ovolmge0    revised
14-Apr-15 ---       ---         df-ovol ~ ovolgelb revised
14-Apr-15 isphtpc   [--same--]  revised
14-Apr-15 df-phtpc  [--same--]  revised
14-Apr-15 phtpyco   phtpycc     revised
14-Apr-15 isphtpy   [--same--]  revised
14-Apr-15 df-phtpy  [--same--]  revised
14-Apr-15 holimf2   hausflf2
14-Apr-15 holimf    hausflf
14-Apr-15 hausflim2 hausflimi
14-Apr-15 flimfelbas flfelbas
14-Apr-15 isflimf   isflf
14-Apr-15 flimfneii flfneii
14-Apr-15 flimfnei  flfnei
14-Apr-15 fbfgfmeq  fmfg
14-Apr-15 fmbas     fmuni       swapped equality arguments
14-Apr-15 fmval     [--same--]  revised
14-Apr-15 fmfval    [--same--]  revised
14-Apr-15 df-fm     [--same--]  revised
14-Apr-15 fbaslim   fbflim      revised
14-Apr-15 limfilss  flimss2     revised
14-Apr-15 df-flim   [--same--]  revised ( ( fLim`J )`F ) -> ( J fLim F )
                                (affects all flim* theorems)
14-Apr-15 filrn     [--same--]  revised
14-Apr-15 fgid      fgfil
14-Apr-15 fgfil     fgcl
14-Apr-15 fbfgss    fgss2
14-Apr-15 fgbas     fguni
14-Apr-15 fbssfg    ssfg
14-Apr-15 fgf       fgval
14-Apr-15 emnfil    filn0
14-Apr-15 fipfil2   filintn0
14-Apr-15 fipfil    filinn0
14-Apr-15 filusb    filtop
14-Apr-15 filint    filin
14-Apr-15 fillsb    filss       rearranged hypotheses
14-Apr-15 filesn    0nelfil
14-Apr-15 nconsubb  [--same--]  revised
14-Apr-15 nconsuba  ---         deleted; use nconsubb
14-Apr-15 consuba   ---         deleted; use connsub or nconsubb
14-Apr-15 usinuniop ---         deleted; use dfcon2 or conndisj
14-Apr-15 iscon     [--same--]  revised
14-Apr-15 stoig2    subspuni
14-Apr-15 stoig3    subsptop
14-Apr-15 neiuni    unnei       swapped equality arguments
14-Apr-15 distop    [--same--]  revised
14-Apr-15 prdmbasex [--same--]  revised
14-Apr-15 rlimi     [--same--]  revised
14-Apr-15 rlim0lt   [--same--]  revised
14-Apr-15 rlim0     [--same--]  revised
14-Apr-15 rlim3     [--same--]  revised
14-Apr-15 rlim2lt   [--same--]  revised
14-Apr-15 rlim2     [--same--]  revised
14-Apr-15 recvalzi  recval      revised
14-Apr-15 fzsdom2   [--same--]  revised
14-Apr-15 hashfz    [--same--]  revised
14-Apr-15 hashfn    [--same--]  revised: eliminated hypothesis
14-Apr-15 iccss     [--same--]  revised
14-Apr-15 iooss2    [--same--]  revised
14-Apr-15 iooss1    [--same--]  revised
14-Apr-15 ixxss2    [--same--]  revised
14-Apr-15 ixxss1    [--same--]  revised
14-Apr-15 pwen      [--same--]  revised: eliminated hypothesis
14-Apr-15 mpt2eq123 [--same--]  revised
12-Apr-15 sneqbg    [--same--]  moved from SF's mathbox to main set.mm
12-Apr-15 sneqrg    [--same--]  moved from SF's mathbox to main set.mm
 9-Apr-15 lspsnvsel lspsneli
 9-Apr-15 lmodvsinv lmodvsneg   moved from SO's mathbox to main set.mm; revised
 7-Apr-15 grpsubinv grpinvsub
22-Mar-15 lspsneli  [--same--]  obsolete; use lspsnvsel
21-Mar-15 lspsnmul  lspsnvsel
21-Mar-15 lvecmulcan2 lvecvscan2
21-Mar-15 lvecmulcan lvecvscan
21-Mar-15 lvecmuln0 lvecvsn0
21-Mar-15 lvecmul0or lvecvs0or
12-Mar-15 0vid      lmod0vid
12-Mar-15 0vrid     lmod0vrid
12-Mar-15 0vlid     lmod0vlid
12-Mar-15 0vcl      lmod0vcl
28-Feb-15 cnvcan    funcocnv2   moved from JM's mathbox to main set.mm
17-Feb-15 hauseqlcld [--same--] moved from SO's mathbox to main set.mm
17-Feb-15 hausdiag  [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 eltpt2    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 xpssres   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 c1lip3    [--same--]  (in SO's mathbox) revised
17-Feb-15 c1lip2    [--same--]  (in SO's mathbox) revised
17-Feb-15 c1lip     [--same--]  (in SO's mathbox) revised
17-Feb-15 plycpn    [--same--]  (in SO's mathbox) revised
17-Feb-15 dvnply    [--same--]  (in SO's mathbox) revised
17-Feb-15 cpnord    [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 elcpn     [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 fncpn     [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvnbss    [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvnf      [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvnp1     [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvn0      [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvf2      dvf         moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvply2    [--same--]  (in SO's mathbox) revised
17-Feb-15 dvply1    [--same--]  (in SO's mathbox) revised
17-Feb-15 dvexp2    [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 dvmptfsum [--same--]  moved from SO's mathbox to main set.mm; revised
17-Feb-15 wemapso   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 wemappo   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 soltmin   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 somin2    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 somincom  [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 somin1    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 poltletr  [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 poleloe   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 fresaunres2 [--same--] moved from SO's mathbox to main set.mm
17-Feb-15 fresaun   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 resasplit [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 elmapi    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 elmapex1  [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 fndmin    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 fndmdifeq0 [--same--] moved from SO's mathbox to main set.mm
17-Feb-15 fndmdifcom [--same--] moved from SO's mathbox to main set.mm
17-Feb-15 fndmdif   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 ralima    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 rexima    [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 fvssunirn [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 fvelrn0   fvrn0       moved from SO's mathbox to main set.mm
17-Feb-15 fvbr0     [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 difopab   [--same--]  moved from SO's mathbox to main set.mm
17-Feb-15 df-maxidl [--same--]  moved from JM's mathbox to main set.mm
17-Feb-15 df-pridl  [--same--]  moved from JM's mathbox to main set.mm
17-Feb-15 df-idl    [--same--]  moved from JM's mathbox to main set.mm
17-Feb-15 conntoppr [--same--]  moved from JGH's mathbox to main set.mm
17-Feb-15 cnconn    [--same--]  moved from JGH's mathbox to main set.mm
17-Feb-15 alexsub   [--same--]  moved from JGH's mathbox to main set.mm
17-Feb-15 finsschain [--same--] moved from JGH's mathbox to main set.mm
17-Feb-15 nconsubb  [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 nconsuba  [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 consuba   [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 istos     [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 df-toset  [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 unprj     undifixp    moved from FL's mathbox to main set.mm
17-Feb-15 eltpg     [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 inpreima2 intpreima   moved from FL's mathbox to main set.mm
17-Feb-15 inpreima5 iinpreima   moved from FL's mathbox to main set.mm
17-Feb-15 fveq12i   [--same--]  moved from FL's mathbox to main set.mm
17-Feb-15 fvrn0     [--same--]  moved from SF's mathbox to main set.mm
17-Feb-15 ---       ---         dvaddbr ~ itgsubst revised
17-Feb-15 dvaddbr   [--same--]  revised
19-Jan-15 ---       ---         df-dv ~ dvcn revised
17-Feb-15 df-dv     [--same--]  revised
17-Feb-15 pi1set    ---         deleted; use pi1bval
17-Feb-15 pi1gp     [--same--]  revised
17-Feb-15 pi1val    pi1pval     revised
17-Feb-15 pi1f      [--same--]  revised
17-Feb-15 pi1fval   [--same--]  revised
17-Feb-15 pi1bvalqs [--same--]  revised
17-Feb-15 elpi1i    [--same--]  revised
17-Feb-15 elpi1     [--same--]  revised
17-Feb-15 pi1bval   [--same--]  revised
17-Feb-15 df-pi1    [--same--]  revised
17-Feb-15 df-pi1b   ---         deleted; use df-pi1
17-Feb-15 iscmp     [--same--]  revised
17-Feb-15 symgcl    [--same--]  revised
17-Feb-15 symgov    [--same--]  revised
17-Feb-15 symgplusg [--same--]  revised
17-Feb-15 symgbas   [--same--]  revised
17-Feb-15 proplem2  [--same--]  revised
17-Feb-15 df-pt     [--same--]  revised
17-Feb-15 ---       ---         math token "tP" changed to "Xt_"
17-Feb-15 mapixp    ---         deleted; use ixpconst
 8-Feb-15 posprs    posprsr     (in FL's mathbox)
 8-Feb-15 isprs     isprsr      (in FL's mathbox)
 8-Feb-15 cpreset   [--same--]  moved from FL's mathbox to main set.mm
 8-Feb-15 df-preset [--same--]  moved from FL's mathbox to main set.mm
28-Jan-15 strssd    [--same--]  moved from NM's mathbox to main set.mm
28-Jan-15 strfvd    [--same--]  moved from NM's mathbox to main set.mm
28-Jan-15 strfvnd   [--same--]  moved from NM's mathbox to main set.mm
28-Jan-15 r1omNEW   r1om        moved from SO's mathbox to main set.mm
28-Jan-15 ackbij2   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 ackbij1b  [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 ackbij1   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 onpsssuc  [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 f1opw     [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 djudisj   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 djussxp   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 xpsnen2g  [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 nnunifi   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 fzsdom2   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 hashfz    [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 isinffi   [--same--]  moved from SO's mathbox to main set.mm
28-Jan-15 isprj2    [--same--]  (in FL's mathbox) revised
28-Jan-15 prdmbasex [--same--]  revised
28-Jan-15 ixpexg    [--same--]  revised
19-Jan-15 ---       ---         strlemor0 ~ prdmlmodd moved from SO's mathbox
                                to main set.mm
19-Jan-15 lspf      [--same--]  moved from SO's mathbox to main set.mm
19-Jan-15 lsslsp    [--same--]  moved from SO's mathbox to main set.mm
19-Jan-15 lsslss    [--same--]  moved from SO's mathbox to main set.mm
19-Jan-15 ---       ---         cghm ~ reslmhm moved from SO's mathbox to main
                                set.mm
19-Jan-15 elfz1end  [--same--]  moved from SO's mathbox to main set.mm
19-Jan-15 curgrpact [--same--]  (in FL's mathbox) revised
19-Jan-15 rngapm    [--same--]  (in FL's mathbox) revised
19-Jan-15 gapm2     [--same--]  (in FL's mathbox) revised
19-Jan-15 gaplc     galcan      moved from FL's mathbox to main set.mm; revised
19-Jan-15 symgfo    [--same--]  (in FL's mathbox) revised
19-Jan-15 ltlga     gaid2       moved from FL's mathbox to main set.mm; revised
19-Jan-15 cayleyth  [--same--]  moved from PC's mathbox to main set.mm; revised
19-Jan-15 cayleyi   cayley      moved from PC's mathbox to main set.mm; revised
19-Jan-15 symggrp   [--same--]  moved from PC's mathbox to main set.mm; revised
19-Jan-15 tgss      [--same--]  revised
19-Jan-15 unitg     [--same--]  revised
19-Jan-15 bastg     [--same--]  revised
19-Jan-15 tg2       [--same--]  revised
19-Jan-15 tg1       [--same--]  revised
19-Jan-15 eltg2b    [--same--]  revised
19-Jan-15 eltg2     [--same--]  revised
19-Jan-15 eltg      [--same--]  revised
19-Jan-15 tgval2    [--same--]  revised
19-Jan-15 tgval     [--same--]  revised
19-Jan-15 df-topgen [--same--]  revised
19-Jan-15 symgidi   symgid      revised
19-Jan-15 symggrpi  symggrp     revised
19-Jan-15 symgov    [--same--]  revised
19-Jan-15 symgval   symgplusg   revised
19-Jan-15 elsymgrn  elsymgbas   revised
19-Jan-15 df-symg   [--same--]  revised
19-Jan-15 gapm      [--same--]  revised
19-Jan-15 gacan     [--same--]  revised
19-Jan-15 gaass     [--same--]  revised
19-Jan-15 gagrpid   [--same--]  revised
19-Jan-15 gaf       [--same--]  revised
19-Jan-15 gagrp     [--same--]  revised
19-Jan-15 ssga      subgga      revised
19-Jan-15 gaid      [--same--]  revised
19-Jan-15 ga0       [--same--]  revised
19-Jan-15 isga2     ---         deleted; use isga
19-Jan-15 gafo      [--same--]  revised
19-Jan-15 isga      [--same--]  revised
19-Jan-15 df-ga     [--same--]  revised
19-Jan-15 grplactf1o [--same--] revised
19-Jan-15 grplactval [--same--] revised
19-Jan-15 grplactfval [--same--] revised
19-Jan-15 islbs2    islbs3      revised
19-Jan-15 lbspss    [--same--]  revised
19-Jan-15 lbsind    lbsind2     revised
19-Jan-15 lbssp     [--same--]  revised
19-Jan-15 lbsel     [--same--]  revised
19-Jan-15 lbsss     [--same--]  revised
19-Jan-15 islbs     [--same--]  revised; see also islbs2
19-Jan-15 lbsval    ---         deleted; use islbs
19-Jan-15 df-lbs    [--same--]  revised
19-Jan-15 lssne0    [--same--]  revised
19-Jan-15 lsscl     [--same--]  revised
19-Jan-15 lssn0     [--same--]  revised
19-Jan-15 lssel     [--same--]  revised
19-Jan-15 lssss     [--same--]  revised
19-Jan-15 islssd    [--same--]  revised
19-Jan-15 islss     [--same--]  revised
19-Jan-15 lagsubglem2 lagsubg2  revised
19-Jan-15 lagsubglem1 eqger     revised
19-Jan-15 issubg2   [--same--]  revised
19-Jan-15 odphi     odzphi
19-Jan-15 oddvds    odzdvds
19-Jan-15 odid      odzid
19-Jan-15 odcl      odzcl
19-Jan-15 odcllem   odzcllem
19-Jan-15 odval     odzval
19-Jan-15 df-od     df-odz
19-Jan-15 cod       codz
19-Jan-15 ---       ---         math token "od" changed to "odZ"
10-Jan-15 lsmss1xxx lsmss2
10-Jan-15 lsmss1    lsmss2
10-Jan-15 lsmss2    lsmss1xxx
 9-Jan-15 mpbiran   [--same--]  changed hypothesis order
 9-Jan-15 mpbiran2  [--same--]  changed hypothesis order
 9-Jan-15 mpbir2an  [--same--]  changed hypothesis order
 9-Jan-15 mpbi2and  [--same--]  changed hypothesis order
 9-Jan-15 mpbir2and [--same--]  changed hypothesis order
 9-Jan-15 mpbir3an  [--same--]  changed hypothesis order
 9-Jan-15 mpbir3and [--same--]  changed hypothesis order
 8-Jan-15 lsmmod    [--same--]  swapped equality arguments
 8-Jan-15 ficarddom [--same--]  swapped biconditional arguments
 7-Jan-15 algvsca   [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algsca    [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algmulr   [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algaddg   [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algbase   [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algfun    [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 algfn     [--same--]  moved from SO's mathbox to main set.mm
 7-Jan-15 crngcom   crngocom
 7-Jan-15 ---       ---         math token "CRing" changed to "CRingOps"
 7-Jan-15 df-mnd2   df-mnd      moved from FL's mathbox to main set.mm
 7-Jan-15 mndass2   mndoass2
 7-Jan-15 mndass    mndoass
 7-Jan-15 mndio     mndoio
 7-Jan-15 mndid     mndoid
 7-Jan-15 mndisass  mndoisass
 7-Jan-15 df-tsms   rngomndo
 7-Jan-15 rngomnd   rngomndo
 7-Jan-15 grpomnd   grpomndo
 7-Jan-15 ismnd2    ismndo2
 7-Jan-15 ismnd1    ismndo1
 7-Jan-15 ismnd     ismndo
 7-Jan-15 mndmgmid  mndomgmid
 7-Jan-15 mndismgm  mndoismgm
 7-Jan-15 mndisexid mndoisexid
 7-Jan-15 mndissmgrp mndoissmgrp
 7-Jan-15 df-mnd    df-mndo
 7-Jan-15 cmnd      cmndo
 7-Jan-15 ---       ---         math token "Mnd" changed to "MndOp"
 7-Jan-15 grp2grpo  ---         deleted (commented out)
 7-Jan-15 unitpropd [--same--]  revised: eliminated hypothesis
 7-Jan-15 dvdsrpropd [--same--] revised: eliminated hypothesis
 7-Jan-15 dvdsrmul2 dvdsrmul1   revised
 7-Jan-15 dvdsrmul  [--same--]  revised
 7-Jan-15 dvdsr2    [--same--]  revised
 7-Jan-15 dvdsr     [--same--]  revised
 7-Jan-15 dvdsrval  [--same--]  revised
 7-Jan-15 df-dvdsr  [--same--]  revised (changed from left-divisible to right)
 7-Jan-15 ringi     [--same--]  revised
 7-Jan-15 isring    [--same--]  revised
 7-Jan-15 df-ring   [--same--]  revised
 7-Jan-15 gsum2d    [--same--]  revised
 7-Jan-15 ---       ---         all gsum* theorems revised for CMnd
 7-Jan-15 mulgnndi  mulgnn0di   revised
 7-Jan-15 abl4      cmn4        revised
 7-Jan-15 abl32     cmn32       revised
 7-Jan-15 isabld    [--same--]  reordered hypotheses
 7-Jan-15 isabl     isabl2
 7-Jan-15 df-abl    [--same--]  revised
 7-Jan-15 mulgnn0ass [--same--] revised
 7-Jan-15 mulgnnass [--same--]  revised
 7-Jan-15 mulgnn0dir [--same--] revised
 7-Jan-15 mulgnndir [--same--]  revised
 7-Jan-15 mulgnn0z  [--same--]  revised
 7-Jan-15 mulgnn0cl [--same--]  revised
 7-Jan-15 mulgnncl  [--same--]  revised
 7-Jan-15 mulgnn0p1 [--same--]  revised
 7-Jan-15 grpinv    ---         deleted; use grplinv, grprinv
 7-Jan-15 isgrpid   ---         deleted; use ismgmid
 7-Jan-15 grpidinv2 ---         deleted; use grplid, grprid, grpinvex
 7-Jan-15 isgrpi    [--same--]  revised: eliminated hypothesis
 7-Jan-15 isgrpiOLD ---         deleted
 7-Jan-15 isgrpdOLD ---         deleted
 7-Jan-15 isgrprd   ---         deleted
 7-Jan-15 isgrpd    [--same--]  revised: eliminated hypothesis
 7-Jan-15 grppropOLD ---        deleted; use grpprop
 7-Jan-15 elgrp     ---         deleted; use isgrp
 7-Jan-15 grpideu2  ---         deleted; use grpideu or grpridd
 7-Jan-15 grpidinv  ---         deleted; use grpinvex
 7-Jan-15 ---       ---         grpidinvlem1 - grpidinvlem4 deleted
 7-Jan-15 grplidinv             deleted; use grpinvex
 7-Jan-15 grplem1   ---         deleted
 7-Jan-15 isgrp2    ---         deleted; use isgrp
 7-Jan-15 isgrp     [--same--]  revised
 7-Jan-15 df-grp    [--same--]  revised
 7-Jan-15 df-mpq    [--same--]  revised
 7-Jan-15 df-plpq   [--same--]  revised
 7-Jan-15 fineqv    [--same--]  revised
 7-Jan-15 erovlem   [--same--]  revised
 7-Jan-15 eroveu    [--same--]  revised
 7-Jan-15 ovmpt2    [--same--]  changed distinct vars
 7-Jan-15 ovmpt2g   [--same--]  changed distinct vars
 7-Jan-15 grplidd   grpridd     revised
 7-Jan-15 grplinvd  grprinvd    revised
 7-Jan-15 grplinvlem2 ---       deleted
 7-Jan-15 grplinvlem1 grprinvlem revised
 7-Jan-15 caovcld   caovclg
 7-Jan-15 posn      [--same--]  revised
 7-Jan-15 sbcbidv   sbcbidgv
 7-Jan-15 sbcbid    sbcbidg
28-Dec-14 grpnegprop ---        (in SO's mathbox) deleted; use grpinvpropd
28-Dec-14 grpidprop ---         (in SO's mathbox) deleted; use grpidpropd
28-Dec-14 fvco4     fvco2       moved from SO's mathbox to main set.mm
28-Dec-14 injrec    [--same--]  (in FL's mathbox) revised
28-Dec-14 subrgugrp [--same--]  revised
28-Dec-14 drngid    [--same--]  revised
28-Dec-14 drngmgrp  [--same--]  revised
28-Dec-14 isdrng2   [--same--]  revised
28-Dec-14 invrfval  [--same--]  revised
28-Dec-14 df-invr   [--same--]  revised
28-Dec-14 unitgrpid [--same--]  revised
28-Dec-14 unitgrp   [--same--]  revised
28-Dec-14 rngidval  [--same--]  revised
28-Dec-14 df-ur     [--same--]  revised
28-Dec-14 df-gsum   [--same--]  revised
28-Dec-14 grpsubval [--same--]  revised: eliminated hypothesis
28-Dec-14 grpidval  [--same--]  revised
28-Dec-14 grpproplem proplem
28-Dec-14 grpproplem2 proplem2
28-Dec-14 grpideu   grpideu2
28-Dec-14 df-0g     [--same--]  revised
28-Dec-14 algrflem  [--same--]  revised: eliminated hypothesis
28-Dec-14 fvco3     [--same--]  revised: eliminated hypothesis
28-Dec-14 fvco2     [--same--]  revised: eliminated hypothesis
28-Dec-14 fvco      [--same--]  revised: eliminated hypothesis
28-Dec-14 hbcsb1    [--same--]  revised: eliminated hypothesis
28-Dec-14 hbsbc1    hbsbc1g2
27-Dec-14 a1i12     a1ii
27-Dec-14 fmpt2d    [--same--]  revised: weakened hypothesis
 5-Dec-14 df-cnfld  [--same--]  moved from SO's mathbox to main set.mm
 5-Dec-14 grppropd  [--same--]  moved from SO's mathbox to main set.mm
 5-Dec-14 df-ress   [--same--]  moved from SO's mathbox to main set.mm
 5-Dec-14 ghsubg    ghsubgo
 5-Dec-14 zaddsubg  zaddsubgo
 5-Dec-14 readdsubg readdsubgo
 5-Dec-14 subgablo  subgoablo
 5-Dec-14 issubgi   issubgoi
 5-Dec-14 subginv   subgoinv
 5-Dec-14 subgid    subgoid
 5-Dec-14 subgrnss  subgornss
 5-Dec-14 subgov    subgoov
 5-Dec-14 subgres   subgores
 5-Dec-14 issubg    issubgo
 5-Dec-14 df-subg   df-subgo
 5-Dec-14 csubg     csubgo
 5-Dec-14 isabvd    [--same--]  revised
 5-Dec-14 rngdvcan1 [--same--]  revised
 5-Dec-14 rngdvcl   [--same--]  revised
 5-Dec-14 rngdvval  [--same--]  revised
 5-Dec-14 rngdvfval [--same--]  revised
 5-Dec-14 rngnegrmul rngmneg2   revised
 5-Dec-14 rngneglmul rngmneg1   revised
 5-Dec-14 isrngd    [--same--]  revised
 5-Dec-14 isrng     [--same--]  revised
 5-Dec-14 df-ring   [--same--]  revised
 5-Dec-14 lagsubg   [--same--]  revised
 5-Dec-14 grpn0     grpbn0
 5-Dec-14 setsval   [--same--]  revised
 5-Dec-14 df-sets   [--same--]  revised
10-Nov-14 dford3    dford5reg   (in SF's mathbox)
10-Nov-14 fvun2     [--same--]  moved from SF's mathbox to main set.mm
10-Nov-14 fvun1     [--same--]  moved from SF's mathbox to main set.mm
10-Nov-14 twsvbdop  oprab4      moved from FL's mathbox to main set.mm
10-Nov-14 ra42e     [--same--]  moved from FL's mathbox to main set.mm
10-Nov-14 dmmptss   [--same--]  moved from SF's mathbox to main set.mm
10-Nov-14 rabxm     [--same--]  moved from JM's mathbox to main set.mm
10-Nov-14 rabnc     [--same--]  moved from JM's mathbox to main set.mm
10-Nov-14 absz      [--same--]  moved from JM's mathbox to main set.mm
10-Nov-14 absmod0   [--same--]  moved from JM's mathbox to main set.mm
10-Nov-14 negmod0   [--same--]  moved from JM's mathbox to main set.mm
13-Oct-14 qredeu    [--same--]  moved from JGH's mathbox to main set.mm
13-Oct-14 qredeq    [--same--]  moved from JGH's mathbox to main set.mm
25-Sep-14 otthg     otthg2      otthg now uses ordered triple definition
23-Sep-14 logcl     logrncl
23-Sep-14 divcnlem  reccn2      revised
23-Sep-14 climsqueeze2 climsqz2
23-Sep-14 climsqueeze climsqz
21-Sep-14 elqs2     ---         (in RM's mathbox) deleted; same as elqsg
21-Sep-14 cnss      ---         (in JM's mathbox) deleted; same as cnsubsp2r
21-Sep-14 elnnr     ---         (in JM's mathbox) deleted; same as elrege0
21-Sep-14 zmodfzcl  ---         (in JM's mathbox) deleted; same as zmodfz
21-Sep-14 subtareqbe [--same--] (in FL's mathbox) revised
21-Sep-14 subtsm    [--same--]  (in FL's mathbox) revised
21-Sep-14 pwtsm     [--same--]  (in FL's mathbox) revised
21-Sep-14 tmpts     tskmcl      moved from FL's mathbox to main set.mm; revised
21-Sep-14 intrtael  tskint      moved from FL's mathbox to main set.mm; revised
21-Sep-14 intartar  inttsk      moved from FL's mathbox to main set.mm
21-Sep-14 inttar1   ---         (in FL's mathbox) deleted; see 0tsk
21-Sep-14 elttar    tskmid      moved from FL's mathbox to main set.mm
21-Sep-14 btmp      eltskm      moved from FL's mathbox to main set.mm; revised
21-Sep-14 bpmp      sstskm      moved from FL's mathbox to main set.mm; revised
21-Sep-14 tarval2g  tskmval     moved from FL's mathbox to main set.mm; revised
21-Sep-14 tarval2   ---         (in FL's mathbox) deleted; see tskmval
21-Sep-14 df-tskmp  df-tskm     moved from FL's mathbox to main set.mm; revised
21-Sep-14 ctarskim  ctskm
21-Sep-14 tarsuc3   ---         (in FL's mathbox) deleted; see tsktrss
21-Sep-14 tarsuc2   tsksuc      moved from FL's mathbox to main set.mm; revised
21-Sep-14 tarsuc1   ---         (in FL's mathbox) deleted; see tsksuc, tsktrss
21-Sep-14 sexptrt   tskmap      moved from FL's mathbox to main set.mm; revised
21-Sep-14 cptarc    tskxp       moved from FL's mathbox to main set.mm; revised
21-Sep-14 tclinf    ---         (in FL's mathbox) deleted; same as tskinf
21-Sep-14 tartord   ---         (in FL's mathbox) deleted; see tsktrss
21-Sep-14 tartrel   tsktrss     moved from FL's mathbox to main set.mm
21-Sep-14 elcartr   ---         (in FL's mathbox) deleted; see trss
21-Sep-14 tarax3d4  ---         (in FL's mathbox) deleted; see tsksdom
21-Sep-14 tarax3d3  ---         (in FL's mathbox) deleted; see tsksdom
21-Sep-14 tarax3c   ---         (in FL's mathbox) deleted; see tsken
21-Sep-14 tarax3b   ---         (in FL's mathbox) deleted; see tsken
21-Sep-14 tarax3a   ---         (in FL's mathbox) deleted; same as tsken
21-Sep-14 inacint   tskin       moved from FL's mathbox to main set.mm; revised
21-Sep-14 elincin   ---         (in FL's mathbox) deleted; same as tskss
21-Sep-14 letri31   ---         (in FL's mathbox) deleted; same as xrletri3
21-Sep-14 elioooord ---         (in FL's mathbox) deleted; same as eliooord
21-Sep-14 elioc3    ---         (in FL's mathbox) deleted; same as elioc2
21-Sep-14 elico3    ---         (in FL's mathbox) deleted; same as elico2
21-Sep-14 omslim2   ---         (in FL's mathbox) deleted; same as dfom5
21-Sep-14 omslim    ---         (in FL's mathbox) deleted; see dfom5
21-Sep-14 ltwefz    [--same--]  moved from SF's mathbox to main set.mm
21-Sep-14 ltwenn    [--same--]  moved from SF's mathbox to main set.mm
21-Sep-14 ltweuz    [--same--]  moved from SF's mathbox to main set.mm
21-Sep-14 sqrrpcl   ---         deleted; same as rpsqrcl
21-Sep-14 ltfrn     ltweuz
21-Sep-14 zmodcl2   zmodfz
21-Sep-14 tskssel2  ---         deleted; see tskssel
21-Sep-14 eltsk2    ---         deleted; see eltsk2g
21-Sep-14 eltsk     ---         deleted; see eltskg
21-Sep-14 dftsk2    ---         deleted; see eltsk2g
21-Sep-14 omsubinit alephinit
21-Sep-14 infenomsub infenaleph
21-Sep-14 omsubindss ---        deleted; same as alephle
21-Sep-14 omsublim  ---         deleted; see alephislim
21-Sep-14 omsubdmss alephdom2
21-Sep-14 elomsubsd alephsdom
21-Sep-14 omsubss   ---         deleted; same as alephord3
21-Sep-14 omsubel   ---         deleted; same as alephord2
21-Sep-14 omsubdom  alephdom
21-Sep-14 omsubsdom ---         deleted; same as alephordi
21-Sep-14 omsubsdomlem2 ---     deleted; see alephordi
21-Sep-14 omsubsdomlem1 ---     deleted; same as alephordilem1
21-Sep-14 omsubsuc2 ---         deleted; same as alephsuc2
21-Sep-14 omsubsuc  ---         deleted; same as alephsuc
19-Sep-14 clfsebs2  ---         (in FL's mathbox) deleted; same as clfsebsr
15-Sep-14 ostth     [--same--]  revised
15-Sep-14 wlogle    [--same--]  revised
11-Sep-14 infmrgelbOLD ---      (in JM's mathbox) deleted; see infmrgelb
11-Sep-14 lbleinfOLD ---        (in JGH's mathbox) deleted; see infmrgelb
11-Sep-14 suplub2   supwlub     (in FL's mathbox)
11-Sep-14 nmfnleub  [--same--]  revised
11-Sep-14 nmopub    [--same--]  revised
11-Sep-14 itg2leub  [--same--]  revised
11-Sep-14 mbfmono   mbfsup      revised
11-Sep-14 ovolshftlem2 [--same--] revised
11-Sep-14 nmoubi    [--same--]  revised
11-Sep-14 pcid      pcidlem
11-Sep-14 caurcvg   [--same--]  revised
11-Sep-14 caurcvglem [--same--] revised
11-Sep-14 limsupcl  [--same--]  revised
11-Sep-14 limsupval [--same--]  revised
11-Sep-14 expcl2lem [--same--]  revised
11-Sep-14 infmxrgelb [--same--] revised
11-Sep-14 infmrgelb [--same--]  revised
11-Sep-14 suprleubii [--same--] revised
11-Sep-14 suprnubii [--same--]  revised
11-Sep-14 suprlubii [--same--]  revised
11-Sep-14 suprleub  [--same--]  revised
11-Sep-14 suprnub   [--same--]  revised
11-Sep-14 suprlub   [--same--]  revised
 2-Sep-14 grpohlem5 grpohmlem5  (in FL's mathbox)
 2-Sep-14 grpohlem3 grpohmlem3  (in FL's mathbox)
 2-Sep-14 ditgsplit [--same--]  revised
 2-Sep-14 ditgswap  [--same--]  revised
 2-Sep-14 ditgcl    [--same--]  revised
 2-Sep-14 ditgneg   [--same--]  revised
 2-Sep-14 ditgpos   [--same--]  revised
 2-Sep-14 mbfeq     mbfeqa      revised
 2-Sep-14 ivthicc   [--same--]  revised
 2-Sep-14 ivthle2   [--same--]  revised
 2-Sep-14 ivthle    [--same--]  revised
 2-Sep-14 ivth2     [--same--]  revised
 2-Sep-14 ivth      [--same--]  revised
 2-Sep-14 negfcncf  [--same--]  revised
 2-Sep-14 cncfco    [--same--]  revised
 2-Sep-14 cncffvrn  [--same--]  revised
 2-Sep-14 rescncf   [--same--]  revised
 2-Sep-14 cncffvelrn ---        deleted; see cncff
 2-Sep-14 cncfi     [--same--]  revised
 2-Sep-14 cncffvelrnOLD ---     deleted; see cncff
 2-Sep-14 cncff     [--same--]  revised
 2-Sep-14 ---       ---         changed math symbol from "Itgbl" to "L^1"
18-Aug-14 reheibor  [--same--]  (in JM's mathbox) revised
18-Aug-14 itgcnval  [--same--]  revised
18-Aug-14 iblre     iblrelem
18-Aug-14 itg0      itgz
18-Aug-14 mbfneg    [--same--]  revised
18-Aug-14 mbfmulc2  mbfmulc2re  revised
18-Aug-14 iccst     ---         deleted; see resubmet
18-Aug-14 stioo     ---         deleted; see resubmet
14-Aug-14 rexxfr    [--same--]  revised to be more general
14-Aug-14 ralxfr    [--same--]  revised to be more general
14-Aug-14 rexxfrd   [--same--]  revised to be more general
14-Aug-14 ralxfrd   [--same--]  revised to be more general
10-Aug-14 subntr    [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 subcls    [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 subsubtop [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 ntrin     [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 epr       [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 epos      [--same--]  moved from JGH's mathbox to main set.mm
10-Aug-14 imrescl   resima2     moved from FL's mathbox to main set.mm
10-Aug-14 dmdcan    [--same--]  moved from SF's mathbox to main set.mm
10-Aug-14 bposlem6  [--same--]  revised
10-Aug-14 bposlem5  [--same--]  revised
10-Aug-14 hashpwlem ---         deleted
30-Jul-14 hasheq0   [--same--]  revised
30-Jul-14 ifswap    ifnot
30-Jul-14 ifor      ifeqor
23-Jul-14 reptertr4 ---         (in FL's mathbox) deleted; see fmptco
23-Jul-14 reptertr3 ---         (in FL's mathbox) deleted; see fmptco
23-Jul-14 reptertr2 ---         (in FL's mathbox) deleted; see fmptco
23-Jul-14 eflti     ---         deleted; see eflt
23-Jul-14 fsumcllem [--same--]  revised
23-Jul-14 fsumcl2lem [--same--] revised
16-Jul-14 cbvrex2v  [--same--]  moved from FL's mathbox to main set.mm
16-Jul-14 df-subg   [--same--]  revised
16-Jul-14 imcj      imval2
16-Jul-14 recj      reval
16-Jul-14 hashf     [--same--]  revised
16-Jul-14 df-hash   [--same--]  revised
16-Jul-14 crmuli    ---         deleted (contents moved to remullem)
14-Jul-14 riota4    riotasbc
14-Jul-14 reiota4   reiotasbc
14-Jul-14 reuuni4   reuunisbc
14-Jul-14 elabs     elabsbc
12-Jul-14 lssdisj   lssdisj1
11-Jul-14 0nelqs2   elqsn0      moved from RM's mathbox to main set.mm; revised
11-Jul-14 erdisj3   qsdisj      moved from RM's mathbox to main set.mm; revised
11-Jul-14 df-subg   [--same--]  revised
11-Jul-14 subgov    [--same--]  revised
11-Jul-14 df-subg   [--same--]  revised
11-Jul-14 hash0     hasheq0
11-Jul-14 dmmulnq   mulnqf      revised
11-Jul-14 dmaddnq   addnqf      revised
11-Jul-14 df-rq     [--same--]  revised
11-Jul-14 ecelqsdm  [--same--]  revised
11-Jul-14 0nelqs    elqsn0      revised
11-Jul-14 uniqs     [--same--]  revised
11-Jul-14 qsexg     [--same--]  revised
11-Jul-14 ecelqsg   [--same--]  changed variable names
11-Jul-14 ecdmn0    [--same--]  revised
11-Jul-14 erdisj2   erdisj      revised
11-Jul-14 erdisj    [--same--]  revised
11-Jul-14 ereldm    ereldmb     revised
11-Jul-14 erthdmr   erth2       revised
11-Jul-14 erthdmg   erth        revised
11-Jul-14 erthdm    erth        revised
11-Jul-14 erth      [--same--]  revised
11-Jul-14 erthi     [--same--]  revised
11-Jul-14 ecdmn0    [--same--]  revised
11-Jul-14 eceq2     eceq1       (these labels should be
11-Jul-14 eceq1     eceq2        exchanged at the same time)
11-Jul-14 erdmrn    [--same--]  revised
11-Jul-14 erref     [--same--]  revised
11-Jul-14 errtr     [--same--]  revised
11-Jul-14 erref2    erref       revised
11-Jul-14 ertr      [--same--]  revised
11-Jul-14 errsym    [--same--]  revised
11-Jul-14 ersymb    [--same--]  revised
11-Jul-14 ersym     [--same--]  revised
11-Jul-14 ster      iser
11-Jul-14 dfec2     [--same--]  revised
11-Jul-14 so        isso2i      revised
11-Jul-14 itlso     issoi
 7-Jul-14 difxpOLD  ---         deleted; see difxp
 7-Jul-14 clsrebb   iccssxr     moved from FL's mathbox to main set.mm; revised
 7-Jul-14 iooirrsa  ioossre     moved from FL's mathbox to main set.mm; revised
 7-Jul-14 elicore2  icossre     moved from FL's mathbox to main set.mm
 7-Jul-14 elicore   icossxr     moved from FL's mathbox to main set.mm; revised
 7-Jul-14 eliocreb2 iocssre     moved from FL's mathbox to main set.mm
 7-Jul-14 eliocreb  iocssxr     moved from FL's mathbox to main set.mm; revised
 7-Jul-14 eliccre2b iccssre     moved from FL's mathbox to main set.mm
 7-Jul-14 eliccreb  iccssxr     moved from FL's mathbox to main set.mm; revised
 7-Jul-14 islvecd   ---         deleted; see islmodd and islvec2
 7-Jul-14 islmodd   [--same--]  revised
 7-Jul-14 islmod    [--same--]  revised
 7-Jul-14 df-lmod   [--same--]  revised (change g e. Abel to g e. Grp)
 7-Jul-14 fsump1i   [--same--]  revised
 7-Jul-14 difxp     [--same--]  revised
 2-Jul-14 difeq12   [--same--]  moved from FL's mathbox to main set.mm
 2-Jul-14 rngneg1   rngnegl     revised
 1-Jul-14 abl4pnp   ablo4pnp    (in JM's mathbox)
 1-Jul-14 ablinvop  abloinvop   (in JM's mathbox)
 1-Jul-14 ablcomgrp ablocomgrp  (in JM's mathbox)
 1-Jul-14 hhssabl   hhssablo
 1-Jul-14 hhssabli  hhssabloi
 1-Jul-14 hilabl    hilablo
 1-Jul-14 nvabl     nvablo
 1-Jul-14 vcabl     vcablo
 1-Jul-14 ablmul    ablomul
 1-Jul-14 ablsn     ablosn
 1-Jul-14 subgabl   subgablo
 1-Jul-14 isablda   isabloda
 1-Jul-14 ablnnncan1 ablonnncan1
 1-Jul-14 ablnncan  ablonncan
 1-Jul-14 ablnnncan ablonnncan
 1-Jul-14 abldivdiv4 ablodivdiv4
 1-Jul-14 abldivdiv ablodivdiv
 1-Jul-14 ablmuldiv ablomuldiv
 1-Jul-14 cabl      cablo
24-Jun-14 df-lmod   [--same--]  revised, and all affected definitions and
                                theorems were revised accordingly (156
                                statements in main set.mm, 4 in FL's mathbox,
                                257 in NM's mathbox, 417 total)
23-Jun-14 ---       ---         moved from JM's mathbox to main set.mm:
                                cphtpy cphtpc phtpy phtpyfval phtpyval isphtpy
                                phtpycom phtpyid phtpyco phtpc phtpcval
                                phtpcrel isphtpc phtpcdm phtpcer reparphti
                                reparpht cpi1b cpco cpi1 pco pi1b pi1 pcofval
                                pcoval pcovalg pcoval1 pco0 pco1 pcoval2 pcocn
                                pcoloopf pcohtpylem pcohtpy pcopt pcoass
                                pcorevlem pcorev pi1bval elpi1 elpi1i pi1bvalqs
                                pi1fval pi1flem pi1f pi1val pi1gplem pi1gp
                                pi1set
23-Jun-14 isablod   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 isablda   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 isgrpod   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 isgrpda   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 cnmpt2pc  [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 paste     [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 ---       ---         moved from JM's mathbox to main set.mm:
                                iccsplit iccshftr iccshftri iccshftl iccshftli
                                iccdil iccdili icccntr icccntri cii ii iitop
                                iiuni dfii2 dfii3 iicmp cnmptre iirev iirevcn
                                iihalf1 iihalf1cn iihalf2 iihalf2cn elii1 elii2
                                iimulcl iimulcn iccst icoopnst iocopnst
                                lincmb01cmp lincmb01icc oprpiece1res1
                                oprpiece1res2
23-Jun-14 subspcld2 [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 subspcld  [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 eroprf2   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 erov2     [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 eroprf    [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 erov      [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 eroveu    [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 erovlem   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 ecelqsg   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 erthdmg   [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 oprabrexex2 [--same--] moved from JM's mathbox to main set.mm
23-Jun-14 oprabvalg ovg         moved from JM's mathbox to main set.mm

23-Jun-14 ---       ---         moved from SF's mathbox to main set.mm:
                                gcdmultiple rprimemulgcd rprimelpwr rprimepwr
                                gcd12 gcddiv gcdmultiplez dvdssqim sqgcd
                                dvdssqlem dvdssq divgcdodd gcdadd pythagtrip
                                trirecip
23-Jun-14 dvdsgcdid ---         (in SF's mathbox) deleted; see gcdeq
23-Jun-14 dvdsprime [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 ---       ---         moved from SF's mathbox to main set.mm:
                                gcdabs1 gcdabs2 dvdsgcdb gcdass mulgcdr
                                coprimeprodsq coprimeprodsq2 odd2np1lem odd2np1
                                opoe omoe opeo omeo
23-Jun-14 abssq     [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 zsqcl     [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 sqrlt     [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 nnsqcl    [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 1elunit   [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 0elunit   [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 binom2subi [--same--] moved from SF's mathbox to main set.mm
23-Jun-14 binom2sub [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 elicc2i   [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 preq12bg  [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 bfplem    bfplem2     (in JM's mathbox)
23-Jun-14 stioo     [--same--]  moved from JM's mathbox to main set.mm
23-Jun-14 elrege0   [--same--]  moved from SF's mathbox to main set.mm
23-Jun-14 clint3OLD icccld
23-Jun-14 eltop2    [--same--]  revised
23-Jun-14 ivthlem   ivthlem3
23-Jun-14 difreicc  [--same--]  revised
23-Jun-14 imaiun    imauni
16-Jun-14 icccmp    icccmpALT   (in JM's mathbox)
16-Jun-14 compfipin0 cmpfi      moved from JGH's mathbox to main set.mm
16-Jun-14 compfipin0lem cmpfilem moved from JGH's mathbox to main set.mm
16-Jun-14 hscptsscld hauscmp    moved from JGH's mathbox to main set.mm
16-Jun-14 hscptsscldlem hauscmplem moved from JGH's mathbox to main set.mm
16-Jun-14 uncomp    uncmp       moved from JGH's mathbox to main set.mm
16-Jun-14 cptclsscpt cmpcld     moved from JGH's mathbox to main set.mm
16-Jun-14 compsub   cmpsub      moved from JGH's mathbox to main set.mm
16-Jun-14 compsublem cmpsublem  moved from JGH's mathbox to main set.mm
16-Jun-14 compcov   cmpcov      moved from JGH's mathbox to main set.mm
16-Jun-14 comptop   cmptop      moved from JGH's mathbox to main set.mm
16-Jun-14 opncldf3  [--same--]  moved from JGH's mathbox to main set.mm
16-Jun-14 opncldf2  [--same--]  moved from JGH's mathbox to main set.mm
16-Jun-14 opncldf1  [--same--]  moved from JGH's mathbox to main set.mm
16-Jun-14 icc0      [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 ioc0      [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 ico0      [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 lbico1    [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 ubioc1    [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 cmptop    [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 sinempcomp 0cmp       moved from FL's mathbox to main set.mm
16-Jun-14 sbincgt   tgfiss      moved from FL's mathbox to main set.mm
16-Jun-14 neffopo   fiinopn     moved from FL's mathbox to main set.mm
16-Jun-14 rnxpid    [--same--]  moved from FL's mathbox to main set.mm
16-Jun-14 mayete3OLDi mayete3iOLD
16-Jun-14 df-toset  df-ts
16-Jun-14 ccha      ctsr
16-Jun-14 fintopcomp fincmp
16-Jun-14 comptoppr cmptoppr
16-Jun-14 cncomp    cncmp
16-Jun-14 iscomp    iscmp
16-Jun-14 df-comp   df-cmp
16-Jun-14 ccomp     ccmp
16-Jun-14 subbas2   ---         deleted; see fiuni
16-Jun-14 subbas    ---         deleted; see fibas
16-Jun-14 invrrOLD  ---         deleted; see drnginvrr
16-Jun-14 invrlOLD  ---         deleted; see drnginvrl
16-Jun-14 invrclOLD invrcllem
16-Jun-14 isumcmpss isumless
16-Jun-14 isumcmp   isumle
16-Jun-14 fsumtscop [--same--]  revised
16-Jun-14 fsumcmp   fsumle
16-Jun-14 fsumcmpss fsumless
16-Jun-14 isercmp   iserle
16-Jun-14 climcmpc2 climlec2
16-Jun-14 climcmp   climle
16-Jun-14 sercmp    serle
16-Jun-14 serdistr  seqdistr
16-Jun-14 serf1o    seqf1o
16-Jun-14 serf1olem2 seqf1olem2
16-Jun-14 serf1olem1 seqf1olem1
16-Jun-14 sercaopr  seqcaopr
16-Jun-14 sercaopr2 seqcaopr2
16-Jun-14 ioojoin   [--same--]  revised
16-Jun-14 snunioo   [--same--]  revised
16-Jun-14 snunioolem ---        deleted
16-Jun-14 icoun     [--same--]  revised
16-Jun-14 icounlem  ---         deleted
16-Jun-14 elico2    [--same--]  revised
16-Jun-14 elioc2    [--same--]  revised
16-Jun-14 elixx2    ---         deleted; see elioo2, elico2, elioc2, elicc2
16-Jun-14 ixxssicc  ixxssixx    revised
16-Jun-14 uzwo3lem2 ---         deleted
16-Jun-14 uzwo3lem1 ---         deleted
16-Jun-14 uzwo5OLD  ---         deleted
16-Jun-14 uzwo4OLD  ---         deleted
16-Jun-14 fmptd     [--same--]  revised
15-Jun-14 pwtr      [--same--]  moved from AS's mathbox to main set.mm; revised
15-Jun-14 pwtrr     pwtr        moved from AS's mathbox to main set.mm; revised
12-Jun-14 eroprv2   erov2       (in JM's mathbox)
12-Jun-14 eroprv    erov        (in JM's mathbox)
12-Jun-14 eropreu   eroveu      (in JM's mathbox)
12-Jun-14 eroprlem  erovlem     (in JM's mathbox)
12-Jun-14 eloprvdm2 elovdm2     (in JM's mathbox)
12-Jun-14 eloprvdm  elovdm      (in JM's mathbox)
12-Jun-14 oprabval4gc ov4gc     (in FL's mathbox)
12-Jun-14 oprabval2gc ov2gc     (in FL's mathbox)
12-Jun-14 opreq123i oveq123i    (in FL's mathbox)
12-Jun-14 fnoprvrn2 fnovrn2     (in FL's mathbox)
12-Jun-14 fnoprvpop fnovpop     (in FL's mathbox)
12-Jun-14 oprssoprvg oprssopvg  (in FL's mathbox)
12-Jun-14 symgoprv  symgov
12-Jun-14 subgopr   subgov
12-Jun-14 ecoprdi   ecovdi
12-Jun-14 ecoprass  ecovass
12-Jun-14 ecoprcom  ecovcom
12-Jun-14 oprec     ovec
12-Jun-14 eceqopreq eceqoveq
12-Jun-14 ecopoprer ecopover
12-Jun-14 ecopoprtrn ecopovtrn
12-Jun-14 ecopoprsym ecopovsym
12-Jun-14 ecopoprdm ecopovdm
12-Jun-14 ecopopreq ecopoveq
12-Jun-14 onopriun  onoviun
12-Jun-14 onopruni  onovuni
12-Jun-14 fnopr2v   fnov2
12-Jun-14 caoprmo   caovmo
12-Jun-14 caoprlem2 caovlem2
12-Jun-14 caoprdilem caovdilem
12-Jun-14 caoprdistrr caovdistrr
12-Jun-14 caopr42   caov42
12-Jun-14 caopr411  caov411
12-Jun-14 caopr4    caov4
12-Jun-14 caopr13   caov13
12-Jun-14 caopr31   caov31
12-Jun-14 caopr12   caov12
12-Jun-14 caopr32   caov32
12-Jun-14 caoprdistr caovdistr
12-Jun-14 caoprdistrg caovdistrg
12-Jun-14 caoprord3 caovord3
12-Jun-14 caoprord2 caovord2
12-Jun-14 caoprord  caovord
12-Jun-14 caoprcan  caovcan
12-Jun-14 caoprass  caovass
12-Jun-14 caoprassg caovassg
12-Jun-14 caoprcom  caovcom
12-Jun-14 caoprcomg caovcomg
12-Jun-14 caoprcl   caovcl
12-Jun-14 caoprcld  caovcld
12-Jun-14 ndmordi   ndmovordi
12-Jun-14 ndmord    ndmovord
12-Jun-14 ndmoprdistr ndmovdistr
12-Jun-14 ndmoprass ndmovass
12-Jun-14 ndmoprcom ndmovcom
12-Jun-14 ndmoprrcl ndmovrcl
12-Jun-14 ndmopr    ndmov
12-Jun-14 ndmoprcl  ndmovcl
12-Jun-14 ndmoprg   ndmovg
12-Jun-14 oprvconst2 ovconst2
12-Jun-14 oprelimab ovelimab
12-Jun-14 funimass4b funimassov
12-Jun-14 oprvelrn  ovelrn
12-Jun-14 fnoprvrn  fnovrn
12-Jun-14 fooprv    foov
12-Jun-14 fnrnoprv  fnrnov
12-Jun-14 foprrn    fovrn
12-Jun-14 oprssoprv oprssov
12-Jun-14 oprvres   ovres
12-Jun-14 oprabval6g ov6g
12-Jun-14 oprabval4gALT ov4gALT
12-Jun-14 oprabval4g ov4g
12-Jun-14 oprabval3 ov3
12-Jun-14 oprabval5 ov5
12-Jun-14 oprabval2 ov2
12-Jun-14 oprabval2g ov2g
12-Jun-14 oprabval2ag ov2ag
12-Jun-14 oprabval2gf ov2gf
12-Jun-14 oprabvalig ovig
12-Jun-14 oprabvaligg ovigg
12-Jun-14 oprabval  ov
12-Jun-14 foprv     fov
12-Jun-14 fnoprv    fnov
12-Jun-14 eqfnoprv2 eqfnov2
12-Jun-14 eqfnoprv  eqfnov
12-Jun-14 foprcl    fovcl
12-Jun-14 ffnoprv   ffnov
12-Jun-14 elimdeloprv elimdelov
12-Jun-14 fnotoprb  fnopovb
12-Jun-14 rcla4eopr rcla4eov
12-Jun-14 csbopr2g  csbov2g
12-Jun-14 csbopr1g  csbov1g
12-Jun-14 csbopr12g csbov12g
12-Jun-14 csboprg   csbovg
12-Jun-14 oprprc2   ovprc2
12-Jun-14 oprprc1   ovprc1
12-Jun-14 oprex     ovex
12-Jun-14 hboprd    hbovd
12-Jun-14 hbopr     hbov
12-Jun-14 opreq123d oveq123d
12-Jun-14 opreqan12rd oveqan12rd
12-Jun-14 opreqan12d oveqan12d
12-Jun-14 opreq12d  oveq12d
12-Jun-14 opreqd    oveqd
12-Jun-14 opreq2d   oveq2d
12-Jun-14 opreq1d   oveq1d
12-Jun-14 opreqi    oveqi
12-Jun-14 opreq12i  oveq12i
12-Jun-14 opreq2i   oveq2i
12-Jun-14 opreq1i   oveq1i
12-Jun-14 opreq12   oveq12
12-Jun-14 opreq2    oveq2
12-Jun-14 opreq1    oveq1
12-Jun-14 opreq     oveq
12-Jun-14 df-opr    df-ov
11-Jun-14 pi1val    [--same--]  (in JM's mathbox) revised
11-Jun-14 pi1f      [--same--]  (in JM's mathbox) revised
11-Jun-14 pi1fval   [--same--]  (in JM's mathbox) revised
11-Jun-14 pi1bvalqs [--same--]  (in JM's mathbox) revised
11-Jun-14 pcorev    [--same--]  (in JM's mathbox) revised
11-Jun-14 pcorevlem [--same--]  (in JM's mathbox) revised
11-Jun-14 pcoass    [--same--]  (in JM's mathbox) revised
11-Jun-14 pcohtpy   [--same--]  (in JM's mathbox) revised
11-Jun-14 ---       ---         pcohtpylem1 - pcohtpylem3 deleted
11-Jun-14 pco1      [--same--]  (in JM's mathbox) revised
11-Jun-14 pco0      [--same--]  (in JM's mathbox) revised
11-Jun-14 pcocn     [--same--]  (in JM's mathbox) revised
11-Jun-14 pcoval2   [--same--]  (in JM's mathbox) revised
11-Jun-14 pcoval1   [--same--]  (in JM's mathbox) revised
11-Jun-14 pcoval    [--same--]  (in JM's mathbox) revised
11-Jun-14 pcofval   [--same--]  (in JM's mathbox) revised
11-Jun-14 df-pco    [--same--]  (in JM's mathbox) revised
11-Jun-14 reparpht  [--same--]  (in JM's mathbox) revised
11-Jun-14 ---       ---         reparphtlem1 - reparphtlem2 deleted
11-Jun-14 isphtpc2  ---         (in JM's mathbox) deleted; see isphtpc
11-Jun-14 isphtpc   [--same--]  (in JM's mathbox) revised
11-Jun-14 df-phtpc  [--same--]  (in JM's mathbox) revised
11-Jun-14 phtpyco   [--same--]  (in JM's mathbox) revised
11-Jun-14 ---       ---         phtpycolem1 - phtpycolem5 deleted
11-Jun-14 phtpycom  [--same--]  (in JM's mathbox) revised
11-Jun-14 phtpyid   [--same--]  (in JM's mathbox) revised
11-Jun-14 isphtpy   [--same--]  (in JM's mathbox) revised
11-Jun-14 phtpyval  [--same--]  (in JM's mathbox) revised
11-Jun-14 phtpyfval [--same--]  (in JM's mathbox) revised
11-Jun-14 df-phtpy  [--same--]  (in JM's mathbox) revised
11-Jun-14 ismrer1   [--same--]  (in JM's mathbox) revised
11-Jun-14 rrnval    [--same--]  (in JM's mathbox) revised
11-Jun-14 df-rrn    [--same--]  (in JM's mathbox) revised
11-Jun-14 bfp       [--same--]  (in JM's mathbox) revised
11-Jun-14 ---       ---         bfplem1 - bfplem11 deleted
11-Jun-14 heiborlem8 [--same--] (in JM's mathbox) revised
11-Jun-14 heibor1lem [--same--] (in JM's mathbox) revised
11-Jun-14 mulcntx   mulcn       moved from JM's mathbox to main set.mm
11-Jun-14 subcntx   subcn       moved from JM's mathbox to main set.mm
11-Jun-14 addcntx   addcn       moved from JM's mathbox to main set.mm
11-Jun-14 txcc      [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 txmet     [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 cnoprab2c ---         (in JM's mathbox) deleted; see cnmpt2nd,cnmpt21
11-Jun-14 cnoprab1c ---         (in JM's mathbox) deleted; see cnmpt1st,cnmpt21
11-Jun-14 cnoprab2  ---         (in JM's mathbox) deleted; see cnmpt2nd,cnmpt21
11-Jun-14 cnoprab1  ---         (in JM's mathbox) deleted; see cnmpt1st,cnmpt21
11-Jun-14 cnoproprabcoc ---     (in JM's mathbox) deleted; see cnmpt22f
11-Jun-14 cnoproprabco ---      (in JM's mathbox) deleted; see cnmpt22f
11-Jun-14 cnopropabcoc ---      (in JM's mathbox) deleted; see cnmpt12f
11-Jun-14 cnopropabco ---       (in JM's mathbox) deleted; see cnmpt12f
11-Jun-14 cnresoprab2 ---       (in JM's mathbox) deleted; see cnmpt2res
11-Jun-14 cnresoprab ---        (in JM's mathbox) deleted; see cnmpt2res
11-Jun-14 txsubsp   [--same--]  moved from JM's mathbox to main set.mm
11-Jun-14 txcnoprab ---         (in JM's mathbox) deleted; see cnmpt2t
11-Jun-14 lmtlm     ---         (in JM's mathbox) deleted
11-Jun-14 tlmconst  ---         (in JM's mathbox) deleted; see lmconst
11-Jun-14 haustlmu  ---         (in JM's mathbox) deleted; see lmmo
11-Jun-14 tlmbrf    ---         (in JM's mathbox) deleted; see lmbrf
11-Jun-14 tlmbr     ---         (in JM's mathbox) deleted; see lmbr
11-Jun-14 tlmval    ---         (in JM's mathbox) deleted; see lmfval
11-Jun-14 df-tlm    ---         (in JM's mathbox) deleted; see df-lm
11-Jun-14 ctlm      ---         (in JM's mathbox) deleted
11-Jun-14 hmeocnv   ---         (in JM's mathbox) deleted; see cnvhmpha
11-Jun-14 hmeocn    ---         (in JM's mathbox) deleted; see hmeobc
11-Jun-14 ishomeo2  ishomeo     moved from JM's mathbox to main set.mm
11-Jun-14 piececn   cnmpt2pc    (in JM's mathbox) revised
11-Jun-14 cnres     ---         (in JM's mathbox) deleted; see cnsubsp
11-Jun-14 cnimass   ---         (in JM's mathbox) deleted; see cnsubsp2
11-Jun-14 cncfco    [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 metdcn    [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 caures    [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 caushft   [--same--]  (in JM's mathbox) revised
11-Jun-14 lmclim2   [--same--]  (in JM's mathbox) revised
11-Jun-14 geomcau   [--same--]  (in JM's mathbox) revised
11-Jun-14 mettrifi2 ---         (in JM's mathbox) deleted; see mettrifi
11-Jun-14 mettrifi  [--same--]  (in JM's mathbox) revised
11-Jun-14 csbrni    [--same--]  (in JM's mathbox) revised
11-Jun-14 trirni    ---         (in JM's mathbox) deleted; see isumshft
11-Jun-14 csbrni    csbrn       (in JM's mathbox) revised
11-Jun-14 fsumlt1   fsumge1     moved from JM's mathbox to main set.mm; revised
11-Jun-14 isumshft2 ---         (in JM's mathbox) deleted; see isumshft
11-Jun-14 iserzshft2 ---        (in JM's mathbox) deleted; see isershft
11-Jun-14 isumclf   ---         (in JM's mathbox) deleted; see isumcl
11-Jun-14 fsumleisum ---        (in JM's mathbox) deleted; see isumless
11-Jun-14 fsumleisumi ---       (in JM's mathbox) deleted; see isumless
11-Jun-14 fsumleisumii ---      (in JM's mathbox) deleted; see isumless
11-Jun-14 fsumltisum isumltss   moved from JM's mathbox to main set.mm; revised
11-Jun-14 fsumltisumi ---       (in JM's mathbox) deleted; see isumltss
11-Jun-14 fsumltisumii ---      (in JM's mathbox) deleted; see isumltss
11-Jun-14 fsumlt    [--same--]  moved from JM's mathbox to main set.mm; revised
11-Jun-14 fsum00OLD ---         (in JM's mathbox) deleted
11-Jun-14 seq1eq2   ---         (in JM's mathbox) deleted; see seqfveq
11-Jun-14 sdc       [--same--]  (in JM's mathbox) revised
11-Jun-14 sdclem2   [--same--]  (in JM's mathbox) revised
11-Jun-14 sdclem1   [--same--]  (in JM's mathbox) revised
11-Jun-14 seq1seqzgOLD ---      (in JM's mathbox) deleted
11-Jun-14 seqzp1gOLD ---        (in JM's mathbox) deleted
11-Jun-14 seqz1gOLD ---         (in JM's mathbox) deleted
11-Jun-14 seq1p1gOLD ---        (in JM's mathbox) deleted
11-Jun-14 seq11gOLD ---         (in JM's mathbox) deleted
11-Jun-14 divexp    expdiv      moved from JM's mathbox to main set.mm; revised
11-Jun-14 acdc5g    ---         (in JM's mathbox) deleted; see axdc4uz
11-Jun-14 acdc3g    ---         (in JM's mathbox) deleted; see axdc3
11-Jun-14 acdcg     ---         (in JM's mathbox) deleted; see axdc2
11-Jun-14 hbixp1    [--same--]  moved from JM's mathbox to main set.mm
11-Jun-14 cbvixpv   [--same--]  moved from JM's mathbox to main set.mm
11-Jun-14 cbvixp    [--same--]  moved from JM's mathbox to main set.mm
11-Jun-14 cnsubsp2  [--same--]  moved from JGH's mathbox to main set.mm
11-Jun-14 cnsubsp   [--same--]  moved from JGH's mathbox to main set.mm
11-Jun-14 avgle2    [--same--]  moved from JGH's mathbox to main set.mm
11-Jun-14 cntrsetlem ---        (in FL's mathbox) deleted
11-Jun-14 topgrpsubcnlem ---    (in FL's mathbox) deleted
11-Jun-14 exopcopn  [--same--]  (in FL's mathbox) revised
11-Jun-14 ttcn2     ---         (in FL's mathbox) deleted; see cnmpt1t
11-Jun-14 ttcn      ---         (in FL's mathbox) deleted; see cnmpt1t
11-Jun-14 eltpt     [--same--]  moved from FL's mathbox to main set.mm
11-Jun-14 eqindhome [--same--]  (in FL's mathbox) revised
11-Jun-14 hmeogrp   [--same--]  (in FL's mathbox) revised
11-Jun-14 rnhmpha   [--same--]  (in FL's mathbox) revised
11-Jun-14 dmhmpha   [--same--]  (in FL's mathbox) revised
11-Jun-14 cnvhmphb  ---         (in FL's mathbox) deleted; see cnvhmph
11-Jun-14 df-mmat   [--same--]  (in FL's mathbox) revised
11-Jun-14 df-expsg  [--same--]  (in FL's mathbox) revised
11-Jun-14 seqzp2    [--same--]  (in FL's mathbox) revised
11-Jun-14 isppm     [--same--]  (in FL's mathbox) revised
11-Jun-14 fprod1ib  fprod2      (in FL's mathbox) revised
11-Jun-14 fprod1i2  ---         (in FL's mathbox) deleted; see fprod1i
11-Jun-14 relsumprd fsumprd     (in FL's mathbox) revised
11-Jun-14 fprodp1s1 ---         (in FL's mathbox) deleted; see fprodp1s
11-Jun-14 fprodp1s1 ---         (in FL's mathbox) deleted; see fprodp1s
11-Jun-14 fprodp1s  [--same--]  (in FL's mathbox) revised
11-Jun-14 fprodp1slem ---       (in FL's mathbox) deleted
11-Jun-14 fprodp1fi [--same--]  (in FL's mathbox) revised
11-Jun-14 fprod1s1  ---         (in FL's mathbox) deleted; see fprod1s
11-Jun-14 fprod1s2  fprod1s     (in FL's mathbox) revised
11-Jun-14 fprod1slem ---        (in FL's mathbox) deleted
11-Jun-14 fprod1fi  [--same--]  (in FL's mathbox) revised
11-Jun-14 fprodp1i  [--same--]  (in FL's mathbox) revised
11-Jun-14 fprod1i   [--same--]  (in FL's mathbox) revised
11-Jun-14 fprodserzfi fprodserf (in FL's mathbox) revised
11-Jun-14 fprodserz fprodser    (in FL's mathbox) revised
11-Jun-14 dffprod   [--same--]  (in FL's mathbox) revised
11-Jun-14 prodeqfv  [--same--]  (in FL's mathbox) revised
11-Jun-14 prodeq3d  [--same--]  (in FL's mathbox) revised
11-Jun-14 prodeq123d [--same--] (in FL's mathbox) revised
11-Jun-14 prodeq123i [--same--] (in FL's mathbox) revised
11-Jun-14 prodeq3   prodeq2     (in FL's mathbox) (these labels should be
11-Jun-14 prodeq2   prodeq3     (in FL's mathbox)  exchanged at the same time)
11-Jun-14 valproemset prod0     (in FL's mathbox)
11-Jun-14 df-prod2  ---         (in FL's mathbox) deleted; see df-prod
11-Jun-14 df-prod   [--same--]  (in FL's mathbox) revised
11-Jun-14 cprd2     ---         (in FL's mathbox) deleted
11-Jun-14 cprd      [--same--]  (in FL's mathbox) revised
11-Jun-14 seq0p1g   ---         (in FL's mathbox) deleted; see seqp1
11-Jun-14 seq00g    ---         (in FL's mathbox) deleted; see seq1
11-Jun-14 iserzmulc1b ---       (in FL's mathbox) deleted; see isermulc2
11-Jun-14 prjnpl    resixp      moved from FL's mathbox to main set.mm
11-Jun-14 cbicp     [--same--]  (in FL's mathbox) revised
11-Jun-14 cbicplem  ---         (in FL's mathbox) deleted
11-Jun-14 isprj2    [--same--]  (in FL's mathbox) revised
11-Jun-14 isprj1    [--same--]  (in FL's mathbox) revised
11-Jun-14 hbcp      ---         (in FL's mathbox) deleted; see hbixp1
11-Jun-14 valpr     [--same--]  (in FL's mathbox) changed variable names
11-Jun-14 prmapcp3  ---         (in FL's mathbox) deleted; see prmapcp2
11-Jun-14 prmapcp2  [--same--]  (in FL's mathbox) changed variable names
11-Jun-14 ispr1     [--same--]  (in FL's mathbox) revised
11-Jun-14 df-prj    [--same--]  (in FL's mathbox) revised
11-Jun-14 df-pro    [--same--]  (in FL's mathbox) revised
11-Jun-14 dffn5b    ---         (in FL's mathbox) deleted; see dffn5v
11-Jun-14 fopabco3  fmptco      moved from FL's mathbox to main set.mm
11-Jun-14 riemtn    ---         (in FL's mathbox) deleted; see mptresid
11-Jun-14 riecb     ---         (in FL's mathbox) deleted; see opabresid
11-Jun-14 cmpran    ---         (in FL's mathbox) deleted; see rnmpt
11-Jun-14 fopab2a   ---         (in FL's mathbox) deleted; see fmpt
11-Jun-14 fopab2ga  ---         (in FL's mathbox) deleted; see fnmpt
11-Jun-14 cmpbvb    ---         (in FL's mathbox) deleted; see cbvmptv
11-Jun-14 fmptb     ---         (in FL's mathbox) deleted; see fmpt2
11-Jun-14 seq0clg   ---         (in FL's mathbox) deleted; see seqcl
11-Jun-14 bpolydiflem2 ---      (in SF's mathbox) deleted
11-Jun-14 bpolydiflem1 ---      (in SF's mathbox) deleted
11-Jun-14 bernpolycl bpolycl    (in SF's mathbox)
11-Jun-14 bernpoly1 bpoly1      (in SF's mathbox)
11-Jun-14 bernpolynn ---        (in SF's mathbox) deleted; see bpolyval
11-Jun-14 bernpoly0 bpoly0      (in SF's mathbox)
11-Jun-14 bernpolyval bpolyval  (in SF's mathbox) revised
11-Jun-14 df-bernpoly df-bpoly  (in SF's mathbox) revised
11-Jun-14 cbernpoly cbp         (in SF's mathbox)
11-Jun-14 fsumsq    ---         (in SF's mathbox) deleted; see fsumge0
11-Jun-14 trirecip  [--same--]  (in SF's mathbox) revised
11-Jun-14 trireciplem [--same--] (in SF's mathbox) revised
11-Jun-14 arisum4   ---         (in SF's mathbox) deleted; see arisum
11-Jun-14 arisum3   ---         (in SF's mathbox) deleted; see arisum
11-Jun-14 arisum2   ---         (in SF's mathbox) deleted; see arisum
11-Jun-14 arisum    [--same--]  moved from SF's mathbox to main set.mm; revised
11-Jun-14 binomp1m1 [--same--]  moved from SF's mathbox to main set.mm
11-Jun-14 binom21   [--same--]  moved from SF's mathbox to main set.mm
11-Jun-14 binom1dif [--same--]  moved from SF's mathbox to main set.mm
11-Jun-14 binom1    ---         (in SF's mathbox) deleted; see binom1p
11-Jun-14 binom     [--same--]  moved from SF's mathbox to main set.mm
11-Jun-14 bcsum     ---         (in SF's mathbox) deleted; see binom11
11-Jun-14 fsumtelescope2 fsumtscop moved from SF's mathbox to main set.mm
11-Jun-14 fsumtelescope ---     (in SF's mathbox) deleted; see fsumtscop
11-Jun-14 fsumsplitlast ---     (in SF's mathbox) deleted; see fsump1
11-Jun-14 fseq1cl   ---         (in PC's mathbox) deleted; see seqcl
11-Jun-14 seq1resval2 ---       (in PC's mathbox) deleted; see seqfveq
11-Jun-14 seq1resval ---        (in PC's mathbox) deleted; see seqfveq
11-Jun-14 seqzresval2 ---       (in PC's mathbox) deleted; see seqfveq
11-Jun-14 ---       ---         circumlem1 - circumlem3 deleted
11-Jun-14 sindivcvg sinccvg     (in PC's mathbox)
11-Jun-14 ---       ---         sindivcvglem1 - sindivcvglem8 deleted
11-Jun-14 efexple   [--same--]  (in MC's mathbox) revised
11-Jun-14 bclbnd2   bclbnd      (in MC's mathbox)
11-Jun-14 bclbnd    ---         (in MC's mathbox) deleted
11-Jun-14 elpjrnch  elpjch
11-Jun-14 elpjch    [--same--]  revised
11-Jun-14 pjhmopidm [--same--]  revised
11-Jun-14 hmopidmpj [--same--]  revised
11-Jun-14 hmopidmch [--same--]  revised
11-Jun-14 hmopidmpji [--same--] revised
11-Jun-14 hmopidmchi [--same--] revised
11-Jun-14 hmopidmchlem ---      deleted
11-Jun-14 opsqrlem6 [--same--]  revised
11-Jun-14 opsqrlem5 [--same--]  revised
11-Jun-14 opsqrlem4 [--same--]  revised
11-Jun-14 opsqrlem3 [--same--]  revised
11-Jun-14 opsqrlem2 [--same--]  revised
11-Jun-14 chso      pjth
11-Jun-14 ---       ---         osumlem1 - osumlem8 deleted
11-Jun-14 pjtheu2i  pjtheu2     revised
11-Jun-14 pjeq2     ---         deleted; see pjeq
11-Jun-14 pjtheui   ---         deleted; see pjtheu
11-Jun-14 pjth      [--same--]  revised
11-Jun-14 pjthi     ---         deleted; see pjth
11-Jun-14 ---       ---         pjthlem3 - pjthlem14 deleted
11-Jun-14 pjthlem2  [--same--]  revised
11-Jun-14 pjthlem1  [--same--]  revised
11-Jun-14 projlemHIL ---        deleted
11-Jun-14 projlem   ---         deleted
11-Jun-14 ---       ---         projlem1 - projlem31 deleted
11-Jun-14 occli     ---         deleted; see occl
11-Jun-14 ---       ---         occllem1 - occllem8 deleted
11-Jun-14 hlimeui   [--same--]  revised
11-Jun-14 hlimreui  [--same--]  revised
11-Jun-14 hlimuniii ---         deleted; see hlimunii
11-Jun-14 hlimcauii ---         deleted; see hlimcaui
11-Jun-14 hilcmpl   [--same--]  revised
11-Jun-14 hhcmpl    [--same--]  revised
11-Jun-14 hhlm      [--same--]  revised
11-Jun-14 hilcau    ---         deleted; see hhcau
11-Jun-14 hillim    ---         deleted; see hhlm
11-Jun-14 hlim2     [--same--]  revised
11-Jun-14 hlimconvi [--same--]  revised
11-Jun-14 hlimi     [--same--]  revised
11-Jun-14 hcau2     ---         deleted; see hcau
11-Jun-14 seq1hcau  [--same--]  revised
11-Jun-14 hcaucvg   [--same--]  revised
11-Jun-14 hcau      [--same--]  revised
11-Jun-14 h2hlm     [--same--]  revised
11-Jun-14 df-hcau   [--same--]  revised
11-Jun-14 df-hlim   [--same--]  revised
11-Jun-14 hmph      [--same--]  revised
11-Jun-14 hmeobc    [--same--]  revised
11-Jun-14 ishomeo   [--same--]  revised
11-Jun-14 df-hmph   [--same--]  revised
11-Jun-14 relogexp  [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 reexplog  [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 explog    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 pilog     logm1       revised
11-Jun-14 resslogrn relogrn     revised
11-Jun-14 logrn     [--same--]  revised
11-Jun-14 df-log    [--same--]  revised
11-Jun-14 eff1o     [--same--]  revised
11-Jun-14 eff1oi    eff1olem    revised
11-Jun-14 effoi     ---         deleted; see eff1o
11-Jun-14 eff1i     ---         deleted; see eff1o
11-Jun-14 eff1lem   ---         deleted
11-Jun-14 shftefif1o ---        deleted; see efif1o
11-Jun-14 shftefif1olem ---     deleted
11-Jun-14 circgrp   [--same--]  revised
11-Jun-14 efielcirc ---         deleted
11-Jun-14 efif1o    [--same--]  revised
11-Jun-14 efif1     ---         deleted; see efif1o
11-Jun-14 ---       ---         efif1lem1 - efif1lem7 deleted
11-Jun-14 efifo     ---         deleted; see efif1o
11-Jun-14 ---       ---         efifolem1 - efifolem7 deleted
11-Jun-14 efif      ---         deleted; see efif1o
11-Jun-14 efghgrpi  efghgrp     revised
11-Jun-14 efghgrpilem ---       deleted
11-Jun-14 efgh      [--same--]  revised
11-Jun-14 cosh111   cos11       revised
11-Jun-14 ---       ---         cosh111lem1 - cosh111lem3 deleted
11-Jun-14 sineq0re  ---         deleted; see sineq0
11-Jun-14 sineq0OLD ---         deleted; see sineq0
11-Jun-14 sineq0    [--same--]  revised
11-Jun-14 sinq12gt0t sinq12gt0
11-Jun-14 sinperlem2 ---        deleted
11-Jun-14 sinperlem1 ---        deleted
11-Jun-14 pilem4    ---         deleted; see pilem3
11-Jun-14 pilem3    [--same--]  revised
11-Jun-14 pilem2    [--same--]  revised
11-Jun-14 pilem1    [--same--]  revised
11-Jun-14 cosco     ---         deleted
11-Jun-14 sinco     ---         deleted
11-Jun-14 sincnlem  ---         deleted
11-Jun-14 sincolem  ---         deleted
11-Jun-14 hlcompl   [--same--]  revised
11-Jun-14 minvecex2 ---         deleted; see minvec
11-Jun-14 minveclem39 ---       deleted
11-Jun-14 minvecle  ---         deleted; see minvec
11-Jun-14 minvecdist ---        deleted; see minvec
11-Jun-14 minveccl  ---         deleted; see minvec
11-Jun-14 minveceu   minvec     revised
11-Jun-14 ---       ---         minveclem35 - minveclem38 deleted
11-Jun-14 minvecex  ---         deleted; see minvec
11-Jun-14 ---       ---         minveclem10 - minveclem33 deleted
11-Jun-14 minvec34   ---        deleted
11-Jun-14 minveclem7 [--same--] revised
11-Jun-14 minveclem6 [--same--] revised
11-Jun-14 minveclem5 [--same--] revised
11-Jun-14 minveclem4 [--same--] revised
11-Jun-14 minveclem3 [--same--] revised
11-Jun-14 minveclem2 [--same--] revised
11-Jun-14 minveclem1 [--same--] revised
11-Jun-14 ipasslem7 [--same--]  revised
11-Jun-14 ipasslem6 ---         deleted
11-Jun-14 ip1cni    ---         deleted; see ipcn
11-Jun-14 ---       ---         ip1cnilem1 - ip1cnilem6 deleted
11-Jun-14 ipval2lem1 ---        deleted
11-Jun-14 sm1cni    ---         deleted; see smcn
11-Jun-14 sm1cnilem ---         deleted
11-Jun-14 va1cn     ---         deleted; see vacn and cnmpt12
11-Jun-14 va1cnlem  ---         deleted
11-Jun-14 vacn      [--same--]  revised
11-Jun-14 ---       ---         vacnlem1 - vacnlem6 deleted
11-Jun-14 nvlmle    [--same--]  revised
11-Jun-14 nvlmcl    [--same--]  revised
11-Jun-14 ghsubgi   ghsubg      revised
11-Jun-14 ghgrpi    ghgrp       revised
11-Jun-14 ---       ---         ghgrpilem1 - ghgrpilem4 deleted
11-Jun-14 bcthlem3  [--same--]  revised
11-Jun-14 cmsss     [--same--]  revised
11-Jun-14 lmcau     [--same--]  revised
11-Jun-14 iscms2i   iscms3i     revised
11-Jun-14 iscms2    iscms3      revised
11-Jun-14 ---       ---         iscms2lem3 - iscms2lem5 deleted
11-Jun-14 fsumcn    [--same--]  revised
11-Jun-14 fsumcnlem ---         deleted
11-Jun-14 mulcn     [--same--]  revised
11-Jun-14 subcn     [--same--]  revised
11-Jun-14 addcn     [--same--]  revised
11-Jun-14 bopcn     ---         deleted; see metcn4
11-Jun-14 ---       ---         bopcnlem1 - bopcnlem4 deleted
11-Jun-14 opr1scn   ---         deleted; see cnmpt12f and cnmptid, cnmptc
11-Jun-14 opr2cn    ---         deleted; see cnmpt12f and cnmptc
11-Jun-14 opr1cn    ---         deleted; see cnmpt12f and cnmptc
11-Jun-14 oprcn     ---         deleted; see cnmpt12f
11-Jun-14 xpcn      ---         deleted; see cnmpt1t
11-Jun-14 xplm      ---         deleted; see txlm
11-Jun-14 xplmi2    ---         deleted; see txlm
11-Jun-14 xplmi     ---         deleted; see txlm
11-Jun-14 metcnp4   [--same--]  revised
11-Jun-14 metcnp4lem2 ---       deleted
11-Jun-14 metcnp4lem1 ---       deleted
11-Jun-14 caublcls  [--same--]  revised
11-Jun-14 metcld    [--same--]  revised
11-Jun-14 metcls    ---         deleted; see metelcls
11-Jun-14 metelcls  [--same--]  revised
11-Jun-14 metcls2   ---         deleted; see lmcls
11-Jun-14 lmclimnn  lmclimf     revised
11-Jun-14 lmclim    [--same--]  revised
11-Jun-14 lmle      [--same--]  revised
11-Jun-14 lmfex     ---         deleted
11-Jun-14 lmfexlem3 ---         deleted
11-Jun-14 lmfexlem2 ---         deleted
11-Jun-14 lmfexlem1 ---         deleted
11-Jun-14 caussi    [--same--]  revised
11-Jun-14 lmss      [--same--]  revised
11-Jun-14 lmsslem   ---         deleted
11-Jun-14 lmuni     lmmo        revised
11-Jun-14 caufss    caufpm      revised
11-Jun-14 lmcl      [--same--]  revised
11-Jun-14 lmfss     [--same--]  revised
11-Jun-14 cmscvg    [--same--]  revised
11-Jun-14 iscms     [--same--]  revised
11-Jun-14 iscaunns  ---         deleted; see iscauf
11-Jun-14 lmcvgnns  ---         deleted; see lmmcvg
11-Jun-14 lmbrnns   ---         deleted; see iscauf
11-Jun-14 iscau5    ---         deleted; see iscauf
11-Jun-14 iscau4    [--same--]  revised
11-Jun-14 iscauf    [--same--]  revised
11-Jun-14 iscau3    [--same--]  revised
11-Jun-14 iscau2    [--same--]  revised
11-Jun-14 iscau     [--same--]  revised
11-Jun-14 lmnn      [--same--]  revised
11-Jun-14 lmconst   [--same--]  revised
11-Jun-14 lmcvg2    ---         deleted; see lmcvg
11-Jun-14 lmcvg     [--same--]  revised
11-Jun-14 lmbrf2    ---         deleted; see lmbrf
11-Jun-14 lmbrf     [--same--]  revised
11-Jun-14 lmbr2     [--same--]  revised
11-Jun-14 lmbr      [--same--]  revised
11-Jun-14 lmrel     [--same--]  revised
11-Jun-14 caufval   [--same--]  revised
11-Jun-14 lmfval    [--same--]  revised
11-Jun-14 df-cmet   [--same--]  revised
11-Jun-14 df-cau    [--same--]  revised
11-Jun-14 df-lm     [--same--]  revised
11-Jun-14 clm       [--same--]  revised
11-Jun-14 dscmet    [--same--]  revised
11-Jun-14 cn2met    [--same--]  revised
11-Jun-14 metdnsconst ---       deleted; see dnsconst
11-Jun-14 metxp     [--same--]  revised
11-Jun-14 metxplem4 [--same--]  revised
11-Jun-14 metxpcl   [--same--]  revised
11-Jun-14 metxpfval [--same--]  revised
11-Jun-14 metxptval [--same--]  revised
11-Jun-14 metxpdval [--same--]  revised
11-Jun-14 2txcn     ---         deleted; see cnmpt2t
11-Jun-14 txcnopab  txcnmpt     revised
11-Jun-14 txcn      [--same--]  revised
11-Jun-14 tx2cn     [--same--]  revised
11-Jun-14 tx1cn     [--same--]  revised
11-Jun-14 txcld     [--same--]  revised
11-Jun-14 txopn     [--same--]  revised
11-Jun-14 txuni     [--same--]  revised
11-Jun-14 txtop     [--same--]  revised
11-Jun-14 subspuni    [--same--]  revised
11-Jun-14 1arith2   [--same--]  revised
11-Jun-14 1arith    [--same--]  revised
11-Jun-14 ---       ---         1arithlem4 - 1arithlem31 deleted
11-Jun-14 1arithlem4 [--same--] revised
11-Jun-14 1arithlem3 [--same--] revised
11-Jun-14 1arithlem2 [--same--] revised
11-Jun-14 1arithlem1 [--same--] revised
11-Jun-14 ---       ---         mulgcdlem1 - mulgcdlem7 deleted
11-Jun-14 eucalg    [--same--]  revised
11-Jun-14 eucalgcvga [--same--] revised
11-Jun-14 eucalglt  [--same--]  revised
11-Jun-14 eucalginv [--same--]  revised
11-Jun-14 eucalgf   [--same--]  revised
11-Jun-14 eucalgval2 [--same--] revised
11-Jun-14 eucalgval [--same--]  revised
11-Jun-14 algfx     [--same--]  revised
11-Jun-14 algcvga   [--same--]  revised
11-Jun-14 algcvg    [--same--]  revised
11-Jun-14 alginv    [--same--]  revised
11-Jun-14 algrp1    [--same--]  revised
11-Jun-14 algrp1lem ---         deleted
11-Jun-14 algr0     [--same--]  revised
11-Jun-14 algrf     [--same--]  revised
11-Jun-14 ruclem39  ruclem13
11-Jun-14 ---       ---         ruclem13 - ruclem38 deleted
11-Jun-14 ruclem12  [--same--]  revised
11-Jun-14 ruclem11  [--same--]  revised
11-Jun-14 ruclem10  [--same--]  revised
11-Jun-14 ruclem9   [--same--]  revised
11-Jun-14 ruclem8   [--same--]  revised
11-Jun-14 ruclem7   [--same--]  revised
11-Jun-14 ruclem6   [--same--]  revised
11-Jun-14 ruclem5   [--same--]  revised
11-Jun-14 ruclem4   [--same--]  revised
11-Jun-14 ruclem3   [--same--]  revised
11-Jun-14 ruclem2   [--same--]  revised
11-Jun-14 ruclem1   [--same--]  revised
11-Jun-14 rpnnen2lem11 [--same--] revised
11-Jun-14 rpnnen2lem10 [--same--] revised
11-Jun-14 rpnnen2lem9 [--same--] revised
11-Jun-14 rpnnen2lem8 [--same--] revised
11-Jun-14 rpnnen2lem7 [--same--] revised
11-Jun-14 rpnnen2lem6 [--same--] revised
11-Jun-14 rpnnen2lem5 [--same--] revised
11-Jun-14 rpnnen2lem4 [--same--] revised
11-Jun-14 rpnnen2lem3 [--same--] revised
11-Jun-14 rpnnen2lem2 [--same--] revised
11-Jun-14 rpnnen2lem1 [--same--] revised
11-Jun-14 acdcALT   ---         deleted; see axdc2
11-Jun-14 acdc      ---         deleted; see axdc2
11-Jun-14 acdclem   ---         deleted
11-Jun-14 acdc5     ---         deleted; see axdc4
11-Jun-14 acdc5lem2 ---         deleted
11-Jun-14 acdc5lem1 ---         deleted
11-Jun-14 acdc2     ---         deleted; see axdc4
11-Jun-14 acdc2lem2 ---         deleted
11-Jun-14 acdc2lem1 ---         deleted
11-Jun-14 acdc4lem1 ---         deleted
11-Jun-14 acdc3     ---         deleted; see axdc3
11-Jun-14 acdc3lem  ---         deleted
11-Jun-14 demoivre  ---         generalized antecedent to N e. ZZ
11-Jun-14 ---       ---         cos01bndlem2 - cos01bndlem3 deleted
11-Jun-14 ---       ---         sin01bndlem1 - sin01bndlem3 deleted
11-Jun-14 cos2OLD   ---         deleted; see cos2t
11-Jun-14 subcos    [--same--]  revised
11-Jun-14 cosaddi   ---         deleted; see cosadd
11-Jun-14 sinaddi   ---         deleted; see sinadd
11-Jun-14 sin0ALT   ---         deleted; see sin0
11-Jun-14 efi4p     [--same--]  revised
11-Jun-14 reeff1olem2 ---       deleted
11-Jun-14 reeff1olem1 ---       deleted
11-Jun-14 ---       ---         efcnlem1 - efcnlem1 deleted
11-Jun-14 efm1legeo ---         deleted
11-Jun-14 efm1legeoi ---        deleted
11-Jun-14 eflegeo   [--same--]  revised
11-Jun-14 eflegeoi  ---         deleted
11-Jun-14 eflegeolem2 ---       deleted
11-Jun-14 eflegeolem1 ---       deleted
11-Jun-14 absefm1lei ---        deleted
11-Jun-14 efm1limi  ---         deleted
11-Jun-14 efltbi    ---         deleted; see eflt
11-Jun-14 eflti     [--same--]  revised
11-Jun-14 efgt0i    ---         deleted; see efgt0
11-Jun-14 efgt0i    ---         deleted; see efgt0
11-Jun-14 efgt1pi   efgt1p      revised
11-Jun-14 efgt1i    efgt1       revised
11-Jun-14 efge1pi   ---         deleted; see efgt1p
11-Jun-14 efge1i    ---         deleted; see efgt1
11-Jun-14 ef4p      [--same--]  revised
11-Jun-14 ef4pi     ---         deleted; see ef4p
11-Jun-14 eft0vali  eft0val     revised
11-Jun-14 effsumlei effsumlt    revised
11-Jun-14 efsepi    efsep       revised
11-Jun-14 abspef01tlubi ---     deleted; see eftlub
11-Jun-14 elt3OLD   ---         deleted; see egt2lt3
11-Jun-14 egt2OLD   ---         deleted; see egt2lt3
11-Jun-14 ---       ---         eirrlem1 - eirrlem5 deleted
11-Jun-14 absef01tlubi eftlub   revised
11-Jun-14 absef01tllem ---      deleted
11-Jun-14 ef01tlubi ---         deleted; see eftlub
11-Jun-14 ef01tllem2OLD ---     deleted
11-Jun-14 ef01tllem2 ---        deleted
11-Jun-14 ef01tllem1 ---        deleted
11-Jun-14 ef1tlubi  ---         deleted; see eftlub
11-Jun-14 ef1tllem  ---         deleted
11-Jun-14 reeftlcl  [--same--]  revised
11-Jun-14 eftlcl    [--same--]  revised
11-Jun-14 eftlex    eftlcvg     revised
11-Jun-14 eftlexiOLD ---        deleted
11-Jun-14 eftlubcl  ---         deleted
11-Jun-14 eftabsi   eftabs      revised
11-Jun-14 efnn0val  efzval      generalized antecedent to N e. ZZ
11-Jun-14 efexp     [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 efaddi    ---         deleted; see efadd
11-Jun-14 ---       ---         efaddlem1 - efaddlem28 deleted
11-Jun-14 efcji     ---         deleted; see efcj
11-Jun-14 ege2le3   [--same--]  revised; see egt2lt3
11-Jun-14 ele3      ---         deleted; see egt2lt3
11-Jun-14 ege2      ---         deleted; see egt2lt3
11-Jun-14 ereALT    ---         deleted; see ere
11-Jun-14 ege2le3lem2 ---       deleted
11-Jun-14 ege2lem2  ---         deleted
11-Jun-14 ege2le3lem1 ---       deleted
11-Jun-14 ele3lem   ---         deleted
11-Jun-14 ---       ---         erelem1 - erelem7 deleted
11-Jun-14 reefcli   ---         deleted; see reefcl
11-Jun-14 eftval    [--same--]  revised
11-Jun-14 efcvgfsum [--same--]  revised
11-Jun-14 efcvg     [--same--]  revised
11-Jun-14 efseq0ex  ---         deleted; see efcllem
11-Jun-14 ef0lem    [--same--]  revised
11-Jun-14 dfef2i    ---         deleted
11-Jun-14 efseq1ex  ---         deleted; see efcllem
11-Jun-14 efcltlem2 ---         deleted; see ef0lem
11-Jun-14 efcltlem1 ---         deleted; see efcllem
11-Jun-14 df-pi     [--same--]  revised
11-Jun-14 df-tan    [--same--]  revised
11-Jun-14 dsupivthi ivth2       revised
11-Jun-14 dsupivthlem ---       deleted
11-Jun-14 isupivthi ivth        revised
11-Jun-14 ---       ---         ivthlem1 - ivthlem9 deleted
11-Jun-14 divccncf  [--same--]  revised
11-Jun-14 mulc1cncf [--same--]  revised
11-Jun-14 abscncflem ---        deleted
11-Jun-14 negfcncfi negfcncf    revised
11-Jun-14 fsum0diag4 ---        deleted; see fsum0diag
11-Jun-14 fsum0diag3 ---        deleted; see fsum0diag
11-Jun-14 fsum0diag2 ---        deleted; see fsum0diag
11-Jun-14 fsum0diag [--same--]  revised
11-Jun-14 fsum0diaglem2 ---     deleted
11-Jun-14 fsum0diaglem1 ---     deleted
11-Jun-14 cvgrati   cvgrat      revised
11-Jun-14 ---       ---         cvgratlem1 - cvgratlem5 deleted
11-Jun-14 ---       ---         cvgratlem1ALT - cvgratlem3ALT deleted
11-Jun-14 geosum2i  ---         deleted; see geoser
11-Jun-14 geosumi   ---         deleted; see geoser
11-Jun-14 georeclim [--same--]  revised
11-Jun-14 geolim1   ---         deleted; see geolim2
11-Jun-14 geolim1i  ---         deleted; see geolim2
11-Jun-14 geolim    [--same--]  revised
11-Jun-14 geolimi   ---         deleted; see geolim
11-Jun-14 geolimilem ---        deleted
11-Jun-14 geoseri   geoser      revised
11-Jun-14 explecnv  [--same--]  revised
11-Jun-14 expcnv    [--same--]  revised
11-Jun-14 ---       ---         expcnvlem1 - expcnvlem6 deleted
11-Jun-14 arisumi   arisum      revised
11-Jun-14 arisumilem ---        deleted
11-Jun-14 supcvg    [--same--]  revised
11-Jun-14 supcvglem ---         deleted
11-Jun-14 reccnv    divcnv      revised
11-Jun-14 binom11i  binom11
11-Jun-14 binom1pi  binom1p     revised
11-Jun-14 binomi    binom       revised
11-Jun-14 ---       ---         binomlem1 - binomlem6 deleted
11-Jun-14 ser0cji   ---         deleted; see sercj
11-Jun-14 serzcji   sercj       revised
11-Jun-14 serzimi   serim       revised
11-Jun-14 serzrei   serre       revised
11-Jun-14 serzrelem ---         deleted
11-Jun-14 ser1mulci ---         deleted; see seqdistr
11-Jun-14 ser0mulci ---         deleted; see seqdistr
11-Jun-14 serzmulci ---         deleted; see seqdistr
11-Jun-14 serzmulc1 ---         deleted; see seqdistr
11-Jun-14 serzsplit ---         deleted; see seqsplit
11-Jun-14 serzcmp0  serge0      revised
11-Jun-14 serzcmp   sercmp      revised
11-Jun-14 serz0     ser0        revised
11-Jun-14 serz1p    seq1p       revised
11-Jun-14 serzrefi  serfre      revised
11-Jun-14 serzrecl  ---         deleted; see serfre
11-Jun-14 serzcl2   ---         deleted; see serf
11-Jun-14 ser1ser0i ---         deleted; see seq1p
11-Jun-14 ser1cl    ---         deleted; see seqcl
11-Jun-14 ser0cl    ---         deleted; see seqcl
11-Jun-14 serzcl    ---         deleted; see seqcl
11-Jun-14 fsumabs2mul ---       deleted; see fsum2mul and fsumabs
11-Jun-14 fsumabs   [--same--]  revised
11-Jun-14 fsum00    [--same--]  revised
11-Jun-14 fsumcmpndx2 fsumcmpss revised
11-Jun-14 fsumcmp0  fsumge0     revised
11-Jun-14 fsumcmp   [--same--]  revised
11-Jun-14 fsum0     ---         deleted; see sumz
11-Jun-14 fsumconst [--same--]  revised
11-Jun-14 fsum2mul  [--same--]  revised
11-Jun-14 fsumsub   [--same--]  revised
11-Jun-14 fsumneg   [--same--]  revised
11-Jun-14 fsumdivcALT ---       deleted
11-Jun-14 fsumdivc  [--same--]  revised
11-Jun-14 fsummulc2 fsummulc1   revised
11-Jun-14 fsummulc1 fsummulc2   revised
11-Jun-14 fsumshftm [--same--]  revised
11-Jun-14 fsumshft  [--same--]  revised
11-Jun-14 fsumrev2  [--same--]  revised
11-Jun-14 fsumrev   [--same--]  revised
11-Jun-14 fsumcom   [--same--]  revised
11-Jun-14 csbfsum   [--same--]  deleted; see sumeq2sdv
11-Jun-14 csbfsumlem [--same--] deleted
11-Jun-14 fsum4     [--same--]  deleted; see fsump1i
11-Jun-14 fsum3     [--same--]  deleted; see fsump1i
11-Jun-14 fsum2     [--same--]  deleted; see fsump1i
11-Jun-14 fsumadd   [--same--]  revised
11-Jun-14 fsumid2   ---         deleted; see fsumss
11-Jun-14 fsum0split ---        deleted; see fsumsplit
11-Jun-14 fsumsplit [--same--]  revised
11-Jun-14 fsum1p    [--same--]  revised
11-Jun-14 fsum1ps   ---         deleted; see fsum1p
11-Jun-14 fsumrecl  [--same--]  revised
11-Jun-14 fsum0cl   ---         deleted; see fsumcl
11-Jun-14 fsumcl    [--same--]  revised
11-Jun-14 fsumcllem [--same--]  revised; see this or fsumcl2lem
11-Jun-14 fsump1s   ---         deleted; see fsump1
11-Jun-14 fsump1slem ---        deleted
11-Jun-14 fsump1fi  ---         deleted; see fsump1
11-Jun-14 fsum1s2   ---         deleted; see sumsns
11-Jun-14 fsum1s    ---         deleted; see sumsns
11-Jun-14 fsum1slem ---         deleted
11-Jun-14 fsum1fi   ---         deleted; see fsum1
11-Jun-14 fsump1i   fsump1      revised
11-Jun-14 fsum1i    fsum1       revised
11-Jun-14 serzfsum  ---         deleted; see fsumser
11-Jun-14 fsumserz2 ---         deleted; see fsumser
11-Jun-14 fsumser1fi ---        deleted; see fsumser
11-Jun-14 fsumser0fi ---        deleted; see fsumser
11-Jun-14 fsumserzfi ---        deleted; see fsumser
11-Jun-14 fsumserz  fsumser     revised
11-Jun-14 dffsum    ---         deleted; see fsumser
11-Jun-14 sumeqfv   sumfc       revised
11-Jun-14 df-sum    [--same--]  revised
11-Jun-14 cvgcmp3ce cvgcmpce    revised
11-Jun-14 cvgcmp3cetlem2 ---    deleted
11-Jun-14 cvgcmp3cetlem1 ---    deleted
11-Jun-14 cvgcmp3cei ---        deleted; see cvgcmpce
11-Jun-14 cvgcmp3ci ---         deleted; see cvgcmpce
11-Jun-14 cvgcmpubi cvgcmpub    revised
11-Jun-14 cvgcmpi   cvgcmp      revised
11-Jun-14 cvgcmp2ci ---         deleted; see cvgcmp
11-Jun-14 cvgcmp2clemOLD ---    deleted
11-Jun-14 cvgcmp2clem ---       deleted
11-Jun-14 cvgcmp2i  ---         deleted; see cvgcmp
11-Jun-14 cvgcmp2lem ---        deleted
11-Jun-14 iserzabsi iserabs     revised
11-Jun-14 iserzabslem ---       deleted
11-Jun-14 ser1cmp2i ---         deleted
11-Jun-14 ser1cmp2lem ---       deleted
11-Jun-14 ser1cmp0i ---         deleted; see serge0
11-Jun-14 ser1cmpi  ---         deleted; see serle
11-Jun-14 ser1clim0 ---         deleted; see serclim0
11-Jun-14 ser10     ---         deleted; see ser0
11-Jun-14 ser1consti ser1const  revised
11-Jun-14 ser1f0i   ---         deleted; see serf0
11-Jun-14 serzf0i   serf0       revised
11-Jun-14 caucvg3   caucvg      revised
11-Jun-14 caucvg3i  ---         deleted; see caucvg
11-Jun-14 caucvg3lem ---        deleted
11-Jun-14 caucvg2i  caurcvg2    revised
11-Jun-14 caucvg3ai ---         deleted; see caucvg
11-Jun-14 caucvgi   caurcvg     revised
11-Jun-14 ---       ---         caucvglem1 - caucvglem6 deleted
11-Jun-14 climcaui  climcau     revised
11-Jun-14 climsupi  climsup     revised
11-Jun-14 climubi   ---         deleted; see monoord
11-Jun-14 climubii  ---         deleted; see monoord
11-Jun-14 climimi   climim      revised
11-Jun-14 climrei   climre      revised
11-Jun-14 climcji   climcj      revised
11-Jun-14 climabsi  climabs     revised
11-Jun-14 climabslem climcn1lem revised
11-Jun-14 climserzlei climserle revised
11-Jun-14 iserzexi  ---         deleted; see iserex
11-Jun-14 clim2serzi ---        deleted; see clim2ser
11-Jun-14 iserzshfti isershft   revised
11-Jun-14 iserzcmp0 iserge0     revised
11-Jun-14 iserzcmp  isercmp     revised
11-Jun-14 climsqueeze2 [--same--] revised
11-Jun-14 climsqueeze [--same--] revised
11-Jun-14 climcmpc1 climcmpc2   revised
11-Jun-14 climcmp   [--same--]  revised
11-Jun-14 climcmplem ---        deleted
11-Jun-14 iserzmulc1 isermulc2  revised
11-Jun-14 iserzex   iserex      revised
11-Jun-14 clim2serz clim2ser    revised
11-Jun-14 climmulci ---         deleted; see climmulc2
11-Jun-14 climaddci ---         deleted; see climaddc2
11-Jun-14 climsubc2 [--same--]  revised
11-Jun-14 climsub   [--same--]  revised
11-Jun-14 climmulc2 [--same--]  revised
11-Jun-14 climmul   [--same--]  revised
11-Jun-14 ---       ---         climmullem1 - climmullem8 deleted
11-Jun-14 climaddc2 [--same--]  revised
11-Jun-14 climaddc1 [--same--]  revised
11-Jun-14 climadd   [--same--]  revised
11-Jun-14 ---       ---         climaddlem1 - climaddlem3 deleted
11-Jun-14 climabs0i climabs0    revised
11-Jun-14 climge0   [--same--]  revised
11-Jun-14 climfnrcli ---        deleted; see climrecl
11-Jun-14 climrecl  [--same--]  revised
11-Jun-14 serzclim0 serclim0    revised
11-Jun-14 climuz0i  ---         deleted; see climconst2
11-Jun-14 iserzshft2i ---       deleted; see isershft
11-Jun-14 climshft2 [--same--]  revised
11-Jun-14 sershft   isershft
11-Jun-14 climshft  [--same--]  revised
11-Jun-14 climres   [--same--]  revised
11-Jun-14 2climnn0  ---         deleted; see 2clim
11-Jun-14 2climnn   ---         deleted; see 2clim
11-Jun-14 climeq    [--same--]  revised
11-Jun-14 climunii  ---         deleted; see climuni
11-Jun-14 clim0     climz
11-Jun-14 climconst3 ---        deleted; see climconst2
11-Jun-14 climconst2 [--same--] revised
11-Jun-14 climconsti climconst  revised
11-Jun-14 clmfnn    ---         deleted; see clim2c
11-Jun-14 climfnn   ---         deleted; see clim2c
11-Jun-14 clmi2a    ---         deleted; see climi2
11-Jun-14 clm4a     ---         deleted; see clim2c
11-Jun-14 clm0ii    ---         deleted; see climi0
11-Jun-14 clmi2rpi  ---         deleted; see climi2
11-Jun-14 clmi2i    ---         deleted; see climi2
11-Jun-14 clmi1i    ---         deleted; see climi
11-Jun-14 clm0nnsi  ---         deleted; see clim0c
11-Jun-14 clmnnsi   ---         deleted; see clim2c
11-Jun-14 clm0i     ---         deleted; see clim0c
11-Jun-14 clm4fi    ---         deleted; see clim2c
11-Jun-14 clm4lei   ---         deleted; see clim2c
11-Jun-14 clm3i     ---         deleted; see clim2c
11-Jun-14 clm2i     ---         deleted; see clim2
11-Jun-14 clm1i     ---         deleted; see clim2
11-Jun-14 climcl    [--same--]  changed variable names
11-Jun-14 clim      [--same--]  revised
11-Jun-14 ser1absdifi ---       deleted; see fsumabs or seqabs
11-Jun-14 ser1absdiflem ---     deleted
11-Jun-14 cauimi    ---         deleted
11-Jun-14 caurei    ---         deleted
11-Jun-14 caubndi   caubnd      revised
11-Jun-14 cvganuzi  rexanuz2    revised
11-Jun-14 cvganz    rexanuz     revised
11-Jun-14 cvg3i     ---         deleted; see rexuz3
11-Jun-14 cvg2i     ---         deleted
11-Jun-14 cvg1      ---         deleted
11-Jun-14 cvg1i     ---         deleted
11-Jun-14 cau5i     ---         deleted; see rexuz3
11-Jun-14 cau4ii    ---         deleted; see rexuz3
11-Jun-14 cau5ii    ---         deleted; see rexuz3
11-Jun-14 cau3i     cau3        revised
11-Jun-14 cau3iri   ---         deleted; see cau3
11-Jun-14 cau3ii    ---         deleted
11-Jun-14 cau2i     ---         deleted
11-Jun-14 seq1ubi   ---         deleted; see fimaxre3 and suprub
11-Jun-14 seq1ublem ---         deleted
11-Jun-14 seq1bndi  ---         deleted; see fimaxre3
11-Jun-14 sqsqr     resqrth
11-Jun-14 discrlem  discr       revised
11-Jun-14 ---       ---         discrlem1 - discrlem3 deleted
11-Jun-14 expnlbnd2 [--same--]  revised
11-Jun-14 leexp2r [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 ltexp2r   [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 leexp2a  [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 ltexp2    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expcan    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 ltexp2a   [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expm1     [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expsubOLD ---         deleted; see expsub
11-Jun-14 expsub    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 exprecOLD ---         deleted; see exprec
11-Jun-14 exprec    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expgt0    [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expne0i   [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 1exp      [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 rpexpcl   [--same--]  generalized antecedent to N e. ZZ
11-Jun-14 expval    [--same--]  revised
11-Jun-14 df-exp    [--same--]  revised
11-Jun-14 ser0p1i   ---         deleted; see seqp1i
11-Jun-14 ser00i    ---         deleted; see seq1i
11-Jun-14 ser0fi    ---         deleted; see serf
11-Jun-14 ser0cl1i  ---         deleted; see serf
11-Jun-14 serzcl1i  ---         deleted; see serf
11-Jun-14 seq1resval2g ---      deleted; see seqfveq
11-Jun-14 seqzresval2g ---      deleted; see seqfveq
11-Jun-14 seq1alcl  ---         deleted; see seqcl
11-Jun-14 seqzalcl  ---         deleted; see seqcl
11-Jun-14 seq0cl    ---         deleted; see seqf
11-Jun-14 seqzres2  ---         deleted; see seqres
11-Jun-14 seqzres   ---         deleted; see seqres
11-Jun-14 seqzresval ---        deleted; see seqfveq
11-Jun-14 seqzcl    ---         deleted; see seqf
11-Jun-14 seqzrn    ---         deleted; see seqf
11-Jun-14 seqzrn2   ---         deleted; see seqf2
11-Jun-14 seqzfveqg ---         deleted; see seqfveq
11-Jun-14 seqzeq    ---         deleted; see seqfeq
11-Jun-14 seqzfveq  ---         deleted; see seqfveq
11-Jun-14 seq1seqzg ---         deleted
11-Jun-14 seqzp1g   ---         deleted; see seqp1
11-Jun-14 seqz1g    ---         deleted; see seq1
11-Jun-14 seq01     ---         deleted; see seqp1i
11-Jun-14 seqzm1    ---         deleted; see seqm1
11-Jun-14 seq1shftid ---        deleted; see seqfeq
11-Jun-14 ser1addi  ---         deleted; see seradd
11-Jun-14 ser1add2i ---         deleted; see seradd
11-Jun-14 ser1monoi ---         deleted; see sermono
11-Jun-14 ser1p1i   ---         deleted; see seqp1i
11-Jun-14 ser11i    ---         deleted; see seq1i
11-Jun-14 ser1f2i   ---         deleted; see serf
11-Jun-14 ser1cl2i  ---         deleted; see serf
11-Jun-14 ser1refi  ---         deleted; see serfre
11-Jun-14 ser1recli ---         deleted; see serfre
11-Jun-14 ser1cl1i  ---         deleted; see serf
11-Jun-14 ser1fi    ---         deleted; see serf
11-Jun-14 ser1f     ---         deleted; see serf
11-Jun-14 seq1p1g   ---         deleted; see seqp1
11-Jun-14 seq11g    ---         deleted; see seq1
11-Jun-14 seq1res   ---         deleted; see seqres
11-Jun-14 seq1cl2   ---         deleted; see seqcl2
11-Jun-14 seq1cl    ---         deleted; see seqcl
11-Jun-14 seq1f2    ---         deleted; see seqf2
11-Jun-14 seq1f     ---         deleted; see seqf
11-Jun-14 seq1rn    ---         deleted; see seqf
11-Jun-14 seq1rn2   ---         deleted; see seqf2
11-Jun-14 seq1m1    ---         deleted; see seqm1
11-Jun-14 seq1lem2  ---         deleted
11-Jun-14 seq0p1    ---         deleted; see seqp1
11-Jun-14 seq00     ---         deleted; see seq1
11-Jun-14 seqzp1    ---         deleted; see seqp1
11-Jun-14 seqz1     ---         deleted; see seq1
11-Jun-14 seq0fn    ---         deleted; see seqfn
11-Jun-14 seq0seqz  ---         deleted
11-Jun-14 seq1seqz  ---         deleted
11-Jun-14 seqzfn    ---         deleted; see seqfn
11-Jun-14 seqzfval  ---         deleted
11-Jun-14 seq0fval  ---         deleted
11-Jun-14 seq1fn    ---         deleted; see seqfn
11-Jun-14 seq1p1    ---         deleted; see seqp1
11-Jun-14 seq11     ---         deleted; see seq1
11-Jun-14 seq1fval  ---         deleted
11-Jun-14 df-seqz   ---         deleted; see df-seq
11-Jun-14 df-seq0   ---         deleted; see df-seq
11-Jun-14 df-seq1   ---         deleted; see df-seq
11-Jun-14 cseqz     ---         deleted                - use seq theorems
11-Jun-14 cseq0     ---         deleted                  in place of seq1, etc.
11-Jun-14 cseq1     ---         deleted
11-Jun-14 sercmp    [--same--]  revised
11-Jun-14 ser0      [--same--]  revised
11-Jun-14 serdistr  [--same--]  revised
11-Jun-14 seqhomo   [--same--]  revised
11-Jun-14 seqid2    [--same--]  revised
11-Jun-14 seqid     [--same--]  revised
11-Jun-14 sersub    [--same--]  revised
11-Jun-14 seradd    [--same--]  revised
11-Jun-14 serf1o    [--same--]  revised
11-Jun-14 serf1olem2 [--same--] revised
11-Jun-14 serf1olem1 [--same--] revised
11-Jun-14 sercaopr  [--same--]  revised
11-Jun-14 seq1p     [--same--]  revised
11-Jun-14 seqsplit  [--same--]  revised
11-Jun-14 sermono   [--same--]  revised
11-Jun-14 monoord   [--same--]  revised
11-Jun-14 serfre    [--same--]  revised
11-Jun-14 serf      [--same--]  revised
11-Jun-14 seqres    [--same--]  revised
11-Jun-14 seqshft2  [--same--]  revised
11-Jun-14 seqfeq    [--same--]  revised
11-Jun-14 seqfveq   [--same--]  revised
11-Jun-14 seqfeq2   [--same--]  revised
11-Jun-14 seqfveq2  [--same--]  revised
11-Jun-14 seqf      [--same--]  revised
11-Jun-14 seqcl     [--same--]  revised
11-Jun-14 seqf2     [--same--]  revised
11-Jun-14 seqcl2    [--same--]  revised
11-Jun-14 caoprassg [--same--]  revised
11-Jun-14 caoprcomg [--same--]  revised
11-Jun-14 fvunsn    [--same--]  eliminate unnecessary hypothesis
29-May-14 iccss2    [--same--]  moved from JM's mathbox to main set.mm
29-May-14 iccss     [--same--]  moved from JM's mathbox to main set.mm
29-May-14 iccconn   [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 retopcon  [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconn    [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconnlem5 [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconnlem4 [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconnlem3 [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconnlem2 [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 reconnlem1 [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 connsub   [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 dfcon2    [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 ioodisj   [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 iccid      [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 imp511    [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 imp55     [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 imp5g     [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 mtord     [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 eqeu      [--same--]  moved from JGH's mathbox to main set.mm
29-May-14 uznnssnn  [--same--]  moved from SF's mathbox to main set.mm
22-May-14 dmnrng    dmnrngo     (in FL's mathbox)
22-May-14 smprngpr  smprngopr   (in FL's mathbox)
22-May-14 prrngrng  prrngorngo  (in FL's mathbox)
22-May-14 isprrng   isprrngo    (in FL's mathbox)
22-May-14 df-prrng  df-prrngo   (in FL's mathbox)
22-May-14 0ring     0rngo       (in FL's mathbox)
22-May-14 rngidl    rngoidl     (in FL's mathbox)
22-May-14 crnghomfo crngohomfo  (in FL's mathbox)
22-May-14 crngrng   crngorngo   (in FL's mathbox)
22-May-14 iscring2  iscrngo2    (in FL's mathbox)
22-May-14 iscring   iscrngo     (in FL's mathbox)
22-May-14 df-cring  df-crngo    (in FL's mathbox)
22-May-14 rngisoco  rngoisoco   (in FL's mathbox)
22-May-14 rngisocnv rngoisocnv  (in FL's mathbox)
22-May-14 rngisohom rngoisohom  (in FL's mathbox)
22-May-14 rngiso1o  rngoiso1o   (in FL's mathbox)
22-May-14 isrngiso  isrngoiso   (in FL's mathbox)
22-May-14 rngisoval rngoisoval  (in FL's mathbox)
22-May-14 df-rngiso df-rngoiso  (in FL's mathbox)
22-May-14 rngkerinj rngokerinj  (in FL's mathbox)
22-May-14 rnghomco  rngohomco   (in FL's mathbox)
22-May-14 rnghomsub rngohomsub  (in FL's mathbox)
22-May-14 rnghom0   rngohom0    (in FL's mathbox)
22-May-14 rnggrphom rngogrphom  (in FL's mathbox)
22-May-14 rnghommul rngohommul  (in FL's mathbox)
22-May-14 rnghomadd rngohomadd  (in FL's mathbox)
22-May-14 rnghom1   rngohom1    (in FL's mathbox)
22-May-14 rnghomcl  rngohomcl   (in FL's mathbox)
22-May-14 rnghomf   rngohomf    (in FL's mathbox)
22-May-14 isrnghom  isrngohom   (in FL's mathbox)
22-May-14 rnghomval rngohomval  (in FL's mathbox)
22-May-14 df-rnghom df-rngohom  (in FL's mathbox)
22-May-14 isdivrng3 isdrngo3    (in FL's mathbox)
22-May-14 isdivrng2 isdrngo2    (in FL's mathbox)
22-May-14 isdivrng1 isdrngo1    (in FL's mathbox)
22-May-14 ringsubdir rngosubdir (in FL's mathbox)
22-May-14 ringsubdi rngosubdi   (in FL's mathbox)
22-May-14 ringnegrmul rngonegrmul (in FL's mathbox)
22-May-14 ringneglmul rngoneglmul (in FL's mathbox)
22-May-14 ringnegmn1r rngonegmn1r (in FL's mathbox)
22-May-14 ringnegmn1l rngonegmn1l (in FL's mathbox)
22-May-14 ringsub   rngosub     (in FL's mathbox)
22-May-14 ringaddneg2 rngoaddneg2 (in FL's mathbox)
22-May-14 ringaddneg1 rngoaddneg1 (in FL's mathbox)
22-May-14 ringnegcl rngonegcl   (in FL's mathbox)
22-May-14 df-toprng df-toprngo  (in FL's mathbox)
22-May-14 glmring   glmrngo     (in FL's mathbox)
22-May-14 rngridfz  rngoridfz   (in FL's mathbox)
22-May-14 rngunval2 rngounval2  (in FL's mathbox)
22-May-14 rnginvcl  rngoinvcl   (in FL's mathbox)
22-May-14 rnplrnml3 rngodmeqrn  (in FL's mathbox)
22-May-14 rngdmdmrn rngodmdmrn  (in FL's mathbox)
22-May-14 uznzr     rngoueqz
22-May-14 ring1cl   rngo1cl
22-May-14 on1el6    rngosn6
22-May-14 on1el4    rngosn4
22-May-14 on1el3    rngosn3
22-May-14 ringoridm rngoridm
22-May-14 ringolidm rngolidm
22-May-14 ringoidmlem rngoidmlem
22-May-14 fora      rngoablo2
22-May-14 fora2     rngoablo2lem2
22-May-14 fora1     rngoablo2lem1
22-May-14 unmnd     rngomnd
22-May-14 rnplrnml  rngorn1eq
22-May-14 rnplrnml2 rngorn1
22-May-14 rnplrnml0 rngodm1dm2
22-May-14 rngn0     rngon0
22-May-14 drngi     drngoi
22-May-14 ringsn    rngosn
22-May-14 cnring    cnrngo
22-May-14 ringorz   rngorz
22-May-14 ringolz   rngolz
22-May-14 ring0lid  rngo0lid
22-May-14 ring0rid  rngo0rid
22-May-14 ring0cl   rngo0cl
22-May-14 ringlcan  rngolcan
22-May-14 ringrcan  rngorcan
22-May-14 ringa4    rngoa4
22-May-14 ringa32   rngoa32
22-May-14 ringaass  rngoaass
22-May-14 ringcom   rngocom
22-May-14 ringgcl   rngogcl
22-May-14 ringogrpo rngogrpo
22-May-14 ringoablo rngoablo
22-May-14 ring2     rngo2
22-May-14 ringoass  rngoass
22-May-14 ringodir  rngodir
22-May-14 ringodi   rngodi
22-May-14 ringoideu rngoideu
22-May-14 ringid    rngoid
22-May-14 ringocl   rngocl
22-May-14 ringsm    rngosm
22-May-14 ringoi    rngoi
22-May-14 isringod  isrngod
22-May-14 isringo   isrngo
22-May-14 relrng    relrngo
22-May-14 df-ringo  df-rngo
22-May-14 cring     crngo
21-May-14 infmrgelb [--same--]  moved from JM's mathbox to main set.mm; revised
21-May-14 infmrlb   [--same--]  moved from JM's mathbox to main set.mm; revised
21-May-14 fienf1f1o ---         deleted; use f1finf1o
21-May-14 lbleinf   infmrgelb   moved from JGH's mathbox to main set.mm
21-May-14 divcan7   [--same--]  moved from JGH's mathbox to main set.mm
21-May-14 blhalf    [--same--]  moved from JM's mathbox to main set.mm
21-May-14 lt0nnn0   [--same--]  revised
17-May-14 oprabval2ga ---       deleted; use ovmpt2g
17-May-14 mpt2fng   ---         deleted; use fnmpt2
17-May-14 rngop     rnmpt2
17-May-14 fnoprab2ga fnmpt2
17-May-14 fnoprab2a fnmpt2i
17-May-14 dmoprab2a dmmpt2
17-May-14 foprab2a  fmpt2
17-May-14 oprabex2ga mpt2exg
17-May-14 mpt2exg   mpt2exga
17-May-14 dmmpt2    dmmpt
17-May-14 dmmpt     dmmptg
17-May-14 visset    vex
17-May-14 elisseti  elexi
17-May-14 elissetxx elisset
17-May-14 elisset   elex
17-May-14 elex      elissetxx
17-May-14 syl111anc syl3anc
17-May-14 syl11anc  syl2anc
11-Mar-14 syl2anc   syl2anr
 7-May-14 peano5uztiOLD ---     deleted
 7-May-14 peano5uziOLD ---      deleted
 7-May-14 dfnn2     dfnn3
 7-May-14 dfnn3     ---         deleted from JH's mathbox; see df-n
19-Apr-14 mod0      [--same--]  moved from JM's mathbox to main set.mm
19-Apr-14 invrcl    ---         deleted; use drnginvrcl and drnginvn0
16-Apr-14 grpkerinj grpokerinj  (in JM's mathbox)
16-Apr-14 grpeqdivid grpoeqdivid (in JM's mathbox)
16-Apr-14 grphm     grpohm      (in FL's mathbox)
16-Apr-14 grphlem5  grpohlem5   (in FL's mathbox)
16-Apr-14 grphmlem4 grpohmlem4  (in FL's mathbox)
16-Apr-14 grphlem3  grpohlem3   (in FL's mathbox)
16-Apr-14 grphmlem2 grpohmlem2  (in FL's mathbox)
16-Apr-14 grphmlem1 grpohmlem1  (in FL's mathbox)
16-Apr-14 grpdivzer grpodivzer  (in FL's mathbox)
16-Apr-14 grpdlcan  grpodlcan   (in FL's mathbox)
16-Apr-14 grpdrcan  grpodrcan   (in FL's mathbox)
16-Apr-14 grpdivfo  grpodivfo   (in FL's mathbox)
16-Apr-14 grpdivone grpodivone  (in FL's mathbox)
16-Apr-14 grpmnd    grpomnd     (in FL's mathbox)
16-Apr-14 grplactf1o grpolactf1o
16-Apr-14 grpnpncan grponpncan
16-Apr-14 grpnnncan2 grponnncan2
16-Apr-14 grppnpcan2 grpopnpcan2
16-Apr-14 grpnpcan  grponpcan
16-Apr-14 grppncan  grpopncan
16-Apr-14 grpdivid  grpodivid
16-Apr-14 grpmuldivass grpomuldivass
16-Apr-14 grpdivdiv grpodivdiv
16-Apr-14 grpdivcl  grpodivcl
16-Apr-14 grpdivf   grpodivf
16-Apr-14 grpdivval grpodivval
16-Apr-14 grpdivfval grpodivfval
16-Apr-14 grpinvdiv grpoinvdiv
16-Apr-14 grpdivinv grpodivinv
16-Apr-14 grpinvop  grpoinvop
16-Apr-14 grpinvf   grpoinvf
16-Apr-14 grp2inv   grpo2inv
16-Apr-14 grpasscan2 grpoasscan2
16-Apr-14 grpasscan1 grpoasscan1
16-Apr-14 grpsn     grposn
16-Apr-14 grprn     grporn
16-Apr-14 grprndm   grporndm
16-Apr-14 grpfo     grpofo
16-Apr-14 grp2grp   grpo2grp
 2-Apr-14 ---       ---         math token "Cgr" changed to "=="
 2-Apr-14 ---       ---         math token "(++)" changed to "(+)"
 2-Apr-14 ---       ---         math token "(+)" changed to "\/_"
31-Mar-14 grpinvcl  [--same--]  removed redundant hypothesis
31-Mar-14 ---       ---         math token "-g" changed to "invg"
23-Mar-14 hbequid2  ---         deleted; use hbequid
22-Mar-14 firnfi4   ---         deleted from JM's mathbox; see abrexfi
22-Mar-14 firnfi3   ---         deleted from JM's mathbox; see abrexfi
22-Mar-14 firnfi2   ---         deleted from JM's mathbox; see abrexfi
22-Mar-14 firnfi    ---         deleted from JM's mathbox; see abrexfi
22-Mar-14 cvol      clvol
22-Mar-14 fimaxre2  [--same--]  moved from JM's mathbox to main set.mm; revised
22-Mar-14 fimaxre   [--same--]  moved from JM's mathbox to main set.mm
15-Mar-14 reef11i   ---         deleted; see reef11
15-Mar-14 fsumsub   [--same--]  moved from SF's mathbox to main set.mm
15-Mar-14 fsumneg   [--same--]  moved from SF's mathbox to main set.mm
15-Mar-14 bccmpl    [--same--]  revised
15-Mar-14 ---       ---         fseq1p1m1lem1 - fseq1p1m1lem3 deleted
15-Mar-14 fz1eqblem ---         deleted
15-Mar-14 fzsuc     [--same--]  revised; see also fzsuc2
15-Mar-14 uz2m1nn   [--same--]  moved from PC's mathbox to main set.mm
15-Mar-14 elnn00nn  ---         deleted; see elnn0
15-Mar-14 npncan3   [--same--]  moved from SF's mathbox to main set.mm
15-Mar-14 npncan2   [--same--]  moved from SF's mathbox to main set.mm
12-Mar-14 copsexgb  coprsexg
 9-Mar-14 grpid     [--same--]  revised
 2-Mar-14 bnj1150   unssd       moved from JB's mathbox to main set.mm
28-Feb-14 f1oeq23   [--same--]  moved from FL's mathbox to main set.mm
28-Feb-14 fzp1elp1  [--same--]  moved from JM's mathbox to main set.mm
28-Feb-14 divides2  [--same--]  moved from JGH's mathbox to main set.mm
28-Feb-14 fzfi2     ---         deleted from JM's mathbox; see fzfi
28-Feb-14 fzfi      [--same--]  moved from JM's mathbox; revised
28-Feb-14 fz1fi     ---         deleted; see fzfi
25-Feb-14 biadan2   [--same--]  moved from JM's mathbox to main set.mm
23-Feb-14 op1steq   [--same--]  generalized antecedent from _V X. _V to V X. W
23-Feb-14 eqop      [--same--]  generalized antecedent from _V X. _V to V X. W
23-Feb-14 eqopi     [--same--]  generalized antecedent from _V X. _V to V X. W
20-Feb-14 eqreldv2  [--same--]  moved from RM's mathbox to main set.mm; revised
20-Feb-14 eqreldv   [--same--]  moved from RM's mathbox to main set.mm
17-Feb-14 qnnenOLD  ---         deleted; see qnnen
17-Feb-14 divvali   divval      revised
17-Feb-14 receui    receu       revised
17-Feb-14 recexi    ---         deleted; see recex
17-Feb-14 ax-cnex   ---         deleted; see cnex
17-Feb-14 axcnex    ---         deleted; see cnex
17-Feb-14 srex      ---         deleted
 4-Feb-14 abl23     ablo32
 4-Feb-14 abl4      ablo4
 4-Feb-14 abldiv23  ablodiv32
 4-Feb-14 nvadd23   nvadd32
 4-Feb-14 vca23     vca32
 4-Feb-14 ringa23   ringa32
 4-Feb-14 divdiv23i divdiv32i
 4-Feb-14 divdiv23  divdiv32
 4-Feb-14 sub23     sub32
 4-Feb-14 dif23     dif32
 4-Feb-14 or23      or32
30-Jan-14 heibor    [--same--]  revised
30-Jan-14 ---       ---         heiborlem11 - heiborlem42 deleted
30-Jan-14 heiborlem10 [--same--] revised
30-Jan-14 heiborlem9 [--same--] revised
30-Jan-14 heiborlem8 [--same--] revised
30-Jan-14 heiborlem7 [--same--] revised
30-Jan-14 heiborlem6 [--same--] revised
30-Jan-14 heiborlem5 [--same--] revised
30-Jan-14 heiborlem4 [--same--] revised
30-Jan-14 heiborlem3 [--same--] revised
30-Jan-14 heiborlem2 [--same--] revised
30-Jan-14 heiborlem1 [--same--] revised
30-Jan-14 ismtyhmeolem [--same--] revised
30-Jan-14 hmopbdopiHIL ---      deleted; see hmopbdoptHIL
30-Jan-14 htthi     htth        revised
30-Jan-14 ---       ---         htthlem1 - htthlem12 deleted
30-Jan-14 ubthi     ubth        revised
30-Jan-14 ubthii    ---         deleted; see ubth
30-Jan-14 ---       ---         ubthlem4 - ubthlem14 deleted
30-Jan-14 ubthlem3  [--same--]  revised
30-Jan-14 ubthlem2  [--same--]  revised
30-Jan-14 ubthlem1  [--same--]  revised
30-Jan-14 bcth      [--same--]  revised
30-Jan-14 ---       ---         bcthlem6 - bcthlem33 deleted
30-Jan-14 bcthlem5  [--same--]  revised
30-Jan-14 bcthlem4  [--same--]  revised
30-Jan-14 bcthlem3  [--same--]  revised
30-Jan-14 bcthlem2  [--same--]  revised
30-Jan-14 bcthlem1  [--same--]  revised
30-Jan-14 fimax     ---         deleted; see fimaxg
30-Jan-14 ac6sfilem3 ---        deleted
30-Jan-14 ac6sfilem2 ---        deleted
30-Jan-14 ac6sfilem1 ---        deleted
30-Jan-14 metdcn    [--same--]  revised
30-Jan-14 ---       ---         metnrmlem4 - metnrmlem6 deleted
30-Jan-14 metnrmlem3 [--same--] revised
30-Jan-14 metnrmlem2 [--same--] revised
30-Jan-14 metnrmlem1 [--same--] revised
30-Jan-14 altretoplem2 ---      deleted
30-Jan-14 altretoplem1 ---      deleted
30-Jan-14 bsi3      bsi
30-Jan-14 bsi2      ---         deleted; see bsi
30-Jan-14 bsi       [--same--]  revised
30-Jan-14 subtopmetlem ---      deleted
30-Jan-14 basmetres ---         deleted; see metssba2
30-Jan-14 nvcnpi4   ---         deleted; see metcnpi4
30-Jan-14 nvcnpi3   ---         deleted; see metcnpi3
30-Jan-14 nmcn3     ---         deleted; see nmcn
30-Jan-14 nmcn2     ---         deleted; see nmcn
30-Jan-14 nmcni     ---         deleted; see nmcn
30-Jan-14 nmcnilem  ---         deleted
30-Jan-14 sqcn2     ---         deleted; see sqcn
30-Jan-14 sqcn      [--same--]  revised
30-Jan-14 nvcni3    ---         deleted; see metcni
30-Jan-14 nvcni2    ---         deleted; see metcni
30-Jan-14 nvcni     ---         deleted; see metcni
30-Jan-14 nvcnpf    ---         deleted; see metcnpf
30-Jan-14 nvcnf     ---         deleted; see metcnf
30-Jan-14 nvelbl2   [--same--]  revised
30-Jan-14 nvelbl    [--same--]  revised
30-Jan-14 metcnp4OLD ---        deleted
30-Jan-14 metcnp4lem2 [--same--] revised
30-Jan-14 metelclsOLD ---       deleted
30-Jan-14 tgioolem  ---         deleted
30-Jan-14 bl2ioo    [--same--]  revised
30-Jan-14 metcnp3   [--same--]  revised
30-Jan-14 metcni2   [--same--]  revised
30-Jan-14 metcni    [--same--]  revised
30-Jan-14 metcnpi4  [--same--]  revised
30-Jan-14 metcnpi3  [--same--]  revised
30-Jan-14 metcnpi2  [--same--]  revised
30-Jan-14 metcnpi   [--same--]  revised
30-Jan-14 metcn     [--same--]  revised
30-Jan-14 metcnp2   [--same--]  revised
30-Jan-14 metcnp    [--same--]  revised
30-Jan-14 metcnplem [--same--]  revised
30-Jan-14 metequiv  [--same--]  revised
30-Jan-14 lpbl      [--same--]  revised
30-Jan-14 blnei     [--same--]  revised
30-Jan-14 metnei    [--same--]  revised
30-Jan-14 neibl     [--same--]  revised
30-Jan-14 blopn     [--same--]  revised
30-Jan-14 tgbl      ---         deleted; see opnval
30-Jan-14 opni3     [--same--]  revised
30-Jan-14 opni2     [--same--]  revised
30-Jan-14 isopn4    [--same--]  revised
30-Jan-14 uniopn2   [--same--]  revised
30-Jan-14 opnfval   ---         deleted
30-Jan-14 ssblex    [--same--]  revised
30-Jan-14 ssbl      [--same--]  revised
30-Jan-14 blssex    [--same--]  revised
30-Jan-14 blss      [--same--]  revised
30-Jan-14 blin      [--same--]  revised
30-Jan-14 rnblssm   ---         deleted; see blssm
30-Jan-14 blssm     [--same--]  revised
30-Jan-14 blex      ---         deleted; see unirnbl
30-Jan-14 blelrn    [--same--]  revised
30-Jan-14 blrn3     ---         deleted; see blrn
30-Jan-14 bln0      [--same--]  revised
30-Jan-14 blcntr    [--same--]  revised
30-Jan-14 blf       [--same--]  revised
30-Jan-14 bl2in     [--same--]  revised
30-Jan-14 blrn2     ---         deleted; see blrn
30-Jan-14 blrn      [--same--]  revised
30-Jan-14 elbl3     [--same--]  revised
30-Jan-14 elbl2     [--same--]  revised
30-Jan-14 elbl      [--same--]  revised
30-Jan-14 blval     [--same--]  revised
30-Jan-14 metdmdm   ---         deleted; see a1i
30-Jan-14 df-opn    [--same--]  revised
30-Jan-14 uniretop  [--same--]  revised
30-Jan-14 unirnioo  [--same--]  revised
30-Jan-14 qjust     ---         deleted
30-Jan-14 df-q      [--same--]  revised
30-Jan-14 unifo     iunfo       revised
30-Jan-14 oprelimab [--same--]  revised
30-Jan-14 oprvelrn  [--same--]  revised
16-Jan-14 resex     [--same--]  moved from JM's mathbox to main set.mm
16-Jan-14 ifeq2da   [--same--]  moved from JM's mathbox to main set.mm
16-Jan-14 ifeq1da   [--same--]  moved from JM's mathbox to main set.mm
16-Jan-14 fvif      [--same--]  moved from JM's mathbox to main set.mm
15-Jan-14 ifclda    [--same--]  moved from JM's mathbox to main set.mm
14-Jan-14 wl-adnestantdALT embantd moved from WL's mathbox to main set.mm
14-Jan-14 rabbirdv  rabbi2dva   revised hypothesis
13-Jan-14 19.23aexi exlimexi    (in AS's mathbox)
13-Jan-14 r19.23aib rexlimib    (in FL's mathbox)
13-Jan-14 r19.23advv rexlimdvv
13-Jan-14 r19.23aivv rexlimivv
13-Jan-14 r19.23adva rexlimdva
13-Jan-14 r19.23adv rexlimdv
13-Jan-14 r19.23ad2 rexlimd2
13-Jan-14 r19.23ad  rexlimd
13-Jan-14 r19.23aivw rexlimivw
13-Jan-14 r19.23aiva rexlimiva
13-Jan-14 r19.23aiv rexlimiv
13-Jan-14 r19.23ai  rexlimi
13-Jan-14 19.23advv exlimdvv
13-Jan-14 19.23aivv exlimivv
13-Jan-14 19.23aiv  exlimiv
13-Jan-14 19.23adv  exlimdv
13-Jan-14 19.23ad   exlimd
13-Jan-14 19.23ai   exlimi
13-Jan-14 19.21a3con13v alrim3con13v (In AS's mathbox)
13-Jan-14 r19.21advva ralrimdvva
13-Jan-14 r19.21advv ralrimdvv
13-Jan-14 r19.21aivva ralrimivva
13-Jan-14 r19.21aivv ralrimivv
13-Jan-14 r19.21adva ralrimdva
13-Jan-14 r19.21adv ralrimdv
13-Jan-14 r19.21ad  ralrimd
13-Jan-14 r19.21aiva ralrimiva
13-Jan-14 r19.21aiv ralrimiv
13-Jan-14 r19.21ai  ralrimi
13-Jan-14 19.21adv  alrimdv
13-Jan-14 19.21aivv alrimivv
13-Jan-14 19.21aiv  alrimiv
13-Jan-14 19.21ad   alrimd
13-Jan-14 19.21ai   alrimi
 9-Jan-14 dvrngprop drngprop
 9-Jan-14 dvrngid2  drngid2
 9-Jan-14 divrngunz drngunz
 9-Jan-14 divrngid  drngid
 9-Jan-14 divrngidlem drngidlem
 9-Jan-14 divrngmcl drngmcl
 9-Jan-14 divrngmgrp drngmgrp
 9-Jan-14 isdivrngrd isdrngrd
 9-Jan-14 isdivrngd isdrngd
 9-Jan-14 divrnggrp drnggrp
 9-Jan-14 divrngring drngrng
 9-Jan-14 isdivrng  isdrng
 9-Jan-14 cdivring  cdr
 9-Jan-14 ringrz    rngrz
 9-Jan-14 ringlz    rnglz
 9-Jan-14 isringd   isrngd
 9-Jan-14 isringid  isrngid
 9-Jan-14 ringridm  rngridm
 9-Jan-14 ringlidm  rnglidm
 9-Jan-14 ringidmlem rngidmlem
 9-Jan-14 ringgrp   rnggrp
 9-Jan-14 ringabl   rngabl
 9-Jan-14 ringidcl  rngidcl
 9-Jan-14 ringdir   rngdir
 9-Jan-14 ringdi    rngdi
 9-Jan-14 ringideu  rngideu
 9-Jan-14 ringass   rngass
 9-Jan-14 ringcl    rngcl
 9-Jan-14 ringi     rngi
 9-Jan-14 isring    isrng
 9-Jan-14 ringidval rngidval
23-Dec-13 cvimarndm cnvimarndm
23-Dec-13 cnvresima [--same--]  moved from JGH's mathbox to main set.mm
23-Dec-13 hstel     ishst
23-Dec-13 stel      isst        revised
23-Dec-13 df-hst    [--same--]  revised
23-Dec-13 df-st     [--same--]  revised
23-Dec-13 shsumval3i shsval3i
23-Dec-13 shsumval2i shsval2i
23-Dec-13 dfchj3    sshjval3    revised
23-Dec-13 dfchj2    sshjval2    revised
23-Dec-13 dfchsup2  ---         deleted; see hsupval2
23-Dec-13 shsumval  shsval      revised
23-Dec-13 df-chsup  [--same--]  revised
23-Dec-13 df-chj    [--same--]  revised
23-Dec-13 df-span   [--same--]  revised
23-Dec-13 df-shsum  df-shs      revised
23-Dec-13 dfch2     [--same--]  revised
23-Dec-13 ch2       isch3
23-Dec-13 chcmhi    ---         deleted; see isch3
23-Dec-13 chsscmi   ---         deleted; see isch3
23-Dec-13 closedsub isch2
23-Dec-13 df-ch     [--same--]  revised
23-Dec-13 sh2       issh3
23-Dec-13 sh        issh2
23-Dec-13 df-sh     [--same--]  revised
23-Dec-13 pjmval    pjfval      revised
23-Dec-13 df-pj     [--same--]  revised
23-Dec-13 df-oc     [--same--]  revised
23-Dec-13 dfhnorm2  [--same--]  revised
23-Dec-13 df-hvsub  [--same--]  revised
23-Dec-13 df-hnorm  [--same--]  revised
23-Dec-13 nvmfval   [--same--]  revised
23-Dec-13 iscringd  [--same--]  (in JM's mathbox) revised
23-Dec-13 flddivrng [--same--]  moved from JM's mathbox to main set.mm; revised
23-Dec-13 isringod  [--same--]  moved from JM's mathbox to main set.mm; revised
23-Dec-13 exidreslem [--same--] (in JM's mathbox) revised
23-Dec-13 extopgrp  [--same--]  (in FL's mathbox) revised
23-Dec-13 invtrgrp  ginvsn      moved from FL's mathbox to main set.mm; revised
23-Dec-13 idtrgrp   gidsn       moved from FL's mathbox to main set.mm; revised
23-Dec-13 zrfld     [--same--]  (in FL's mathbox) revised
23-Dec-13 fldi      [--same--]  (in FL's mathbox) revised
23-Dec-13 rngunval2 [--same--]  (in FL's mathbox) revised
23-Dec-13 ununr     [--same--]  (in FL's mathbox) revised
23-Dec-13 mndid     [--same--]  (in FL's mathbox) (in FL's mathbox) revised
23-Dec-13 zrdivrng  [--same--]  revised
23-Dec-13 rngmgmbs4 [--same--]  revised
23-Dec-13 ismnd2    [--same--]  revised
23-Dec-13 ismnd1    [--same--]  revised
23-Dec-13 ismnd     [--same--]  revised
23-Dec-13 isexid2   [--same--]  revised
23-Dec-13 isexid    [--same--]  revised
23-Dec-13 df-exid   [--same--]  revised
23-Dec-13 0vfval    [--same--]  revised
23-Dec-13 ringoideu [--same--]  revised
23-Dec-13 ringid    [--same--]  revised
23-Dec-13 ringoi    [--same--]  revised
23-Dec-13 isringo   [--same--]  revised
23-Dec-13 df-ringo  [--same--]  revised
23-Dec-13 gxnval    [--same--]  revised
23-Dec-13 gxpval    [--same--]  revised
23-Dec-13 gxval     [--same--]  revised
23-Dec-13 gxoprval  gxfval      revised
23-Dec-13 grpdivfval [--same--] revised
23-Dec-13 grpoinvval [--same--] revised
23-Dec-13 grpoinvfval [--same--] revised
23-Dec-13 grpoidval [--same--]  revised
23-Dec-13 grpidvallem ---       deleted
23-Dec-13 fungid    fngid       revised
23-Dec-13 gid0      ---         deleted
23-Dec-13 grprlidrid ---        deleted
23-Dec-13 df-gx     [--same--]  revised
23-Dec-13 df-gdiv   [--same--]  revised
23-Dec-13 df-ginv   [--same--]  revised
23-Dec-13 df-gid    [--same--]  revised
22-Dec-13 df-igen   [--same--]  (in JM's mathbox) revised
22-Dec-13 pcoval    [--same--]  (in JM's mathbox) revised
22-Dec-13 pcofval   [--same--]  (in JM's mathbox) revised
22-Dec-13 df-pi1    [--same--]  (in JM's mathbox) revised
22-Dec-13 df-pi1b   [--same--]  (in JM's mathbox) revised
22-Dec-13 df-pco    [--same--]  (in JM's mathbox) revised
22-Dec-13 txsubsp   [--same--]  (in JM's mathbox) revised
22-Dec-13 subspabs  ---         (in JM's mathbox) deleted; use subspco
22-Dec-13 subspopn  [--same--]  (in JM's mathbox) revised
22-Dec-13 fzm1      [--same--]  moved from JM's mathbox to main set.mm
22-Dec-13 elfzp12   [--same--]  moved from JM's mathbox to main set.mm
22-Dec-13 zornn0    [--same--]  moved from JM's mathbox to main set.mm
22-Dec-13 inficl    [--same--]  moved from JM's mathbox to main set.mm; revised
22-Dec-13 resoprab2 [--same--]  moved from JM's mathbox to main set.mm
22-Dec-13 oprabval2a ovmpt2x    moved from JM's mathbox to main set.mm; revised
22-Dec-13 eqfnoprv2 [--same--]  moved from JM's mathbox to main set.mm
22-Dec-13 filnetlem5 [--same--] (in JGH's mathbox) revised
22-Dec-13 filnetlem4 [--same--] (in JGH's mathbox) revised
22-Dec-13 filnetlem3 [--same--] (in JGH's mathbox) revised
22-Dec-13 filnetlem2 [--same--] (in JGH's mathbox) revised
22-Dec-13 filnetlem1 [--same--] (in JGH's mathbox) revised
22-Dec-13 tailmap   tailf       (in JGH's mathbox)
22-Dec-13 istail    tailval     (in JGH's mathbox) revised
22-Dec-13 tailf     tailfval    (in JGH's mathbox) revised
22-Dec-13 fmfnfm    [--same--]  (in JGH's mathbox) revised
22-Dec-13 fmfnfmlem4 [--same--] (in JGH's mathbox) revised
22-Dec-13 fmfnfmlem3 [--same--] (in JGH's mathbox) revised
22-Dec-13 fmfnfmlem2 [--same--] (in JGH's mathbox) revised
22-Dec-13 fmfnfmlem1 [--same--] (in JGH's mathbox) revised
22-Dec-13 ufcondr   ufildr      (in JGH's mathbox) revised
22-Dec-13 uffinfix  [--same--]  (in JGH's mathbox) revised
22-Dec-13 fixufil   [--same--]  (in JGH's mathbox) changed variable names
22-Dec-13 uffixfr   [--same--]  (in JGH's mathbox) revised
22-Dec-13 ufileulem ---         (in JGH's mathbox) deleted
22-Dec-13 filssufillem ---      (in JGH's mathbox) deleted
22-Dec-13 supfil    [--same--]  (in JGH's mathbox) revised
22-Dec-13 fbasfip   [--same--]  moved from JGH's mathbox to main set.mm;revised
22-Dec-13 subsubtop ---         (in JGH's mathbox) to be deleted; use subspco
22-Dec-13 ssntr     [--same--]  moved from JGH's mathbox to main set.mm;revised
22-Dec-13 elfiun    [--same--]  moved from JGH's mathbox to main set.mm;revised
22-Dec-13 isrocatset [--same--] (in FL's mathbox) revised
22-Dec-13 df-rocatset [--same--] (in FL's mathbox) revised
22-Dec-13 singcon   ---         (in FL's mathbox) deleted
22-Dec-13 topsinind topsn       moved from FL's mathbox to main set.mm; revised
22-Dec-13 empcon    ---         (in FL's mathbox) deleted
22-Dec-13 intopcon  [--same--]  (in FL's mathbox) revised
22-Dec-13 clindistop [--same--] (in FL's mathbox) revised
22-Dec-13 stfincomp [--same--]  (in FL's mathbox) revised
22-Dec-13 cmptop    [--same--]  (in FL's mathbox) revised
22-Dec-13 subsincomp ---        (in FL's mathbox) deleted
22-Dec-13 subempcomp ---        (in FL's mathbox) deleted
22-Dec-13 limfillem2 ---        (in FL's mathbox) deleted
22-Dec-13 limfillem1 ---        (in FL's mathbox) deleted
22-Dec-13 trnei2    trnei       (in FL's mathbox) revised
22-Dec-13 trfil     [--same--]  (in FL's mathbox) revised
22-Dec-13 rcfpfil   [--same--]  (in FL's mathbox) revised
22-Dec-13 rcfpfillem6 ---       (in FL's mathbox) deleted
22-Dec-13 rcfpfillem5 ---       (in FL's mathbox) deleted
22-Dec-13 rcfpfillem4 ---       (in FL's mathbox) deleted
22-Dec-13 rcfpfillem3 ---       (in FL's mathbox) deleted
22-Dec-13 rcfpfillem2 ---       (in FL's mathbox) deleted
22-Dec-13 rcfpfillem1 ---       (in FL's mathbox) deleted
22-Dec-13 efilcp2   efilcp      (in FL's mathbox) revised
22-Dec-13 efilcp    [--same--]  (in FL's mathbox) revised
22-Dec-13 fgsb      ---         (in FL's mathbox) deleted; use fsubbas,fgfil
22-Dec-13 ptincpw   ---         (in FL's mathbox) deleted; use topgele
22-Dec-13 topge     ---         (in FL's mathbox) deleted; use pwuni
22-Dec-13 topgele   [--same--]  moved from FL's mathbox to main set.mm; revised
22-Dec-13 subtopsin2 subspsn2   moved from FL's mathbox to main set.mm; revised
22-Dec-13 stoig2b   ---         (in FL's mathbox) deleted; use subspuni
22-Dec-13 sbtpsines subspsn     moved from FL's mathbox to main set.mm; revised
22-Dec-13 subspemp2 subsp0      moved from FL's mathbox to main set.mm; revised
22-Dec-13 subspemp  ---         (in FL's mathbox) deleted; use subsp0
22-Dec-13 intopcoaconlem3 [--same--] (in FL's mathbox) revised
22-Dec-13 bintop3   ---         (in FL's mathbox) deleted; use fibas
22-Dec-13 bintop    ---         (in FL's mathbox) deleted; use fibas
22-Dec-13 topindis  ---         (in FL's mathbox) deleted; use topgele
22-Dec-13 rngop     [--same--]  moved from FL's mathbox to main set.mm
22-Dec-13 relcnvfld [--same--]  moved from FL's mathbox to main set.mm
22-Dec-13 ficli     ---         (in FL's mathbox) deleted; use fiin
22-Dec-13 fiiu      ---         (in FL's mathbox) deleted; use fipwuni
22-Dec-13 infi1     ---         (in FL's mathbox) deleted; use fiin
22-Dec-13 mpteq2dvg mpteq2dvgOLD (in FL's mathbox)
22-Dec-13 uzf       [--same--]  moved from SF's mathbox to main set.mm; revised
22-Dec-13 fzf       [--same--]  moved from SF's mathbox to main set.mm; revised
22-Dec-13 elfzm1b   [--same--]  moved from PC's mathbox to main set.mm
22-Dec-13 hashgaddOLD ---       (in PC's mathbox) deleted
22-Dec-13 ---       ---         nmcopexlem1 - nmcopexlem6 deleted
22-Dec-13 eigval1   eigvalval
22-Dec-13 kbvalval  kbval
22-Dec-13 kbval     kbfval      revised
22-Dec-13 bravalval braval
22-Dec-13 braval    brafval     revised
22-Dec-13 cnfnc     [--same--]  revised
22-Dec-13 elnlfn    [--same--]  revised
22-Dec-13 cnopc     [--same--]  revised
22-Dec-13 eigvalval eigvalfval  revised
22-Dec-13 eigvecval [--same--]  revised
22-Dec-13 elcnfn    [--same--]  revised
22-Dec-13 nlfnval   [--same--]  revised
22-Dec-13 dfbdop2   df-bdop
22-Dec-13 elcnop    [--same--]  revised
22-Dec-13 df-spec   [--same--]  revised
22-Dec-13 df-eigval [--same--]  revised
22-Dec-13 df-eigvec [--same--]  revised
22-Dec-13 df-kb     [--same--]  revised
22-Dec-13 df-bra    [--same--]  revised
22-Dec-13 df-lnfn   [--same--]  revised
22-Dec-13 df-cnfn   [--same--]  revised
22-Dec-13 df-nlfn   [--same--]  revised
22-Dec-13 df-nmfn   [--same--]  revised
22-Dec-13 df-hmop   [--same--]  revised
22-Dec-13 df-bdop   [--same--]  revised
22-Dec-13 df-lnop   [--same--]  revised
22-Dec-13 df-cnop   [--same--]  revised
22-Dec-13 df-nmop   [--same--]  revised
22-Dec-13 hfsval    [--same--]  revised
22-Dec-13 hfmmval   [--same--]  revised
22-Dec-13 hfsmval   [--same--]  revised
22-Dec-13 hodmval   [--same--]  revised
22-Dec-13 hommval   [--same--]  revised
22-Dec-13 hosmval   [--same--]  revised
22-Dec-13 df-hfmul  [--same--]  revised
22-Dec-13 df-hsum   [--same--]  revised
22-Dec-13 df-hodif  [--same--]  revised
22-Dec-13 df-homul  [--same--]  revised
22-Dec-13 df-hosum  [--same--]  revised
22-Dec-13 tosdir    [--same--]  revised
22-Dec-13 dirge     [--same--]  changed variable names
22-Dec-13 dirtr     [--same--]  changed variable names
22-Dec-13 dirref    [--same--]  changed variable names
22-Dec-13 dirdm     [--same--]  changed variable names
22-Dec-13 reldir    [--same--]  changed variable names
22-Dec-13 isdir     [--same--]  revised
22-Dec-13 df-tail   [--same--]  revised
22-Dec-13 df-dir    [--same--]  revised
22-Dec-13 contop    [--same--]  revised
22-Dec-13 hausfillim2 hausflim2
22-Dec-13 sflimf    flfval
22-Dec-13 flimff    flffval     revised
22-Dec-13 elfilmap3 elfm3
22-Dec-13 elfilmap2 elfm2
22-Dec-13 elfilmap  elfm
22-Dec-13 fmf       fmfil
22-Dec-13 filmapss  fmss        changed variable names
22-Dec-13 isfilmap  fmval       changed variable names
22-Dec-13 filmapf   fmfval      revised
22-Dec-13 df-flimf  df-flf      revised
22-Dec-13 df-filmap df-fm       revised
22-Dec-13 cflimf    cflf
22-Dec-13 cfilmap   cfm
22-Dec-13 hausfillim hausflim
22-Dec-13 isfillim  elflim
22-Dec-13 limfil    flimval
22-Dec-13 sfvlim    flimfval    revised
22-Dec-13 df-flim1  df-flim     revised
22-Dec-13 cflim1    cflim       revised
22-Dec-13 fbunfip   [--same--]  revised
22-Dec-13 fsubbas   [--same--]  revised
22-Dec-13 infi      fiin        revised
22-Dec-13 0nelfb    [--same--]  revised
22-Dec-13 oefil2    snfil
22-Dec-13 filintf   infil       revised
22-Dec-13 emnfil    [--same--]  revised
22-Dec-13 isfil     isfil2      revised
22-Dec-13 df-fil    [--same--]  revised
22-Dec-13 df-fg     [--same--]  revised
22-Dec-13 subsptop  [--same--]  revised
22-Dec-13 stoigOLD  ---         deleted
22-Dec-13 stoiglem  ---         deleted
22-Dec-13 stoiglemOLD ---       deleted
22-Dec-13 elsubsp   elsubspr    revised
22-Dec-13 issubspt  elsubsp     revised
22-Dec-13 issubsplem1 ---       deleted
22-Dec-13 issubsp   ---         deleted
22-Dec-13 subsp     subspval    revised
22-Dec-13 subspi    [--same--]  revised
22-Dec-13 df-subsp  [--same--]  revised
22-Dec-13 df-homeo  [--same--]  revised
22-Dec-13 fibas     [--same--]  revised
22-Dec-13 fiiu2     fipwuni     revised
22-Dec-13 sppfi     elfi        revised
22-Dec-13 spfi      ---         deleted
22-Dec-13 abfi2     ssfii
22-Dec-13 abfi      ---         deleted
22-Dec-13 inficlALT inficl
22-Dec-13 fine2     fi0         revised
22-Dec-13 fine      ---         deleted
22-Dec-13 fiv       fival       revised
22-Dec-13 df-fi     [--same--]  revised
22-Dec-13 istoset   istoset3    revised
22-Dec-13 df-toset  [--same--]  revised
22-Dec-13 symgval   [--same--]  revised
22-Dec-13 symgoprab ---         deleted
22-Dec-13 df-symgrp df-symg     revised
22-Dec-13 csymgrp   csymg
22-Dec-13 pilem3    [--same--]  revised
22-Dec-13 spwpr4OLD ---         deleted
22-Dec-13 spwex     [--same--]  changed variable names
22-Dec-13 spwcl     [--same--]  changed variable names
22-Dec-13 spwnex    ---         deleted
22-Dec-13 spwval3   ---         deleted
22-Dec-13 spwval    [--same--]  revised
22-Dec-13 spwval2   [--same--]  revised
22-Dec-13 df-spw    [--same--]  revised
22-Dec-13 ipblnfi   [--same--]  revised
22-Dec-13 nmofval   [--same--]  revised
22-Dec-13 lnolin    [--same--]  revised
22-Dec-13 islno     [--same--]  revised
22-Dec-13 lnoval    [--same--]  revised
22-Dec-13 df-hmo    [--same--]  revised
22-Dec-13 df-aj     [--same--]  revised
22-Dec-13 df-0o     [--same--]  revised
22-Dec-13 df-blo    [--same--]  revised
22-Dec-13 df-nmo    [--same--]  revised
22-Dec-13 df-lno    [--same--]  revised
22-Dec-13 df-ssp    [--same--]  revised
22-Dec-13 ipfval    [--same--]  revised
22-Dec-13 df-ip     [--same--]  revised
22-Dec-13 df-ims    [--same--]  revised
22-Dec-13 df-ba     [--same--]  revised
22-Dec-13 opnfval   [--same--]  revised
22-Dec-13 ismsg     ---         deleted
22-Dec-13 mscl      ---         deleted
22-Dec-13 msf       ---         deleted
22-Dec-13 msflem    ---         deleted
22-Dec-13 msrel     ---         deleted
22-Dec-13 df-opn    [--same--]  revised
22-Dec-13 df-ball   [--same--]  revised
22-Dec-13 df-met    [--same--]  revised
22-Dec-13 cnpfval   [--same--]  revised
22-Dec-13 df-cnp    [--same--]  revised
22-Dec-13 df-cn     [--same--]  revised
22-Dec-13 lpfval    [--same--]  revised
22-Dec-13 df-lp     [--same--]  revised
22-Dec-13 neival    [--same--]  revised
22-Dec-13 neifval   [--same--]  revised
22-Dec-13 df-nei    [--same--]  revised
22-Dec-13 ntrval    [--same--]  revised
22-Dec-13 clsfval   [--same--]  revised
22-Dec-13 ntrfval   [--same--]  revised
22-Dec-13 cldval    [--same--]  revised
22-Dec-13 df-cls    [--same--]  revised
22-Dec-13 df-ntr    [--same--]  revised
22-Dec-13 df-cld    [--same--]  revised
22-Dec-13 df-tx     [--same--]  revised
22-Dec-13 df-topgen [--same--]  revised
22-Dec-13 df-top    [--same--]  revised
22-Dec-13 unbenlem  [--same--]  revised
22-Dec-13 df-gcd    [--same--]  revised
22-Dec-13 reeff1o2  reeff1o
22-Dec-13 reeff1o   [--same--]  revised
22-Dec-13 reeff1    [--same--]  revised
22-Dec-13 df-pi     [--same--]  revised
22-Dec-13 df-cos    [--same--]  revised
22-Dec-13 df-sin    [--same--]  revised
22-Dec-13 df-ef     [--same--]  revised
22-Dec-13 cncfval   [--same--]  revised
22-Dec-13 df-cncf   [--same--]  revised
22-Dec-13 climshft2i climshft2  revised
22-Dec-13 climresi  ---         deleted
22-Dec-13 climshfti ---         deleted
22-Dec-13 clim      [--same--]  revised
22-Dec-13 df-clim   [--same--]  revised
22-Dec-13 hashgadd  [--same--]  revised
22-Dec-13 hashenOLDOLD ---      deleted
22-Dec-13 hashenOLD ---         deleted
22-Dec-13 hashfz1OLD ---        deleted
22-Dec-13 hashginvOLD ---       deleted
22-Dec-13 hashgvalOLD ---       deleted
22-Dec-13 hashginv  [--same--]  revised
22-Dec-13 hashgval  [--same--]  revised
22-Dec-13 fz1fiOLD  ---         deleted
22-Dec-13 hashgf1o  [--same--]  revised
22-Dec-13 df-hash   [--same--]  revised
22-Dec-13 bccl2     [--same--]  revised
22-Dec-13 bcpasci   ---         deleted
22-Dec-13 bcpasc2   ---         deleted
22-Dec-13 bcpasc2i  ---         deleted
22-Dec-13 bcnp11    bcn1        revised
22-Dec-13 bccmpl    [--same--]  revised
22-Dec-13 bcval3    [--same--]  revised
22-Dec-13 bcval2    [--same--]  revised
22-Dec-13 bcval     [--same--]  revised
22-Dec-13 df-bc     [--same--]  revised
22-Dec-13 df-abs    [--same--]  revised
22-Dec-13 cjval     remim
22-Dec-13 imval     [--same--]  revised
22-Dec-13 reval     [--same--]  revised
22-Dec-13 df-im     [--same--]  revised
22-Dec-13 df-re     [--same--]  revised
22-Dec-13 df-cj     [--same--]  revised
22-Dec-13 df-limsup [--same--]  revised
22-Dec-13 shftf     [--same--]  revised
22-Dec-13 shftval   [--same--]  revised
22-Dec-13 shftresval ---        deleted
22-Dec-13 shftres   ---         deleted
22-Dec-13 shftfn    [--same--]  revised
22-Dec-13 shftfval  [--same--]  revised
22-Dec-13 df-shft   [--same--]  revised
22-Dec-13 cardfz    [--same--]  revised
22-Dec-13 fzennn    [--same--]  revised
22-Dec-13 uzrdgsuci [--same--]  revised
22-Dec-13 uzrdg0i   [--same--]  revised
22-Dec-13 uzrdgfni  [--same--]  revised
22-Dec-13 uzrdglem  [--same--]  revised
22-Dec-13 om2uzrdg  [--same--]  revised
22-Dec-13 om2uzisoi [--same--]  revised
22-Dec-13 om2uzf1oi [--same--]  revised
22-Dec-13 om2uzrani [--same--]  revised
22-Dec-13 om2uzlt2i [--same--]  revised
22-Dec-13 om2uzlti  [--same--]  revised
22-Dec-13 om2uzuzi  [--same--]  revised
22-Dec-13 om2uzsuci [--same--]  revised
22-Dec-13 om2uz0i   [--same--]  revised
22-Dec-13 df-fz     [--same--]  revised
22-Dec-13 df-uz     [--same--]  revised
22-Dec-13 df-icc    [--same--]  revised
22-Dec-13 df-ico    [--same--]  revised
22-Dec-13 df-ioc    [--same--]  revised
22-Dec-13 df-ioo    [--same--]  revised
22-Dec-13 df-mod    [--same--]  revised
22-Dec-13 df-fl     [--same--]  revised
22-Dec-13 df-div    [--same--]  revised
22-Dec-13 df-sub    [--same--]  revised
22-Dec-13 cflim     cflm
22-Dec-13 cffnon    cff         revised
22-Dec-13 df-cda    [--same--]  revised
22-Dec-13 alephlim  [--same--]  changed variable names
22-Dec-13 df-cf     [--same--]  revised
22-Dec-13 df-aleph  [--same--]  revised
22-Dec-13 df-card   [--same--]  revised
22-Dec-13 df-rank   [--same--]  revised
22-Dec-13 df-r1     [--same--]  revised
22-Dec-13 abfii5    ---         deleted; use dffi2
22-Dec-13 abfii4    ---         deleted; use dffi2
22-Dec-13 abfii3    ---         deleted; use dffi2
22-Dec-13 abfii2    ---         deleted; use dffi2
22-Dec-13 abfii1    ---         deleted; use dffi2
22-Dec-13 df-pm     [--same--]  revised
22-Dec-13 df-map    [--same--]  revised
22-Dec-13 oev2      [--same--]  revised
22-Dec-13 df-oexp   [--same--]  revised
22-Dec-13 df-omul   [--same--]  revised
22-Dec-13 df-oadd   [--same--]  revised
22-Dec-13 frsucmpt2 ---         deleted
22-Dec-13 frsucopab ---         deleted
22-Dec-13 rdglimi   ---         deleted
22-Dec-13 rdgsuci   ---         deleted
22-Dec-13 rdgval    [--same--]  revised
22-Dec-13 rdglem2   ---         deleted
22-Dec-13 dfrdg2    ---         deleted
22-Dec-13 df-rdg    [--same--]  revised
22-Dec-13 tz7.44-3  [--same--]  revised
22-Dec-13 tz7.44-2  [--same--]  revised
22-Dec-13 tz7.44-1  [--same--]  revised
22-Dec-13 foprab2a  [--same--]  revised
22-Dec-13 df-2nd    [--same--]  revised
22-Dec-13 df-1st    [--same--]  revised
22-Dec-13 resmpt2   resmpt
22-Dec-13 mpteq2dvaf mpteq2da
22-Dec-13 mpteqi    mpteq12i
22-Dec-13 oprabval2gfOLD ---    deleted
22-Dec-13 oprabval2gf ---       deleted
22-Dec-13 oprabval2gfNEW oprabval2gf revised
22-Dec-13 oprabvali ---         deleted
22-Dec-13 oprabvaligg [--same--] revised
22-Dec-13 oprabvalig [--same--] revised
25-Nov-13 eq2ab     ---         obsolete; use abbi instead
14-Nov-13 sb19.21   sbrim
11-Nov-13 alrot3    [--same--]  moved from ATS's mathbox to main set.mm
11-Nov-13 pm11.53   [--same--]  moved from ATS's mathbox to main set.mm
 4-Nov-13 ispos     [--same--]  removed nonempty base set requirement
 4-Nov-13 df-poset  [--same--]  removed nonempty base set requirement
17-Oct-13 mpt2eqdv  mpt2eqdva
17-Oct-13 mpt2eqdvg mpt2eqdvaf  moved from FL's mathbox to main set.mm
 6-Oct-13 ipid      ipidsq
 5-Oct-13 plusgval  ---         obsolete; use grpplusg
 5-Oct-13 divrngmgrp [--same--] eliminated hard-coded structure indices
 5-Oct-13 divrngid  [--same--]  eliminated hard-coded structure indices
 5-Oct-13 divrngidlem [--same--] eliminated hard-coded structure indices
 5-Oct-13 invrfval  [--same--]  eliminated hard-coded structure indices
 5-Oct-13 divrngid  [--same--]  eliminated hard-coded structure indices
 5-Oct-13 divrngidlem [--same--] eliminated hard-coded structure indices
 5-Oct-13 divrngmgrp [--same--] eliminated hard-coded structure indices
 5-Oct-13 isdivrng  [--same--]  eliminated hard-coded structure indices
 5-Oct-13 df-drng   [--same--]  eliminated hard-coded structure indices
 5-Oct-13 ndxargi   ndxarg
 5-Oct-13 strcval   strfvn
 3-Oct-13 ringmulr  rngmulr     eliminated unnecessary hypotheses
 3-Oct-13 ringplusg rngplusg    eliminated unnecessary hypotheses
 3-Oct-13 ringbase  rngbase     eliminated unnecessary hypotheses
 3-Oct-13 grpplusgg ---         obsolete; use grpplusg
 3-Oct-13 grpbaseg  ---         obsolete; use grpbase
 3-Oct-13 grpplusg  [--same--]  eliminated unnecessary antecedent
 3-Oct-13 grpbase   [--same--]  eliminated unnecessary antecedent
 3-Oct-13 str3v3    ---         obsolete; use strfv
 3-Oct-13 str3v2    ---         obsolete; use strfv
 3-Oct-13 str3v1    ---         obsolete; use strfv
 3-Oct-13 str2v2    ---         obsolete; use strfv
 3-Oct-13 str2v1    ---         obsolete; use strfv
 3-Oct-13 str3v3x   ---         obsolete; use strfv
 3-Oct-13 str3v2x   ---         obsolete; use strfv
 3-Oct-13 str3v1x   ---         obsolete; use strfv
 3-Oct-13 str2v2x   ---         obsolete; use strfv
 3-Oct-13 str2v1x   ---         obsolete; use strfv
 3-Oct-12 tpshyp    ---         obsolete; use tpslem
 3-Oct-13 ringhyp   ---         obsolete; use rnglem
 3-Oct-13 grphyp    ---         obsolete; use grplem
 3-Oct-13 poshyp    ---         obsolete; use poslem
 3-Oct-13 poslem    posi
 2-Oct-13 isfinite  ---         obsolete; use isfinite3
 1-Oct-13 ressnop0  [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fvtp3     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fvtp2     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fvtp1     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fvpr2     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fvpr1     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fntp      [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 fnprg     [--same--]  eliminated unnecessary antecedents
 1-Oct-13 fnsn      [--same--]  eliminated unnecessary hypothesis
 1-Oct-13 funtp     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 funpr     [--same--]  eliminated unnecessary hypotheses
 1-Oct-13 funprg    [--same--]  eliminated unnecessary antecedents
 1-Oct-13 funsng    [--same--]  eliminated unnecessary antecedent
 1-Oct-13 funsn     [--same--]  eliminated unnecessary hypothesis
30-Sep-13 ltneii    [--same--]  swapped conclusion vars for ltnei compatibility
25-Sep-13 2nalexn   [--same--]  moved from ATS's mathbox to main set.mm
25-Sep-13 2exnexn   [--same--]  moved from ATS's mathbox to main set.mm
24-Sep-13 supeq2    [--same--]  moved from JM's mathbox to main set.mm
24-Sep-13 ixpfi     [--same--]  moved from JM's mathbox to main set.mm
24-Sep-13 mapfi     [--same--]  moved from JM's mathbox to main set.mm
24-Sep-13 enf1f1o   fienf1f1o   moved from JM's mathbox to main set.mm
24-Sep-13 nnaun2    ficardun2
24-Sep-13 nnaun     ficardun
24-Sep-13 relsn     relsnop
24-Sep-13 difdisj   disjdif
20-Sep-13 imdistanda [--same--] moved from JM's mathbox to main set.mm
20-Sep-13 rnoprab2  [--same--]  moved from SF's mathbox to main set.mm
20-Sep-13 eqfunfv   [--same--]  moved from SF's mathbox to main set.mm
20-Sep-13 pm5.21ndd [--same--]  moved from PC's mathbox to main set.mm
20-Sep-13 div2neg   [--same--]  moved from PC's mathbox to main set.mm
16-Sep-13 oprabexd  [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 fsum00    [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 fzdisj    [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 fzsplit   [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 fzn0      [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 fz10      [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 addsubeq4 [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 add20     [--same--]  moved from JM's mathbox to main set.mm
16-Sep-13 f1elima   [--same--]  moved from JM's mathbox to main set.mm
15-Sep-13 hashpw    [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashpwlem [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashxp    [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashxplem [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashunsng [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashun    [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 hashgadd  [--same--]  moved from PC's mathbox to main set.mm
15-Sep-13 2ne3      ---         obsolete (use 2lt3 + ltneii instead)
15-Sep-13 1ne9      ---         obsolete (use 1lt9 + ltneii instead)
15-Sep-13 1ne3      ---         obsolete (use 1lt3 + ltneii instead)
10-Sep-13 exp5c     [--same--]  moved from JGH's mathbox to main set.mm
10-Sep-13 snelpwr   snelpwi     moved from AS's mathbox to main set.mm
 8-Sep-13 df-exp    [--same--]  revised definition
 8-Sep-13 df-fac    [--same--]  revised definition
 8-Sep-13 df-seq0   [--same--]  revised definition
 8-Sep-13 df-seq1   [--same--]  revised definition
 8-Sep-13 df-seqz   [--same--]  revised definition
 8-Sep-13 df-sqr    [--same--]  revised definition
 8-Sep-13 expval    [--same--]  revised theorem statement
 8-Sep-13 facnn     [--same--]  revised theorem statement
 8-Sep-13 fzp1ss    [--same--]  revised theorem statement
 8-Sep-13 fzss1     [--same--]  revised theorem statement
 8-Sep-13 fzss2     [--same--]  revised theorem statement
 8-Sep-13 fzssp1    [--same--]  revised theorem statement
 8-Sep-13 om2uzf1oi [--same--]  revised theorem statement
 8-Sep-13 om2uzisoi [--same--]  revised theorem statement
 8-Sep-13 om2uzrani [--same--]  revised theorem statement
 8-Sep-13 om2uzuzi  [--same--]  revised theorem statement
 8-Sep-13 seq0fval  [--same--]  revised theorem statement
 8-Sep-13 seqzfval  [--same--]  revised theorem statement
 8-Sep-13 sqrlem1   [--same--]  revised theorem statement
 8-Sep-13 sqrlem2   [--same--]  revised theorem statement
 8-Sep-13 sqrlem3   [--same--]  revised theorem statement
 8-Sep-13 sqrlem4   [--same--]  revised theorem statement
 8-Sep-13 sqrlem5   [--same--]  revised theorem statement
 8-Sep-13 sqrlem6   [--same--]  revised theorem statement
 8-Sep-13 sqrlem7   [--same--]  revised theorem statement
 8-Sep-13 sqrval    [--same--]  revised theorem statement
 8-Sep-13 uzrdgsuci [--same--]  revised theorem statement
 8-Sep-13 sqrcl     resqrcl     (new sqrcl is complex version)
 8-Sep-13 dfseq0    ---         obsolete
 8-Sep-13 expnnval  ---         obsolete
 8-Sep-13 seq0valt  ---         obsolete
 8-Sep-13 seq11lem  ---         obsolete
 8-Sep-13 seq1fnlem ---         obsolete
 8-Sep-13 seq1lem1  ---         obsolete
 8-Sep-13 seq1rval  ---         obsolete
 8-Sep-13 seq1seq0  ---         obsolete
 8-Sep-13 seq1seq01 ---         obsolete
 8-Sep-13 seq1seq02 ---         obsolete
 8-Sep-13 seq1suclem ---        obsolete
 8-Sep-13 seq1val   ---         obsolete
 8-Sep-13 seq1val2  ---         obsolete
 8-Sep-13 seqzfval2 ---         obsolete
 8-Sep-13 seqzval   ---         obsolete
 8-Sep-13 seqzval2  ---         obsolete
 8-Sep-13 ---       ---         sqrlem10 - sqrlem24 and sqrlem26 obsolete
 8-Sep-13 sqrlem8   ---         obsolete
 8-Sep-13 sqrlem9   ---         obsolete
 8-Sep-13 uzrdgfnuzi ---        obsolete
 8-Sep-13 uzrdginii ---         obsolete
 8-Sep-13 uzrdginip1i ---       obsolete
 8-Sep-13 uzrdgvali ---         obsolete
 8-Sep-13 ---       ---         math token "seq" changed to "seqz"
 2-Sep-13 ltfrn     [--same--]  revised theorem statement
 2-Sep-13 ltfrn     [--same--]  moved from ATS's mathbox to main set.mm
 2-Sep-13 eluzsub   [--same--]  moved from JM's mathbox to main set.mm
 2-Sep-13 eluzadd   [--same--]  moved from JM's mathbox to main set.mm
 2-Sep-13 rdgeq12   [--same--]  moved from SF's mathbox to main set.mm
 1-Sep-13 raffsp    craffsp     (in FL's mathbox)
 1-Sep-13 ptdfc     cptdfc      (in ATS's mathbox)
 1-Sep-13 rr3c      crr3c       (in ATS's mathbox)
 1-Sep-13 psc       cpscN        (in NM's mathbox)
 1-Sep-13 wgcdOLD   cgcdOLD     (in JH's mathbox)
 1-Sep-13 plusrc    cplusr      (in ATS's mathbox)
 1-Sep-13 minusrc   cminusr     (in ATS's mathbox)
 1-Sep-13 timesrc   ctimesr     (in ATS's mathbox)
 1-Sep-13 csmo      wsmo
 1-Sep-13 syn-bnj17 w-bnj17     (in JB's mathbox)
 1-Sep-13 syn-bnj16 c-bnj16     (in JB's mathbox)
 1-Sep-13 syn-bnj14 c-bnj14     (in JB's mathbox)
 1-Sep-13 syn-bnj13 w-bnj13     (in JB's mathbox)
 1-Sep-13 syn-bnj15 w-bnj15     (in JB's mathbox)
 1-Sep-13 syn-bnj18 c-bnj18     (in JB's mathbox)
 1-Sep-13 syn-bnj19 w-bnj19     (in JB's mathbox)
 1-Sep-13 vd1       wvd1        (in AS's mathbox)
 1-Sep-13 vd2       wvd2        (in AS's mathbox)
 1-Sep-13 vd3       wvd3        (in AS's mathbox)
31-Aug-13 trcl-df   df-trcl     (in FL's mathbox)
31-Aug-13 rtrcl-df  df-rtrcl    (in FL's mathbox)
31-Aug-13 orHom-df  df-orHom    (in FL's mathbox)
31-Aug-13 orIso-df  df-orIso    (in FL's mathbox)
31-Aug-13 decfun-df df-decfun   (in FL's mathbox)
31-Aug-13 expsg-df  df-expsg    (in FL's mathbox)
29-Aug-13 clsbldneg notab       moved from FL's mathbox to main set.mm
18-Aug-13 oprabval2gf [--same--] added bound var hypotheses
10-Aug-13 vtocl2gf  [--same--]  added bound var hypotheses
 7-Aug-13 ringidval [--same--]  changed iota to iota_
 7-Aug-13 df-1r     [--same--]  changed iota to iota_
 7-Aug-13 grpidcl   [--same--]  changed variable names
 7-Aug-13 grpid     [--same--]  changed variable names
 7-Aug-13 grpinveu  [--same--]  changed variable names
 7-Aug-13 grpinvid  [--same--]  changed variable names
 7-Aug-13 grpinvid2 [--same--]  changed variable names
 7-Aug-13 grpinvid1 [--same--]  changed variable names
 7-Aug-13 grprinv   [--same--]  changed variable names
 7-Aug-13 grplinv   [--same--]  changed variable names
 7-Aug-13 grpinv    [--same--]  changed variable names
 7-Aug-13 grpinvval [--same--]  changed iota to iota_
 7-Aug-13 grpinvfval [--same--] changed iota to iota_
 7-Aug-13 df-minusg [--same--]  changed iota to iota_
 7-Aug-13 grprid    [--same--]  changed variable names
 7-Aug-13 grplid    [--same--]  changed variable names
 7-Aug-13 grpidinv2 [--same--]  changed variable names
 7-Aug-13 grpidval  [--same--]  changed iota to iota_
 7-Aug-13 df-0g     [--same--]  changed iota to iota_
 6-Aug-13 isabld    isablod     (in JM's mathbox)
 2-Aug-13 isringd   isringod    (in JM's mathbox)
30-Jul-13 riemtn    mptresid    moved from FL's mathbox to main set.mm
30-Jul-13 riecb     opabresid   moved from FL's mathbox to main set.mm
25-Jul-13 sbcne12g  [--same--]  moved from ATS's mathbox to main set.mm
25-Jul-13 sbcnel12g [--same--]  moved from ATS's mathbox to main set.mm
17-Jul-13 fvopab4s  [--same--]  eliminated redundant hypothesis
30-Jun-13 bnj1263   syl5sseqr   moved from JB's mathbox to main set.mm
30-Jun-13 bnj1264   syl5sseq    moved from JB's mathbox to main set.mm
30-Jun-13 bnj1141   syl6ss      moved from JB's mathbox to main set.mm
24-Jun-13 onsubcum  onssr1      moved from FL's mathbox to main set.mm
21-Jun-13 19.40-2   [--same--]  moved from ATS's mathbox to main set.mm
21-Jun-13 hbxfr     hbxfreq
21-Jun-13 ssopab2   ssopab2b
18-Jun-13 boe       enpr1g      moved from FL's mathbox to main set.mm
18-Jun-13 unpde2eg2 pr2nelem    moved from FL's mathbox to main set.mm
18-Jun-13 unpde2eg22 pr2ne      moved from FL's mathbox to main set.mm
18-Jun-13 unpam2    prdom2      moved from FL's mathbox to main set.mm
18-Jun-13 uncum     r1tr2       moved from FL's mathbox to main set.mm
18-Jun-13 ctarski   ctsk        moved from FL's mathbox to main set.mm
18-Jun-13 cgruni    cgru        moved from FL's mathbox to main set.mm
18-Jun-13 df-tsk    [--same--]  moved from FL's mathbox to main set.mm
18-Jun-13 taralt    dftsk2      moved from FL's mathbox to main set.mm
18-Jun-13 tarval    eltsk       moved from FL's mathbox to main set.mm
18-Jun-13 tarvalg   eltskg      moved from FL's mathbox to main set.mm
18-Jun-13 tarval1   eltsk2      moved from FL's mathbox to main set.mm
18-Jun-13 tarval1g  eltsk2g     moved from FL's mathbox to main set.mm
18-Jun-13 tarax1    tskpwss     moved from FL's mathbox to main set.mm
18-Jun-13 tarax2    tskpw       moved from FL's mathbox to main set.mm
18-Jun-13 tarax3    tsken       moved from FL's mathbox to main set.mm
18-Jun-13 empistar  0tsk        moved from FL's mathbox to main set.mm
18-Jun-13 tarax3d2  tsksdom     moved from FL's mathbox to main set.mm
18-Jun-13 tarax3e   tskssel2    moved from FL's mathbox to main set.mm
18-Jun-13 tarax3f   tskssel     moved from FL's mathbox to main set.mm
18-Jun-13 tarsin    tsksn       moved from FL's mathbox to main set.mm
18-Jun-13 emptar    tsk0        moved from FL's mathbox to main set.mm
18-Jun-13 tarone    tsk1        moved from FL's mathbox to main set.mm
18-Jun-13 tartwo    tsk2        moved from FL's mathbox to main set.mm
18-Jun-13 tarmrtwo  2domtsk     moved from FL's mathbox to main set.mm
18-Jun-13 tarunpa   tskpr       moved from FL's mathbox to main set.mm
18-Jun-13 tarorpa   tskop       moved from FL's mathbox to main set.mm
18-Jun-13 tarcrpr   tskxpss     moved from FL's mathbox to main set.mm
18-Jun-13 ixpssmapg [--same--]  moved from JM's mathbox to main set.mm
18-Jun-13 bnj572    hbxfrbi     moved from JB's mathbox to main set.mm
 5-Jun-13 isgrpd    isgrpod     (in JM's mathbox)
24-May-13 pm2.01bd  pm2.18d     moved from FL's mathbox to main set.mm
23-May-13 r19.3zvb  r19.3z      moved from FL's mathbox to main set.mm
22-May-13 son2lpi   [--same--]  eliminated redundant hypotheses
22-May-13 sotri     [--same--]  eliminated redundant hypotheses
22-May-13 soirri    [--same--]  eliminated redundant hypothesis
22-May-13 suprnubii [--same--]  eliminated redundant hypothesis
22-May-13 suprleubii [--same--]  eliminated redundant hypothesis
20-May-13 suprnub   [--same--]  eliminated redundant antecedent
20-May-13 suprleub  [--same--]  eliminated redundant antecedent
20-May-13 noinfep   [--same--]  eliminated redundant antecedent
18-May-13 pre-axlttri axpre-lttri
18-May-13 pre-axlttrn axpre-lttrn
18-May-13 pre-axltadd axpre-ltadd
18-May-13 pre-axmulgt0 axpre-mulgt0
18-May-13 pre-axsup  axpre-sup
16-May-13 3ne0      [--same--]  moved from FL's mathbox to main set.mm
16-May-13 3cn       [--same--]  moved from FL's mathbox to main set.mm
16-May-13 ltaddpos2tb ltaddrp   moved from FL's mathbox to main set.mm
16-May-13 ltsubpostb ltsubrp    moved from FL's mathbox to main set.mm
16-May-13 r19.26t   r19.26-3    moved from FL's mathbox to main set.mm
16-May-13 uzp1      [--same--]  moved from JM's mathbox to main set.mm
16-May-13 uzm1      [--same--]  moved from JM's mathbox to main set.mm
16-May-13 r1subsuc  r1sssuc     moved from FL's mathbox to main set.mm
15-May-13 impbidd   [--same--]  moved from RM's mathbox to main set.mm
26-Apr-13 domint    dmiin       moved from FL's mathbox to main set.mm
26-Apr-13 inpartelt iinss2      moved from FL's mathbox to main set.mm
25-Apr-13 ssiing    ssiinf      moved from FL's mathbox to main set.mm
24-Apr-13 cnvintcnv cnviin      moved from FL's mathbox to main set.mm
23-Apr-13 eqrelrivg eqrelriv    moved from FL's mathbox to main set.mm
23-Apr-13 eqrelriv  eqrelriiv
22-Apr-13 coeq12d   [--same--]  moved from FL's mathbox to main set.mm
21-Apr-13 coeq12i   [--same--]  moved from FL's mathbox to main set.mm
20-Apr-13 cexint2   iinexg      moved from FL's mathbox to main set.mm
19-Apr-13 fnimapr   [--same--]  moved from JM's mathbox to main set.mm
18-Apr-13 foco2     [--same--]  moved from JM's mathbox to main set.mm
17-Apr-13 pm11.07   [--same--]  moved from ATS's mathbox to main set.mm
16-Apr-13 rcla4t    [--same--]  moved from ATS's mathbox to main set.mm
15-Apr-13 cla4gft   [--same--]  moved from ATS's mathbox to main set.mm
14-Apr-13 isseta    issetf      moved from ATS's mathbox to main set.mm
12-Apr-13 orkurss   opid        moved from FL's mathbox to main set.mm
11-Apr-13 cmpinj    f1cocnv1    moved from FL's mathbox to main set.mm
11-Apr-13 cmpinj2   f1cocnv2    moved from FL's mathbox to main set.mm
10-Apr-13 cnvinj    f1cnv       moved from FL's mathbox to main set.mm
10-Apr-13 f1cnv     f1cnvcnv
 9-Apr-13 reltrncnv relcnvtr    moved from FL's mathbox to main set.mm
 9-Apr-13 fmptd     [--same--]  added "F =" hypothesis
 9-Apr-13 fnmpt     funmpt
 8-Apr-13 cnveq2    cnveqb      moved from FL's mathbox to main set.mm
 7-Apr-13 prnzg     [--same--]  moved from FL's mathbox to main set.mm
 6-Apr-13 resrelfld relresfld   moved from FL's mathbox to main set.mm
 5-Apr-13 cmprelid2 relcoi1     moved from FL's mathbox to main set.mm
 5-Apr-13 cmprelid1 relcoi2     moved from FL's mathbox to main set.mm
 5-Apr-13 inclrel   coss1       moved from FL's mathbox to main set.mm
 5-Apr-13 cmpdia    coires1     moved from FL's mathbox to main set.mm
 4-Apr-13 findcard2s [--same--]  moved from PC's mathbox to main set.mm
 3-Apr-13 prmexpb   [--same--]  moved from PC's mathbox to main set.mm
 3-Apr-13 prmdvdsexpb [--same--]  moved from PC's mathbox to main set.mm
 2-Apr-13 imimorb   [--same--]  moved from PC's mathbox to main set.mm
 1-Apr-13 ac6sg     [--same--]  antecedent now has V instead of _V
 1-Apr-13 clint3    ---         obsolete; use icccld instead
 1-Apr-13 clicls    icccld
 1-Apr-13 lemul2aALT ---        obsolete; use lemul2a instead
 1-Apr-13 cdrci     difreicc
 1-Apr-13 rabeq0    [--same--]  moved from JM's mathbox to main set.mm
31-Mar-13 difin2    [--same--]  moved from JM's mathbox to main set.mm
30-Mar-13 respreima [--same--]  moved from JM's mathbox to main set.mm
29-Mar-13 unpreima  [--same--]  moved from JM's mathbox to main set.mm
28-Mar-13 inpreima  [--same--]  moved from JM's mathbox to main set.mm
27-Mar-13 elpri     [--same--]  moved from SF's mathbox to main set.mm
26-Mar-13 indifdi   indifdir    moved from SF's mathbox to main set.mm
25-Mar-13 r19.30    [--same--]  moved from SF's mathbox to main set.mm
24-Mar-13 r19.21    [--same--]  moved from SF's mathbox to main set.mm
23-Mar-13 19.41vvvv [--same--]  moved from FL's mathbox to main set.mm
23-Mar-13 disjr     [--same--]  moved from JM's mathbox to main set.mm
22-Mar-13 smores2   smores3
22-Mar-13 soxp      [--same--]  changed hypotheses to antecedents
22-Mar-13 poxp      [--same--]  changed hypotheses to antecedents
22-Mar-13 frxp      [--same--]  changed hypotheses to antecedents
22-Mar-13 wexp      [--same--]  changed hypotheses to antecedents
22-Mar-13 soxp      [--same--]  moved from SF's mathbox to main set.mm
22-Mar-13 poxp      [--same--]  moved from SF's mathbox to main set.mm
22-Mar-13 frxp      [--same--]  moved from SF's mathbox to main set.mm
22-Mar-13 wexp      [--same--]  moved from SF's mathbox to main set.mm
22-Mar-13 mapdom1   [--same--]  removed redundant hypothesis
22-Mar-13 mapen     [--same--]  removed redundant hypotheses
22-Mar-13 mapsnen   [--same--]  removed redundant hypothesis
22-Mar-13 xpen      [--same--]  removed redundant hypotheses
22-Mar-13 xpeng     [--same--]  removed redundant antecedents
21-Mar-13 3reeanv   [--same--]  moved from JM's mathbox to main set.mm
20-Mar-13 rexrab    [--same--]  moved from JM's mathbox to main set.mm
19-Mar-13 ee01      mpsyl       moved from AS's mathbox to main set.mm
19-Mar-13 morex     [--same--]  moved from JM's mathbox to main set.mm
18-Mar-13 cbviota   [--same--]  moved from ATS's mathbox to main set.mm
18-Mar-13 cbviotaf  [--same--]  moved from ATS's mathbox to main set.mm
17-Mar-13 raleqfn   [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 xporderlem [--same--]  moved from SF's mathbox to main set.mm
16-Mar-13 3an6      [--same--]  moved from SF's mathbox to main set.mm
16-Mar-13 3or6      [--same--]  moved from SF's mathbox to main set.mm
16-Mar-13 elres     [--same--]  moved from SF's mathbox to main set.mm
16-Mar-13 elsnres   [--same--]  moved from SF's mathbox to main set.mm
16-Mar-13 issmo     [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smoeq     [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smodm     [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smores    [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smores3   [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 iordsmo   [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smo0      [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smofvon   [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smoel     [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smoiun    [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smoiso    [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 smoge     [--same--]  moved from ATS's mathbox to main set.mm
16-Mar-13 supeut    [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 fisup2g   [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 fimax2g   [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 wofi      [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 frfi      [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 pofun     [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 frminex   [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 xpeng     [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 fimax     [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 fimaxg    [--same--]  moved from JM's mathbox to main set.mm
16-Mar-13 fisupg    [--same--]  moved from JM's mathbox to main set.mm
15-Mar-13 trint0    [--same--]  moved from ATS's mathbox to main set.mm
15-Mar-13 ordintdif [--same--]  moved from ATS's mathbox to main set.mm
14-Mar-13 ne0f      n0f
 1-Mar-13 eupickbi  [--same--]  moved from ATS's mathbox to main set.mm
 1-Mar-13 dvelimfALT2 [--same--] moved from ATS's mathbox to main set.mm
 1-Mar-13 ax12      a12study2   moved from ATS's mathbox to main set.mm
24-Feb-13 sbceq2dig sbceq2g
24-Feb-13 sbceq1dig sbceq1g
24-Feb-13 sbceqdig  sbceqg
24-Feb-13 sbcbidig  sbcbig
21-Feb-13 ---       ---         See http://us.metamath.org/mpeuni/mmnotes.txt
21-Feb-13 ---       ---         entry of 21-Feb-13 for instructions for
21-Feb-13 ---       ---         the changes below.
21-Feb-13 sylan     [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanb    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanbr   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylan2    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylan2b   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylan2br  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl2an    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl2anb   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl2anbr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syland    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylan2d   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl2and   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanl1   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanl2   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanr1   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanr2   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylani    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylan2i   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl2ani   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylancl   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylancr   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylanbrc  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylancb   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 sylancbr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an1   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an2   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an3   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an1b  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an2b  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an3b  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an1br [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an2br [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an3br [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3an    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anb   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anbr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syld3an3  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syld3an1  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syld3an2  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anl1  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anl2  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anl3  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anl   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anr1  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anr2  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl3anr3  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5com   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5      [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5d     [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5ib    syl5bi      reordered hypotheses for better logical flow
21-Feb-13 syl5ibr   syl5bir     reordered hypotheses for better logical flow
21-Feb-13 syl5bi    syl5ib      reordered hypotheses for better logical flow
21-Feb-13 syl5cbi   syl5ibcom   reordered hypotheses for better logical flow
21-Feb-13 syl5bir   syl5ibr     reordered hypotheses for better logical flow
21-Feb-13 syl5cbir  syl5ibrcom  reordered hypotheses for better logical flow
21-Feb-13 syl5bb    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5rbb   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5bbr   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5rbbr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eq    [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5req   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eqr   [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5reqr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eqel  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eqelr [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eleq  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eleqr [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eqner [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5ss    syl5eqss    reordered hypotheses for better logical flow
21-Feb-13 syl5ssr   syl5eqssr   reordered hypotheses for better logical flow
21-Feb-13 syl5eqbr  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5eqbrr [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5breq  [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl5breqr [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl7      [--same--]  reordered hypotheses for better logical flow
21-Feb-13 syl7ib    syl7bi      reordered hypotheses for better logical flow
21-Feb-13 syl6ss    syl6sseq
21-Feb-13 syl6ssr   syl6sseqr
19-Feb-13 fv4       fv4         moved from ATS's mathbox to main set.mm
11-Feb-13 fvopab2b  fvmpt2      moved from FL's mathbox to main set.mm
11-Feb-13 isfinite3 [--same--]  moved from FL's mathbox to main set.mm
 4-Feb-13 remcon    difabs      moved from FL's mathbox to main set.mm
 4-Feb-13 foelrn    [--same--]  moved from JM's mathbox to main set.mm
 4-Feb-13 xpeq2d    [--same--]  moved from JM's mathbox to main set.mm
 4-Feb-13 xpeq1d    [--same--]  moved from JM's mathbox to main set.mm
31-Jan-13 opabex3   [--same--]  moved from JM's mathbox to main set.mm
31-Jan-13 ressn0    ressnop0    moved from SF's mathbox to main set.mm
31-Jan-13 valfunun  fvun        moved from FL's mathbox to main set.mm
20-Jan-13 sucdomi   ---         obsolete; use sucdom instead
20-Jan-13 omsucdom  ---         obsolete; use sucdom instead
20-Jan-13 fisucdom  ---         obsolete; use sucdom instead
20-Jan-13 cardennn  [--same--]  eliminated redundant antecedent
20-Jan-13 oncardon  ---         obsolete; use cardon instead
20-Jan-13 weth      [--same--]  made hypothesis into antecedent
20-Jan-13 tz7.49    [--same--]  changed hypotheses
20-Jan-13 tz7.49c   [--same--]  changed hypotheses
20-Jan-13 r19.23aivr r19.23aivw  moved from FL's mathbox to main set.mm
 4-Jan-13 mul23     mul32
 4-Jan-13 mul23i    mul32i
 4-Jan-13 add23     add32
 4-Jan-13 add23i    add32i
 4-Jan-13 cbvralcsf [--same--]  moved from ATS's mathbox to main set.mm
 4-Jan-13 cbvrexcsf [--same--]  moved from ATS's mathbox to main set.mm
 4-Jan-13 cbvreucsf [--same--]  moved from ATS's mathbox to main set.mm
 4-Jan-13 cbvrabcsf [--same--]  moved from ATS's mathbox to main set.mm
 3-Jan-13 ax0id     addid1
 3-Jan-13 ax1id     mulid1
10-Dec-12 elimant   ---         obsolete (renamed elimantOLD, to be deleted)
 1-Dec-12 fixp      xpfi
 1-Dec-12 xpfi      xpfir
 1-Dec-12 finsucdom fisucdom
 1-Dec-12 setwoe    en1eqsn
 1-Dec-12 sfseqeq   fisseneq
 1-Dec-12 islfin    difinf
 1-Dec-12 unfin     unfir
 1-Dec-12 finfin    diffi
 1-Dec-12 twpar2    uneqdifeq
 1-Dec-12 findcard2 [--same--]  moved from JM's mathbox to main set.mm
27-Nov-12 an1s      an12s
27-Nov-12 an1rs     an32s
27-Nov-12 ancom13s  an13s
27-Nov-12 ancom31s  an31s
19-Nov-12 ee11      ---         obsolete; same as sylc
17-Nov-12 seq11g    [--same--]  moved from JM's mathbox to main set.mm
17-Nov-12 seq1p1g   [--same--]  moved from JM's mathbox to main set.mm
17-Nov-12 seqz1g    [--same--]  moved from JM's mathbox to main set.mm
17-Nov-12 seqzp1g   [--same--]  moved from JM's mathbox to main set.mm
17-Nov-12 seq1seqzg [--same--]  moved from JM's mathbox to main set.mm
16-Nov-12 ordelordaxr ordelordALT
12-Nov-12 funimadisj fnimadisj
 4-Nov-12 ---       ---         math token "0vNEW" changed to "0v"
 4-Nov-12 ---       ---         math token "0v" changed to "0vec"
 4-Nov-12 ---       ---         math token "1rNEW" changed to "1r"
 4-Nov-12 ---       ---         math token "TopSet" changed to "TopOpen"
 4-Nov-12 ---       ---         math token "Toset" changed to "TosetRel"
 4-Nov-12 ---       ---         math token "Dir" changed to "DirRel"
 4-Nov-12 ---       ---         math token "LatNEW" changed to "Lat"
 4-Nov-12 ---       ---         math token "Lat" changed to "LatRel"
 4-Nov-12 ---       ---         math token "PosetNEW" changed to "Poset"
 4-Nov-12 ---       ---         math token "Poset" changed to "PosetRel"
 4-Nov-12 ---       ---         math token "DivRingNEW" changed to "DivRing"
 4-Nov-12 ---       ---         math token "DivRing" changed to "DivRingOps"
 4-Nov-12 ---       ---         math token "RingNEW" changed to "Ring"
 4-Nov-12 ---       ---         math token "Ring" changed to "RingOps"
 4-Nov-12 ---       ---         math token "SubGrp" changed to "SubGrpOp"
 4-Nov-12 ---       ---         math token "AbelNEW" changed to "Abel"
 4-Nov-12 ---       ---         math token "Abel" changed to "AbelOp"
 4-Nov-12 ---       ---         math token "GrpNEW" changed to "Grp"
 4-Nov-12 ---       ---         math token "Grp" changed to "GrpOp"
 4-Nov-12 ---       ---         math token "Open" changed to "MetOpen"
 4-Nov-12 grpNEW2grp grp2grpo
 4-Nov-12 grpNEWstr grpstr
 4-Nov-12 grpNEWprop grpprop
 4-Nov-12 grp2grpNEW grp2grp
 4-Nov-12 postrNEW  postr
 4-Nov-12 isdivrngNEW isdivrng
 4-Nov-12 df-drngNEW df-drng
 4-Nov-12 cdivringNEW cdivring
 4-Nov-12 ringrzNEW ringrz
 4-Nov-12 ringlzNEW ringlz
 4-Nov-12 ringridmNEW ringridm
 4-Nov-12 ringlidmNEW ringlidm
 4-Nov-12 ringidmlemNEW ringidmlem
 4-Nov-12 ringgrpNEW ringgrp
 4-Nov-12 ringablNEW ringabl
 4-Nov-12 ringdirNEW ringdir
 4-Nov-12 ringdiNEW ringdi
 4-Nov-12 ringideuNEW ringideu
 4-Nov-12 ringassNEW ringass
 4-Nov-12 ringclNEW ringcl
 4-Nov-12 ringiNEW  ringi
 4-Nov-12 isringNEW isring
 4-Nov-12 cnaddablNEW cnaddabl
 4-Nov-12 ablcomNEW ablcom
 4-Nov-12 ablgrpNEW ablgrp
 4-Nov-12 isabliNEW isabli
 4-Nov-12 isablNEW  isabl
 4-Nov-12 grplcanNEW grplcan
 4-Nov-12 grpinvidNEW grpinvid
 4-Nov-12 grpinvid2NEW grpinvid2
 4-Nov-12 grpinvid1NEW grpinvid1
 4-Nov-12 grprinvNEW grprinv
 4-Nov-12 grplinvNEW grplinv
 4-Nov-12 grpinvNEW grpinv
 4-Nov-12 grpinvclNEW grpinvcl
 4-Nov-12 grpinvvalNEW grpinvval
 4-Nov-12 grpinvfvalNEW grpinvfval
 4-Nov-12 grpidNEW  grpid
 4-Nov-12 grpinveuNEW grpinveu
 4-Nov-12 grprcanNEW grprcan
 4-Nov-12 grpridNEW grprid
 4-Nov-12 grplidNEW grplid
 4-Nov-12 grpidinv2NEW grpidinv2
 4-Nov-12 grpidclNEW grpidcl
 4-Nov-12 grpidvalNEW grpidval
 4-Nov-12 isgrpiNEW isgrpi
 4-Nov-12 grpn0NEW  grpn0
 4-Nov-12 grpideuNEW grpideu
 4-Nov-12 grpidinvNEW grpidinv
 4-Nov-12 grpidinvlem4NEW grpidinvlem4
 4-Nov-12 grpidinvlem3NEW grpidinvlem3
 4-Nov-12 grpidinvlem2NEW grpidinvlem2
 4-Nov-12 grpidinvlem1NEW grpidinvlem1
 4-Nov-12 grplidinvNEW grplidinv
 4-Nov-12 grpassNEW grpass
 4-Nov-12 grpclNEW  grpcl
 4-Nov-12 elgrpNEW  elgrp
 4-Nov-12 isgrp2NEW isgrp2
 4-Nov-12 isgrpNEW  isgrp
 4-Nov-12 df-ringNEW df-ring
 4-Nov-12 df-ablNEW df-abl
 4-Nov-12 df-grpNEW df-grp
 4-Nov-12 crgNEW    crg
 4-Nov-12 cabelNEW  cabel
 4-Nov-12 cgrpNEW   cgrp
 4-Nov-12 postr     posreltr
 4-Nov-12 isdivrng  isdivrngo
 4-Nov-12 df-drng   df-drngo
 4-Nov-12 ringrz    ringorz
 4-Nov-12 ringlz    ringolz
 4-Nov-12 ringridm  ringoridm
 4-Nov-12 ringlidm  ringolidm
 4-Nov-12 ringidmlem ringoidmlem
 4-Nov-12 ringgrp   ringogrpo
 4-Nov-12 ringabl   ringoablo
 4-Nov-12 ringdir   ringodir
 4-Nov-12 ringdi    ringodi
 4-Nov-12 ringideu  ringoideu
 4-Nov-12 ringass   ringoass
 4-Nov-12 ringcl    ringocl
 4-Nov-12 ringi     ringoi
 4-Nov-12 isring    isringo
 4-Nov-12 cnaddabl  cnaddablo
 4-Nov-12 ablcom    ablocom
 4-Nov-12 ablgrp    ablogrpo
 4-Nov-12 isabli    isabloi
 4-Nov-12 isabl     isablo
 4-Nov-12 grplcan   grpolcan
 4-Nov-12 grpinvid  grpoinvid
 4-Nov-12 grpinvid2 grpoinvid2
 4-Nov-12 grpinvid1 grpoinvid1
 4-Nov-12 grprinv   grporinv
 4-Nov-12 grplinv   grpolinv
 4-Nov-12 grpinv    grpoinv
 4-Nov-12 grpinvcl  grpoinvcl
 4-Nov-12 grpinvval grpoinvval
 4-Nov-12 grpinvfval grpoinvfval
 4-Nov-12 grpid     grpoid
 4-Nov-12 grpinveu  grpoinveu
 4-Nov-12 grprcan   grporcan
 4-Nov-12 grprid    grporid
 4-Nov-12 grplid    grpolid
 4-Nov-12 grpidinv2 grpoidinv2
 4-Nov-12 grpidcl   grpoidcl
 4-Nov-12 grpidval  grpoidval
 4-Nov-12 isgrpi    isgrpoi
 4-Nov-12 grpn0     grpon0
 4-Nov-12 grpideu   grpoideu
 4-Nov-12 grpidinv  grpoidinv
 4-Nov-12 grpidinvlem4 grpoidinvlem4
 4-Nov-12 grpidinvlem3 grpoidinvlem3
 4-Nov-12 grpidinvlem2 grpoidinvlem2
 4-Nov-12 grpidinvlem1 grpoidinvlem1
 4-Nov-12 grplidinv grpolidinv
 4-Nov-12 grpass    grpoass
 4-Nov-12 grpcl     grpocl
 4-Nov-12 isgrp2    isgrpo2
 4-Nov-12 isgrp     isgrpo
 4-Nov-12 df-ring   df-ringo
 4-Nov-12 df-abl    df-ablo
 4-Nov-12 df-grp    df-grpo
 4-Nov-12 1r        1sr
29-Oct-12 ralimdvaa ralimdva
28-Oct-12 mptfn     mptfng
26-Oct-12 raleqi    [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 fneq12d   [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 feq23i    [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 reseq2i   [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 reseq2d   [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 ifbieq2d  [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 supeq1d   [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 supeq1i   [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 emfin     0fin        moved from PC's mathbox to main set.mm
26-Oct-12 fz1n      [--same--]  moved from PC's mathbox to main set.mm
26-Oct-12 nn0lt10b  [--same--]  moved from PC's mathbox to main set.mm
25-Oct-12 fnoprab2ga [--same--]  moved from FL's mathbox to main set.mm
25-Oct-12 fnoprab2a [--same--]  moved from FL's mathbox to main set.mm
25-Oct-12 dmoprab2a [--same--]  moved from FL's mathbox to main set.mm
25-Oct-12 foprab2a  [--same--]  moved from FL's mathbox to main set.mm
25-Oct-12 oprabval2ga [--same--]  moved from FL's mathbox to main set.mm
25-Oct-12 oprabex2ga [--same--]  moved from FL's mathbox to main set.mm
22-Oct-12 ---       ---         math token "Bases" was changed to "TopBases"
21-Oct-12 stoi      [--same--]  converted to new structure scheme
21-Oct-12 topgele   [--same--]  converted to new structure scheme
21-Oct-12 subtopsin2 [--same--] converted to new structure scheme
21-Oct-12 topindis  [--same--]  converted to new structure scheme
21-Oct-12 subsptop    [--same--]  converted to new structure scheme
21-Oct-12 subspuni    [--same--]  converted to new structure scheme
21-Oct-12 stoig     [--same--]  converted to new structure scheme
21-Oct-12 stoiglem  [--same--]  converted to new structure scheme
20-Oct-12 retps     [--same--]  converted to new structure scheme
20-Oct-12 distps    [--same--]  converted to new structure scheme
20-Oct-12 indistps  [--same--]  converted to new structure scheme
20-Oct-12 istps5    [--same--]  converted to new structure scheme
20-Oct-12 istps4    [--same--]  converted to new structure scheme
20-Oct-12 istps3    [--same--]  converted to new structure scheme
20-Oct-12 istps2    [--same--]  converted to new structure scheme
20-Oct-12 istps     [--same--]  converted to new structure scheme
20-Oct-12 tpsex     ---         obsolete
20-Oct-12 istps     [--same--]  converted to new structure scheme
20-Oct-12 df-topsp  [--same--]  converted to new structure scheme
20-Oct-12 subsp2    subsp       moved from FL's mathbox to main set.mm
20-Oct-12 subsp     subspi
19-Oct-12 mpteqi    [--same--]  moved from SF's mathbox to main set.mm
19-Oct-12 mpteq2dva  [--same--]  moved from FL's mathbox to main set.mm
19-Oct-12 empntop   0ntop       moved from FL's mathbox to main set.mm
19-Oct-12 mp4an     [--same--]  moved from JM's mathbox to main set.mm
18-Oct-12 df-struct ---         obsolete; affected theorems reproved
18-Oct-12 df-strbldr ---        obsolete; affected theorems reproved
15-Oct-12 cbviin    [--same--]  moved from JGH's mathbox to main set.mm
15-Oct-12 cbviinv   [--same--]  moved from JGH's mathbox to main set.mm
15-Oct-12 txtopi    [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 txunii    [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 euuni2    [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 difxp     [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 unopn     [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 incld     [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 txopn     [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 txcld     [--same--]  moved from JM's mathbox to main set.mm
15-Oct-12 opnnei    [--same--]  moved from JGH's mathbox to main set.mm
 7-Oct-12 3ioran    [--same--]  moved from SF's mathbox to main set.mm
27-Aug-12 in23      in32
21-Jul-12 simplim   [--same--]  unnecessary negation removed
20-Jul-12 ---       ---         math token "base" was changed to "Base"
25-Jun-12 nelne     nelne1
24-Jun-12 an23      an32
22-Mar-12 simplld   simpld
21-May-12 fiss      [--same--]  moved from JGH's mathbox to main set.mm
21-May-12 inficlALT [--same--]  moved from JGH's mathbox to main set.mm
21-May-12 fitop     [--same--]  moved from JGH's mathbox to main set.mm
21-May-12 abrexex2g [--same--]  moved from JM's mathbox to main set.mm
16-Apr-12 rexcom4a  [--same--]  moved from JM's mathbox to main set.mm
16-Apr-12 rexcom4b  [--same--]  moved from JM's mathbox to main set.mm
16-Apr-12 eqfnfv3   [--same--]  moved from JM's mathbox to main set.mm
16-Apr-12 fibas     [--same--]  moved from JGH's mathbox to main set.mm
16-Apr-12 indexfi   [--same--]  moved from JM's mathbox to main set.mm
16-Apr-12 fipreima  [--same--]  moved from JM's mathbox to main set.mm
14-Apr-12 int2rel   brin
12-Apr-12 dif2rel   brdif       moved from SF's mathbox to main set.mm
25-Mar-12 syl3an2c  syl13anc    old hypothesis 1 is now hypothesis 5
25-Mar-12 syl3anc   syl111anc   old hypothesis 1 is now hypothesis 4
22-Mar-12 sylc      [--same--]  old hypothesis 1 is now hypothesis 4
22-Mar-12 sylanc    syl11anc    old hypothesis 1 is now hypothesis 4
22-Mar-12 syl2anr   syl22anc    old hypothesis 1 is now hypothesis 5
22-Mar-12 sylan31c  syl21anc    order of variables is different
22-Mar-12 sylan32c  syl12anc    order of variables is different
22-Mar-12 pm3.26im  simplim
22-Mar-12 pm3.27im  simprim
22-Mar-12 pm3.26    simpl
22-Mar-12 pm3.26i   simpli
22-Mar-12 pm3.26d   simpld
22-Mar-12 pm3.26bi  simplbi
22-Mar-12 pm3.27    simpr
22-Mar-12 pm3.27i   simpri
22-Mar-12 pm3.27d   simprd
22-Mar-12 pm3.27bi  simprbi
22-Mar-12 pm3.26bda simprbda
22-Mar-12 pm3.27bda simplbda
22-Mar-12 pm3.26bi2 simplbi2
22-Mar-12 pm3.26bi2VD simplbi2VD
22-Mar-12 3simp1    simp1
22-Mar-12 3simp2    simp2
22-Mar-12 3simp3    simp3
22-Mar-12 3simpl1   simpl1
22-Mar-12 3simpl2   simpl2
22-Mar-12 3simpl3   simpl3
22-Mar-12 3simpr1   simpr1
22-Mar-12 3simpr2   simpr2
22-Mar-12 3simpr3   simpr3
22-Mar-12 3simp1i   simp1i
22-Mar-12 3simp2i   simp2i
22-Mar-12 3simp3i   simp3i
22-Mar-12 3simp1d   simp1d
22-Mar-12 3simp2d   simp2d
22-Mar-12 3simp3d   simp3d
22-Mar-12 3simp1bi  simp1bi
22-Mar-12 3simp2bi  simp2bi
22-Mar-12 3simp3bi  simp3bi
22-Mar-12 3simp1l   simp1l
22-Mar-12 3simp1r   simp1r
22-Mar-12 3simp2l   simp2l
22-Mar-12 3simp2r   simp2r
22-Mar-12 3simp3l   simp3l
22-Mar-12 3simp3r   simp3r
22-Mar-12 3simp11   simp11
22-Mar-12 3simp12   simp12
22-Mar-12 3simp13   simp13
22-Mar-12 3simp21   simp21
22-Mar-12 3simp22   simp22
22-Mar-12 3simp23   simp23
22-Mar-12 3simp31   simp31
22-Mar-12 3simp32   simp32
22-Mar-12 3simp33   simp33
20-Mar-12 truni     [--same--]  moved from SF's mathbox to main set.mm
20-Mar-12 trsuc2    [--same--]  moved from SF's mathbox to main set.mm
20-Mar-12 trint     [--same--]  moved from SF's mathbox to main set.mm
20-Mar-12 trintss   [--same--]  moved from SF's mathbox to main set.mm
 4-Mar-12 ralunb    [--same--]  moved from SF's mathbox to main set.mm
20-Feb-12 3orcomb   [--same--]  moved from SF's mathbox to main set.mm
29-Jan-12 sbmo      [--same--]  moved from JM's mathbox to main set.mm
29-Jan-12 2ralor    [--same--]  moved from JM's mathbox to main set.mm
29-Jan-12 rexun     [--same--]  moved from JM's mathbox to main set.mm
29-Jan-12 ralun     [--same--]  moved from JM's mathbox to main set.mm
29-Jan-12 rexsn     [--same--]  moved from JM's mathbox to main set.mm
16-Jan-12 reuuninegi reuunineg
16-Jan-12 riotaund  riotaundb
 3-Jan-12 ee111     syl3c       moved from AS's mathbox to main set.mm
 3-Jan-12 ee12      sylsyld     moved from AS's mathbox to main set.mm
 3-Jan-12 ee20      syl6mpi     moved from AS's mathbox to main set.mm
22-Nov-11 eqfnfv3   [--same--]  moved from JM's mathbox to main set.mm
 6-Nov-11 cm        cmap
 4-Nov-11 hashgf1o  [--same--]  moved from PC's mathbox to main set.mm
 4-Nov-11 hashgval  [--same--]  moved from PC's mathbox to main set.mm
 4-Nov-11 hashginv  [--same--]  moved from PC's mathbox to main set.mm
 4-Nov-11 hashfz1   [--same--]  moved from PC's mathbox to main set.mm
 4-Nov-11 hashen    [--same--]  moved from PC's mathbox to main set.mm
 4-Nov-11 fz1fi     [--same--]  moved from PC's mathbox to main set.mm
20-Oct-11 ralab     [--same--]  moved from JM's mathbox to main set.mm
20-Oct-11 ralrab    [--same--]  moved from JM's mathbox to main set.mm
20-Sep-11 ifbieq2i  [--same--]  moved from PC's mathbox to main set.mm
20-Sep-11 dfiin2g   [--same--]  moved from JGH's mathbox to main set.mm
20-Sep-11 oprvex    ab2rexex    generalized oper. value to be arbitrary class
16-Sep-11 riotass2  reiotass2
16-Sep-11 riota2    reiota2
16-Sep-11 riota2f   reiota2f
16-Sep-11 riota1    reiota1
16-Sep-11 riotasbc    reiotasbc
16-Sep-11 riotacl   reiotacl
16-Sep-11 riotacl2  reiotacl2
15-Sep-11 19.22-2   2exim
15-Sep-11 19.20-2   2alim
15-Sep-11 19.20ii2  2al2imi
15-Sep-11 19.20ian2 2alanimi
15-Sep-11 sbc19.20dv sbcimdv
15-Sep-11 r19.22dva reximdva
15-Sep-11 r19.22sdv reximdv
15-Sep-11 r19.22dv  reximdvai
15-Sep-11 r19.22dv2 reximdv2
15-Sep-11 r19.22d   reximdai
15-Sep-11 r19.22si  reximi
15-Sep-11 r19.22i2  reximi2
15-Sep-11 r19.22i   reximia
15-Sep-11 r19.22OLD reximOLD
15-Sep-11 r19.22    rexim
15-Sep-11 r19.20dv2 ralimdv2
15-Sep-11 r19.20sdv ralimdv
15-Sep-11 r19.20dva ralimdva
15-Sep-11 r19.20da  ralimdaa
15-Sep-11 r19.20sii ral2imi
15-Sep-11 r19.20si  ralimi
15-Sep-11 r19.20ia  ralimiaa
15-Sep-11 r19.20i   ralimia
15-Sep-11 r19.20i2  ralimi2
15-Sep-11 r19.20    ralim
15-Sep-11 19.22dvv  2eximdv
15-Sep-11 19.20dvv  2alimdv
15-Sep-11 19.22dv   eximdv
15-Sep-11 19.20dv   alimdv
15-Sep-11 19.22d    eximd
15-Sep-11 19.22i2   2eximi
15-Sep-11 19.22i    eximi
15-Sep-11 19.22     exim
15-Sep-11 19.20d    alimd
15-Sep-11 19.20ian  alanimi
15-Sep-11 19.20ii   al2imi
15-Sep-11 19.20     alim
15-Sep-11 19.20i2   2alimi
15-Sep-11 19.20i    alimi
15-Sep-11 rexeqd    rexeqbi1dv
15-Sep-11 rexeq1d   rexeqdv
15-Sep-11 rexeq1    rexeq
15-Sep-11 rexeq1f   rexeqf
15-Sep-11 raleq1i   raleqi
15-Sep-11 raleqd    raleqbi1dv
15-Sep-11 raleq1d   raleqdv
15-Sep-11 raleq1    raleq
15-Sep-11 raleq1f   raleqf
15-Sep-11 rabeq12d  rabeqbidv   moved from JM's mathbox to main set.mm
15-Sep-11 19.18-2   2exbi
15-Sep-11 19.15-2   2albi
15-Sep-11 r19.15    ralbi
15-Sep-11 19.18     exbi
15-Sep-11 19.15     albi
15-Sep-11 2albi     2albiim
15-Sep-11 albi      albiim
14-Sep-11 ciota     cio
14-Sep-11 rabbii    rabbiia
14-Sep-11 rabbisdv  rabbidv
14-Sep-11 rabbidv   rabbidva
14-Sep-11 tpi3      tpid3
14-Sep-11 tpi2      tpid2
14-Sep-11 tpi1      tpid1
13-Sep-11 dmfnwdm2  fnprg       moved from FL's mathbox to main set.mm
13-Sep-11 s2pf      funprg      moved from FL's mathbox to main set.mm
12-Sep-11 mptexg    [--same--]  swapped variables "B" and "C"
 9-Sep-11 hbcmpt    hbmpt1      moved from FL's mathbox to main set.mm
 9-Sep-11 bnj1344   simp3bi     moved from JB's mathbox to main set.mm
 9-Sep-11 bnj1301   simp2bi     moved from JB's mathbox to main set.mm
 9-Sep-11 bnj1206   simp1bi     moved from JB's mathbox to main set.mm
 8-Sep-11 syl3an2c  [--same--]  moved from JM's mathbox to main set.mm
 8-Sep-11 eqfnfvALT eqfnfv2
 8-Sep-11 uridm2    ringoridm
 8-Sep-11 uridm1    ringolidm
 8-Sep-11 uridm     ringoidmlem
 8-Sep-11 zerab2    ringorz
 8-Sep-11 zerab     ringolz
 7-Sep-11 euunian   iota4an     moved from ATS's mathbox to main set.mm
 7-Sep-11 iota3     iota4       (because it's analogous to reuunisbc / riota4)
 6-Sep-11 pm13.181  [--same--]  moved from ATS's mathbox to main set.mm
 6-Sep-11 pm13.18   [--same--]  moved from ATS's mathbox to main set.mm
 6-Sep-11 trutru    tru         moved from AH's mathbox to main set.mm
 6-Sep-11 nofaltru  notfal      moved from AH's mathbox to main set.mm
 4-Sep-11 feq1i     [--same--]  moved from PC's mathbox to main set.mm
 4-Sep-11 fneq1i    [--same--]  moved from PC's mathbox to main set.mm
 4-Sep-11 fneq2d    [--same--]  moved from PC's mathbox to main set.mm
 4-Sep-11 fneq1d    [--same--]  moved from PC's mathbox to main set.mm
 3-Sep-11 prf       fpr         moved from JM's mathbox to main set.mm
 3-Sep-11 prfv2     fvpr2       moved from JM's mathbox to main set.mm
 3-Sep-11 prfv1     fvpr1       moved from JM's mathbox to main set.mm
 3-Sep-11 prfun     funpr       moved from JM's mathbox to main set.mm
30-Aug-11 eqfnfvf2  eqfnfv2f
30-Aug-11 xp11a     xpcan2      xp11a (obsolete) was a special case of xpcan2
30-Aug-11 xp11b     xpcan       xp11b (obsolete) was a special case of xpcan
26-Aug-11 dmsdtriord domtriord  moved from JGH's mathbox to main set.mm
26-Aug-11 impbid3   impcon4bid  moved from JGH's mathbox to main set.mm
26-Aug-11 cbvcsb    [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 cbvcsb    [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 ordiso    [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem1 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem2 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem3 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem4 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem5 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem6 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtypelem7 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 ordtype   [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 hartoglem [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 hartog    [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 onsdom    [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubsuc  [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubsuc2 [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubsdomlem1 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 omsubsdomlem2 [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 omsubsdom [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubdom  [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubel   [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubss   [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 elomsubsd [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubdmss [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsublim  [--same--]  moved from JGH's mathbox to main set.mm
26-Aug-11 omsubindss [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 infenomsub [--same--] moved from JGH's mathbox to main set.mm
26-Aug-11 omsubinit [--same--]  moved from JGH's mathbox to main set.mm
20-Aug-11 iotaval   [--same--]  swapped order of equality in consequent
20-Aug-11 iotaequ   [--same--]  swapped order of equality in consequent
20-Aug-11 iotanul   [--same--]  swapped order of equality
18-Aug-11 mpset     mptexg      moved from FL's mathbox to main set.mm
18-Aug-11 hbiota    hbiota1     moved from ATS's mathbox to main set.mm
18-Aug-11 iotacl    [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 iota3     [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 iotaex    [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 iotanul   [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 iotaequ   [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 iotaval   [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 sbeqalb   [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 sbceqal   [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 eqsbc3    [--same--]  moved from ATS's mathbox to main set.mm
18-Aug-11 19.20ian  [--same--]  moved from ATS's mathbox to main set.mm
17-Aug-11 mpt2g     ovmpt2g
17-Aug-11 mptg      fvmptg
17-Aug-11 bnj1226   imorri      moved from JB's mathbox to main set.mm
17-Aug-11 jad       [--same--]  moved from SF's mathbox to main set.mm
13-Aug-11 ceqsex3v  ---         (RM's mathbox) - obsolete; use ceqsexgv
13-Aug-11 ceqsex3   ---         (RM's mathbox) - obsolete; use ceqsexg
13-Aug-11 ceqsex2v  [--same--]  reformatted to use triple conjunction
13-Aug-11 ceqsex2   [--same--]  reformatted to use triple conjunction
 9-Aug-11 feq2d     [--same--]  moved from PC's mathbox to main set.mm
 9-Aug-11 bnj1456   snssd       moved from JB's mathbox to main set.mm
 9-Aug-11 snssd     [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 fbaslim   [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 fbfgss    [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 fgid      [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 cnpnei    [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 limfilss  [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 fbfgfmeq  [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 fgss      [--same--]  moved from JGH's mathbox to main set.mm
 9-Aug-11 filmapss  [--same--]  moved from JGH's mathbox to main set.mm
18-Jul-11 ompfl3    3anibar
18-Jul-11 rexeq12d  rexeqbidv
18-Jul-11 raleq12d  raleqbidv
18-Jul-11 ralbieq1dv ---        obsolete; use raleqbidv
18-Jul-11 exan2     exsimpl
 8-Jul-11 brab1     [--same--]  changed set var "y" to class var "A"
29-Jun-11 exan2     [--same--]  moved from RM's mathbox to main set.mm
29-Jun-11 wfal      [--same--]  moved from AH's mathbox to main set.mm
29-Jun-11 df-fal    [--same--]  moved from AH's mathbox to main set.mm
29-Jun-11 wtru      [--same--]  moved from AH's mathbox to main set.mm
29-Jun-11 df-tru    [--same--]  moved from AH's mathbox to main set.mm
29-Jun-11 mptfn     [--same--]  moved from SF's mathbox to main set.mm
29-Jun-11 rnmpt     [--same--]  moved from SF's mathbox to main set.mm
29-Jun-11 dford2    [--same--]  moved from SF's mathbox to main set.mm
29-Jun-11 funsngxx  funsng      changed "e. _V" to "e. C", "e. D" in antec.
29-Jun-11 bnj94     funsngxx    moved from JB's mathbox to main set.mm
29-Jun-11 bnj928    fnsn        moved from JB's mathbox to main set.mm
29-Jun-11 bnj1257   eleq2s      moved from JB's mathbox to main set.mm
29-Jun-11 bnj1495   funeqi      moved from JB's mathbox to main set.mm
29-Jun-11 erdisj2   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 cass      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-ass    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 isass     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 isexid    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ismgm     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 opidon    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rngopid   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 opidon2   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 isexid2   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 exidu1    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 idrval    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 iorlid    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 cmpidelt  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 csem      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-sgr    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 smgrpismgm [--same--] moved from FL's mathbox to main set.mm
29-Jun-11 issmgrp   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 smgrpmgm  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 smgrpass  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 cmnd      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-mnd    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 mndissmgrp [--same--] moved from FL's mathbox to main set.mm
29-Jun-11 mndisexid [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 mndismgm  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 mndmgmid  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ismnd     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ismnd1    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 relrng    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rngn0     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rngmgmbs4 [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rnplrnml0 [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rnplrnml2 [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 rnplrnml  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 unmnd     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 fora1     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 fora2     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 fora      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 uridm     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 uridm1    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 zerab     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 zerab2    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 on1el3    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 on1el4    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 on1el6    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ring1cl   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 uznzr     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 isdivrngo  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 zrdivrng  [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 dvrunz    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 clmgm     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 uridm2    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 grpmnd    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 iscom2    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ismnd2    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 difeq12   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 setwoe    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 sfseqeq   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 opreq123d [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 oprabvaligg [--same--] moved from FL's mathbox to main set.mm
29-Jun-11 cexid     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-exid   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 cmagm     [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-mgm    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 ccm2      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-com2   [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 cfld      [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 df-fld    [--same--]  moved from FL's mathbox to main set.mm
29-Jun-11 imp5a     [--same--]  moved from JGH's mathbox to main set.mm
29-Jun-11 iccleub   [--same--]  moved from JGH's mathbox to main set.mm
29-Jun-11 expl      [--same--]  moved from JGH's mathbox to main set.mm
29-Jun-11 ghomid    [--same--]  moved from PC's mathbox to main set.mm
29-Jun-11 ghomlin   [--same--]  moved from PC's mathbox to main set.mm
28-Jun-11 infmssuzle [--same--] removed redundant antecedent S =/= (/)
22-Jun-11 xpeq12    [--same--]  moved from FL's mathbox to main set.mm
22-Jun-11 xpeq12i   [--same--]  moved from FL's mathbox to main set.mm
21-Jun-11 axnul2    axnulALT
25-Mar-11 ntunte    inuni
 8-Mar-11 ssxp      xpss12
 8-Mar-11 bepart    elelpwi
 8-Mar-11 intprd    intprg      changed "e. _V" to "e. C", "e. D" in antec.
 2-Mar-11 equnamo   n0moeu
21-Feb-11 muln0b    mulne0b
21-Feb-11 muln0i    mulne0i
16-Jan-11 grothinf  grothomex
13-Jan-11 hbequid   hbequid2
10-Dec-10 nexnoti   nexr
31-Oct-10 reu3xxx   reu6
31-Oct-10 reu6      reu3
31-Oct-10 reu3      reu3xxx
30-Oct-10 eusn      euabsn
26-Oct-10 raaan     raaanv
18-Oct-10 ---       ---         changed math symbol from "C=" to "C_"
 3-Oct-10 ---       ---         added variables E, e, I, i, V
 3-Oct-10 ---       ---         changed math symbol from "P~" to "~P"
 3-Oct-10 ---       ---         changed math symbol from "H~" to "~H"
 3-Oct-10 ---       ---         changed math symbol from "(_" to "C="
 3-Oct-10 ---       ---         changed math symbol from "(." to "C."
 3-Oct-10 ---       ---         changed math symbol from "C." to "_C"
 3-Oct-10 ---       ---         changed math symbol from "E" to "_E"
 3-Oct-10 ---       ---         changed math symbol from "e" to "_e"
 3-Oct-10 ---       ---         changed math symbol from "I" to "_I"
 3-Oct-10 ---       ---         changed math symbol from "i" to "_i"
 3-Oct-10 ---       ---         changed math symbol from "V" to "_V"
24-Jul-09 sandbox   mathbox
12-Jun-09 mulge0    [--same--]  rearranged antecedent
12-Jun-09 mulgt0    [--same--]  rearranged antecedent
12-May-09 ---       ---         changed math symbol from "ZZ_>" to "ZZ>="
 2-May-09 snsspr    snsspr1
 2-May-09 axpow     zfpow
 2-May-09 axac      zfac
 2-May-09 axun      zfun
27-Apr-09 pm4.22    bitr
24-Apr-09 axinf     zfinf
24-Apr-09 zfinf     zfinf2
 2-Apr-09 infmssuzle [--same--] changed -. S = (/) to S =/= (/)
23-Mar-09 eqfnfvf   ---         obsolete; use eqfnfvf2 instead
23-Mar-09 ffnoprval ffnoprv
23-Mar-09 eqfnoprval eqfnoprv
23-Mar-09 fnoprval  fnoprv
23-Mar-09 foprval   foprv
23-Mar-09 oprvalres oprvres
23-Mar-09 oprssoprval oprssoprv
23-Mar-09 fnrnoprval fnrnoprv
23-Mar-09 fooprval  fooprv
23-Mar-09 fnoprvalrn fnoprvrn
23-Mar-09 oprvalelrn oprvelrn
23-Mar-09 oprvalconst2 oprvconst2
23-Mar-09 oprvalex  oprvex
23-Mar-09 symgoprval symgoprv
23-Mar-09 fnoprvalrn2 fnoprvrn2
22-Mar-09 icoshf    icoshft
 8-Mar-09 nnont     nnon
 7-Mar-09 eluzsubii eluzsubi
 7-Mar-09 eluzaddii eluzaddi
 7-Mar-09 divexp    expdiv
 7-Mar-09 recexp    exprec
 7-Mar-09 ---       ---         changed math symbol from "ZZ>" to "ZZ_>"
27-Feb-09 lediv23   [--same--]  rearranged antecedent
27-Feb-09 ltdiv23   [--same--]  rearranged antecedent
 3-Jan-09 muln0     mulne0
 3-Jan-09 vne0      vn0
 3-Jan-09 n0        neq0
 3-Jan-09 ne0       n0
 3-Jan-09 ssne0     ssn0
 3-Jan-09 onne0     onn0
 3-Jan-09 dmsnne0   dmsnn0
 3-Jan-09 rnsnne0   rnsnn0
 3-Jan-09 1ne0      1n0
 3-Jan-09 metne0    metn0
 3-Jan-09 blne0     bln0
 2-Jan-08 flrecl    reflcl
30-Dec-08 letrdi    letrd
30-Dec-08 lelttrdi  lelttrd
30-Dec-08 ltletrdi  ltletrd
30-Dec-08 lttrdi    lttrd
29-Dec-08 hbnegi    hbneg
29-Dec-08 hbnegdi   hbnegd
29-Dec-08 hbsumi    hbsum
29-Dec-08 hbsum1i   hbsum1
28-Dec-08 negnei    negne0i
28-Dec-08 negne0i   negne0bi
28-Dec-08 lemul2    [--same--]  rearranged antecedent
28-Dec-08 lemul1    [--same--]  rearranged antecedent
28-Dec-08 ltmul2    [--same--]  rearranged antecedent
28-Dec-08 ltmul1    [--same--]  rearranged antecedent
28-Dec-08 ecdmn0    [--same--]  changed -. ... = to =/=
27-Dec-08 divdiv24  [--same--]  rearranged antecedent
27-Dec-08 divdiv13  [--same--]  rearranged antecedent
27-Dec-08 divadddiv [--same--]  rearranged antecedent
27-Dec-08 divdivdiv [--same--]  rearranged antecedent
27-Dec-08 recndi    recnd
27-Dec-08 divdivmul divdiv1
27-Dec-08 divdiv23  [--same--]  rearranged antecedent
27-Dec-08 dmsnsn0   ---         obsolete; use the more general dmsn0el
25-Dec-08 div12     [--same--]  rearranged antecedent
25-Dec-08 div13     [--same--]  rearranged antecedent
25-Dec-08 div23     [--same--]  rearranged antecedent
25-Dec-08 expm1     expm1t
25-Dec-08 divmuldiv [--same--]  rearranged antecedent
25-Dec-08 recexp    [--same--]  rearranged antecedent
25-Dec-08 expne0i   [--same--]  rearranged antecedent
25-Dec-08 expsub    [--same--]  rearranged antecedent
25-Dec-08 divexp    [--same--]  rearranged antecedent
21-Dec-08 imaun2    imaundir
21-Dec-08 imaun     imaundi
19-Dec-08 sbhyp     ---         obsolete; use sbhypf
19-Dec-08 opelcog   opelco2g
18-Dec-08 fsumspl   fsumsplit
18-Dec-08 fsum0spl  fsum0split
18-Dec-08 fsumshf   fsumshft
18-Dec-08 fsumcons  fsumconst
18-Dec-08 dmco2     dmco
17-Dec-08 ---       ---         the math token "Base" was changed to "BaseSet"
17-Dec-08 ssxpr     ---         obsolete; use ssxpb
17-Dec-08 nicodraw  ---         obsolete; use nic-ax
17-Dec-08 nicodmpraw ---        obsolete; use nic-mp
17-Dec-08 3exbi     3exbii
17-Dec-08 relssdr   relssdmrn
16-Dec-08 dfoprab4  dfoprab5s
16-Dec-08 dfoprab5  dfoprab4s
16-Dec-08 dffxxx    dff2
16-Dec-08 dff4      dff3
16-Dec-08 dff3      dff4
16-Dec-08 dff4      dffxxx
16-Dec-08 dffunmo   dffun6
16-Dec-08 dffun6    dffun7
16-Dec-08 dffun7    dffun8
16-Dec-08 dffun8    dffun9
16-Dec-08 dffunmof  dffun6f
16-Dec-08 fnopabfv  dffn5
16-Dec-08 fnforn    dffn4
16-Dec-08 fnfrn     dffn3
16-Dec-08 fnf       dffn2
16-Dec-08 f1fvf     dff13f
16-Dec-08 f1fv      dff13
16-Dec-08 f11       dff12
16-Dec-08 f1ofv     dff1o6
16-Dec-08 f1o5      dff1o5
16-Dec-08 f1o4      dff1o4
16-Dec-08 f1o3      dff1o3
16-Dec-08 f1o2      dff1o2
15-Dec-08 pm4.2d    biidd
15-Dec-08 pm4.2     biid
15-Dec-08 pm4.1     con34b
15-Dec-08 bi2.15    con1b
15-Dec-08 bi2.03    con2b
15-Dec-08 a3d       con4d
15-Dec-08 a3i       con4i
13-Dec-08 2climnni  2climnn
13-Dec-08 2climnn0i 2climnn0
12-Dec-08 reeftlclti reeftlcl
12-Dec-08 eftlclti  eftlcl
12-Dec-08 eftlexti  eftlex
12-Dec-08 fnsmnti   arisumi
12-Dec-08 nn0le2msqti nn0le2msqi
12-Dec-08 reccnvi   reccnv
12-Dec-08 expcnvi   expcnv
11-Dec-08 isummulc1i isummulc1
11-Dec-08 iserzgt0i iserzgt0
11-Dec-08 isumreclti isumrecl
11-Dec-08 isumclti  isumcl
11-Dec-08 isumnn0nni isumnn0nn
11-Dec-08 isum1pi   isum1p
11-Dec-08 isumnuli  isumnul
11-Dec-08 isumclim5ti isumclim5
11-Dec-08 isumclim4ti isumclim4
11-Dec-08 isumclim3ti isumclim3
11-Dec-08 isumclim2ti isumclim2
11-Dec-08 isumclim2tfi isumclim2f
11-Dec-08 isum1climi isum1clim
11-Dec-08 isumclimti isumclim
11-Dec-08 isumval2ti isumval2
11-Dec-08 isumvalti isumval
11-Dec-08 cvgcmp3ceti cvgcmp3ce
11-Dec-08 iserzcmp0i iserzcmp0
11-Dec-08 iserzcmpi iserzcmp
11-Dec-08 climsqueeze2i climsqueeze2
11-Dec-08 climsqueezei climsqueeze
11-Dec-08 climcmpc1i climcmpc1
11-Dec-08 climcmpi  climcmp
11-Dec-08 iserzmulc1i iserzmulc1
11-Dec-08 iserzexti iserzex
11-Dec-08 clim2serzti clim2serz
11-Dec-08 climsubc2i climsubc2
11-Dec-08 climsubi  climsub
11-Dec-08 climmulc2i climmulc2
11-Dec-08 climmuli  climmul
11-Dec-08 climaddc2i climaddc2
11-Dec-08 climaddc1i climaddc1
11-Dec-08 climaddi  climadd
11-Dec-08 climge0i  climge0
11-Dec-08 climrecli climrecl
11-Dec-08 climreui  climreu
11-Dec-08 climeui   climeu
11-Dec-08 climuniii climunii
11-Dec-08 climunii  climuni
11-Dec-08 clm4ati   clm4a
11-Dec-08 serzmulc1i serzmulc1
11-Dec-08 serzspliti serzsplit
11-Dec-08 serzcmp0i serzcmp0
11-Dec-08 serzcmpi  serzcmp
11-Dec-08 serz1pi   serz1p
11-Dec-08 serzreclti serzrecl
11-Dec-08 serzcl2ti serzcl2
11-Dec-08 ser1clti  ser1cl
11-Dec-08 ser0clti  ser0cl
11-Dec-08 serzclti  serzcl
11-Dec-08 fsum4i    fsum4
11-Dec-08 fsum3i    fsum3
11-Dec-08 fsum2i    fsum2
11-Dec-08 fsum0spli fsum0spl
11-Dec-08 fsumspli  fsumspl
11-Dec-08 serzfsumi serzfsum
11-Dec-08 fsumserz2i fsumserz2
11-Dec-08 fsumserzi fsumserz
11-Dec-08 cvg1ii    cvg1i
11-Dec-08 cvg1i     cvg1
11-Dec-08 seqzres2i seqzres2
11-Dec-08 seqzresi  seqzres
11-Dec-08 seqzresvali seqzresval
11-Dec-08 seqzcli   seqzcl
11-Dec-08 seqzrni   seqzrn
11-Dec-08 seqzrn2i  seqzrn2
11-Dec-08 seqzeqi   seqzeq
11-Dec-08 seqzfveqi seqzfveq
11-Dec-08 seqzval2ti seqzval2
11-Dec-08 seq01i    seq01
11-Dec-08 seq0p1i   seq0p1
11-Dec-08 seq00i    seq00
11-Dec-08 seqzm1i   seqzm1
11-Dec-08 seqzp1i   seqzp1
11-Dec-08 seqz1i    seqz1
11-Dec-08 seq0fni   seq0fn
11-Dec-08 seq1seq0i seq1seq0
11-Dec-08 seq1seq0ti seq1seq01
11-Dec-08 seq1seq02ti seq1seq02
11-Dec-08 seq0seqzi seq0seqz
11-Dec-08 seq1seqzi seq1seqz
11-Dec-08 seqzvalti seqzval
11-Dec-08 seqzfni   seqzfn
11-Dec-08 seqzfval2i seqzfval2
11-Dec-08 seqzfvali seqzfval
11-Dec-08 seq0valti seq0valt
11-Dec-08 seq0fvali seq0fval
11-Dec-08 seq1shftidi seq1shftid
11-Dec-08 shftidti  shftidt
11-Dec-08 shftcan1ti shftcan1
11-Dec-08 shftcan2ti shftcan2
11-Dec-08 shftfi    shftf
11-Dec-08 shftval5ti shftval5
11-Dec-08 shftval4ti shftval4
11-Dec-08 shftval3ti shftval3
11-Dec-08 shftval2ti shftval2
11-Dec-08 shftvalti shftval
11-Dec-08 shftresvalti shftresval
11-Dec-08 shftresi  shftres
11-Dec-08 shftfni   shftfn
11-Dec-08 shftfvali shftfval
11-Dec-08 seq1resi  seq1res
11-Dec-08 seq1cl2i  seq1cl2
11-Dec-08 seq1cli   seq1cl
11-Dec-08 seq1f2i   seq1f2
11-Dec-08 seq1fi    seq1f
11-Dec-08 seq1rni   seq1rn
11-Dec-08 seq1rn2i  seq1rn2
11-Dec-08 seq1fni   seq1fn
11-Dec-08 seq1m1i   seq1m1
11-Dec-08 seq1p1i   seq1p1
11-Dec-08 seq11i    seq11
11-Dec-08 seq1val2i seq1val2
11-Dec-08 seq1vali  seq1val
11-Dec-08 seq1rvali seq1rval
11-Dec-08 uznegi    uzneg
 9-Dec-08 nvelv     vprc
 9-Dec-08 inelv     iprc
 9-Dec-08 fipr      fiprc
 9-Dec-08 ecqs      [--same--]  eliminated redundant hypothesis A e. _V
18-Nov-08 ---       ---         See mmnotes.txt entry of 18-Nov-2008
18-Nov-08 cdavalt   cdaval
18-Nov-08 cdaval    cdavali
18-Nov-08 unbnnt    unbnn3
18-Nov-08 frsuct    frsuc
18-Nov-08 fr0t      fr0g
18-Nov-08 rdg0t     rdg0g
18-Nov-08 ssonunit  ssonuni
18-Nov-08 ssonuni   ssonunii
18-Nov-08 eqtr3t    eqtr3
18-Nov-08 eqtr2t    eqtr2
18-Nov-08 eqtrt     eqtr
18-Nov-08 3eqtr4r   3eqtr4ri
18-Nov-08 3eqtr3r   3eqtr3ri
18-Nov-08 3eqtr2r   3eqtr2ri
18-Nov-08 3eqtr4r   3eqtr4ri
18-Nov-08 3eqtr3r   3eqtr3ri
18-Nov-08 3bitr3r   3bitr3ri
18-Nov-08 3bitr4r   3bitr4ri
18-Nov-08 3bitr2r   3bitr2ri
18-Nov-08 biimpr    biimpri
18-Nov-08 biimp     biimpi
18-Nov-08 impbi     impbii
18-Nov-08 ---       ---         See mmnotes.txt entry of 17-Nov-2008
17-Nov-08 ---       ---         Remember that substitutions are
17-Nov-08 ---       ---         made in _reverse_ order.
17-Nov-08 efi4pt    efi4p
17-Nov-08 resin4pt  resin4p
17-Nov-08 recos4pt  recos4p
17-Nov-08 ef4pt     ef4p
17-Nov-08 addclt    addcl
17-Nov-08 readdclt  readdcl
17-Nov-08 mulclt    mulcl
17-Nov-08 remulclt  remulcl
17-Nov-08 addcomt   addcom
17-Nov-08 mulcomt   mulcom
17-Nov-08 addasst   addass
17-Nov-08 mulasst   mulass
17-Nov-08 adddit    adddi
17-Nov-08 addid1t   addid1
17-Nov-08 mulid1t   mulid1
17-Nov-08 recnt     recn
17-Nov-08 adddirt   adddir
17-Nov-08 addid2t   addid2
17-Nov-08 add12t    add12
17-Nov-08 add23t    add23
17-Nov-08 add4t     add4
17-Nov-08 add42t    add42
17-Nov-08 cnegext   cnegex
17-Nov-08 cnegextlem1 cnegexlem1
17-Nov-08 cnegextlem2 cnegexlem2
17-Nov-08 cnegextlem3 cnegexlem3
17-Nov-08 addcant   addcan
17-Nov-08 addcan2t  addcan2
17-Nov-08 subvalt   subval
17-Nov-08 subclt    subcl
17-Nov-08 negclt    negcl
17-Nov-08 subaddt   subadd
17-Nov-08 subsub23t subsub23
17-Nov-08 pncan3t   pncan3
17-Nov-08 negidt    negid
17-Nov-08 negsubt   negsub
17-Nov-08 addsubasst addsubass
17-Nov-08 addsubt   addsub
17-Nov-08 subadd23t subadd23
17-Nov-08 addsub12t addsub12
17-Nov-08 2addsubt  2addsub
17-Nov-08 negnegt   negneg
17-Nov-08 subnegt   subneg
17-Nov-08 subidt    subid
17-Nov-08 subid1t   subid1
17-Nov-08 pncant    pncan
17-Nov-08 pncan2t   pncan2
17-Nov-08 npcant    npcan
17-Nov-08 npncant   npncan
17-Nov-08 nppcant   nppcan
17-Nov-08 subcan2t  subcan2
17-Nov-08 subeq0t   subeq0
17-Nov-08 neg11t    neg11
17-Nov-08 negcon1t  negcon1
17-Nov-08 negcon2t  negcon2
17-Nov-08 subcant   subcan
17-Nov-08 mulid2t   mulid2
17-Nov-08 mul12t    mul12
17-Nov-08 mul23t    mul23
17-Nov-08 mul4t     mul4
17-Nov-08 muladdt   muladd
17-Nov-08 muladd11t muladd11
17-Nov-08 subdit    subdi
17-Nov-08 subdirt   subdir
17-Nov-08 renegclt  renegcl
17-Nov-08 resubclt  resubcl
17-Nov-08 mul01t    mul01
17-Nov-08 mul02t    mul02
17-Nov-08 mulneg1t  mulneg1
17-Nov-08 mulneg2t  mulneg2
17-Nov-08 mulneg12t mulneg12
17-Nov-08 mul2negt  mul2neg
17-Nov-08 negdit    negdi
17-Nov-08 negdi2t   negdi2
17-Nov-08 negsubdit negsubdi
17-Nov-08 negsubdi2t negsubdi2
17-Nov-08 neg2subt  neg2sub
17-Nov-08 submul2t  submul2
17-Nov-08 subsub2t  subsub2
17-Nov-08 subsubt   subsub
17-Nov-08 subsub3t  subsub3
17-Nov-08 subsub4t  subsub4
17-Nov-08 sub23t    sub23
17-Nov-08 nnncant   nnncan
17-Nov-08 nnncan1t  nnncan1
17-Nov-08 nnncan2t  nnncan2
17-Nov-08 nncant    nncan
17-Nov-08 nppcan2t  nppcan2
17-Nov-08 mulm1t    mulm1
17-Nov-08 addsub4t  addsub4
17-Nov-08 subadd4t  subadd4
17-Nov-08 sub4t     sub4
17-Nov-08 mulsubt   mulsub
17-Nov-08 pnpcant   pnpcan
17-Nov-08 pnpcan2t  pnpcan2
17-Nov-08 pnncant   pnncan
17-Nov-08 ppncant   ppncan
17-Nov-08 ltxrt     ltxr
17-Nov-08 rexrt     rexr
17-Nov-08 ltxrltt   ltxrlt
17-Nov-08 xrlenltt  xrlenlt
17-Nov-08 xrltnlet  xrltnle
17-Nov-08 lttrt     lttr
17-Nov-08 mulgt0t   mulgt0
17-Nov-08 lenltt    lenlt
17-Nov-08 ltnlet    ltnle
17-Nov-08 lttri2t   lttri2
17-Nov-08 lttri3t   lttri3
17-Nov-08 lttri4t   lttri4
17-Nov-08 ltnet     ltne
17-Nov-08 letri3t   letri3
17-Nov-08 leloet    leloe
17-Nov-08 eqleltt   eqlelt
17-Nov-08 ltlet     ltle
17-Nov-08 leltnet   leltne
17-Nov-08 ltlent    ltlen
17-Nov-08 lelttrt   lelttr
17-Nov-08 ltletrt   ltletr
17-Nov-08 letrt     letr
17-Nov-08 ltnrt     ltnr
17-Nov-08 leidt     leid
17-Nov-08 ltnsymt   ltnsym
17-Nov-08 ltnsym2t  ltnsym2
17-Nov-08 renepnft  renepnf
17-Nov-08 renemnft  renemnf
17-Nov-08 xrltnrt   xrltnr
17-Nov-08 ltpnft    ltpnf
17-Nov-08 mnfltt    mnflt
17-Nov-08 mnfltxrt  mnfltxr
17-Nov-08 pnfnltt   pnfnlt
17-Nov-08 nltmnft   nltmnf
17-Nov-08 pnfget    pnfge
17-Nov-08 mnflet    mnfle
17-Nov-08 xrltnsymt xrltnsym
17-Nov-08 xrltnsym2t xrltnsym2
17-Nov-08 xrlttrit  xrlttri
17-Nov-08 xrlttrt   xrlttr
17-Nov-08 xrlttri2t xrlttri2
17-Nov-08 xrlttri3t xrlttri3
17-Nov-08 xrleloet  xrleloe
17-Nov-08 xrleltnet xrleltne
17-Nov-08 xrltlet   xrltle
17-Nov-08 xrleidt   xrleid
17-Nov-08 xrletrit  xrletri
17-Nov-08 xrlelttrt xrlelttr
17-Nov-08 xrltletrt xrltletr
17-Nov-08 xrletrt   xrletr
17-Nov-08 xrltnet   xrltne
17-Nov-08 nltpnftt  nltpnft
17-Nov-08 ngtmnftt  ngtmnft
17-Nov-08 xrrebndt  xrrebnd
17-Nov-08 xrret     xrre
17-Nov-08 xrre2t    xrre2
17-Nov-08 eqlet     eqle
17-Nov-08 msqgt0t   msqgt0
17-Nov-08 msqge0t   msqge0
17-Nov-08 gt0ne0t   gt0ne0
17-Nov-08 ne0gt0t   ne0gt0
17-Nov-08 letrit    letric
17-Nov-08 lelttrit  lelttric
17-Nov-08 ltadd1t   ltadd1
17-Nov-08 ltadd2t   ltadd2
17-Nov-08 leadd1t   leadd1
17-Nov-08 leadd2t   leadd2
17-Nov-08 ltsubaddt ltsubadd
17-Nov-08 ltsubadd2t ltsubadd2
17-Nov-08 lesubaddt lesubadd
17-Nov-08 lesubadd2t lesubadd2
17-Nov-08 ltaddsubt ltaddsub
17-Nov-08 ltaddsub2t ltaddsub2
17-Nov-08 leaddsubt leaddsub
17-Nov-08 leaddsub2t leaddsub2
17-Nov-08 sublet    suble
17-Nov-08 lesubt    lesub
17-Nov-08 ltsub23t  ltsub23
17-Nov-08 ltsub13t  ltsub13
17-Nov-08 lt2addt   lt2add
17-Nov-08 le2addt   le2add
17-Nov-08 ltleaddt  ltleadd
17-Nov-08 leltaddt  leltadd
17-Nov-08 addgt0t   addgt0
17-Nov-08 addgegt0t addgegt0
17-Nov-08 addgtge0t addgtge0
17-Nov-08 addge0t   addge0
17-Nov-08 ltaddpost ltaddpos
17-Nov-08 ltaddpos2t ltaddpos2
17-Nov-08 ltsubpost ltsubpos
17-Nov-08 posdift   posdif
17-Nov-08 ltnegt    ltneg
17-Nov-08 ltnegcon1t ltnegcon1
17-Nov-08 lenegt    leneg
17-Nov-08 lenegcon1t lenegcon1
17-Nov-08 lenegcon2t lenegcon2
17-Nov-08 lesub1t   lesub1
17-Nov-08 lesub2t   lesub2
17-Nov-08 ltsub1t   ltsub1
17-Nov-08 ltsub2t   ltsub2
17-Nov-08 lt0neg1t  lt0neg1
17-Nov-08 lt0neg2t  lt0neg2
17-Nov-08 le0neg1t  le0neg1
17-Nov-08 le0neg2t  le0neg2
17-Nov-08 addge01t  addge01
17-Nov-08 addge02t  addge02
17-Nov-08 subge0t   subge0
17-Nov-08 suble0t   suble0
17-Nov-08 subge02t  subge02
17-Nov-08 lesub0t   lesub0
17-Nov-08 mulge0t   mulge0
17-Nov-08 recext    recex
17-Nov-08 mulcant   mulcan
17-Nov-08 mulcan2t  mulcan2
17-Nov-08 mul0ort   mul0or
17-Nov-08 muln0bt   mulne0b
17-Nov-08 muln0t    muln0
17-Nov-08 muleqaddt muleqadd
17-Nov-08 divmult   divmul
17-Nov-08 divmul2t  divmul2
17-Nov-08 divmul3t  divmul3
17-Nov-08 divclt    divcl
17-Nov-08 recclt    reccl
17-Nov-08 divcan1t  divcan1
17-Nov-08 divcan2t  divcan2
17-Nov-08 divne0bt  divne0b
17-Nov-08 divne0t   divne0
17-Nov-08 recne0t   recne0
17-Nov-08 recidt    recid
17-Nov-08 recid2t   recid2
17-Nov-08 divrect   divrec
17-Nov-08 divrec2t  divrec2
17-Nov-08 divasst   divass
17-Nov-08 div23t    div23
17-Nov-08 div13t    div13
17-Nov-08 div12t    div12
17-Nov-08 divdirt   divdir
17-Nov-08 divcan3t  divcan3
17-Nov-08 divcan4t  divcan4
17-Nov-08 div11t    div11
17-Nov-08 dividt    divid
17-Nov-08 div0t     div0
17-Nov-08 diveq0t   diveq0
17-Nov-08 div1t     div1
17-Nov-08 divnegt   divneg
17-Nov-08 divsubdirt divsubdir
17-Nov-08 recrect   recrec
17-Nov-08 rec11rt   rec11r
17-Nov-08 divmuldivt divmuldiv
17-Nov-08 divcan5t  divcan5
17-Nov-08 divmul13t divmul13
17-Nov-08 divmul24t divmul24
17-Nov-08 divadddivt divadddiv
17-Nov-08 divdivdivt divdivdiv
17-Nov-08 recdivt   recdiv
17-Nov-08 divcan6t  divcan6
17-Nov-08 divdiv23t divdiv23
17-Nov-08 divdivmult divdivmul
17-Nov-08 recdiv2t  recdiv2
17-Nov-08 conjmult  conjmul
17-Nov-08 redivclt  redivcl
17-Nov-08 rerecclt  rereccl
17-Nov-08 eqnegt    eqneg
17-Nov-08 negeq0t   negeq0
17-Nov-08 ltp1t     ltp1
17-Nov-08 lep1t     lep1
17-Nov-08 ltm1t     ltm1
17-Nov-08 letrp1t   letrp1
17-Nov-08 p1let     p1le
17-Nov-08 prodgt0t  prodgt0
17-Nov-08 prodgt02t prodgt02
17-Nov-08 prodge0t  prodge0
17-Nov-08 prodge02t prodge02
17-Nov-08 ltmul1t   ltmul1
17-Nov-08 ltmul2t   ltmul2
17-Nov-08 lemul1t   lemul1
17-Nov-08 lemul2t   lemul2
17-Nov-08 lemul1it  lemul1a
17-Nov-08 lemul2it  lemul2a
17-Nov-08 ltmul12it ltmul12a
17-Nov-08 lemul12ait lemul12b
17-Nov-08 lemul12it lemul12a
17-Nov-08 mulgt1t   mulgt1
17-Nov-08 ltmulgt11t ltmulgt11
17-Nov-08 ltmulgt12t ltmulgt12
17-Nov-08 lemulge11t lemulge11
17-Nov-08 ltdiv1t   ltdiv1
17-Nov-08 lediv1t   lediv1
17-Nov-08 gt0divt   gt0div
17-Nov-08 ge0divt   ge0div
17-Nov-08 divgt0t   divgt0
17-Nov-08 divge0t   divge0
17-Nov-08 recgt0t   recgt0
17-Nov-08 ltmuldivt ltmuldiv
17-Nov-08 ltmuldiv2t ltmuldiv2
17-Nov-08 ltdivmult ltdivmul
17-Nov-08 ledivmult ledivmul
17-Nov-08 ltdivmul2t ltdivmul2
17-Nov-08 lt2mul2divt lt2mul2div
17-Nov-08 ledivmul2t ledivmul2
17-Nov-08 lemuldivt lemuldiv
17-Nov-08 lemuldiv2t lemuldiv2
17-Nov-08 ltrect    ltrec
17-Nov-08 lerect    lerec
17-Nov-08 lt2msqt   lt2msq
17-Nov-08 ltdiv2OLDt   ltdiv2OLD
17-Nov-08 ltrec1t   ltrec1
17-Nov-08 lerec2t   lerec2
17-Nov-08 ledivdivt ledivdiv
17-Nov-08 lediv2t   lediv2
17-Nov-08 ltdiv23t  ltdiv23
17-Nov-08 lediv23t  lediv23
17-Nov-08 lediv12it lediv12a
17-Nov-08 lediv2it  lediv2a
17-Nov-08 reclt1t   reclt1
17-Nov-08 recgt1t   recgt1
17-Nov-08 recgt1it  recgt1i
17-Nov-08 recrecltt recreclt
17-Nov-08 le2msqt   le2msq
17-Nov-08 ledivp1t  ledivp1
17-Nov-08 xrmaxltt  xrmaxlt
17-Nov-08 xrltmint  xrltmin
17-Nov-08 maxlet    maxle
17-Nov-08 lemint    lemin
17-Nov-08 maxltt    maxlt
17-Nov-08 ltmint    ltmin
17-Nov-08 nnret     nnre
17-Nov-08 nncnt     nncn
17-Nov-08 nnaddclt  nnaddcl
17-Nov-08 nnmulclt  nnmulcl
17-Nov-08 nn2get    nn2ge
17-Nov-08 nnge1t    nnge1
17-Nov-08 nngt1ne1t nngt1ne1
17-Nov-08 nnle1eq1t nnle1eq1
17-Nov-08 nngt0t    nngt0
17-Nov-08 nnne0t    nnne0
17-Nov-08 nnrecret  nnrecre
17-Nov-08 nnrecgt0t nnrecgt0
17-Nov-08 nnleltp1t nnleltp1
17-Nov-08 nnltp1let nnltp1le
17-Nov-08 nnsubt    nnsub
17-Nov-08 nnaddm1clt nnaddm1cl
17-Nov-08 nndivt    nndiv
17-Nov-08 nndivtrt  nndivtr
17-Nov-08 2timest   2times
17-Nov-08 times2t   times2
17-Nov-08 halfclt   halfcl
17-Nov-08 rehalfclt rehalfcl
17-Nov-08 half0t    half0
17-Nov-08 halfpost  halfpos
17-Nov-08 halfpos2t halfpos2
17-Nov-08 halfnneg2t halfnneg2
17-Nov-08 2halvest  2halves
17-Nov-08 halfaddsubt halfaddsub
17-Nov-08 lt2halvest lt2halves
17-Nov-08 avglet    avgle
17-Nov-08 rpret     rpre
17-Nov-08 rpcnt     rpcn
17-Nov-08 rpgt0t    rpgt0
17-Nov-08 rpge0t    rpge0
17-Nov-08 rpregt0t  rpregt0
17-Nov-08 rpne0t    rpne0
17-Nov-08 rprene0t  rprene0
17-Nov-08 rpcnne0t  rpcnne0
17-Nov-08 rpaddclt  rpaddcl
17-Nov-08 rpmulclt  rpmulcl
17-Nov-08 rpdivclt  rpdivcl
17-Nov-08 rerpdivclt rerpdivcl
17-Nov-08 rpnegt    rpneg
17-Nov-08 nnreclt   nnrecl
17-Nov-08 nnnn0t    nnnn0
17-Nov-08 nn0ret    nn0re
17-Nov-08 nn0cnt    nn0cn
17-Nov-08 nn0ge0t   nn0ge0
17-Nov-08 nn0le0eq0t nn0le0eq0
17-Nov-08 nn0addclt nn0addcl
17-Nov-08 nn0mulclt nn0mulcl
17-Nov-08 nnnn0addclt nnnn0addcl
17-Nov-08 nn0nnaddclt nn0nnaddcl
17-Nov-08 nn0ltp1let nn0ltp1le
17-Nov-08 nn0leltp1t nn0leltp1
17-Nov-08 nn0ltlem1t nn0ltlem1
17-Nov-08 nn0addge1t nn0addge1
17-Nov-08 nn0addge2t nn0addge2
17-Nov-08 zret      zre
17-Nov-08 zcnt      zcn
17-Nov-08 nnzt      nnz
17-Nov-08 nn0zt     nn0z
17-Nov-08 znnnlt1t  znnnlt1
17-Nov-08 nn0subt   nn0sub
17-Nov-08 nn0sub2t  nn0sub2
17-Nov-08 znegclt   znegcl
17-Nov-08 zaddclt   zaddcl
17-Nov-08 zsubclt   zsubcl
17-Nov-08 zrevaddclt zrevaddcl
17-Nov-08 nn0p1nnt  nn0p1nn
17-Nov-08 nnm1nn0t  nnm1nn0
17-Nov-08 znnsubt   znnsub
17-Nov-08 znn0subt  znn0sub
17-Nov-08 znn0sub2t znn0sub2
17-Nov-08 zmulclt   zmulcl
17-Nov-08 zltp1let  zltp1le
17-Nov-08 zleltp1t  zleltp1
17-Nov-08 zlem1ltt  zlem1lt
17-Nov-08 zltlem1t  zltlem1
17-Nov-08 nn0lem1ltt nn0lem1lt
17-Nov-08 nnlem1ltt nnlem1lt
17-Nov-08 nnltlem1t nnltlem1
17-Nov-08 zdivt     zdiv
17-Nov-08 zdivaddt  zdivadd
17-Nov-08 zdivmult  zdivmul
17-Nov-08 z2get     z2ge
17-Nov-08 zextlet   zextle
17-Nov-08 zextltt   zextlt
17-Nov-08 recnzt    recnz
17-Nov-08 btwnnzt   btwnnz
17-Nov-08 gtndivt   gtndiv
17-Nov-08 primet    prime
17-Nov-08 nneot     nneo
17-Nov-08 zeot      zeo
17-Nov-08 qret      qre
17-Nov-08 zqt       zq
17-Nov-08 nnqt      nnq
17-Nov-08 qcnt      qcn
17-Nov-08 qaddclt   qaddcl
17-Nov-08 qnegclt   qnegcl
17-Nov-08 qmulclt   qmulcl
17-Nov-08 qsubclt   qsubcl
17-Nov-08 qrecclt   qreccl
17-Nov-08 qdivclt   qdivcl
17-Nov-08 qrevaddclt qrevaddcl
17-Nov-08 nnrecqt   nnrecq
17-Nov-08 irraddt   irradd
17-Nov-08 irrmult   irrmul
17-Nov-08 flvalt    flval
17-Nov-08 flclt     flcl
17-Nov-08 flreclt   flrecl
17-Nov-08 flleltt   fllelt
17-Nov-08 fllet     flle
17-Nov-08 flltp1t   flltp1
17-Nov-08 fraclt1t  fraclt1
17-Nov-08 fracge0t  fracge0
17-Nov-08 flget     flge
17-Nov-08 flltt     fllt
17-Nov-08 flidt     flid
17-Nov-08 flidmt    flidm
17-Nov-08 flidzt    flidz
17-Nov-08 flwordit  flwordi
17-Nov-08 flval2t   flval2
17-Nov-08 flval3t   flval3
17-Nov-08 flbit     flbi
17-Nov-08 flbi2t    flbi2
17-Nov-08 flge0nn0t flge0nn0
17-Nov-08 flge1nnt  flge1nn
17-Nov-08 fladdzt   fladdz
17-Nov-08 btwnzge0t btwnzge0
17-Nov-08 flhalft   flhalf
17-Nov-08 ceiclt    ceicl
17-Nov-08 ceiget    ceige
17-Nov-08 ceim1lt   ceim1l
17-Nov-08 ceilet    ceile
17-Nov-08 fldivt    fldiv
17-Nov-08 fldiv2t   fldiv2
17-Nov-08 modvalt   modval
17-Nov-08 modclt    modcl
17-Nov-08 modge0t   modge0
17-Nov-08 modltt    modlt
17-Nov-08 modfract  modfrac
17-Nov-08 flmodt    flmod
17-Nov-08 modcyct   modcyc
17-Nov-08 modcyc2t  modcyc2
17-Nov-08 modadd1t  modadd1
17-Nov-08 modmul1t  modmul1
17-Nov-08 moddit    moddi
17-Nov-08 modirrt   modirr
17-Nov-08 ioovalt   iooval
17-Nov-08 iooval2t  iooval2
17-Nov-08 ioo0t     ioo0
17-Nov-08 ioon0t    ioon0
17-Nov-08 iooint    iooin
17-Nov-08 iocvalt   iocval
17-Nov-08 icovalt   icoval
17-Nov-08 iccvalt   iccval
17-Nov-08 elioo1t   elioo1
17-Nov-08 elioo2t   elioo2
17-Nov-08 elioc1t   elioc1
17-Nov-08 elico1t   elico1
17-Nov-08 elicc1t   elicc1
17-Nov-08 elioo5t   elioo5
17-Nov-08 eliooret  elioore
17-Nov-08 eliooxrt  eliooxr
17-Nov-08 eliooordt eliooord
17-Nov-08 elioc2t   elioc2
17-Nov-08 elico2t   elico2
17-Nov-08 elicc2t   elicc2
17-Nov-08 iooshft   iooshf
17-Nov-08 iccssret  iccssre
17-Nov-08 lbicc2t   lbicc2
17-Nov-08 ubicc2t   ubicc2
17-Nov-08 ioonegt   iooneg
17-Nov-08 iccnegt   iccneg
17-Nov-08 icoshft   icoshf
17-Nov-08 ioojoint  ioojoin
17-Nov-08 uzvalt    uzval
17-Nov-08 eluz1t    eluz1
17-Nov-08 eluz2t    eluz2
17-Nov-08 eluzt     eluz
17-Nov-08 uzidt     uzid
17-Nov-08 uznegit   uznegi
17-Nov-08 uz11t     uz11
17-Nov-08 eluzp1m1t eluzp1m1
17-Nov-08 eluzp1lt  eluzp1l
17-Nov-08 eluzp1p1t eluzp1p1
17-Nov-08 uzaddclt  uzaddcl
17-Nov-08 fzvalt    fzval
17-Nov-08 elfz1t    elfz1
17-Nov-08 elfzt     elfz
17-Nov-08 elfz2t    elfz2
17-Nov-08 elfz5t    elfz5
17-Nov-08 elfz4t    elfz4
17-Nov-08 eluzfzt   eluzfz
17-Nov-08 elfzuz3t  elfzuz3
17-Nov-08 elfzuz2t  elfzuz2
17-Nov-08 eluzfz1t  eluzfz1
17-Nov-08 elfzuzt   elfzuz
17-Nov-08 eluzfz2t  eluzfz2
17-Nov-08 elfz3t    elfz3
17-Nov-08 elfz1eqt  elfz1eq
17-Nov-08 fznt      fzn
17-Nov-08 elfznnt   elfznn
17-Nov-08 elfz2nn0t elfz2nn0
17-Nov-08 elfznn0t  elfznn0
17-Nov-08 elfz3nn0t elfz3nn0
17-Nov-08 fznn0subt fznn0sub
17-Nov-08 fznn0sub2t fznn0sub2
17-Nov-08 fzaddelt  fzaddel
17-Nov-08 fzsubelt  fzsubel
17-Nov-08 fzoptht   fzopth
17-Nov-08 fzss1t    fzss1
17-Nov-08 fzss2t    fzss2
17-Nov-08 fzssuzt   fzssuz
17-Nov-08 fzssp1t   fzssp1
17-Nov-08 fzp1sst   fzp1ss
17-Nov-08 fzelp1t   fzelp1
17-Nov-08 fzrevt    fzrev
17-Nov-08 fzrev2t   fzrev2
17-Nov-08 fzrev2it  fzrev2i
17-Nov-08 fzrev3t   fzrev3
17-Nov-08 fzrev3it  fzrev3i
17-Nov-08 fznn0t    fznn0
17-Nov-08 fz1sbct   fz1sbc
17-Nov-08 fzneuzt   fzneuz
17-Nov-08 fzrevralt fzrevral
17-Nov-08 fzrevral2t fzrevral2
17-Nov-08 fzrevral3t fzrevral3
17-Nov-08 fzshftralt fzshftral
17-Nov-08 ser1ft    ser1f
17-Nov-08 limsupvalt limsupval
17-Nov-08 limsupclt limsupcl
17-Nov-08 expvalt   expval
17-Nov-08 exp0t     exp0
17-Nov-08 expnnvalt expnnval
17-Nov-08 exp1t     exp1
17-Nov-08 expp1t    expp1
17-Nov-08 nnexpclt  nnexpcl
17-Nov-08 nn0expclt nn0expcl
17-Nov-08 zexpclt   zexpcl
17-Nov-08 qexpclt   qexpcl
17-Nov-08 reexpclt  reexpcl
17-Nov-08 expclt    expcl
17-Nov-08 rpexpclt  rpexpcl
17-Nov-08 expm1t    expm1
17-Nov-08 1expt     1exp
17-Nov-08 expeq0t   expeq0
17-Nov-08 expne0t   expne0
17-Nov-08 expne0it  expne0i
17-Nov-08 expgt0t   expgt0
17-Nov-08 0expt     0exp
17-Nov-08 expge0t   expge0
17-Nov-08 expgt1t   expgt1
17-Nov-08 expge1t   expge1
17-Nov-08 mulexpt   mulexp
17-Nov-08 recexpt   recexp
17-Nov-08 expaddt   expadd
17-Nov-08 expmult   expmul
17-Nov-08 expsubt   expsub
17-Nov-08 divexpt   divexp
17-Nov-08 ltexp2at  ltexp2a
17-Nov-08 expcant   expcan
17-Nov-08 expordt   ltexp2
17-Nov-08 expwordit leexp2a
17-Nov-08 expord2t  ltexp2r
17-Nov-08 expword2it leexp2r
17-Nov-08 expmwordit leexp1a
17-Nov-08 exple1t   exple1
17-Nov-08 expubndt  expubnd
17-Nov-08 sqvalt    sqval
17-Nov-08 sqnegt    sqneg
17-Nov-08 sqclt     sqcl
17-Nov-08 sqmult    sqmul
17-Nov-08 sqeq0t    sqeq0
17-Nov-08 sqne0t    sqne0
17-Nov-08 resqclt   resqcl
17-Nov-08 sqgt0t    sqgt0
17-Nov-08 sq11t     sq11
17-Nov-08 lt2sqt    lt2sq
17-Nov-08 le2sqt    le2sq
17-Nov-08 le2sqit   le2sq2
17-Nov-08 sqge0t    sqge0
17-Nov-08 sqlecant  sqlecan
17-Nov-08 subsqt    subsq
17-Nov-08 subsq2t   subsq2
17-Nov-08 sqeqort   sqeqor
17-Nov-08 binom2t   binom2
17-Nov-08 sq01t     sq01
17-Nov-08 expnbndt  expnbnd
17-Nov-08 expnlbndt expnlbnd
17-Nov-08 expnlbnd2t expnlbnd2
17-Nov-08 nn0opth2t nn0opth2
17-Nov-08 sqrclt    sqrcl
17-Nov-08 sqrgt0t   sqrgt0
17-Nov-08 sqrge0t   sqrge0
17-Nov-08 sqrlet    sqrle
17-Nov-08 sqr00t    sqr00
17-Nov-08 rpsqrclt  rpsqrcl
17-Nov-08 sqrsqt    sqrsq
17-Nov-08 sqsqrt    sqsqr
17-Nov-08 crut      cru
17-Nov-08 revalt    reval
17-Nov-08 imvalt    imval
17-Nov-08 reclt     recl
17-Nov-08 imclt     imcl
17-Nov-08 replimt   replim
17-Nov-08 absvalt   absval
17-Nov-08 cjvalt    cjval
17-Nov-08 cjclt     cjcl
17-Nov-08 crret     crre
17-Nov-08 crimt     crim
17-Nov-08 imret     imre
17-Nov-08 reim0t    reim0
17-Nov-08 reim0bt   reim0b
17-Nov-08 rerebt    rereb
17-Nov-08 mulret    mulre
17-Nov-08 reret     rere
17-Nov-08 cjrebt    cjreb
17-Nov-08 cjmulrclt cjmulrcl
17-Nov-08 cjmulvalt cjmulval
17-Nov-08 cjmulge0t cjmulge0
17-Nov-08 renegt    reneg
17-Nov-08 readdt    readd
17-Nov-08 resubt    resub
17-Nov-08 imnegt    imneg
17-Nov-08 imaddt    imadd
17-Nov-08 imsubt    imsub
17-Nov-08 cjret     cjre
17-Nov-08 cjcjt     cjcj
17-Nov-08 cjaddt    cjadd
17-Nov-08 cjmult    cjmul
17-Nov-08 cjnegt    cjneg
17-Nov-08 addcjt    addcj
17-Nov-08 cjsubt    cjsub
17-Nov-08 cjexpt    cjexp
17-Nov-08 recjt     recj
17-Nov-08 imcjt     imcj
17-Nov-08 cjreimt   cjreim
17-Nov-08 cjreim2t  cjreim2
17-Nov-08 cj11t     cj11
17-Nov-08 cjne0t    cjne0
17-Nov-08 absnegt   absneg
17-Nov-08 absclt    abscl
17-Nov-08 abscjt    abscj
17-Nov-08 absvalsqt absvalsq
17-Nov-08 absvalsq2t absvalsq2
17-Nov-08 sqabsaddt sqabsadd
17-Nov-08 sqabssubt sqabssub
17-Nov-08 absval2t  absval2
17-Nov-08 abs00t    abs00
17-Nov-08 absge0t   absge0
17-Nov-08 absrpclt  absrpcl
17-Nov-08 absreimsqt absreimsq
17-Nov-08 absreimt  absreim
17-Nov-08 absmult   absmul
17-Nov-08 absdivt   absdiv
17-Nov-08 absidt    absid
17-Nov-08 absnidt   absnid
17-Nov-08 leabst    leabs
17-Nov-08 absort    absor
17-Nov-08 absret    absre
17-Nov-08 absresqt  absresq
17-Nov-08 absexpt   absexp
17-Nov-08 absrelet  absrele
17-Nov-08 absimlet  absimle
17-Nov-08 nn0absclt nn0abscl
17-Nov-08 absltt    abslt
17-Nov-08 abslet    absle
17-Nov-08 abssubne0t abssubne0
17-Nov-08 absdifltt absdiflt
17-Nov-08 absdiflet absdifle
17-Nov-08 lenegsqt  lenegsq
17-Nov-08 releabst  releabs
17-Nov-08 cjdivt    cjdiv
17-Nov-08 absidmt   absidm
17-Nov-08 absgt0t   absgt0
17-Nov-08 abssubt   abssub
17-Nov-08 abssubge0t abssubge0
17-Nov-08 abssuble0t abssuble0
17-Nov-08 absmaxt   absmax
17-Nov-08 abstrit   abstri
17-Nov-08 abs3dift  abs3dif
17-Nov-08 abs2dift  abs2dif
17-Nov-08 abs2difabst abs2difabs
17-Nov-08 recant    recan
17-Nov-08 abs3lemt  abs3lem
17-Nov-08 facnnt    facnn
17-Nov-08 facp1t    facp1
17-Nov-08 facnn2t   facnn2
17-Nov-08 facclt    faccl
17-Nov-08 facne0t   facne0
17-Nov-08 facdivt   facdiv
17-Nov-08 facndivt  facndiv
17-Nov-08 facwordit facwordi
17-Nov-08 facavgt   facavg
17-Nov-08 bcvalt    bcval
17-Nov-08 bcval2t   bcval2
17-Nov-08 bcval3t   bcval3
17-Nov-08 bcval4t   bcval4
17-Nov-08 bccmplt   bccmpl
17-Nov-08 bcn0t     bcn0
17-Nov-08 bcnnt     bcnn
17-Nov-08 bcnp11t   bcnp11
17-Nov-08 bcnp1nt   bcnp1n
17-Nov-08 bcpasc2t  bcpasc2
17-Nov-08 bcpasct   bcpasc
17-Nov-08 bccl2t    bccl2
17-Nov-08 bcclt     bccl
17-Nov-08 permnnt   permnn
17-Nov-08 fsumclt   fsumcl
17-Nov-08 fsum0clt  fsum0cl
17-Nov-08 fsumreclt fsumrecl
17-Nov-08 fsumsplit fsumspli
17-Nov-08 fsum0split fsum0spli
17-Nov-08 fsumshft  fsumshf
17-Nov-08 fsumconst fsumcons
17-Nov-08 clmi2at   clmi2a
17-Nov-08 caucvg3t  caucvg3
17-Nov-08 eftclt    eftcl
17-Nov-08 efvalt    efval
17-Nov-08 efclt     efcl
17-Nov-08 reefclt   reefcl
17-Nov-08 efcjt     efcj
17-Nov-08 efaddt    efadd
17-Nov-08 efcant    efcan
17-Nov-08 efne0t    efne0
17-Nov-08 efsubt    efsub
17-Nov-08 efexpt    efexp
17-Nov-08 efnn0valt efnn0val
17-Nov-08 reeftclt  reeftcl
17-Nov-08 eftlubclt eftlubcl
17-Nov-08 efgt0t    efgt0
17-Nov-08 reef11t   reef11
17-Nov-08 eflegeot  eflegeo
17-Nov-08 efm1legeot efm1legeo
17-Nov-08 sinvalt   sinval
17-Nov-08 cosvalt   cosval
17-Nov-08 sinclt    sincl
17-Nov-08 cosclt    coscl
17-Nov-08 resinvalt resinval
17-Nov-08 recosvalt recosval
17-Nov-08 resinclt  resincl
17-Nov-08 recosclt  recoscl
17-Nov-08 sinnegt   sinneg
17-Nov-08 cosnegt   cosneg
17-Nov-08 efivalt   efival
17-Nov-08 efmivalt  efmival
17-Nov-08 efeult    efeul
17-Nov-08 sinaddt   sinadd
17-Nov-08 cosaddt   cosadd
17-Nov-08 sinsubt   sinsub
17-Nov-08 cossubt   cossub
17-Nov-08 addsint   addsin
17-Nov-08 subsint   subsin
17-Nov-08 addcost   addcos
17-Nov-08 subcost   subcos
17-Nov-08 sincossqt sincossq
17-Nov-08 sin2tt    sin2t
17-Nov-08 cos2tt    cos2t
17-Nov-08 cos2tsint cos2tsin
17-Nov-08 sinbndt   sinbnd
17-Nov-08 cosbndt   cosbnd
17-Nov-08 absefit   absefi
17-Nov-08 abseft    absef
17-Nov-08 absefibt  absefib
17-Nov-08 cosh111t  cosh111
17-Nov-08 logclt    logcl
17-Nov-08 relogclt  relogcl
17-Nov-08 eflogt    eflog
17-Nov-08 reeflogt  reeflog
17-Nov-08 logeft    logef
17-Nov-08 relogeft  relogef
17-Nov-08 relogmult relogmul
17-Nov-08 relogdivt relogdiv
17-Nov-08 explogt   explog
17-Nov-08 reexplogt reexplog
17-Nov-08 relogexpt relogexp
17-Nov-08 logltbt   logltb
17-Nov-08 1p1times  1p1timesi
17-Nov-08 2climnn   2climnni
17-Nov-08 2climnn0  2climnn0i
17-Nov-08 2shft     2shfti
17-Nov-08 2times    2timesi
17-Nov-08 abs00     abs00i
17-Nov-08 abs1m     abs1mi
17-Nov-08 abs3dif   abs3difi
17-Nov-08 abscj     abscji
17-Nov-08 abscl     abscli
17-Nov-08 absdivz   absdivzi
17-Nov-08 absef01tlub absef01tlubi
17-Nov-08 absefm1le absefm1lei
17-Nov-08 absge0    absge0i
17-Nov-08 absgt0    absgt0i
17-Nov-08 absid     absidi
17-Nov-08 absle     abslei
17-Nov-08 abslt     abslti
17-Nov-08 absmul    absmuli
17-Nov-08 absneg    absnegi
17-Nov-08 absnid    absnidi
17-Nov-08 absor     absori
17-Nov-08 abspef01tlub abspef01tlubi
17-Nov-08 absre     absrei
17-Nov-08 abssub    abssubi
17-Nov-08 abstri    abstrii
17-Nov-08 absval2   absval2i
17-Nov-08 absvalsq  absvalsqi
17-Nov-08 absvalsq2 absvalsq2i
17-Nov-08 add12     add12i
17-Nov-08 add20     add20i
17-Nov-08 add23     add23i
17-Nov-08 add4      add4i
17-Nov-08 add42     add42i
17-Nov-08 addass    addassi
17-Nov-08 addcan    addcani
17-Nov-08 addcan2   addcan2i
17-Nov-08 addcj     addcji
17-Nov-08 addcl     addcli
17-Nov-08 addcom    addcomi
17-Nov-08 adddi     adddii
17-Nov-08 adddir    adddiri
17-Nov-08 addge0    addge0i
17-Nov-08 addgegt0  addgegt0i
17-Nov-08 addgt0    addgt0i
17-Nov-08 addgt0i   addgt0ii
17-Nov-08 addid1    addid1i
17-Nov-08 addid2    addid2i
17-Nov-08 addsub    addsubi
17-Nov-08 addsub4   addsub4i
17-Nov-08 addsubass addsubassi
17-Nov-08 bcpasc    bcpasci
17-Nov-08 bcpasc2   bcpasc2i
17-Nov-08 binom     binomi
17-Nov-08 binom1p   binom1pi
17-Nov-08 binom2    binom2i
17-Nov-08 binom2a   binom2ai
17-Nov-08 cau2      cau2i
17-Nov-08 cau3      cau3i
17-Nov-08 cau3i     cau3ii
17-Nov-08 cau3ir    cau3iri
17-Nov-08 cau4i     cau4ii
17-Nov-08 cau5      cau5i
17-Nov-08 cau5i     cau5ii
17-Nov-08 caubnd    caubndi
17-Nov-08 caucvg    caucvgi
17-Nov-08 caucvg2   caucvg2i
17-Nov-08 caucvg3   caucvg3i
17-Nov-08 caucvg3a  caucvg3ai
17-Nov-08 cauim     cauimi
17-Nov-08 caure     caurei
17-Nov-08 cbvsum    cbvsumi
17-Nov-08 cjadd     cjaddi
17-Nov-08 cjcj      cjcji
17-Nov-08 cjcl      cjcli
17-Nov-08 cjdiv     cjdivi
17-Nov-08 cjmul     cjmuli
17-Nov-08 cjmulge0  cjmulge0i
17-Nov-08 cjmulrcl  cjmulrcli
17-Nov-08 cjmulval  cjmulvali
17-Nov-08 cjneg     cjnegi
17-Nov-08 cjreb     cjrebi
17-Nov-08 clim2serz clim2serzi
17-Nov-08 clim2serzt clim2serzti
17-Nov-08 climabs   climabsi
17-Nov-08 climabs0  climabs0i
17-Nov-08 climadd   climaddi
17-Nov-08 climaddc  climaddci
17-Nov-08 climaddc1 climaddc1i
17-Nov-08 climaddc2 climaddc2i
17-Nov-08 climcau   climcaui
17-Nov-08 climcj    climcji
17-Nov-08 climcmp   climcmpi
17-Nov-08 climcmpc1 climcmpc1i
17-Nov-08 climconst climconsti
17-Nov-08 climeu    climeui
17-Nov-08 climfnrcl climfnrcli
17-Nov-08 climge0   climge0i
17-Nov-08 climim    climimi
17-Nov-08 climmul   climmuli
17-Nov-08 climmulc  climmulci
17-Nov-08 climmulc2 climmulc2i
17-Nov-08 climre    climrei
17-Nov-08 climrecl  climrecli
17-Nov-08 climres   climresi
17-Nov-08 climreu   climreui
17-Nov-08 climserzle climserzlei
17-Nov-08 climshft  climshfti
17-Nov-08 climshft2 climshft2i
17-Nov-08 climsqueeze climsqueezei
17-Nov-08 climsqueeze2 climsqueeze2i
17-Nov-08 climsub   climsubi
17-Nov-08 climsubc2 climsubc2i
17-Nov-08 climsup   climsupi
17-Nov-08 climub    climubi
17-Nov-08 climubi   climubii
17-Nov-08 climuni   climunii
17-Nov-08 climunii  climuniii
17-Nov-08 climuz0   climuz0i
17-Nov-08 clm0      clm0i
17-Nov-08 clm0i     clm0ii
17-Nov-08 clm0nns   clm0nnsi
17-Nov-08 clm1      clm1i
17-Nov-08 clm2      clm2i
17-Nov-08 clm3      clm3i
17-Nov-08 clm4      clm4i
17-Nov-08 clm4at    clm4ati
17-Nov-08 clm4f     clm4fi
17-Nov-08 clm4le    clm4lei
17-Nov-08 clmi1     clmi1i
17-Nov-08 clmi2     clmi2i
17-Nov-08 clmi2rp   clmi2rpi
17-Nov-08 clmnns    clmnnsi
17-Nov-08 cnegex    cnegexi
17-Nov-08 cosadd    cosaddi
17-Nov-08 crim      crimi
17-Nov-08 crmul     crmuli
17-Nov-08 crne0     crne0i
17-Nov-08 crre      crrei
17-Nov-08 crrecz    crreczi
17-Nov-08 cru       crui
17-Nov-08 cvg1      cvg1i
17-Nov-08 cvg1i     cvg1ii
17-Nov-08 cvg2      cvg2i
17-Nov-08 cvg3      cvg3i
17-Nov-08 cvganuz   cvganuzi
17-Nov-08 cvgcmp    cvgcmpi
17-Nov-08 cvgcmp2   cvgcmp2i
17-Nov-08 cvgcmp2c  cvgcmp2ci
17-Nov-08 cvgcmp3c  cvgcmp3ci
17-Nov-08 cvgcmp3ce cvgcmp3cei
17-Nov-08 cvgcmp3cet cvgcmp3ceti
17-Nov-08 cvgcmpub  cvgcmpubi
17-Nov-08 cvgrat    cvgrati
17-Nov-08 dfef2     dfef2i
17-Nov-08 dfuz      dfuzi
17-Nov-08 div0      div0i
17-Nov-08 div1      div1i
17-Nov-08 div11     div11i
17-Nov-08 div23     div23i
17-Nov-08 divadddiv divadddivi
17-Nov-08 divass    divassi
17-Nov-08 divassz   divasszi
17-Nov-08 divcan1   divcan1i
17-Nov-08 divcan1z  divcan1zi
17-Nov-08 divcan2   divcan2i
17-Nov-08 divcan2z  divcan2zi
17-Nov-08 divcan3   divcan3i
17-Nov-08 divcan3z  divcan3zi
17-Nov-08 divcan4   divcan4i
17-Nov-08 divcan4z  divcan4zi
17-Nov-08 divcl     divcli
17-Nov-08 divclz    divclzi
17-Nov-08 divdir    divdiri
17-Nov-08 divdirz   divdirzi
17-Nov-08 divdiv23  divdiv23i
17-Nov-08 divdiv23z divdiv23zi
17-Nov-08 divdivdiv divdivdivi
17-Nov-08 divge0    divge0i
17-Nov-08 divgt0    divgt0i
17-Nov-08 divgt0i   divgt0ii
17-Nov-08 divgt0i2  divgt0i2i
17-Nov-08 divid     dividi
17-Nov-08 divmul    divmuli
17-Nov-08 divmul13  divmul13i
17-Nov-08 divmuldiv divmuldivi
17-Nov-08 divmulz   divmulzi
17-Nov-08 divne0    divne0i
17-Nov-08 divrec    divreci
17-Nov-08 divrecz   divreczi
17-Nov-08 divval    divvali
17-Nov-08 dsupivth  dsupivthi
17-Nov-08 ef01tlub  ef01tlubi
17-Nov-08 ef1tlub   ef1tlubi
17-Nov-08 ef4p      ef4pi
17-Nov-08 efadd     efaddi
17-Nov-08 efcj      efcji
17-Nov-08 effsumle  effsumlei
17-Nov-08 efge1     efge1i
17-Nov-08 efge1p    efge1pi
17-Nov-08 efgt0     efgt0i
17-Nov-08 efgt1     efgt1i
17-Nov-08 eflegeo   eflegeoi
17-Nov-08 eflt      eflti
17-Nov-08 efltb     efltbi
17-Nov-08 efm1legeo efm1legeoi
17-Nov-08 efm1lim   efm1limi
17-Nov-08 efsep     efsepi
17-Nov-08 eft0val   eft0vali
17-Nov-08 eftabs    eftabsi
17-Nov-08 eftlclt   eftlclti
17-Nov-08 eftlext   eftlexti
17-Nov-08 elcncf1d  elcncf1di
17-Nov-08 elcncf1i  elcncf1ii
17-Nov-08 elfzel2   elfzel2i
17-Nov-08 elrpi     elrpii
17-Nov-08 eluz1     eluz1i
17-Nov-08 eluzaddi  eluzaddii
17-Nov-08 eluzsubi  eluzsubii
17-Nov-08 eqle      eqlei
17-Nov-08 eqneg     eqnegi
17-Nov-08 expcnv    expcnvi
17-Nov-08 fnsmnt    fnsmnti
17-Nov-08 fseqsupub fseqsupubi
17-Nov-08 fsum1     fsum1i
17-Nov-08 fsum1f    fsum1fi
17-Nov-08 fsum2     fsum2i
17-Nov-08 fsum3     fsum3i
17-Nov-08 fsum4     fsum4i
17-Nov-08 fsump1    fsump1i
17-Nov-08 fsump1f   fsump1fi
17-Nov-08 fsumser0f fsumser0fi
17-Nov-08 fsumser1f fsumser1fi
17-Nov-08 fsumserz  fsumserzi
17-Nov-08 fsumserz2 fsumserz2i
17-Nov-08 fsumserzf fsumserzfi
17-Nov-08 fzelp1    fzelp1i
17-Nov-08 geoser    geoseri
17-Nov-08 geosum    geosumi
17-Nov-08 gt0ne0    gt0ne0i
17-Nov-08 gt0ne0i   gt0ne0ii
17-Nov-08 halfpos   halfposi
17-Nov-08 hbneg     hbnegi
17-Nov-08 hbnegd    hbnegdi
17-Nov-08 hbsum     hbsumi
17-Nov-08 hbsum1    hbsum1i
17-Nov-08 icoshftf1oi icoshftf1oii
17-Nov-08 imadd     imaddi
17-Nov-08 imcj      imcji
17-Nov-08 imcl      imcli
17-Nov-08 immul     immuli
17-Nov-08 imneg     imnegi
17-Nov-08 infcvg    infcvgi
17-Nov-08 infcvgaux1 infcvgaux1i
17-Nov-08 infcvgaux2 infcvgaux2i
17-Nov-08 ipcn      ipcni
17-Nov-08 iserzabs  iserzabsi
17-Nov-08 iserzcmp  iserzcmpi
17-Nov-08 iserzcmp0 iserzcmp0i
17-Nov-08 iserzex   iserzexi
17-Nov-08 iserzext  iserzexti
17-Nov-08 iserzgt0  iserzgt0i
17-Nov-08 iserzmulc1 iserzmulc1i
17-Nov-08 iserzshft iserzshfti
17-Nov-08 iserzshft2 iserzshft2i
17-Nov-08 isum0split isum0spliti
17-Nov-08 isum1clim isum1climi
17-Nov-08 isum1p    isum1pi
17-Nov-08 isumclim2t isumclim2ti
17-Nov-08 isumclim2tf isumclim2tfi
17-Nov-08 isumclim3t isumclim3ti
17-Nov-08 isumclim4t isumclim4ti
17-Nov-08 isumclim5t isumclim5ti
17-Nov-08 isumclimt isumclimti
17-Nov-08 isumclimtf isumclimtfi
17-Nov-08 isumclt   isumclti
17-Nov-08 isumcmpi  isumcmpii
17-Nov-08 isummulc1 isummulc1i
17-Nov-08 isummulc1ALT isummulc1iALT
17-Nov-08 isummulc1a isummulc1ai
17-Nov-08 isumnn0nn isumnn0nni
17-Nov-08 isumnn0nna isumnn0nnai
17-Nov-08 isumnul   isumnuli
17-Nov-08 isumreclt isumreclti
17-Nov-08 isumshft  isumshfti
17-Nov-08 isumshft2 isumshft2i
17-Nov-08 isumsplit isumspliti
17-Nov-08 isumval2t isumval2ti
17-Nov-08 isumvalt  isumvalti
17-Nov-08 isumvaltf isumvaltfi
17-Nov-08 isupivth  isupivthi
17-Nov-08 le2add    le2addi
17-Nov-08 le2msq    le2msqi
17-Nov-08 le2sq     le2sqi
17-Nov-08 le2tri3   le2tri3i
17-Nov-08 leabs     leabsi
17-Nov-08 leadd1    leadd1i
17-Nov-08 leadd2    leadd2i
17-Nov-08 lecase    lecasei
17-Nov-08 ledivp1   ledivp1i
17-Nov-08 leid      leidi
17-Nov-08 leloe     leloei
17-Nov-08 lelttr    lelttri
17-Nov-08 lelttrd   lelttrdi
17-Nov-08 lemul1    lemul1i
17-Nov-08 lemul2    lemul2i
17-Nov-08 leneg     lenegi
17-Nov-08 lenegcon1 lenegcon1i
17-Nov-08 lenlt     lenlti
17-Nov-08 lerec     lereci
17-Nov-08 lesub0    lesub0i
17-Nov-08 lesubadd  lesubaddi
17-Nov-08 lesubadd2 lesubadd2i
17-Nov-08 letr      letri
17-Nov-08 letrd     letrdi
17-Nov-08 letri     letrii
17-Nov-08 letri3    letri3i
17-Nov-08 lt2add    lt2addi
17-Nov-08 lt2msq    lt2msqi
17-Nov-08 lt2sq     lt2sqi
17-Nov-08 ltadd1    ltadd1i
17-Nov-08 ltadd2    ltadd2i
17-Nov-08 ltaddpos  ltaddposi
17-Nov-08 ltaddsub  ltaddsubi
17-Nov-08 ltdiv1    ltdiv1i
17-Nov-08 ltdiv1i   ltdiv1ii
17-Nov-08 ltdiv23   ltdiv23i
17-Nov-08 ltdiv23i  ltdiv23ii
17-Nov-08 ltdivp1   ltdivp1i
17-Nov-08 ltle      ltlei
17-Nov-08 ltlei     ltleii
17-Nov-08 ltlen     ltleni
17-Nov-08 ltletr    ltletri
17-Nov-08 ltletrd   ltletrdi
17-Nov-08 ltmul1    ltmul1i
17-Nov-08 ltmul1i   ltmul1ii
17-Nov-08 ltmul2    ltmul2i
17-Nov-08 ltmuldiv  ltmuldivi
17-Nov-08 ltne      ltnei
17-Nov-08 ltneg     ltnegi
17-Nov-08 ltnegcon1 ltnegcon1i
17-Nov-08 ltnegcon2 ltnegcon2i
17-Nov-08 ltnle     ltnlei
17-Nov-08 ltnr      ltnri
17-Nov-08 ltnsym    ltnsymi
17-Nov-08 ltp1      ltp1i
17-Nov-08 ltrec     ltreci
17-Nov-08 ltreci    ltrecii
17-Nov-08 ltsubadd  ltsubaddi
17-Nov-08 ltsubadd2 ltsubadd2i
17-Nov-08 lttr      lttri
17-Nov-08 lttrd     lttrdi
17-Nov-08 lttri2    lttri2i
17-Nov-08 lttri3    lttri3i
17-Nov-08 msq0      msq0i
17-Nov-08 msq11     msq11i
17-Nov-08 msqge0    msqge0i
17-Nov-08 msqgt0    msqgt0i
17-Nov-08 mul01     mul01i
17-Nov-08 mul02     mul02i
17-Nov-08 mul0or    mul0ori
17-Nov-08 mul12     mul12i
17-Nov-08 mul23     mul23i
17-Nov-08 mul2neg   mul2negi
17-Nov-08 mul4      mul4i
17-Nov-08 muladd    muladdi
17-Nov-08 mulass    mulassi
17-Nov-08 mulcan    mulcani
17-Nov-08 mulcant2  mulcant2i
17-Nov-08 mulcl     mulcli
17-Nov-08 mulcom    mulcomi
17-Nov-08 mulge0    mulge0i
17-Nov-08 mulgt0    mulgt0i
17-Nov-08 mulgt0i   mulgt0ii
17-Nov-08 mulid1    mulid1i
17-Nov-08 mulid2    mulid2i
17-Nov-08 mulm1     mulm1i
17-Nov-08 muln0     mulne0i
17-Nov-08 mulneg1   mulneg1i
17-Nov-08 mulneg2   mulneg2i
17-Nov-08 neg11     neg11i
17-Nov-08 negcl     negcli
17-Nov-08 negcon1   negcon1i
17-Nov-08 negcon2   negcon2i
17-Nov-08 negdi     negdii
17-Nov-08 negeu     negeui
17-Nov-08 negfcncf  negfcncfi
17-Nov-08 negid     negidi
17-Nov-08 negn0     negn0i
17-Nov-08 negne0    negne0i
17-Nov-08 negneg    negnegi
17-Nov-08 negreb    negrebi
17-Nov-08 negsub    negsubi
17-Nov-08 negsubdi  negsubdii
17-Nov-08 negsubdi2 negsubdi2i
17-Nov-08 nn0addcl  nn0addcli
17-Nov-08 nn0addge1 nn0addge1i
17-Nov-08 nn0addge2 nn0addge2i
17-Nov-08 nn0cn     nn0cni
17-Nov-08 nn0ge0    nn0ge0i
17-Nov-08 nn0le2msqt nn0le2msqti
17-Nov-08 nn0le2x   nn0le2xi
17-Nov-08 nn0lele2x nn0lele2xi
17-Nov-08 nn0mulcl  nn0mulcli
17-Nov-08 nn0opth   nn0opthi
17-Nov-08 nn0opth2  nn0opth2i
17-Nov-08 nn0re     nn0rei
17-Nov-08 nncn      nncni
17-Nov-08 nneo      nneoi
17-Nov-08 nnesq     nnesqi
17-Nov-08 nngt0     nngt0i
17-Nov-08 nnlesq    nnlesqi
17-Nov-08 nnne0     nnne0i
17-Nov-08 nnnn0     nnnn0i
17-Nov-08 nnre      nnrei
17-Nov-08 nnsqcl    nnsqcli
17-Nov-08 nnsub     nnsubi
17-Nov-08 om2uz0    om2uz0i
17-Nov-08 om2uzf1o  om2uzf1oi
17-Nov-08 om2uziso  om2uzisoi
17-Nov-08 om2uzlt   om2uzlti
17-Nov-08 om2uzlt2  om2uzlt2i
17-Nov-08 om2uzran  om2uzrani
17-Nov-08 om2uzsuc  om2uzsuci
17-Nov-08 om2uzuz   om2uzuzi
17-Nov-08 peano2zd  peano2zd
17-Nov-08 peano5nn  peano5nni
17-Nov-08 peano5uz  peano5uzi
17-Nov-08 peano5uzt peano5uzti
17-Nov-08 pm2.61ltle ltlecasei
17-Nov-08 pncan3    pncan3i
17-Nov-08 pnncan    pnncani
17-Nov-08 posdif    posdifi
17-Nov-08 posex     posexi
17-Nov-08 prodge0   prodge0i
17-Nov-08 prodgt0   prodgt0i
17-Nov-08 readd     readdi
17-Nov-08 readdcl   readdcli
17-Nov-08 rec11     rec11i
17-Nov-08 rec11i    rec11ii
17-Nov-08 reccl     reccli
17-Nov-08 recclz    recclzi
17-Nov-08 reccnv    reccnvi
17-Nov-08 receu     receui
17-Nov-08 recex     recexi
17-Nov-08 recgt0    recgt0i
17-Nov-08 recgt0i   recgt0ii
17-Nov-08 recid     recidi
17-Nov-08 recidz    recidzi
17-Nov-08 recj      recji
17-Nov-08 recl      recli
17-Nov-08 recn      recni
17-Nov-08 recnd     recndi
17-Nov-08 recne0z   recne0zi
17-Nov-08 recrec    recreci
17-Nov-08 recvalz   recvalzi
17-Nov-08 redivcl   redivcli
17-Nov-08 redivclz  redivclzi
17-Nov-08 reef11    reef11i
17-Nov-08 reefcl    reefcli
17-Nov-08 reeftlclt reeftlclti
17-Nov-08 reim0b    reim0bi
17-Nov-08 releabs   releabsi
17-Nov-08 remul     remuli
17-Nov-08 remulcl   remulcli
17-Nov-08 reneg     renegi
17-Nov-08 renegcl   renegcli
17-Nov-08 replim    replimi
17-Nov-08 rereb     rerebi
17-Nov-08 rereccl   rereccli
17-Nov-08 rerecclz  rerecclzi
17-Nov-08 resqcl    resqcli
17-Nov-08 resubcl   resubcli
17-Nov-08 reuunineg reuunineg
17-Nov-08 seq00     seq00i
17-Nov-08 seq01     seq01i
17-Nov-08 seq0fn    seq0fni
17-Nov-08 seq0fval  seq0fvali
17-Nov-08 seq0p1    seq0p1i
17-Nov-08 seq0seqz  seq0seqzi
17-Nov-08 seq0valt  seq0valti
17-Nov-08 seq11     seq11i
17-Nov-08 seq1bnd   seq1bndi
17-Nov-08 seq1cl    seq1cli
17-Nov-08 seq1cl2   seq1cl2i
17-Nov-08 seq1f     seq1fi
17-Nov-08 seq1f2    seq1f2i
17-Nov-08 seq1fn    seq1fni
17-Nov-08 seq1m1    seq1m1i
17-Nov-08 seq1p1    seq1p1i
17-Nov-08 seq1res   seq1resi
17-Nov-08 seq1rn    seq1rni
17-Nov-08 seq1rn2   seq1rn2i
17-Nov-08 seq1rval  seq1rvali
17-Nov-08 seq1seq0  seq1seq0i
17-Nov-08 seq1seq02t seq1seq02ti
17-Nov-08 seq1seq0t seq1seq0ti
17-Nov-08 seq1seqz  seq1seqzi
17-Nov-08 seq1shftid seq1shftidi
17-Nov-08 seq1ub    seq1ubi
17-Nov-08 seq1val   seq1vali
17-Nov-08 seq1val2  seq1val2i
17-Nov-08 seqz1     seqz1i
17-Nov-08 seqzcl    seqzcli
17-Nov-08 seqzeq    seqzeqi
17-Nov-08 seqzfn    seqzfni
17-Nov-08 seqzfval  seqzfvali
17-Nov-08 seqzfval2 seqzfval2i
17-Nov-08 seqzfveq  seqzfveqi
17-Nov-08 seqzm1    seqzm1i
17-Nov-08 seqzp1    seqzp1i
17-Nov-08 seqzres   seqzresi
17-Nov-08 seqzres2  seqzres2i
17-Nov-08 seqzresval seqzresvali
17-Nov-08 seqzrn    seqzrni
17-Nov-08 seqzrn2   seqzrn2i
17-Nov-08 seqzval2t seqzval2ti
17-Nov-08 seqzvalt  seqzvalti
17-Nov-08 ser00     ser00i
17-Nov-08 ser0cj    ser0cji
17-Nov-08 ser0cl1   ser0cl1i
17-Nov-08 ser0clt   ser0clti
17-Nov-08 ser0f     ser0fi
17-Nov-08 ser0mulc  ser0mulci
17-Nov-08 ser0p1    ser0p1i
17-Nov-08 ser11     ser11i
17-Nov-08 ser1absdif ser1absdifi
17-Nov-08 ser1add   ser1addi
17-Nov-08 ser1add2  ser1add2i
17-Nov-08 ser1cl1   ser1cl1i
17-Nov-08 ser1cl2   ser1cl2i
17-Nov-08 ser1clt   ser1clti
17-Nov-08 ser1cmp   ser1cmpi
17-Nov-08 ser1cmp0  ser1cmp0i
17-Nov-08 ser1cmp2  ser1cmp2i
17-Nov-08 ser1const ser1consti
17-Nov-08 ser1f     ser1fi
17-Nov-08 ser1f0    ser1f0i
17-Nov-08 ser1f2    ser1f2i
17-Nov-08 ser1mono  ser1monoi
17-Nov-08 ser1mulc  ser1mulci
17-Nov-08 ser1p1    ser1p1i
17-Nov-08 ser1recl  ser1recli
17-Nov-08 ser1ref   ser1refi
17-Nov-08 ser1ser0  ser1ser0i
17-Nov-08 serz1p    serz1pi
17-Nov-08 serzcj    serzcji
17-Nov-08 serzcl1   serzcl1i
17-Nov-08 serzcl2t  serzcl2ti
17-Nov-08 serzclt   serzclti
17-Nov-08 serzcmp   serzcmpi
17-Nov-08 serzcmp0  serzcmp0i
17-Nov-08 serzf0    serzf0i
17-Nov-08 serzfsum  serzfsumi
17-Nov-08 serzim    serzimi
17-Nov-08 serzmulc  serzmulci
17-Nov-08 serzmulc1 serzmulc1i
17-Nov-08 serzre    serzrei
17-Nov-08 serzreclt serzreclti
17-Nov-08 serzref   serzrefi
17-Nov-08 serzsplit serzspliti
17-Nov-08 shftcan1t shftcan1ti
17-Nov-08 shftcan2t shftcan2ti
17-Nov-08 shftf     shftfi
17-Nov-08 shftfn    shftfni
17-Nov-08 shftfval  shftfvali
17-Nov-08 shftidt   shftidti
17-Nov-08 shftres   shftresi
17-Nov-08 shftresvalt shftresvalti
17-Nov-08 shftval2t shftval2ti
17-Nov-08 shftval3t shftval3ti
17-Nov-08 shftval4t shftval4ti
17-Nov-08 shftval5t shftval5ti
17-Nov-08 shftvalt  shftvalti
17-Nov-08 sinadd    sinaddi
17-Nov-08 sq11      sq11i
17-Nov-08 sqabsadd  sqabsaddi
17-Nov-08 sqabssub  sqabssubi
17-Nov-08 sqcl      sqcli
17-Nov-08 sqdiv     sqdivi
17-Nov-08 sqeq0     sqeq0i
17-Nov-08 sqeqor    sqeqori
17-Nov-08 sqge0     sqge0i
17-Nov-08 sqgt0     sqgt0i
17-Nov-08 sqmul     sqmuli
17-Nov-08 sqr11     sqr11i
17-Nov-08 sqrcl     sqrcli
17-Nov-08 sqreci    sqrecii
17-Nov-08 sqrge0    sqrge0i
17-Nov-08 sqrgt0    sqrgt0i
17-Nov-08 sqrgt0i   sqrgt0ii
17-Nov-08 sqrle     sqrlei
17-Nov-08 sqrlt     sqrlti
17-Nov-08 sqrmsq    sqrmsqi
17-Nov-08 sqrmsq2   sqrmsq2i
17-Nov-08 sqrmul    sqrmuli
17-Nov-08 sqrmuli   sqrmulii
17-Nov-08 sqrsq     sqrsqi
17-Nov-08 sqrth     sqrthi
17-Nov-08 sqsqr     sqsqri
17-Nov-08 sqval     sqvali
17-Nov-08 subadd    subaddi
17-Nov-08 subadd2   subadd2i
17-Nov-08 subaddri  subaddrii
17-Nov-08 subcan    subcani
17-Nov-08 subcan2   subcan2i
17-Nov-08 subcl     subcli
17-Nov-08 subdi     subdii
17-Nov-08 subdir    subdiri
17-Nov-08 subeq0    subeq0i
17-Nov-08 subge0    subge0i
17-Nov-08 subid     subidi
17-Nov-08 subid1    subid1i
17-Nov-08 subneg    subnegi
17-Nov-08 subsq     subsqi
17-Nov-08 subsq0    subsq0i
17-Nov-08 subsub23  subsub23i
17-Nov-08 sumsqne0  sumsqne0i
17-Nov-08 sup3i     sup3ii
17-Nov-08 suprcli   suprclii
17-Nov-08 suprleubi suprleubii
17-Nov-08 suprlubi  suprlubii
17-Nov-08 suprnubi  suprnubii
17-Nov-08 suprubi   suprubii
17-Nov-08 times2    times2i
17-Nov-08 uzinfm    uzinfmi
17-Nov-08 uzrdgfnuz uzrdgfnuzi
17-Nov-08 uzrdgini  uzrdginii
17-Nov-08 uzrdginip1 uzrdginip1i
17-Nov-08 uzrdgsuc  uzrdgsuci
17-Nov-08 uzrdgval  uzrdgvali
17-Nov-08 zre       zrei
17-Nov-08 abs3lem   abs3lemi
17-Nov-08 abs2difabs abs2difabsi
17-Nov-08 abs2dif   abs2difi
17-Nov-08 2basgent  2basgen
17-Nov-08 basgent   basgen
17-Nov-08 basgen2t  basgen2
17-Nov-08 tgss3t    tgss3
17-Nov-08 tgss2t    tgss2
17-Nov-08 tgsst     tgss
17-Nov-08 tgtop11t  tgtop11
17-Nov-08 bastopt   bastop
17-Nov-08 bastop    bastop1
17-Nov-08 tgidmt    tgidm
17-Nov-08 eltop3t   eltop3
17-Nov-08 eltop2t   eltop2
17-Nov-08 eltopt    eltop
17-Nov-08 tgtopt    tgtop
17-Nov-08 topbast   topbas
17-Nov-08 eltg3t    eltg3
17-Nov-08 tgval3t   tgval3
17-Nov-08 tgclt     tgcl
17-Nov-08 unitgt    unitg
17-Nov-08 bastgt    bastg
17-Nov-08 tg2t      tg2
17-Nov-08 tg1t      tg1
17-Nov-08 eltg2t    eltg2
17-Nov-08 eltgt     eltg
17-Nov-08 tgval2t   tgval2
17-Nov-08 tgvalt    tgval
17-Nov-08 basis2t   basis2
17-Nov-08 basis1t   basis1
17-Nov-08 0opnt     0opn
17-Nov-08 inopnt    inopn
17-Nov-08 iunopnt   iunopn
17-Nov-08 uniopnt   uniopn
17-Nov-08 uniopn    uniopn2
17-Nov-08 entrt     entr
17-Nov-08 entr4     entr4i
17-Nov-08 entr3     entr3i
17-Nov-08 entr2     entr2i
17-Nov-08 entr      entri
17-Nov-08 entri     entric
17-Nov-08 rdglimt   rdglim
17-Nov-08 onelpsst  onelpss
17-Nov-08 rdgsuct   rdgsuc
17-Nov-08 on0eqelt  on0eqel
17-Nov-08 onelsst   onelss
17-Nov-08 onsst     onss
17-Nov-08 rdglim    rdglimi
17-Nov-08 rdgsuc    rdgsuci
17-Nov-08 nnon      nnoni
17-Nov-08 onsucss   onsucssi
17-Nov-08 onun      onun2i
17-Nov-08 onssel    onsseli
17-Nov-08 onuninsuc onuninsuci
17-Nov-08 onuniorsuc onuniorsuci
17-Nov-08 onunisuc  onunisuci
17-Nov-08 onsuc     onsuci
17-Nov-08 onelun    oneluni
17-Nov-08 onelin    onelini
17-Nov-08 onssneli2 onssnel2i
17-Nov-08 onelss    onelssi
17-Nov-08 onss      onssi
17-Nov-08 onel      oneli
17-Nov-08 onirr     onirri
17-Nov-08 ontrc     ontrci
17-Nov-08 onord     onordi
17-Nov-08 ---       ---         The *tr inferences were changed to *tri,
17-Nov-08 ---       ---         for consistency with *tr*d
17-Nov-08 bitr      bitri
17-Nov-08 bitr2     bitr2i
17-Nov-08 bitr3     bitr3i
17-Nov-08 bitr4     bitr4i
17-Nov-08 3bitr     3bitri
17-Nov-08 3bitrr    3bitrri
17-Nov-08 3bitr2    3bitr2i
17-Nov-08 3bitr3    3bitr3i
17-Nov-08 3bitr4    3bitr4i
17-Nov-08 3imtr3    3imtr3i
17-Nov-08 3imtr4    3imtr4i
17-Nov-08 eqtr      eqtri
17-Nov-08 eqtr2     eqtr2i
17-Nov-08 eqtr3     eqtr3i
17-Nov-08 eqtr4     eqtr4i
17-Nov-08 3eqtr     3eqtri
17-Nov-08 3eqtrr    3eqtrri
17-Nov-08 3eqtr2    3eqtr2i
17-Nov-08 3eqtr3    3eqtr3i
17-Nov-08 3eqtr4    3eqtr4i
17-Nov-08 eq2tr     eq2tri
17-Nov-08 eqeltr    eqeltri
17-Nov-08 eqeltrr   eqeltrri
17-Nov-08 eleqtr    eleqtri
17-Nov-08 eleqtrr   eleqtrri
17-Nov-08 eqsstr    eqsstri
17-Nov-08 eqsstr3   eqsstr3i
17-Nov-08 sseqtr    sseqtri
17-Nov-08 sseqtr4   sseqtr4i
17-Nov-08 3sstr3    3sstr3i
17-Nov-08 3sstr4    3sstr4i
17-Nov-08 eqbrtr    eqbrtri
17-Nov-08 eqbrtrr   eqbrtrri
17-Nov-08 breqtr    breqtri
17-Nov-08 breqtrr   breqtrri
17-Nov-08 3brtr3    3brtr3i
17-Nov-08 3brtr4    3brtr4i
16-Nov-08 opabsb    opelopabsb
14-Nov-08 zfext2    axext3
14-Nov-08 axext     axext2
14-Nov-08 nega      notnot2
14-Nov-08 negai     notnotri
14-Nov-08 negb      notnot1
14-Nov-08 negbi     notnoti
14-Nov-08 negbii    notbii
14-Nov-08 negbid    notbid
14-Nov-08 pm4.13    notnot
14-Nov-08 pm4.11    notbi
11-Nov-08 divmul3t  [--same--]  rearranged antecedent; renamed variables
11-Nov-08 divmul2t  [--same--]  rearranged antecedent; renamed variables
11-Nov-08 divmult   [--same--]  rearranged antecedent; renamed variables
11-Nov-08 elqsi     [--same--]  changed E. x ( x e. A /\ ...  to E. x e. A ...
11-Nov-08 elqs      [--same--]  changed E. x ( x e. A /\ ...  to E. x e. A ...
 8-Nov-08 indistop  [--same--]  eliminated hypothesis A e. _V
 8-Nov-08 pri2      prid2
 8-Nov-08 pri1      prid1
 7-Nov-08 qdivclt   [--same--]  antecedent changed to use triple conjunction
 6-Nov-08 rcfpfil   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem6 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem5 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem4 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem3 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem2 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 rcfpfillem1 [--same--] changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fisub     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 filint2   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 efilcp    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fgsb      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fipfil2   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 sppfi     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fiv       [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 df-fi     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 0fin     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 ficli     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fiiu      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 abfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fine      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 infi1     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 spfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fctop     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 subbas2   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 subbas    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 istps5    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 istps4    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 istop2g   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 isfinite  [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 pwfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 pwfilem   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 iunfi     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fofi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fodomfib  [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 fodomfi   [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 abfii5    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Nov-08 abfii4    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 isfinite1 [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 domfi     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 unifi     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 abfii1    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 abfii2    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
31-Sep-08 abfii3    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
10-Sep-08 isfinite2 [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 9-Sep-08 fisucdom  [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 7-Sep-08 ominf     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Sep-08 onfin     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Sep-08 pssinf    {--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 6-Sep-08 divsubdirt [--same--] changed hyp. order
 3-Sep-08 php3      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 2-Sep-08 fiint     [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
 1-Sep-08 prfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
30-Aug-08 unfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
29-Aug-08 snfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
29-Aug-08 ssnnfi    [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
29-Aug-08 ssfi      [--same--]  changed "E. ... e. _om ... ~~ ..." to "e. Fin"
24-Aug-08 mulcant   [--same--]  changed antecedent order; swapped var. names
24-Aug-08 mulcan2t  [--same--]  changed antecedent order; swapped var. names
24-Aug-08 mulcant2  [--same--]  changed hyp. order; swapped var. names
24-Aug-08 mulcan    [--same--]  changed hyp. order; swapped var. names
23-Aug-08 divcan4t  [--same--]  changed antecedent order; swapped var. names
23-Aug-08 divcan4z  [--same--]  changed hyp. order; swapped var. names
23-Aug-08 divcan3t  [--same--]  changed antecedent order; swapped var. names
23-Aug-08 divcan3z  [--same--]  changed hyp. order; swapped var. names
22-Aug-08 ssnn      ssnnfi
22-Aug-08 divcan4   [--same--]  changed hyp. order; swapped var. names
22-Aug-08 divcan3   [--same--]  changed hyp. order; swapped var. names
21-Aug-08 pm4.2i    biidd
21-Aug-08 divcan2t  [--same--]  changed antecedent order; swapped var. names
21-Aug-08 divcan2z  [--same--]  changed hyp. order; swapped var. names
20-Aug-08 divdirt   [--same--]  changed hyp. order
18-Aug-08 divcan2   [--same--]  changed hyp. order; swapped var. names
18-Aug-08 divcan1t  [--same--]  changed antecedent order; swapped var. names
18-Aug-08 divcan1z  [--same--]  changed hyp. order; swapped var. names
18-Aug-08 divcan1   [--same--]  changed hyp. order; swapped var. names
17-Aug-08 ltmuldiv2t [--same--] changed antecedent grouping
17-Aug-08 ltdivmult [--same--]  changed antecedent grouping
17-Aug-08 ledivmult [--same--]  changed antecedent grouping
17-Aug-08 ltdivmul2t [--same--] changed antecedent grouping
17-Aug-08 ledivmul2t [--same--] changed antecedent grouping
17-Aug-08 lemuldivt [--same--]  changed antecedent grouping
17-Aug-08 lemuldiv2t [--same--] changed antecedent grouping
16-Aug-08 ltmuldivt [--same--]  changed antecedent grouping
15-Aug-08 bii       dfbi1
15-Aug-08 biigb     dfbi1gb
15-Aug-08 bi        dfbi2
15-Aug-08 dfbi      dfbi3
14-Aug-08 lediv1t   [--same--]  changed antecedent grouping
14-Aug-08 ltdiv1t   [--same--]  changed antecedent grouping
10-Jul-08 expne0t   [--same--]  swapped biconditional
10-Jul-08 sq0t      sqeq0t
10-Jul-08 sq00      sqeq0
 7-Jul-08 syl3dan3  syld3an3
 7-Jul-08 syl3dan2  syld3an2
31-May-08 isnvi     [--same--]  eliminated hypotheses G e. V, S e. _V
31-May-08 isnvg     ---         obsolete; use isnv
31-May-08 isvcg     ---         obsolete; use isvc
31-May-08 ideq      [--same--]  eliminated hypothesis A e. _V
31-May-08 ideqg     [--same--]  eliminated first antecedent A e. C
28-May-08 opelxpex  ---         obsolete; use opelxp1
22-May-08 ax9a      ax9
22-May-08 ax9       ax9o
21-May-08 ax6-2     ax6
21-May-08 ax6-3     ax6o
21-May-08 ax-6      ax-6o
21-May-08 ax-5      ax-5o
17-May-08 ax-10     ax-10o
16-May-08 er2       dfer2
16-May-08 er2       dfer2
16-May-08 sb7       dfsb7
13-May-08 cla4e2v   cla42ev
13-May-08 cla4e2gv  cla42egv
12-May-08 a4w1      a4eiv
12-May-08 a4w       a4imev
12-May-08 a4c1      a4imed
12-May-08 a4c       a4ime
12-May-08 a4b1      a4v
12-May-08 a4b       a4imv
12-May-08 a4at      a4imt
12-May-08 a4a       a4im
11-May-08 sbea4     a4sbe
11-May-08 sbia4     a4sbim
11-May-08 sbba4     a4sbbi
 6-May-08 inf4      axinf2
 6-May-08 minfnre   mnfnre
27-Apr-08 sb6y      sb6f
27-Apr-08 sb5y      sb5f
17-Apr-08 sbn2      ---         obsolete; use sbn
17-Apr-08 sbn1      ---         obsolete; use sbn
 9-Apr-08 isvci     [--same--]  weakened hyp from G : ... to dom G = ...
 9-Apr-08 isabli    [--same--]  weakened hyp from G : ... to dom G = ...
 2-Apr-08 19.2      [--same--]  generalized to use 2 set variables
30-Mar-08 grprn     [--same--]  weakened hyp from G : ... to dom G = ...
11-Mar-08 absefimt  absefit
11-Mar-08 axcnre    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 cnegexlem2 [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 cnegext   [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 recextlem1 [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 recextlem2 [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 recext    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crulem    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 cru       [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crut      [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crne0     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crmul     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crrecz    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 creur     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 creui     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 rimul     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 df-re     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 df-im     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 revalt    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 imvalt    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 replimt   [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 df-cj     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 cjvalt    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 replim    [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crret     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crimt     [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crre      [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 crim      [--same--]  changed 'x. i' to 'i x.'
11-Mar-08 efit4pt   efi4pt      changed 'x. i' to 'i x.'
10-Mar-08 fabex     [--same--]  added 3rd hypothesis
 6-Mar-08 pm2.36    [--same--]  corrected to match Principia Mathematica
 6-Mar-08 pm2.37    [--same--]  corrected to match Principia Mathematica
 6-Mar-08 pm2.38    [--same--]  corrected to match Principia Mathematica
 2-Mar-08 csbiet    csbiegft
 2-Mar-08 csbie2g   csbie2t
 2-Mar-08 vsbcint   sbhyp
 2-Mar-08 cbvsbcv   cbvralsv
 1-Mar-08 sbcrex    sbcrexg
 1-Mar-08 sbcral    sbcralg
 1-Mar-08 19.23g    19.23t
 1-Mar-08 19.21g    19.21t
 1-Mar-08 minusex   negex
 1-Mar-08 negext    cnegext
 1-Mar-08 negex     cnegex
29-Feb-08 hbneq     hbne
29-Feb-08 hbne      hbn
29-Feb-08 csbiet    csbiegft
29-Feb-08 sbciet    sbciegft
29-Feb-08 elabt     elabgt
29-Feb-08 vtoclefg  vtoclegft
23-Feb-08 sqdif0    subsq0
23-Feb-08 binom2a   ---         obsolete; use subsq
12-Feb-08 cnhl      [--same--]  added hypothesis to assign vector space to var
 9-Feb-08 oneirr    onirr
 9-Feb-08 ordeirr   ordirr
 9-Feb-08 eirr      elirr
 9-Feb-08 eirrv     elirrv
29-Jan-08 oibabs    [--same--]  swapped sides of biconditional
24-Jan-08 cos2t     ---         obsolete; use cos2tt
20-Jan-08 ffvrni    ffvelrni
20-Jan-08 ffvrn     ffvelrn
20-Jan-08 fnfvrn    fnfvelrn
20-Jan-08 fvrn      fvelrn
20-Jan-08 fvelrn    fvelrnb
18-Jan-08 arch      [--same--]  changed x to n, changing $f hypothesis order
18-Jan-08 cos1lem4  8th4div3
18-Jan-08 eftlex    ---         obsolete; use eftlext
18-Jan-08 sin2t     ---         obsolete; use sin2tt
15-Jan-08 explt1t   expord2t
15-Jan-08 eft0vallem eft0val
15-Jan-08 effsumlelem ---       obsolete; use reeftclt
15-Jan-08 eftvallem eftval
15-Jan-08 efpartex  eftlex
15-Jan-08 efcltlem4 efseq0ex
15-Jan-08 efcltlem2a ef0lem
15-Jan-08 dfef2lem  dfef2
15-Jan-08 efcltlem3 efseq1ex
15-Jan-08 eftcltlem eftclt
15-Jan-08 eftabslem eftabs
12-Jan-08 rgen2xxx  rgen2a
12-Jan-08 rgen2a    rgen2
12-Jan-08 rgen2     rgen2xxx
12-Jan-08 cnbn      [--same--]  added hypothesis to assign vector space to var
12-Jan-08 cnph      [--same--]  added hypothesis to assign vector space to var
12-Jan-08 cnims     [--same--]  reorganized hypotheses and conclusion
14-Jan-08 rgen3     [--same--]  generalized for 3 different class variables
12-Jan-08 cnnv      [--same--]  added hypothesis to assign vector space to var
10-Jan-08 zneo      [--same--]  changed -. ... = to =/=
 3-Jan-08 ax7-467   ax467to7
 3-Jan-08 ax6-467   ax467to6
 3-Jan-08 ax4-467   ax467to4
 3-Jan-08 ax6-67    ax67to6
 3-Jan-08 ax7-67    ax67to7
 3-Jan-08 ax4-46    ax46to4
 3-Jan-08 ax5-46    ax46to5
29-Dec-07 eftvallem [--same--]  added hypothesis
22-Dec-07 zfnuleu   [--same--]  added $e hypothesis to remove ax-nul dependency
 8-Dec-07 supxrre2  [--same--]  changed -. ... = to =/=
23-Nov-07 sub4      addsub4
23-Nov-07 sub4t     addsub4t
17-Nov-07 climres   [--same--]  generalized antecedent from A e. CC to A e. B
12-Nov-07 climle    climcmp
11-Nov-07 eqneqi    necon3bii
11-Nov-07 eqneqd    necon3bid
10-Nov-07 ser0cj    [--same--]  weakened hypotheses
 9-Nov-07 ser1cj    ---         obsolete; derive from serzcj (as in ser0cj)
 9-Nov-07 ser0re    ---         obsolete; derive from serzre (as in ser0cj)
 9-Nov-07 ser1re    ---         obsolete; derive from serzre (as in ser0cj)
 8-Nov-07 mp3dan    mp3dan23
23-Oct-07 pm3.27bd  simprbi
23-Oct-07 pm3.26bd  simplbi
16-Oct-07 expbndt   expubndt
16-Oct-07 expge1t   [--same--]  strengthened from N e. NN to N e. NN0
12-Oct-07 kmlem15   [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem14   [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem13   [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem10   [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem9    [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem7    [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem5    [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem4    [--same--]  changed -. ... = to =/=
12-Oct-07 kmlem3    [--same--]  changed -. ... = to =/=
 5-Oct-07 1open     topopn
 5-Oct-07 1clsd     topcld
 3-Oct-07 intss3    ntrss3
 2-Oct-07 isopen3   isopn3
 2-Oct-07 isopen2   isopn2
 2-Oct-07 cmclsopen cmclsopn
 2-Oct-07 snclsd    sncld
 2-Oct-07 clsdlp    cldlp
 2-Oct-07 isclsd3   iscld3
 2-Oct-07 cmntrclsd cmntrcld
 2-Oct-07 clsclsd   clscld
 2-Oct-07 clsdcls   cldcls
 2-Oct-07 unclsd    uncld
 2-Oct-07 intclsd   intcld
 2-Oct-07 iinclsd   iincld
 2-Oct-07 0clsd     0cld
 2-Oct-07 openclsd  opncld
 2-Oct-07 clsdopen  cldopn
 2-Oct-07 clsdss    cldss
 2-Oct-07 isclsd2   iscld2
 2-Oct-07 isclsd    iscld
 2-Oct-07 clsdval   cldval
 2-Oct-07 df-clsd   df-cld
 2-Oct-07 isopn2    isopn4
28-Sep-07 ---       ---         changed math symbol from "floor" to "|_"
26-Sep-07 ser0cl    ser0cl1
26-Sep-07 ser1cl    ser1cl1
25-Sep-07 ser1re2   ser1re
25-Sep-07 ser1re    ser1ref
23-Sep-07 df-fac    [--same--]  swapped arguments of union
23-Sep-07 seqzrnx   seqzrn
23-Sep-07 seqzrn    seqzrn2
23-Sep-07 seqzrn2   seqzrnx
23-Sep-07 seq1rnx   seq1rn
23-Sep-07 seq1rn    seq1rn2
23-Sep-07 seq1rn2   seq1rnx
17-Sep-07 pm2.21nd  pm2.24d
17-Sep-07 pm2.21ni  pm2.24i
16-Sep-07 dvelimf2  dvelimfALT
 8-Sep-07 lemul2it  [--same--]  rearranged antecedent
 8-Sep-07 lemul1it  [--same--]  rearranged antecedent
 7-Sep-07 0vval     0vfval
 4-Sep-07 ---       ---         Many changes after df-ms, described in the
                                  4-Sep-2007 entry of
                                  us.metamath.org/mpeuni/mmnotes.txt
 4-Sep-07 elssab    ---         obsolete; use elssabg
 4-Sep-07 nvc       nvvc
 4-Sep-07 ---       ---         changed math symbol from "Met" to "MetSp"
 4-Sep-07 ---       ---         changed math symbol from "CMet" to "CMetSp"
25-Aug-07 fopabco   fopabcos
21-Aug-07 xrltnet   [--same--]  changed -. A = B to B =/= A; triple conjunction
21-Aug-07 lttri2    [--same--]  changed -. A = B to A =/= B
21-Aug-07 lttri2t   [--same--]  changed -. A = B to A =/= B
15-Aug-07 sbccsbg   sbccsb2g
11-Aug-07 recdivt   [--same--]  rearranged antecedent
 9-Aug-07 funopabex2g opabex2g
 9-Aug-07 funopabex2 opabex2
 9-Aug-07 funopabex opabex
 9-Aug-07 cnco      [--same--]  swapped 2nd & 3rd args in 1st triple conj
 6-Aug-07 ---       ---         changed "ncv" to "nv" in the labels of:
                                  cncv df-ncv ncvss ncvrel ncvop ncvvop
                                  isncvg isncvi ncvi ncvv ncvgcl
                                  ncvscl ncvf ncvcl ncvcli ncvdm ncvs
                                  ncvm1 ncvdif ncvpi ncvz0 ncvz ncvtri
                                  ncvabs ncvge0 cnncv cnncv0 elimncvu
                                  ncvnd phncv bnncv hlncv hilncv
 4-Aug-07 subval    ---         obsolete; use subvalt
31-Jul-07 divge0t   [--same--]  rearranged antecedent
31-Jul-07 divgt0t   [--same--]  rearranged antecedent
31-Jul-07 ltne      [--same--]  changed -. A = B to B =/= A
31-Jul-07 ltnet     [--same--]  changed -. A = B to B =/= A; triple conjunction
31-Jul-07 ltlen     [--same--]  changed -. A = B to B =/= A
31-Jul-07 ltlent    [--same--]  changed -. A = B to B =/= A
22-Jul-07 xrleltnet [--same--]  changed -. A = B to B =/= A
20-Jul-07 nngt1ne1t [--same--]  changed -. A = 1 to A =/= 1
18-Jul-07 leltnet   [--same--]  changed -. A = B to B =/= A
15-Ju1-07 zornx     zorn
15-Ju1-07 zorn      zorn2
15-Ju1-07 zorn2     zornx
18-Jun-07 caucvglem2 [--same--]  changed -. S = (/) to S =/= (/)
17-Jun-07 seq1ublem [--same--]  changed -. ... = (/) to =/= (/)
17-Jun-07 suppr     supexpr
17-Jun-07 ruclem33  [--same--]  changed -. ... = (/) to =/= (/)
16-Jun-07 ltrec1t   [--same--]  rearranged antecedent
15-Jun-07 lerec2t   [--same--]  rearranged antecedent
 3-Jun-07 nordeq    [--same--]  changed -. A = B to A =/= B
 3-Jun-07 xpsndisj  [--same--]  changed -. A = B to A =/= B
 2-Jun-07 peano3    [--same--]  changed -. A = (/) to A =/= (/)
 2-Jun-07 disjsn2   [--same--]  changed -. A = B to A =/= B
 2-Jun-07 fun2ssres [--same--]  antecedent changed to use triple conjunction
 2-Jun-07 onelpsst  [--same--]  changed -. A = B to A =/= B
 1-Jun-07 ordelssne [--same--]  changed -. A = B to A =/= B
 1-Jun-07 suprleubi [--same--]  changed -. A = (/) to A =/= (/)
31-May-07 suprnubi  [--same--]  changed -. A = (/) to A =/= (/)
30-Mar-07 onssmin   [--same--]  changed -. A = (/) to A =/= (/)
29-May-07 suprlub   [--same--]  changed -. A = (/) to A =/= (/)
29-May-07 funssfv   [--same--]  antecedent changed to use triple conjunction
29-May-07 limuni3   [--same--]  changed -. A = (/) to A =/= (/)
29-May-07 ordge1n0  [--same--]  changed -. A = (/) to A =/= (/)
28-May-07 onmindif2 [--same--]  changed -. A = (/) to A =/= (/)
28-May-07 suprleub  [--same--]  changed -. A = (/) to A =/= (/)
28-May-07 tz7.7     [--same--]  changed -. B = A to B =/= A
27-May-07 nnullss   [--same--]  changed -. ... = (/) to =/= (/)
27-May-07 supxrre2  [--same--]  changed -. A = (/) to A =/= (/)
27-May-07 fodomfib  [--same--]  changed -. A = (/) to A =/= (/)
26-May-07 supxrre1  [--same--]  changed -. A = (/) to A =/= (/)
24-May-07 supxrgtmnf [--same--]  changed -. A = (/) to A =/= (/)
23-May-07 ltmsqt    ---         obsolete; use msqgt0t
23-May-07 msqgt0    [--same--]  changed -. A = (/) to A =/= (/)
22-May-07 supxrbnd  [--same--]  changed -. A = (/) to A =/= (/)
21-May-07 suprnub   [--same--]  changed -. A = (/) to A =/= (/)
21-May-07 19.3r     ---         obsolete; use 19.3
21-May-07 19.9rv    ---         obsolete; use 19.9v
20-May-07 19.9r     ---         obsolete; use 19.9
17-May-07 iunn0     [--same--]  changed -. ... = (/) to =/= (/)
17-May-07 iinon     [--same--]  changed -. A = (/) to A =/= (/)
17-May-07 map0      [--same--]  changed -. B = (/) to B =/= (/)
16-May-07 infmrcl   [--same--]  changed -. A = (/) to A =/= (/)
16-May-07 suprub    [--same--]  changed -. A = (/) to A =/= (/)
16-May-07 suprcli   [--same--]  changed -. A = (/) to A =/= (/)
16-May-07 suprubi   [--same--]  changed -. A = (/) to A =/= (/)
16-May-07 suprlubi  [--same--]  changed -. A = (/) to A =/= (/)
14-May-07 sup3i     [--same--]  changed -. A = (/) to A =/= (/)
13-May-07 kmlemxx   kmlem8      changed -. ... = (/) to =/= (/)
13-May-07 kmlem8    kmlem9
13-May-07 kmlem9    kmlem10
13-May-07 kmlem10   kmlem11
13-May-07 kmlem11   kmlem12     changed -. ... = to =/=
13-May-07 kmlem12   kmlem13     changed -. ... = to =/=
13-May-07 kmlem13   kmlemxx
13-May-07 supxrre   [--same--]  changed -. A = (/) to A =/= (/)
13-May-07 infmsup   [--same--]  changed -. A = (/) to A =/= (/)
13-May-07 suprcl    [--same--]  changed -. A = (/) to A =/= (/)
12-May-07 kmlem1    [--same--]  changed -. ... = to =/=
12-May-07 kmlem3    [--same--]  changed -. ... = to =/=
12-May-07 kmlem6    [--same--]  changed -. ... = to =/=
12-May-07 kmlem7    [--same--]  changed -. ... = to =/=
11-May-07 infm3     [--same--]  changed -. A = (/) to A =/= (/)
11-May-07 sup3      [--same--]  changed -. A = (/) to A =/= (/)
10-May-07 oneqmin   [--same--]  changed -. B = (/) to B =/= (/)
10-May-07 infmssuzcl [--same--]  changed -. S = (/) to S =/= (/)
 5-May-07 xpexr2    [--same--]  changed -. ... = (/) to =/= (/)
 5-May-07 tz7.49c   [--same--]  changed -. ... = to =/=
 4-May-07 tz7.49    [--same--]  changed -. ... = to =/=
 4-May-07 funimass2 [--same--]  conjoined antecedents in hypothesis
 3-May-07 ac4c      [--same--]  changed -. x = (/) to x =/= (/)
30-Apr-07 aceq6b    [--same--]  changed -. z = (/) to z =/= (/)
30-Apr-07 disjpss   [--same--]  changed -. B = (/) to B =/= (/)
30-Apr-07 infxpidmlem10 [--same--]  changed -. g = (/) to g =/= (/)
30-Apr-07 1ne0      [--same--]  changed -. 1o = (/) to 1o =/= (/)
30-Apr-07 ac5b      [--same--]  changed -. x = (/) to x =/= (/)
30-Apr-07 aceq6a    [--same--]  changed -. z = (/) to z =/= (/)
30-Apr-07 on0eln0   [--same--]  changed -. A = (/) to A =/= (/)
28-Apr-07 tz7.2     [--same--]  changed -. B = A to B =/= A; triple conjunction
25-Apr-07 ac5       [--same--]  changed -. x = (/) to x =/= (/)
23-Apr-07 ac4       [--same--]  changed -. z = (/) to z =/= (/)
22-Apr-07 ac8       [--same--]  changed -. ... = to =/=
22-Apr-07 uzwo2     [--same--]  changed -. S = (/) to S =/= (/)
21-Apr-07 aceq5     [--same--]  changed -. ... = to =/=
21-Apr-07 epfrc     [--same--]  -. B = (/) to B =/= (/); triple conjunction
20-Apr-07 dfepfr    [--same--]  changed -. x = (/) to x =/= (/)
19-Apr-07 xpnz      [--same--]  changed -. ... = (/) to =/= (/)
18-Apr-07 ltexprlem1 [--same--]  changed -. C = (/) to C =/= (/)
17-Apr-07 uzwo      [--same--]  changed -. S = (/) to S =/= (/)
17-Apr-07 aceq4     [--same--]  changed -. z = (/) to z =/= (/)
17-Apr-07 prn0      [--same--]  changed -. A = (/) to A =/= (/)
15-Apr-07 elni      [--same--]  changed -. A = (/) to A =/= (/)
14-Apr-07 aceq3lem  [--same--]  changed -. z = (/) to z =/= (/)
14-Apr-07 aceq3     [--same--]  changed -. z = (/) to z =/= (/)
13-Apr-07 tpnz      [--same--]  changed -. ... = (/) to =/= (/)
13-Apr-07 0nep0     [--same--]  changed -. (/) = { (/) } to (/) =/= { (/) }
12-Apr-07 1cn       ax1cn
12-Apr-07 ax1re     1re
11-Apr-07 zfreg     [--same--]  changed -. A = (/) to A =/= (/)
11-Apr-07 zfreg2    [--same--]  changed -. A = (/) to A =/= (/)
11-Apr-07 inf1      [--same--]  changed -. x = (/) to x =/= (/)
11-Apr-07 inf2      [--same--]  changed -. x = (/) to x =/= (/)
11-Apr-07 zorn2lem6  [--same--]  changed -. H = (/) to H =/= (/)
11-Apr-07 zorn2lem5  [--same--]  changed -. H = (/) to H =/= (/)
11-Apr-07 zorn2lem3  [--same--]  changed -. D = (/) to D =/= (/)
11-Apr-07 zorn2lem2  [--same--]  changed -. D = (/) to D =/= (/)
11-Apr-07 zorn2lem1  [--same--]  changed -. D = (/) to D =/= (/)
11-Apr-07 inf3lem2  [--same--]  changed -. ... = to =/=
11-Apr-07 inf3lem3  [--same--]  changed -. ... = to =/=
11-Apr-07 inf3lem4  [--same--]  changed -. -. x = (/) to x =/= (/)
11-Apr-07 inf3lem5  [--same--]  changed -. -. x = (/) to x =/= (/)
11-Apr-07 inf3lem6  [--same--]  changed -. -. x = (/) to x =/= (/)
11-Apr-07 inf3lem7  [--same--]  changed -. -. x = (/) to x =/= (/)
11-Apr-07 inf3      [--same--]  changed -. -. x = (/) to x =/= (/)
10-Apr-07 htalem    [--same--]  changed -. A = (/) to A =/= (/)
 9-Apr-07 ac3       [--same--]  changed -. z = (/) to z =/= (/)
 9-Apr-07 rnxp      [--same--]  changed -. A = (/) to A =/= (/)
 7-Apr-07 aceq2     [--same--]  changed -. z = (/) to z =/= (/)
 6-Apr-07 tz6.12i   [--same--]  changed -. B = (/) to B =/= (/)
 6-Apr-07 scott0s   [--same--]  changed -. .. = (/) to =/= { (/) }
 6-Apr-07 dmxp      [--same--]  changed -. A = (/) to A =/= (/)
 6-Apr-07 nnsuc     [--same--]  changed -. A = (/) to A =/= (/)
 5-Apr-07 onne0     [--same--]  changed -. On = (/) to On =/= (/)
 5-Apr-07 ord0eln0  [--same--]  changed -. A = (/) to A =/= (/)
 5-Apr-07 wereu     [--same--]  -. B = (/) to B =/= (/); triple conjunction
 3-Apr-07 aceq5lem5 [--same--]  changed -. u = (/) to u =/= (/)
 3-Apr-07 aceq5lem4 [--same--]  changed -. u = (/) to u =/= (/)
 3-Apr-07 aceq5lem3 [--same--]  changed -. u = (/) to u =/= (/)
 3-Apr-07 aceq5lem2 [--same--]  changed -. u = (/) to u =/= (/)
 3-Apr-07 pssdifn0  [--same--]  changed -. ... = to =/=
 3-Apr-07 fri       [--same--]  changed -. ... = (/) to ... =/= (/)
 2-Apr-07 cplem1    [--same--]  changed -. ... = (/) to =/= (/)
 2-Apr-07 cplem2    [--same--]  changed -. ... = (/) to =/= (/)
 2-Apr-07 0pss      [--same--]  changed -. A = (/) to A =/= (/)
 2-Apr-07 inelcm    [--same--]  changed -. ... = (/) to =/= (/)
 2-Apr-07 snnz      [--same--]  changed -. A = (/) to A =/= (/)
 2-Apr-07 inf0      [--same--]  changed conclusion to match ax-inf exactly
 2-Apr-07 n0f       ---         obsolete; use n0f
26-Mar-07 df-lim    [--same--]  changed -. A = (/) to A =/= (/)
26-Mar-07 pwen      [--same--]  eliminated redundant hypotheses
26-Mar-07 ssundif   undif
23-Mar-07 fo2       dffo2
23-Mar-07 fofv      dffo3
22-Mar-07 fnbr      [--same--]  eliminated redundant hypotheses
22-Mar-07 fnop      [--same--]  eliminated redundant hypotheses
21-Mar-07 kardex    [--same--]  eliminated redundant hypothesis
21-Mar-07 qsid      [--same--]  eliminated redundant hypothesis
21-Mar-07 0nelqs    [--same--]  eliminated redundant hypothesis
21-Mar-07 brecop2   [--same--]  eliminated redundant hypothesis
21-Mar-07 ecelqsdm  [--same--]  eliminated redundant hypothesis
18-Mar-07 map0b     [--same--]  changed -. A = (/) to A =/= (/)
17-Mar-07 oninton   [--same--]  changed -. A = (/) to A =/= (/)
17-Mar-07 wefrc     [--same--]  -. B = (/) to B =/= (/); triple conjunction
17-Mar-07 onint     [--same--]  changed -. A = (/) to A =/= (/)
17-Mar-07 tz7.5     [--same--]  -. B = (/) to B =/= (/); triple conjunction
17-Mar-07 fiint     [--same--]  changed -. x = (/) to x =/= (/)
16-Mar-07 ishlg     [--same--]  changed hypothesis from X = dom N to X = ran G
16-Mar-07 unitopt   ---         obsolete; use topopn
16-Mar-07 peano3nn0 nn0p1nnt
15-Mar-07 intex     [--same--]  changed -. A = (/) to A =/= (/)
 4-Mar-07 opthreg   [--same--]  added converse:  ->  to  <->
15-Feb-07 qbtwnre   [--same--]  antecedent changed to use triple conjunction
13-Feb-07 rcla42ev  [--same--]  antecedent changed to use triple conjunction
10-Feb-07 fodomb    [--same--]  changed -. A = (/) to A =/= (/)
 7-Feb-07 rabbidv   [--same--]  conjoined antecedents in hypothesis
 5-Feb-07 equidALT  equid
 5-Feb-07 ax-11     ax-11o
 2-Feb-07 ax11a     ax11v
 1-Feb-07 frc       [--same--]  -. = (/) to =/= (/); conjoined antecedents
31-Jan-07 itimesi   ixi
31-Jan-07 isqm1     i2
30-Jan-07 dffr2     [--same--]  changed -. ... = (/) to ... =/= (/)
30-Jan-07 df-fr     [--same--]  changed -. ... = (/) to ... =/= (/)
30-Jan-07 f1oeng    [--same--]  conjoined antecedents
29-Jan-07 2sumeq2d  ---         obsolete; use 2sumeq2dv
29-Jan-07 sumeq12d  ---         obsolete; use sumeq12dv
29-Jan-07 sumeq12rd ---         obsolete; use sumeq12rdv
29-Jan-07 eval      [--same--]  ( 1 ^ k ) changed to 1
22-Jan-07 ax11el    [--same--]  generalized with less restrictive variables
18-Jan-07 climcvgc1 ---         obsolete; use clmi1
18-Jan-07 climcvg1  ---         obsolete; use clmi2
18-Jan-07 clim1     ---         obsolete; use clm2
18-Jan-07 clim1a    ---         obsolete; use clm3
18-Jan-07 clim2a    ---         obsolete; use clm2
18-Jan-07 clim2     ---         obsolete; use clm4
18-Jan-07 climcvg2  ---         obsolete; use clmi2
18-Jan-07 climcvg2z ---         obsolete; use clmi2
18-Jan-07 climcvgc2z ---        obsolete; use clmi1
18-Jan-07 climcvg2zb ---        obsolete; use clmi2
18-Jan-07 clim2az   ---         obsolete; use clm3
18-Jan-07 clim3az   ---         obsolete; use clm3
18-Jan-07 clim3a    ---         obsolete; use clm3
18-Jan-07 clim3     ---         obsolete; use clm4
18-Jan-07 clim3b    ---         obsolete; use clm2
18-Jan-07 climcvg3  ---         obsolete; use clmi2
18-Jan-07 climcvg3z ---         obsolete; use clmi2
18-Jan-07 clim4a    ---         obsolete; use clm3
18-Jan-07 clim4     ---         obsolete; use clm4
18-Jan-07 climcvg4  ---         obsolete; use clmi2
18-Jan-07 climcvgc4z ---        obsolete; use clmi1
18-Jan-07 climcvg4z ---         obsolete; use clmi2
18-Jan-07 clim0cvg4z ---        obsolete; use clm0i
18-Jan-07 climcvgc5z ---        obsolete; use clmi1
18-Jan-07 climcvg5z ---         obsolete; use clmi2
18-Jan-07 clim0cvg5z ---        obsolete; use clm0i
18-Jan-07 climnn0   ---         obsolete; use clm4
18-Jan-07 climnn    ---         obsolete; use clm4
18-Jan-07 clim0nn   ---         obsolete; use clm0
18-Jan-07 climcvgnn ---         obsolete; use clmi2
18-Jan-07 climcvgnn0 ---        obsolete; use clmi2
18-Jan-07 clim0cvgnn0 ---       obsolete; use clm0i
18-Jan-07 climcvg2nn0 ---       obsolete; use clmi2
18-Jan-07 clim0cvg2nn0 ---      obsolete; use clm0i
18-Jan-07 climnn0le ---         obsolete; use clm4le
18-Jan-07 clim0nn0le ---        obsolete; use clm4le and clm0
16-Jan-07 abn0      [--same--]  changed -. ... = (/) to ... =/= (/)
16-Jan-07 rabn0     [--same--]  changed -. ... = (/) to ... =/= (/)
16-Jan-07 nsuceq0   [--same--]  changed -. ... = (/) to ... =/= (/)
16-Jan-07 iin0      [--same--]  changed -. A = (/) to A =/= (/)
16-Jan-07 fint      [--same--]  changed -. B = (/) to B =/= (/)
14-Jan-07 clim3z    clm4at
12-Jan-07 climconst [--same--]  made M e. ZZ a hypothesis instead of antecedent
11-Jan-07 climres2  ---         obsolete; use climres
 4-Jan-07 iunconst  [--same--]  changed -. A = (/) to A =/= (/)
21-Dec-06 intssuni2 [--same--]  changed -. A = (/) to A =/= (/)
21-Dec-06 intssuni  [--same--]  changed -. A = (/) to A =/= (/)
21-Dec-06 prer2     preqr2
20-Dec-06 ccms      cnms
20-Dec-06 ccims     cnims
20-Dec-06 ccmsval   cnimsval
18-Dec-06 cvgannn   ---         obsolete; use cvganuz
18-Dec-06 cvgannn0  ---         obsolete; use cvganuz
14-Dec-06 cleqreli  eqrelriv
14-Dec-06 cleqrel   eqrel
12-Dec-06 rnco      rncoss
12-Dec-06 dmco      dmcoss
 5-Dec-06 r19.2z    [--same--]  -. A = (/) to A =/= (/); conjoined antecedents
24-Nov-06 infn0     [--same--]  changed -. A = (/) to A =/= (/)
24-Nov-06 0sdom     [--same--]  changed -. A = (/) to A =/= (/)
24-Nov-06 0sdomg    [--same--]  changed -. A = (/) to A =/= (/)
24-Nov-06 infxpabs  [--same--]  -. B = (/) to B =/= (/); use w3a for antec.
24-Nov-06 xpdom3    [--same--]  changed antecedent from -. B = (/) to B =/= (/)
14-Nov-06 zfnul     axnul
14-Nov-06 zfaus     axsep
28-Oct-06 inv       inv1
25-Oct-06 orcana    ---         obsolete; use pm5.6
10-Oct-06 oprec     [--same--]  changed order of $f hypotheses
10-Oct-06 ecoprdi   [--same--]  changed order of $f hypotheses
10-Oct-06 ecoprass  [--same--]  changed order of $f hypotheses
 9-Oct-06 unisseq   ---         obsolete; use unimax
 8-Oct-06 notzfaus  [--same--]  more meaningful first hypothesis
 8-Oct-06 intmin    [--same--]  swapped arguments of = sign
 8-Oct-06 intmin2   [--same--]  swapped arguments of = sign
 5-Oct-06 expcant   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 expsubt   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 divexpt   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 expwordit [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 explt1t   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 recexpt   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 expordt   [--same--]  generalized antecedent from e. NN to e. NN0
 5-Oct-06 iineq2dv  [--same--]  conjoined antecedents in hypothesis
 5-Oct-06 iuneq2dv  [--same--]  conjoined antecedents in hypothesis
 5-Oct-06 r19.9rzv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 r19.45zv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 r19.27zv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 r19.36zv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 iindif2   [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 r19.28zv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 5-Oct-06 r19.3rzv  [--same--]  changed antecedent from -. A = (/) to A =/= (/)
 2-Oct-06 phplem5   phplem4
 2-Oct-06 phplem4   phplem3
 2-Oct-06 phplem3   phplem2
 2-Oct-06 phplem2   phplem1
 2-Oct-06 phplem1   ---         obsolete; use difsnid
29-Sep-06 uniord    orduni
29-Sep-06 onunit    ssonuni
29-Sep-06 onuni     ssonunii
29-Sep-06 ac6s2     ac6s3
29-Sep-06 ac6c      ---         obsolete; use ac6s5
21-Sep-06 rankuni   rankuni2
20-Sep-06 npnz      [--same--]  strengthened by adding converse
20-Sep-06 onsucuni2 [--same--]  swapped arguments of = sign
19-Sep-06 nlimsuc   ---         obsolete; use nlimsucg
19-Sep-06 limuni2   limuni3
15-Sep-06 ranklon   rankval4
13-Sep-06 cbvop     rexxp
11-Sep-06 zfaus     zfauscl
10-Sep-06 fex       [--same--]  antecedent changed to use conjunction & swapped
10-Sep-06 f1dmex    [--same--]  antecedent changed to use conjunction & swapped
10-Sep-06 fnex      [--same--]  antecedent changed to use conjunction & swapped
10-Sep-06 ssexg     [--same--]  antecedent changed to use conjunction & swapped
10-Sep-06 funimaexg [--same--]  antecedent changed to use conjunction & swapped
10-Sep-06 resfunexg [--same--]  antecedent changed to use conjunction & swapped
 9-Sep-06 funex     [--same--]  antecedent changed to use conjunction & swapped
 8-Sep-06 cls       clsp
29-Aug-06 elab3g    elab3
26-Aug-06 unop      uniop
26-Aug-06 unpr      unipr
26-Aug-06 unictb    [--same--]  removed irrelevant hypothesis
16-Aug-06 ssrab     ssrab2
16-Aug-06 rabss     rabss2
16-Aug-06 ssab      ssab2
13-Aug-06 fvco3     [--same--]  antecedent changed to use triple conjunction
13-Aug-06 fvco2     [--same--]  antecedent changed to use triple conjunction
 6-Jun-06 sq0       sq00
 1-Jun-06 infpn     infpn2
27-May-06 ---       ---         exp was changed to ex to prevent matching
27-May-06 ---       ---           math token 'exp'.
27-May-06 exp       ex
26-May-06 f1ocnvfvb [--same--]  antecedent changed to use triple conjunction
22-Apr-06 fvco      [--same--]  antecedent changed to use triple conjunction
10-Apr-06 plus1let  p1let
10-Apr-06 leplus1t  lep1t
10-Apr-06 ltplus1   ltp1
10-Apr-06 ltplus1t  ltp1t
29-Mar-06 xpdom2    [--same--]  eliminated the A e. _V hypothesis
29-Mar-06 xpdom1    [--same--]  eliminated the A e. _V hypothesis
28-Mar-06 sspr      [--same--]  eliminated both $e hypotheses
26-Mar-06 fnfvop    fnopfvb
26-Mar-06 fnfvbr    fnbrfvb
26-Mar-06 eqri      eqriv
26-Mar-06 eqrd      eqrdv
26-Mar-06 nn0z      nn0zrab
26-Mar-06 nnz       nnzrab
24-Mar-06 fodomb    [--same--]  eliminated the B e. _V hypothesis
24-Mar-06 eldmg     eldm2g
22-Mar-06 prprc     prprc1
22-Mar-06 sqrsqet   sqrsqt
22-Mar-06 sqrsqe    sqrsq
22-Mar-06 sqrsq     sqrmsq2
21-Mar-06 nn0le2sqet nn0le2msqt
21-Mar-06 le2sqet   le2sqt
21-Mar-06 le2sqt    le2msqt
21-Mar-06 lt2sqet   lt2sqt
21-Mar-06 lt2sqt    lt2msqt
21-Mar-06 le2sqe    le2sq
21-Mar-06 le2sq     le2msq
21-Mar-06 lt2sqe    lt2sq
21-Mar-06 lt2sq     lt2msq
21-Mar-06 ltsqt     ltmsqt
13-Mar-06 sq11t     [--same--]  rearranged antecedent
11-Mar-06 sqrecl    resqcl
11-Mar-06 sqreclt   resqclt
11-Mar-06 ---       ---         'sq' is normal square (A ^ 2)
11-Mar-06 sqe0      sqeq0
11-Mar-06 sqe11     sq11
11-Mar-06 sqegt0    sqgt0
11-Mar-06 sqege0    sqge0
11-Mar-06 sqe11t    sq11t
11-Mar-06 sqege0t   sqge0t
11-Mar-06 ---       ---         'msq' is square represented by mult. (A x. A)
11-Mar-06 sqeq0      msq0
11-Mar-06 sqgt0     msqgt0
11-Mar-06 sqge0     msqge0
11-Mar-06 sq11      msq11
11-Mar-06 sqznn     msqznn
11-Mar-06 sqrsqid   sqrmsq
11-Mar-06 sqeq0      msq0
24-Feb-06 lerect    [--same--]  rearranged antecedent
24-Feb-06 ltrect    [--same--]  rearranged antecedent
24-Feb-06 lt2sqet   [--same--]  rearranged antecedent
24-Feb-06 le2sqet   [--same--]  rearranged antecedent
24-Feb-06 lt2sqt    [--same--]  rearranged antecedent
24-Feb-06 le2sqt    [--same--]  rearranged antecedent
20-Feb-06 funfvopi  funopfv
20-Feb-06 funopfv   funfvop
20-Feb-06 funfvop   funopfvb
 9-Feb-06 divneq0bt divne0bt
 9-Feb-06 divneq0   divne0
 9-Feb-06 recneq0z  recne0z
 9-Feb-06 pm2.61an2 pm2.61dan
 9-Feb-06 pm2.61an1 pm2.61ian
28-Jan-06 cleqfvf   eqfnfvf
26-Jan-06 fri       [--same--]  changed to closed theorem instead of inference
17-Jan-06 relin     relin1
17-Jan-06 ssrelqqq  relss
17-Jan-06 relss     ssrel
17-Jan-06 ssrel     ssrelqqq
16-Jan-06 elrnqqq   elrn2
16-Jan-06 elrn2     elrn
16-Jan-06 elrn      elrnqqq
12-Jan-06 df-ef     [--same--]  revised to use new df-sum
 9-Jan-06 rabeqbi2i rabeq2i
 9-Jan-06 abeqbi2   abeq2
 9-Jan-06 abeqbi1   abeq1
 9-Jan-06 abeqbi2i  abeq2i
 9-Jan-06 abeqbi1i  abeq1i
 9-Jan-06 abeqbi2d  abeq2d
 9-Jan-06 abbieq2i  abbi2i
 9-Jan-06 abbieqi   abbii
 9-Jan-06 abbieqd   abbid
 9-Jan-06 abbieqdv  abbidv
 9-Jan-06 abbieq2dv abbi2dv
 9-Jan-06 abbieq1dv abbi1dv
 9-Jan-06 rabbieqi  rabbii
 9-Jan-06 rabbieqdv rabbidv
 9-Jan-06 rabbieqsdv rabbisdv
 9-Jan-06 rabbieqrdv rabbirdv
 9-Jan-06 opabbieqd opabbid
 9-Jan-06 opabbieqdv opabbidv
 9-Jan-06 oprabbieqd oprabbid
 9-Jan-06 oprabbieqdv oprabbidv
 9-Jan-06 oprabbieqi oprabbii
 9-Jan-06 abeqbi2   abeq2
 9-Jan-06 abeqbi2i  abeq2i
 9-Jan-06 abeqbi1   abeq1
 9-Jan-06 abeqbi2d  abeq2d
 9-Jan-06 abeqbi1i  abeq1i
 9-Jan-06 rabeqbi2i rabeq2i
 9-Jan-06 oprabbieqi oprabbii
 7-Jan-06 divgt0lem divgt0i2
 5-Jan-06 lep1t  letrp1t
 4-Jan-06 nnegdift  ---         obsolete; use subge0t (swapped biconditional)
 2-Jan-06 opabbii.2 opabbii
 1-Jan-06 negdi2    negsubdi
 1-Jan-06 negdi2t   negsubdit
 1-Jan-06 negdi3    negsubdi2t
 1-Jan-06 negdi3t   negsubdi2t
17-Dec-05 msca      ---         obsolete; now embedded inside equs4 proof
16-Dec-05 1expt     [--same--]  antecedent extended from NN to NN0
16-Dec-05 nnexpclt  [--same--]  antecedent extended from NN to NN0
16-Dec-05 nn0expclt [--same--]  antecedent extended from NN to NN0
16-Dec-05 zexpclt   [--same--]  antecedent extended from NN to NN0
16-Dec-05 qexpclt   [--same--]  antecedent extended from NN to NN0
16-Dec-05 reexpclt  [--same--]  antecedent extended from NN to NN0
16-Dec-05 expclt    [--same--]  antecedent extended from NN to NN0
16-Dec-05 expcllem  [--same--]  antecedent extended from NN to NN0; + 3rd hyp.
16-Dec-05 expp1t    [--same--]  antecedent extended from NN to NN0
16-Dec-05 expvalt   expnnvalt
13-Dec-05 sbcco     sbccog
 1-Dec-05 subneg2t  subnegt
 1-Dec-05 subnegt   ---         obsolete; use negsubt (swapped equality)
 1-Dec-05 subneg    ---         obsolete; use negsub (swapped equality)
 1-Dec-05 reueq     reueq1
 1-Dec-05 rexeq     rexeq1
 1-Dec-05 raleq     raleq1
 1-Dec-05 reueqf    reueq1f
 1-Dec-05 rexeqf    rexeq1f
 1-Dec-05 raleqf    raleq1f
 1-Dec-05 ad2antxx  ad2antrr
 1-Dec-05 ad2antrr  ad2antll
 1-Dec-05 ad2antll  ad2antxx
29-Nov-05 sbcel2    sbcel2gv
29-Nov-05 sbcel1    sbcel1gv
28-Nov-05 sbcn      sbcng
28-Nov-05 sbcim     sbcimg
28-Nov-05 sbcbi     sbcbig
28-Nov-05 sbcor     sbcorg
28-Nov-05 sbcan     sbcang
28-Nov-05 sbcal     sbcalg
28-Nov-05 sbcex     sbcexg
28-Nov-05 sbceq1    sbceq1a
21-Nov-05 2o        2on
21-Nov-05 1o        1on
19-Nov-05 zfrep3    axrep5
19-Nov-05 zfrep2    axrep4
19-Nov-05 axrep     axrep2
18-Nov-05 hbsbcg    hbsbc1g
18-Nov-05 hbsbc     hbsbc1
18-Nov-05 hbsbcv    hbsbc1v
18-Nov-05 ---       ---         More changes to the bixx series below -
18-Nov-05 ---       ---         changed to xxbix to be analogous to the xxeqx
18-Nov-05 ---       ---         series e.g. uneq12d.  Also, the bi(r)abxx were
18-Nov-05 ---       ---         changed to (r)abbieqxx: "bi" in hyp. and
18-Nov-05 ---       ---         "eq" in conclusion.
18-Nov-05 bial      albii
18-Nov-05 bi2al     2albii
18-Nov-05 biex      exbii
18-Nov-05 bi2ex     2exbii
18-Nov-05 bi3ex     3exbi
18-Nov-05 biald     albid
18-Nov-05 biexd     exbid
18-Nov-05 bisb      sbbii
18-Nov-05 bisbd     sbbid
18-Nov-05 bialdv    albidv
18-Nov-05 biexdv    exbidv
18-Nov-05 bi2aldv   2albidv
18-Nov-05 bi2exdv   2exbidv
18-Nov-05 bi3exdv   3exbidv
18-Nov-05 bi4exdv   4exbidv
18-Nov-05 bieud     eubid
18-Nov-05 bieudv    eubidv
18-Nov-05 bieu      eubii
18-Nov-05 bimod     mobid
18-Nov-05 bimo      mobii
18-Nov-05 biralda   ralbida
18-Nov-05 birexda   rexbida
18-Nov-05 biraldva  ralbidva
18-Nov-05 birexdva  rexbidva
18-Nov-05 birald    ralbid
18-Nov-05 birexd    rexbid
18-Nov-05 biraldv   ralbidv
18-Nov-05 birexdv   rexbidv
18-Nov-05 biraldv2  ralbidv2
18-Nov-05 birexdv2  rexbidv2
18-Nov-05 biral     ralbii
18-Nov-05 birex     rexbii
18-Nov-05 bi2ral    2ralbii
18-Nov-05 bi2rex    2rexbii
18-Nov-05 biral2    ralbii2
18-Nov-05 birex2    rexbii2
18-Nov-05 birala    ralbiia
18-Nov-05 birexa    rexbiia
18-Nov-05 bi2rexa   2rexbiia
18-Nov-05 bi2ralda  2ralbida
18-Nov-05 bi2raldva 2ralbidva
18-Nov-05 bi2rexdva 2rexbidva
18-Nov-05 bireudva  reubidva
18-Nov-05 bireudv   reubidv
18-Nov-05 bireua    reubiia
18-Nov-05 bireu     reubii
18-Nov-05 bisbcdv   sbcbidv
18-Nov-05 bisbc     sbcbii
18-Nov-05 eqrabi    rabeqbi2i
18-Nov-05 eqab      abeqbi2
18-Nov-05 eqabr     abeqbi1
18-Nov-05 eqabi     abeqbi2i
18-Nov-05 eqabri    abeqbi1i
18-Nov-05 eqabd     abeqbi2d
18-Nov-05 biabri    abbieq2i
18-Nov-05 biabi     abbieqi
18-Nov-05 biabd     abbieqd
18-Nov-05 biabdv    abbieqdv
18-Nov-05 biabrdv   abbieq2dv
18-Nov-05 biabldv   abbieq1dv
18-Nov-05 birabi    rabbieqi
18-Nov-05 birabdv   rabbieqdv
18-Nov-05 birabsdv  rabbieqsdv
18-Nov-05 birabrdv  rabbieqrdv
18-Nov-05 biopabd   opabbieqd
18-Nov-05 biopabdv  opabbieqdv
18-Nov-05 bioprabd  oprabbieqd
18-Nov-05 bioprabdv oprabbieqdv
18-Nov-05 bioprabi  oprabbieqi
18-Nov-05 bicon1i   con1bii
18-Nov-05 bicon2i   con2bii
18-Nov-05 bicon4i   con4bii
18-Nov-05 bicon4d   con4bid
18-Nov-05 bicon2    con2bi
18-Nov-05 bicon2d   con2bid
18-Nov-05 bicon1d   con1bid
18-Nov-05 bisyl7    syl7ib
18-Nov-05 bisyl8    syl8ib
11-Nov-05 sbcbidv   [--same--]  swapped antecedents
21-Oct-05 ciin      [--same--]  "|^|" changed to "|^|_"
21-Oct-05 cuin      [--same--]  "U." changed to "U_"
21-Oct-05 ---SYMBOL CHANGE----  Changed "|^|" to "|^|_" in thm's using ciin
21-Oct-05 ---SYMBOL CHANGE----  Changed "U." to "U_" in thm's using ciun
20-Oct-05 rax5      ra5
20-Oct-05 rax4      ---         obsolete; use ra4sbc
20-Oct-05 reuuni2f  [--same--]  weakened its hypotheses
19-Oct-05 reuss     [--same--]  antecedent changed to use triple conjunction
10-Oct-05 uzwo      [--same--]  changed to use ZZ>= notation
10-Oct-05 uzwo2     [--same--]  changed to use ZZ>= notation
 1-Oct-05 nnncant   nnncan1t
13-Sep-05 leltnet   [--same--]  antecedent changed to use triple conjunction
10-Sep-05 ifel      ifcl
 6-Sep-05 dmopab2   dmopab3
 5-Sep-05 peano2uz  peano2uz2
 1-Sep-05 cleqfv    eqfnfv
 1-Sep-05 df-seq    df-seq1
 1-Sep-05 cseqz     cseq1
 1-Sep-05 serft     ser1ft
 1-Sep-05 serf      ser1f
 1-Sep-05 sercl     ser1cl
 1-Sep-05 serrecl   ser1recl
 1-Sep-05 serre     ser1re
 1-Sep-05 sercl2    ser1cl2
 1-Sep-05 serf2     ser1f2
 1-Sep-05 ser12     ser11
 1-Sep-05 sersuc2   ser1p1
 1-Sep-05 sermono   ser1mono
 1-Sep-05 seradd2   ser1add2
 1-Sep-05 seradd    ser1add
 1-Sep-05 serdir    ser1dir
 1-Sep-05 serabsdiflem ser1absdiflem
 1-Sep-05 serabsdif ser1absdif
 1-Sep-05 serre2    ser1re2
 1-Sep-05 sercj     ser1cj
 1-Sep-05 serconst  ser1const
 1-Sep-05 sertrunclem ser1trunclem
 1-Sep-05 sercmp    ser1cmp
 1-Sep-05 sercmp0   ser1cmp0
 1-Sep-05 sercmp2lem ser1cmp2lem
 1-Sep-05 sercmp2   ser1cmp2
 1-Sep-05 seqlem1   seq1lem1
 1-Sep-05 seqlem2   seq1lem2
 1-Sep-05 seqrval   seq1rval
 1-Sep-05 seqval    seq1val
 1-Sep-05 seqfnlem  seq1fnlem
 1-Sep-05 seqval2   seq1val2
 1-Sep-05 seq1lem   seq11lem
 1-Sep-05 seqsuclem seq1suclem
 1-Sep-05 seqp1     seq1p1
 1-Sep-05 seqm1     seq1m1
 1-Sep-05 seqfn     seq1fn
 1-Sep-05 seqrn     seq1rn2
 1-Sep-05 seqrn2    seq1rn
 1-Sep-05 seqcl     seq1cl
 1-Sep-05 seqres    seq1res
 1-Sep-05 seqbnd    seq1bnd
 1-Sep-05 sequblem  seq1ublem
 1-Sep-05 sequb     seq1ub
 1-Sep-05 seqhcau   seq1hcau
 1-Sep-05 ---SYMBOL CHANGE----  Changed math symbol 'seq' to 'seq1'
 1-Sep-05 seq1      seq11       Warning: do _before_ the symbol change above
17-Aug-05 df-clim   [--same--]  The old df-clim, df-shft, and df-seq0, and
17-Aug-05 df-shft   [--same--]      all derived theorems, have been scrapped
17-Aug-05 df-seq0   [--same--]      or rederived from the new definitions.
30-Jul-05 ---       ---         syl* changes below were sugg'ed by Scott Fenton
30-Jul-05 syl34d    imim12d
30-Jul-05 syl4d     imim1d
30-Jul-05 syl3d     imim2d
30-Jul-05 syl34     imim112i
30-Jul-05 syl4      imim1i
30-Jul-05 syl3      imim2i
30-Jul-05 syl2      imim1
30-Jul-05 syl1      imim2
27-Jul-05 uzind     [--same--]  weaker basis hyp.; different mand. hyp. order
13-Jul-05 mp3an11   mp3anl1
13-Jul-05 mp3an12   mp3anl2
13-Jul-05 mp3an13   mp3anl3
13-Jul-05 syl3an11  syl3anl1
13-Jul-05 syl3an12  syl3anl2
13-Jul-05 syl3an13  syl3anl3
13-Jul-05 mpan11    mpanl1
13-Jul-05 mpan12    mpanl2
13-Jul-05 mpan21    mpanr1
13-Jul-05 mpan22    mpanr2
13-Jul-05 sylan11   sylanl1
13-Jul-05 sylan12   sylanl2
13-Jul-05 sylan21   sylanr1
13-Jul-05 sylan22   sylanr2
13-Jul-05 mpan121   mpanlr1
13-Jul-05 ecased    ---         obsolete; use ecase23d (diff. hyp. order)
11-Jul-05 lelt      lenlt
11-Jul-05 leltt     lenltt
11-Jul-05 lenltt    eqleltt
10-Jul-05 bcpasc    bcpasc2
10-Jul-05 bcvalt    bcval2t
 9-Jul-05 sermconst ---         obsolete; use ser1mulc
 9-Jul-05 seqsuc    seq1p1
 3-Jul-05 peano5c   ---         obsolete; use peano5nn (restr. qntfr.)
 3-Jul-05 df-n      [--same--]  shortened with restricted quantifier
 2-Jul-05 mulge0t   [--same--]  conjoined antecedents
 2-Jul-05 prodgt02t [--same--]  swapped A e. RR and B e. RR
27-Jun-05 syl3an    [--same--]  changed order of hypotheses
25-Jun-05 ecoprcom  [--same--]  changed order of $f hypotheses
21-Jun-05 nn0ltlem1 nn0ltlem1t
21-Jun-05 subsub    subsub23
17-Jun-05 ecoprdist ---         obsolete; use ecoprdi
16-Jun-05 binom     binom2
12-Jun-05 oel       orabs
30-May-05 ltdiv23t  [--same--]  conjoined antecedents
30-May-05 ledivt    lediv1t
23-May-05 rcla42v   [--same--]  swapped antecedents
23-May-05 rcla4v    [--same--]  swapped antecedents
23-May-05 rcla4     [--same--]  swapped antecedents
10-May-05 mpbiranr  mpbiran2
 8-May-05 funfv2    [--same--]  changed to A F y instead of <. A , y >. e. F
 8-May-05 imasn     ---         obsolete; use relimasn (A R y instead of o.p.)
 3-May-05 nndiv     nndivt
 2-May-05 subaddeq  pncan3
 2-May-05 subaddeqt pncan3t
 1-May-05 divne0bt  [--same--]  changed antecedent to triple conjunction
 1-May-05 divcan2t  [--same--]  changed antecedent to triple conjunction
 1-May-05 divcan1t  [--same--]  changed antecedent to triple conjunction
30-Apr-05 divnegt   [--same--]  changed antecedent to triple conjunction
30-Apr-05 divrect   [--same--]  changed antecedent to triple conjunction
30-Apr-05 divcan3t  [--same--]  changed antecedent to triple conjunction
30-Apr-05 divcan4t  [--same--]  changed antecedent to triple conjunction
29-Apr-05 crut      [--same--]  generalized -> to <->
29-Apr-05 cru       [--same--]  generalized -> to <->
29-Apr-05 isqm1     itimesi
29-Apr-05 crmult    crmul       changed hypotheses from real to complex
29-Apr-05 redivclt  [--same--]  changed antecedent to triple conjunction
29-Apr-05 divclt    [--same--]  changed antecedent to triple conjunction
28-Apr-05 ine0      [--same--]  changed -. and = to =/=
27-Apr-05 ltdivt    ltdiv1t
27-Apr-05 ltdiv     ltdiv1
27-Apr-05 ltdivi    ltdiv1i
24-Apr-05 prodgt0   [--same--]  strengthened 0 < A to 0 <_ A
24-Apr-05 prodgt0i  prodgt0lem
 7-Apr-05 equs2     ---         obsolete; use equs5
 7-Apr-05 equs1     ---         obsolete; use equs4
 6-Apr-05 absltt    [--same--]  swapped & contraposed conjunct with -u
 6-Apr-05 absle     [--same--]  swapped & contraposed conjunct with -u
 6-Apr-05 abslt     [--same--]  swapped & contraposed conjunct with -u
26-Mar-05 abscj     [--same--]  swapped arguments of = sign
18-Mar-05 reim0     reim0b
18-Mar-05 rere      rereb
18-Mar-05 cjre      cjreb
18-Mar-05 negre     negreb
11-Mar-05 frsuc     frsuc
10-Mar-05 nn0addge2 [--same--]  Generalized 1st hyp from NN0 to RR
10-Mar-05 nn0addge1 [--same--]  Generalized 1st hyp from NN0 to RR
 5-Mar-05 chv       chvarv
 5-Mar-05 chv2      chvar
 4-Mar-05 divdistr  divdir
 4-Mar-05 divdistrz divdirz
 4-Mar-05 divge0t   [--same--]  conjoined the two left-most antecedents
 4-Mar-05 divgt0t   [--same--]  conjoined the two left-most antecedents
 4-Mar-05 absgt0t   [--same--]  changed  -. A = 0  to  A =/= 0
 4-Mar-05 absgt0    [--same--]  changed  -. A = 0  to  A =/= 0
24-Feb-05 absidt    [--same--]  conjoined the two left-most antecedents
27-Feb-05 del34     ---         obsolete; use dral1 instead
27-Feb-05 del35     ---         obsolete; use dral1 instead
27-Feb-05 del34b    dral1
27-Feb-05 del36     ---         obsolete; use dral2 instead
27-Feb-05 del40     ---         obsolete; use drex1 instead
27-Feb-05 del41     ---         obsolete; use drex1 instead
27-Feb-05 del42     ---         obsolete; use drex2 instead
27-Feb-05 del43     ---         obsolete; use drsb1 instead
27-Feb-05 del43b    drsb1
27-Feb-05 del44     ---         obsolete; use drsb2 instead
27-Feb-05 del45     ---         obsolete; use drsb2 instead
27-Feb-05 ddelimf2  dvelimf2
27-Feb-05 ddelimf   dvelimf
27-Feb-05 ddelimdf  dvelimdf
27-Feb-05 ddelim    dvelim
27-Feb-05 ddeeq1    dveeq1
27-Feb-05 ddeeq2    dveeq2
27-Feb-05 ddeel1    dveel1
27-Feb-05 ddeel2    dveel2
24-Feb-05 bi3ord    3orbi123d
24-Feb-05 im3ord    3orim123d
24-Feb-05 bi3or     3orbi123i
24-Feb-05 bi3an     3anbi123i
24-Feb-05 bi3and    3anbi123d
24-Feb-05 im3an     3anim123i
24-Feb-05 divdistrt divdirt
24-Feb-05 ltdiv1t   [--same--]  conjoined the two left-most antecedents
24-Feb-05 lediv1t   [--same--]  conjoined the two left-most antecedents
24-Feb-05 ltmuldivt [--same--]  conjoined the two left-most antecedents
24-Feb-05 ltdivmult [--same--]  conjoined the two left-most antecedents
24-Feb-05 ltmuldiv2t [--same--]  conjoined the two left-most antecedents
24-Feb-05 gt0ne0t   [--same--]  conjoined the two left-most antecedents
24-Feb-05 ltrect    [--same--]  conjoined the two left-most antecedents
24-Feb-05 recgt0t   [--same--]  conjoined the two left-most antecedents
24-Feb-05 lerect    [--same--]  conjoined the two left-most antecedents
21-Feb-05 nn0ge0i   nn0ge0
21-Feb-05 rdgzer    rdg0
21-Feb-05 rdgzert   rdg0g
21-Feb-05 frzer     fr0g
21-Feb-05 mulzer1   mul01
21-Feb-05 mulzer2   mul02
21-Feb-05 mulzer1t  mul01t
21-Feb-05 mulzer2t  mul02t
21-Feb-05 divzer    div0
19-Feb-05 ax0re     0re
13-Feb-05 cardcard  cardidm
13-Feb-05 exp2t     sqvalt
13-Feb-05 uzind2    ---         Obsolete; use uzind3
 5-Feb-05 ---       ---         We will adopt "equ" (vs. old "eq") for
 5-Feb-05 ---       ---         set variable equality and "eq" (vs. old
 5-Feb-05 ---       ---         "cleq") for class equality.  (Remember it
 5-Feb-05 ---       ---         is important to do these in REVERSE order
 5-Feb-05 ---       ---         below!)
 5-Feb-05 cleqri    eqri
 5-Feb-05 cleqrd    eqrd
 5-Feb-05 cleqid    eqid
 5-Feb-05 cleqcom   eqcom
 5-Feb-05 cleqcomi  eqcomi
 5-Feb-05 cleqcomd  eqcomd
 5-Feb-05 cleq1     eqeq1
 5-Feb-05 cleq2     eqeq2
 5-Feb-05 cleq1i    eqeq1i
 5-Feb-05 cleq2i    eqeq2i
 5-Feb-05 cleq1d    eqeq1d
 5-Feb-05 cleq2d    eqeq2d
 5-Feb-05 cleq12    eqeq12
 5-Feb-05 cleq12i   eqeq12i
 5-Feb-05 cleq12d   eqeq12d
 5-Feb-05 cleqan12d eqeqan12d
 5-Feb-05 cleqan12rd eqeqan12rd
 5-Feb-05 cleqtr    eqtr
 5-Feb-05 cleq2tr   eq2tri
 5-Feb-05 cleqab    abeqbi2
 5-Feb-05 cleqabi   abeqbi2i
 5-Feb-05 cleqabr   abeqbi1
 5-Feb-05 cleqabd   abeqbi2d
 5-Feb-05 cleqabri  abeqbi1i
 5-Feb-05 cleq2ab   eq2ab
 5-Feb-05 cleqrabi  rabeqbi2i
 5-Feb-05 clneq     nelneq
 5-Feb-05 clneq2    nelneq2
 5-Feb-05 sbeq2     equsb2
 5-Feb-05 sbeq1     equsb1
 5-Feb-05 eqvin.l2  ---           obsolete; use equvin instead
 5-Feb-05 eqvin     equvin
 5-Feb-05 eqvin.l1  equvini
 5-Feb-05 eqsal     equsal
 5-Feb-05 eqsex     equsex
 5-Feb-05 eqs5      equs5
 5-Feb-05 eqs4      equs4
 5-Feb-05 eqs3      equs3
 5-Feb-05 eqs2      equs2
 5-Feb-05 eqs1      equs1
 5-Feb-05 eq6s      hbnaes
 5-Feb-05 eq6       hbnae
 5-Feb-05 eq5s      hbaes
 5-Feb-05 eq5       hbae
 5-Feb-05 eq4ds     nalequcoms
 5-Feb-05 eq4s      alequcoms
 5-Feb-05 eq4       ax-10
 5-Feb-05 a14b      elequ2
 5-Feb-05 a13b      elequ1
 5-Feb-05 eqt2b     equequ2
 5-Feb-05 a8b       equequ1
 5-Feb-05 eqt       equtr
 5-Feb-05 eqt2      equtrr
 5-Feb-05 eqan      equtr2
 5-Feb-05 eqcom     equcomi
 5-Feb-05 eqcomb    equcom
 5-Feb-05 eqcoms    equcoms
 5-Feb-05 eqid      equid
 3-Feb-05 sb5f1     sb6rf
21-Jan-05 mulcanxx  mulcant2
21-Jan-05 mulcant2  mulcant
21-Jan-05 mulcant   mulcanxx
10-Jan-05 add41r3   add42
10-Jan-05 caopr41r3 caopr42
10-Jan-05 an41r3s   an42s
10-Jan-05 an41r3    an42
 8-Jan-05 ---       ---         The imxx series was changed analogously
 8-Jan-05 ---       ---         to the bixx series change.
 8-Jan-05 im2an     anim12i
 8-Jan-05 imran     anim1i
 8-Jan-05 imlan     anim2i
 8-Jan-05 im2or     orim12i
 8-Jan-05 imror     orim1i
 8-Jan-05 imlor     orim2i
 8-Jan-05 im2and    anim12d
 8-Jan-05 imrand    anim1d
 8-Jan-05 imland    anim2d
 8-Jan-05 im2ord    orim12d
 8-Jan-05 imrord    orim1d
 8-Jan-05 imlord    orim2d
 8-Jan-05 ---       ---         The bixx series was changed to be analogous
 8-Jan-05 ---       ---         to the xxeqx series e.g. uneq12d.
 8-Jan-05 ---       ---         (Suggested by Raph Levien.)
 8-Jan-05 bi2and    anbi12d
 8-Jan-05 birand    anbi1d
 8-Jan-05 biland    anbi2d
 8-Jan-05 bi2imd    imbi12d
 8-Jan-05 birimd    imbi1d
 8-Jan-05 bilimd    imbi2d
 8-Jan-05 bi2ord    orbi12d
 8-Jan-05 birord    orbi1d
 8-Jan-05 bilord    orbi2d
 8-Jan-05 bi2bid    bibi12d
 8-Jan-05 birbid    bibi1d
 8-Jan-05 bilbid    bibi2d
 8-Jan-05 binegd    negbid
 8-Jan-05 bi2an     anbi12i
 8-Jan-05 biran     anbi1i
 8-Jan-05 bilan     anbi2i
 8-Jan-05 bi2im     imbi12i
 8-Jan-05 birim     imbi1i
 8-Jan-05 bilim     imbi2i
 8-Jan-05 bi2or     orbi12i
 8-Jan-05 biror     orbi1i
 8-Jan-05 bilor     orbi2i
 8-Jan-05 bi2bi     bibi12i
 8-Jan-05 birbi     bibi1i
 8-Jan-05 bilbi     bibi2i
 8-Jan-05 bineg     negbii
 3-Jan-05 pm5.41    imdi
 1-Jan-05 iundif    iundif2
 1-Jan-05 iindif    iindif2
 1-Jan-05 iunin     iunin2
 1-Jan-05 iinin     iinin2
 1-Jan-05 sylan13br sylancbr
 1-Jan-05 sylan13b  sylancb
 1-Jan-05 sylan13   sylanc
 1-Jan-05 syl13     sylc
26-Dec-04 0ne1o     ---         obsolete; use 1ne0
19-Dec-04 sbequ6    [--same--]  swapped biconditional order
19-Dec-04 sbequ5    [--same--]  swapped biconditional order
15-Dec-04 syl2and   syl2ani
15-Dec-04 sylan2d   sylan2i
15-Dec-04 syland    sylani
12-Dec-04 nnordex   nnaordex
12-Dec-04 nnwordex  nnawordex
12-Dec-04 mpand     mpdan
12-Dec-04 ontr      ontr1
 6-Dec-04 on0eqel   on0eqelt
30-Nov-04 exp2      sqvalt
30-Nov-04 1exp      1expt
30-Nov-04 0exp      0expt
30-Nov-04 exp1      exp1t
30-Nov-04 expp1     expp1t
18-Nov-04 divrclz   redivclz
18-Nov-04 divrclt   redivclt
18-Nov-04 subrclt   resubclt
18-Nov-04 negrclt   renegclt
18-Nov-04 mulrclt   remulclt
18-Nov-04 divrcl    redivcl
18-Nov-04 subrcl    resubcl
18-Nov-04 negrcl    renegcl
18-Nov-04 mulrcl    remulcl
18-Nov-04 addrcl    readdcl
18-Nov-04 ltdivmul  ---         obsolete; use ltmuldiv instead
18-Nov-04 ltdivmult ---         obsolete; use ltmuldivt instead (note: there
                                is a new ltdivmult that is unrelated)
18-Nov-04 distr2t   adddirt
18-Nov-04 distr2    adddir
18-Nov-04 distr     adddi
18-Nov-04 subdistr  subdir
17-Nov-04 nnrect    nnrecgt0t
17-Nov-04 posdif    [--same--]  swapped biconditional and variable order
15-Nov-04 negdistt3 negdi3t
15-Nov-04 negdistt2 negdi2t
15-Nov-04 negdistt  negdit
15-Nov-04 negdist3  negdi3
15-Nov-04 negdist2  negdi2
11-Nov-04 reuunis   reuuni2
11-Nov-04 reuuni    reuuni1
 9-Nov-04 zlelt1    zleltp1t
 9-Nov-04 zltle1    zltp1let
 7-Sep-04 arch      [--same--]  removed quantifier, changed set var. to class
 2-Nov-04 dfom2     dfom3
 2-Nov-04 dfom3     dfom4
29-Oct-04 df-ded    df-if
29-Oct-04 dedeq1    ifeq1
29-Oct-04 dedeq2    ifeq2
29-Oct-04 dedeq12   ifeq12
29-Oct-04 dedbi     ifbi
29-Oct-04 dedlem1   iftrue
29-Oct-04 dedlem2   iffalse
29-Oct-04 dedex     ifex
29-Oct-04 cded      cif
29-Oct-04 ---SYMBOL CHANGE----  Changed math symbol 'ded' to 'if'
28-Oct-04 cmulc     cmul
20-Oct-04 oprabex   oprabex2
14-Oct-04 nn0lelt1  nn0leltp1t
14-Oct-04 nn0ltle1  nn0ltp1let
14-Oct-04 nnlelt1   nnleltp1t
14-Oct-04 nnltle1   nnltp1let
14-Oct-04 rnoel3    rabn0
14-Oct-04 noel3     abn0
14-Oct-04 noel2     n0i
14-Oct-04 peano2c   peano2nn
12-Oct-04 supeu     supeui
12-Oct-04 supcl     supcli
12-Oct-04 supub     supubi
12-Oct-04 suplub    suplubi
12-Oct-04 supnub    supnubi
12-Oct-04 suprcl    suprcli
12-Oct-04 suprub    suprubi
12-Oct-04 pm4.12    con2bi
12-Oct-04 bicon4    con4bii
12-Oct-04 con2bi    con2bii
12-Oct-04 bicon1    con1bii
12-Oct-04 pm2.11    exmid
11-Oct-04 sbf1      ---         obsolete; use sbf instead
11-Oct-04 ceqsexg   ceqex
 9-Oct-04 fvco2     fvco3
 8-Oct-04 indif0    disjdif
 8-Oct-04 biopab    opabbii.2
 8-Oct-04 bioprab   oprabbieqi
 7-Oct-04 ssii      sselii
 6-Oct-04 op2nd     op2ndb
 6-Oct-04 op1st     op1stb
 3-Oct-04 ind       nnind
 3-Oct-04 sylan5    sylan2
 3-Oct-04 sylan5b   sylan2b
 3-Oct-04 sylan5br  sylan2br
 3-Oct-04 sylan5d   sylan2i
 3-Oct-04 zind      ---         obsolete; use uzind
30-Sep-04 fvop      funfvop
30-Sep-04 funfvop   funopfv
30-Sep-04 pm4.21    bicom
30-Sep-04 bicom     bicomi
30-Sep-04 entr      entri
30-Sep-04 sstr2qqq  sstr
30-Sep-04 sstr      sstr2
30-Sep-04 sstr2     sstr2qqq
29-Sep-04 xp0qqq    xp0r
29-Sep-04 xp0r      xp0
29-Sep-04 xp0       xp0qqq
28-Sep-04 xpdom     xpdom2      changed variable names
28-Sep-04 xpdom2    xpdom3
26-Sep-04 xpindi    inxp
26-Sep-04 xpun1     xpundi
26-Sep-04 xpun2     xpundir
25-Sep-04 entr      entrt
23-Sep-04 ssfnres   ---         obsolete; use fnssres instead
23-Sep-04 resun     resundi
21-Sep-04 f11       [--same--]  changed o.p. membership to binary relation
21-Sep-04 unisuc    [--same--]  swapped arguments of = sign
21-Sep-04 onunisuc  [--same--]  swapped arguments of = sign
21-Sep-04 undif3    ---         obsolete; use undif
21-Sep-04 ssequn2   [--same--]  swapped arguments of = sign
21-Sep-04 sseqin2   [--same--]  swapped arguments of = sign
21-Sep-04 onelun    [--same--]  swapped arguments of = sign
21-Sep-04 dfss4     [--same--]  swapped arguments of = sign
21-Sep-04 ordunisuc ordunisssuc
21-Sep-04 ssfun     funss
15-Sep-04 19.6      alex
15-Sep-04 alex      alexeq
15-Sep-04 19.11     excom
15-Sep-04 19.11a    excomim
15-Sep-04 19.5      alcom
15-Sep-04 19.7      alnex
15-Sep-04 19.14     exnal
15-Sep-04 alnex     alinexa
15-Sep-04 exnal     exanali
15-Sep-04 dmsn      dmsnop
15-Sep-04 rnsn      rnsnop
13-Sep-04 ppnull    pwpw0
13-Sep-04 pwnull    pw0
13-Sep-04 zfnull2   zfnul
13-Sep-04 nullpss   0pss
13-Sep-04 nullss    0ss
13-Sep-04 nulleq    eq0
13-Sep-04 nnull     n0
13-Sep-04 nnullf    n0f
13-Sep-04 xpdisj    xpsndisj
13-Sep-04 subdist   subdi
13-Sep-04 negdist   negdi
13-Sep-04 nndist    nndi
13-Sep-04 xpindist  inxp
11-Sep-04 ssd       sseld
11-Sep-04 ssi       sseli
11-Sep-04 vtoclab   elab2
11-Sep-04 vtoclabg  elab2g
11-Sep-04 elab2g    elab3g
 6-Sep-04 comm      com12
 4-Sep-04 opabval   fvopab3
 4-Sep-04 opabvalig fvopab3ig
 4-Sep-04 opabval2g fvopab4g
 4-Sep-04 opabval2  fvopab4
 3-Sep-04 undif2    difun2
 1-Sep-04 dedlem2   [--same--]  swapped arguments of = sign
 1-Sep-04 dedlem1   [--same--]  swapped arguments of = sign
31-Aug-04 pm2.16d   con3d
31-Aug-04 pm2.03d   con2d
31-Aug-04 pm2.15d   con1d
31-Aug-04 pm2.16    con3
31-Aug-04 pm2.03    con2
31-Aug-04 pm2.15    con1
31-Aug-04 con3      con3i
31-Aug-04 con2      con2i
31-Aug-04 con1      con1i
29-Aug-04 oprabelrn elrnoprab
27-Aug-04 ssequn1   [--same--]  swapped arguments of = sign
27-Aug-04 df-ss     dfss
27-Aug-04 imdistanb ---         obsolete; use imdistan
27-Aug-04 imdistan  [--same--]  now includes converse
17-Aug-04 difun2    [--same--]  swapped arguments of = sign
17-Aug-04 undif1    [--same--]  swapped arguments of = sign and union
17-Aug-04 difin     [--same--]  swapped arguments of = sign
17-Aug-04 unindistr undir
17-Aug-04 unindist  undi
17-Aug-04 inundistr indir
17-Aug-04 inundist  indi
17-Aug-04 indist    inindi
16-Aug-04 ss2un     unss12      order of variables changed
15-Aug-04 funmo,dffunmof,dffunmo
                    [--same--]  ordered pair membership -> binary relation
15-Aug-04 dfrel2    [--same--]  swapped arguments of = sign
12-Aug-04 unxp      xpundir
11-Aug-04 elima2    elima3
11-Aug-04 reluni    [--same--]  restricted quantifier and added converse
 9-Aug-04 imun      imaun
 3-Aug-04 1id       om1
 3-Aug-04 oalim     [--same--]  conjoined antecedents; now uses indexed union
 3-Aug-04 divdiv23  divdiv23z
 3-Aug-04 divdiv23i divdiv23
 2-Aug-04 divrec,divrecz [--same--] swapped A and B
 2-Aug-04 zq        zqt
 2-Aug-04 qre       qret
 1-Aug-04 mulcant  [--same--]  swapped conjunct in antecedent
 1-Aug-04 axrecex,axrrecex,divclt,divcan1t,divcan2t,recidt,divdistrt,divrclt
                    [--same--]  conjoined the two left-most antecedents
 1-Aug-04 peano1c   1nn
 1-Aug-04 1nn       1onn
28-Jul-04 sbco0     sbid2
28-Jul-04 sbid2     sbid2v
26-Jul-04 cardonval oncardval
15-Jun-04 ssin      [--same--]  swapped biconditional order
15-Jun-04 unss      [--same--]  swapped biconditional order
11-Jun-04 dfun2     df-un
11-Jun-04 df-un     dfun2
11-Jun-04 dfin2     df-in
11-Jun-04 df-in     dfin2
 3-Jun-04 ssintss   intss
 3-Jun-04 intss     intss1
30-May-04 r1clos    r1pwcl      now uses antecedent instead of hypothesis
30-May-04 r1powt    r1pw
28-May-04 sqvalt    ---         obsolete; use exp2
28-May-04 expntwo   exp2
28-May-04 expnone   ---         obsolete; use expp1t
28-May-04 expnsuc   ---         obsolete; use expp1t
28-May-04 expnzer   ---         obsolete; use exp0t
26-May-04 ontrt     ---         obsolete; use onelon instead
26-May-04 ddelim*   [--same--]  (*=wildcard) changed order of hypotheses
21-May-04 fvcnvb    f1ocnvfvb
21-May-04 fvcnv     f1ocnvfv
21-May-04 sbcb      sbcbig    now uses antecedent instead of hypothesis
21-May-04 sbci      sbcimg
21-May-04 sbb       sbbi
21-May-04 sbo       sbor
21-May-04 sbi       sbim
21-May-04 sbim      sbimi
21-May-04 sba       sban
21-May-04 fvelrn    [--same--]  changed to restricted quantifier
 8-Feb-04 zfpowb    pwexb
 8-Feb-04 zfpowcl   pwex
 8-Feb-04 zfnull    0ex
 8-Feb-04 limelon   [--same--]  changed first -> to /\ in antecedent


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                           2. Quick "How To"
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

How to use this file under Windows 95/98/NT/2K/XP/Vista/7/10:

1. Download the program metamath.exe per the instructions on the
   Metamath home page (http://us.metamath.org) and put it in the same
   directory as this file (set.mm).
2. In Windows Explorer, double-click on metamath.exe.
3. Type "read set.mm" and press Enter.
4. Type "help" for a list of help topics, and "help demo" for some
   command examples.


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                             3. Bibliography
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Bibliographical references are made by bracketing an identifier in a theorem's
comment, such as [RussellWhitehead].  These refer to HTML tags on the following
web pages:

  Logic and set theory - see http://us.metamath.org/mpeuni/mmset.html#bib
  Hilbert space - see http://us.metamath.org/mpeuni/mmhil.html#ref

A bracketed reference must be preceded by a theorem number, etc. and followed
by a page number.  See HELP WRITE BIBLIOGRAPHY for details.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                      4. Metamath syntax summary
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

The HELP LANGUAGE command in the Metamath program will give you a quick
overview of Metamath.  The official spec is found on pp. 92-95 of the
Metamath book.  The following syntax summary is provided for convenience
but may omit some details.

A Metamath database (set of one or more ASCII source files) is a sequence of
_tokens_, which are normally separated by spaces or line breaks.  The only
tokens that are built into the Metamath language are those (two-character
sequences) beginning with $, shown in the following. These tokens are called
_keywords_:

          $c ... $. - Constant declaration
          $v ... $. - Variable declaration
          $d ... $. - Disjoint (distinct) variable restriction
  <label> $f ... $. - "Floating" hypothesis (i.e. variable type declaration)
  <label> $e ... $. - "Essential" hypothesis (i.e. a logical assumption for a
                      theorem or axiom)
  <label> $a ... $. - Axiom or definition or syntax construction
  <label> $p ... $= ... $. - Theorem and its proof
          ${ ... $} - Block for defining the scope of the above statements
                      (except $a, $p which are forever active)
$)        $( ... $)
$(                  - Comments (may not be nested); see HELP LANGUAGE
                      for markup features.
          $[ ... $] - Include a file

The only "logic" Metamath uses in its proof verification algorithm is the
substitution of expressions for variables while checking for distinct variable
violations.  Everything else, including the axioms for logic, is defined in the
database.

All other tokens are user-defined, and their names are arbitrary.  There are
two kinds of user-defined tokens, called math symbols (or just symbols) and
labels.  A _symbol_ may contain any non-whitespace printable character except
"$".  A _label_ may contain only alphanumeric characters and the characters "."
(period), "-" (hyphen), and "_" (underscore).  Symbols and labels are
case-sensitive.  All labels (except in proofs) must be distinct.  A label may
not have the same name as a symbol (to simplify the coding of certain parsers
and translators).

Here is some more detail about the syntax.:

  $c <symbollist> $.
      <symbollist> is a (whitespace-separated) list of distinct symbols that
      haven't been used before.
  $v <symbollist> $.
      <symbollist> is a list of distinct symbols that haven't been used yet
      in the current scope (see ${ ... $} below).
  $d <symbollist> $.
      <symbollist> is a (whitespace-separated) list of distinct symbols
      previously declared with $v in current scope.  It means that
      substitutions into these symbols may not have variables in common.
  <label> $f <symbollist> $.
      <symbollist> is a list of 2 symbols, the first of which must be
      previously declared with $c in the current scope.
  <label> $e <symbollist> $.
      <symbollist> is a list of 2 or more symbols, the first of which must be
      previously declared with $c in the current scope.
  <label> $a <symbollist> $.
      <symbollist> is a list of 2 or more symbols, the first of which must be
      previously declared with $c in the current scope.
  <label> $p <symbollist> $= <proof> $.
      <symbollist> is a list of 2 or more symbols, the first of which must be
      previously declared with $c in the current scope.  <proof> is either a
      whitespace-delimited sequence of previous labels (created by
      SAVE PROOF <label> /NORMAL) or a compressed proof (created by
      SAVE PROOF <label> /COMPRESSED).  After using SAVE PROOF, use
      WRITE SOURCE to save the database file to disk.
  ${ ... $}
      Block for scoping the above statements (except $a, $p which are forever
      active).  Currently, $c may not occur inside of a block.
$)
  $( <any text> $)
$(    Comment.  Note: <any text> may not contain adjacent "$" and ")"
      characters.  The comment opening and closing delimiters must be
      surrounded by whitespace (space, tab, CR, LF, or FF).
  $[ <filename> $]
      Insert contents of <filename> at this point.  If <filename> is current
      file or has been already been inserted, it will not be inserted again.

Inside of comments, it is recommended that labels be preceded with a tilde (~)
and math symbol tokens be enclosed in grave accents (` `).  This way the LaTeX
and HTML rendition of comments will be accurate, and (future) tools to globally
change labels and math symbols will also change them in comments.  Note that
inside of grave accents a pair of grave accents is interpreted as a single
grave accent.  A special comment containing $ t defines LaTeX and HTML symbols.
See HELP LANGUAGE and HELP HTML for other markup features in comments.

The proofs in this file are in "compressed" format for storage efficiency.  The
Metamath program reads the compressed format directly.  This format is
described in an Appendix of the Metamath book.  It is not intended to be read
by humans.  For viewing proofs you should use the various SHOW PROOF commands
described in the Metamath book (or the on-line HELP).

The Metamath program does not normally affect any content of this file (set.mm)
other than proofs, i.e. the text between "$=" and "$.".  All other content is
user-created.  Proofs are created or modified with the PROVE command.


=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                          5. Other notes
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

1. It is recommended that you be familiar with chapters 2 and 4 of the
'Metamath' book to understand the Metamath language.  Chapters 2, 3 and 5
explain how to use the program.  Chapter 3 gives you an informal overview of
what this source file is all about.  Appendix A shows you the standard
mathematical symbols corresponding to some of the ASCII tokens in this file.

The ASCII tokens may seem cryptic at first, even if you are familiar with set
theory, but a review of the definition summary in Chapter 3 should quickly
enable you to see the correspondence to standard mathematical notation.  To
easily find the definition of a token, search for the first occurrences of the
token surrounded by spaces.  Some odd-looking ones include "-." for "not", and
"C_" for "is a subset of."  (HELP TEX tells you how to obtain a LaTeX output to
see the real mathematical symbols.)  Let me know if you have better suggestions
for naming ASCII tokens.

2. Theorems can be written in different forms: "closed form", "deduction form"
or "inference form" (for details see ~ conventions ).  We prefer to write
theorems in "deduction form" - we call this approach "deduction style" - and
try to avoid theorems in "inference form" unless there are reasonable grounds
for it.

3. On providing new definitions and theorems, the conventions provided in the
comment of ~ conventions should be obeyed.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
           6. Acceptable shorter proofs
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Shorter proofs are welcome, and any shorter proof I accept will be acknowledged
in the theorem's description.  However, in some cases a proof may be "shorter"
or not depending on how it is formatted.  This section provides general
guidelines.

Usually I will automatically accept shorter proofs that (1) shorten the set.mm
file (with compressed proofs), (2) reduce the size of the HTML file generated
with SHOW STATEMENT xx / HTML, (3) use only existing, unmodified theorems in
the database (the order of theorems may be changed, though), and (4) use no
additional axioms.

Usually I will also automatically accept a _new_ theorem that is used to
shorten multiple proofs, if the total size of set.mm (including the comment of
the new theorem, not including the acknowledgment) decreases as a result.

In borderline cases, I typically place more importance on the number of
compressed proof steps and less on the length of the label section (since the
names are in principle arbitrary).  If two proofs have the same number of
compressed proof steps, I will typically give preference to the one with the
smaller number of different labels, or if these numbers are the same, the proof
with the fewest number of characters that the proofs happen to have by chance
when label lengths are included.

A few theorems have a longer proof than necessary in order to avoid the use of
certain axioms, for pedagogical purposes, and for other reasons.  These
theorems will (or should) have a "(Proof modification is discouraged.)" tag in
their description.  For example, id1 shows a proof directly from axioms.
Shorter proofs for such cases won't be accepted, of course, unless the criteria
described continues to be satisfied.

$)

$( End $[ set-header.mm $] $)

$( Begin $[ set-main.mm $] $)
$( Begin $[ set-pred.mm $] $)

$( The following header is the first to appear in the Theorem List contents,
because higher-level headers suppress all previous same- or lower-level headers
in the same comment area between $a and $p statements.  See HELP WRITE
THEOREM_LIST for information about headers. $)

$(
###############################################################################
            CLASSICAL FIRST-ORDER LOGIC WITH EQUALITY
###############################################################################

  Logic can be defined as the "study of the principles of correct reasoning"
  (Merrilee H. Salmon's 1991 "Informal Reasoning and Informal Logic" in
  _Informal Reasoning and Education_) or as "a formal system using symbolic
  techniques and mathematical methods to establish truth-values" (the Oxford
  English Dictionary).

  This section formally defines the logic system we will use.  In particular,
  it defines symbols for declaring truthful statements, along with rules for
  deriving truthful statements from other truthful statements.  The system
  defined here is classical first-order logic with equality (the most common
  logic system used by mathematicians).

  We begin with a few housekeeping items in pre-logic, and then introduce
  propositional calculus (both its axioms and important theorems that can be
  derived from them).  Propositional calculus deals with general truths about
  well-formed formulas (wffs) regardless of how they are constructed.  This is
  followed by proofs that other axiomatizations of classical propositional
  calculus can be derived from the axioms we have chosen to use.

  We then define predicate calculus, which adds additional symbols and rules
  useful for discussing objects (beyond simply true or false).  In particular,
  it introduces the symbols ` = ` ("equals"), ` e. ` ("is a member of"), and `
  A. ` ("for all").  The first two are called "predicates."  A predicate
  specifies a true or false relationship between its two arguments.

$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
                           Pre-logic
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

  This section includes a few "housekeeping" mechanisms before we begin
  defining the basics of logic.

$)

  $( Declare the primitive constant symbols for propositional calculus. $)
  $c ( $.  $( Left parenthesis $)
  $c ) $.  $( Right parenthesis $)
  $c -> $. $( Right arrow (read:  "implies") $)
  $c -. $. $( Right handle (read:  "not") $)
  $c wff $. $( Well-formed formula symbol (read:  "the following symbol
               sequence is a wff") $)
  $c |- $. $( Turnstile (read:  "the following symbol sequence is provable" or
              'a proof exists for") $)

  $( Define the syntax and logical typecodes, and declare that our grammar is
     unambiguous (verifiable using the KLR parser, with compositing depth 5).
     (This $ j comment need not be read by verifiers, but is useful for parsers
     like mmj2.) $)
  $( $j
    syntax 'wff';
    syntax '|-' as 'wff';
    unambiguous 'klr 5';
  $)

  $( Declare typographical constant symbols that are not directly used
     in the formalism, but *are* symbols we find useful when
     explaining the formalism. It is much easier to consistently use
     a single typographical system when generating text. $)

  $c & $. $( Ampersand (read: "and-also") $)
  $c => $. $( Big-to (read: "proves") $)

  $( wff variable sequence:  ph ps ch th ta et ze si rh mu la ka $)
  $( Introduce some variable names we will use to represent well-formed
     formulas (wff's). $)
  $v ph $.  $( Greek phi $)
  $v ps $.  $( Greek psi $)
  $v ch $.  $( Greek chi $)
  $v th $.  $( Greek theta $)
  $v ta $.  $( Greek tau $)
  $v et $.  $( Greek eta $)
  $v ze $.  $( Greek zeta $)
  $v si $.  $( Greek sigma $)
  $v rh $.  $( Greek rho $)
  $v mu $.  $( Greek mu $)
  $v la $.  $( Greek lambda $)
  $v ka $.  $( Greek kappa $)

  $( Specify some variables that we will use to represent wff's.
     The fact that a variable represents a wff is relevant only to a theorem
     referring to that variable, so we may use $f hypotheses.  The symbol
     ` wff ` specifies that the variable that follows it represents a wff. $)
  $( Let variable ` ph ` be a wff. $)
  wph $f wff ph $.
  $( Let variable ` ps ` be a wff. $)
  wps $f wff ps $.
  $( Let variable ` ch ` be a wff. $)
  wch $f wff ch $.
  $( Let variable ` th ` be a wff. $)
  wth $f wff th $.
  $( Let variable ` ta ` be a wff. $)
  wta $f wff ta $.
  $( Let variable ` et ` be a wff. $)
  wet $f wff et $.
  $( Let variable ` ze ` be a wff. $)
  wze $f wff ze $.
  $( Let variable ` si ` be a wff. $)
  wsi $f wff si $.
  $( Let variable ` rh ` be a wff. $)
  wrh $f wff rh $.
  $( Let variable ` mu ` be a wff. $)
  wmu $f wff mu $.
  $( Let variable ` la ` be a wff. $)
  wla $f wff la $.
  $( Let variable ` ka ` be a wff. $)
  wka $f wff ka $.

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                 Inferences for assisting proof development
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
$)

  ${
    dummylink.1 $e |- ph $.
    dummylink.2 $e |- ps $.
    $( (_Note_:  This inference rule and the next one, ~ idi , will normally
       never appear in a completed proof.  They can be ignored if you are using
       this database to assist learning logic - please start with the statement
       ~ wn instead.)

       This is a technical inference to assist proof development.  It provides
       a temporary way to add an independent subproof to a proof under
       development, for later assignment to a normal proof step.

       The metamath program's Proof Assistant requires proofs to be developed
       backwards from the conclusion with no gaps, and it has no mechanism that
       lets the user to work on isolated subproofs.  This inference provides a
       workaround for this limitation.  It can be inserted at any point in a
       proof to allow an independent subproof to be developed on the side, for
       later use as part of the final proof.

       _Instructions_:  (1) Assign this inference to any unknown step in the
       proof.  Typically, the last unknown step is the most convenient, since
       'assign last' can be used.  This step will be replicated in hypothesis
       dummylink.1, from where the development of the main proof can continue.
       (2) Develop the independent subproof backwards from hypothesis
       dummylink.2.  If desired, use a 'let' command to pre-assign the
       conclusion of the independent subproof to dummylink.2.  (3) After the
       independent subproof is complete, use 'improve all' to assign it
       automatically to an unknown step in the main proof that matches it.  (4)
       After the entire proof is complete, use 'minimize *' to clean up
       (discard) all dummylink references automatically.

       This inference was originally designed to assist importing partially
       completed Proof Worksheets from the mmj2 Proof Assistant GUI, but it can
       also be useful on its own.  Interestingly, no axioms are required for
       its proof.  It is the inference associated with ~ a1i .  (Contributed by
       NM, 7-Feb-2006.) $)
    dummylink $p |- ph $=
      (  ) C $.
  $}

  ${
    idi.1 $e |- ph $.
    $( Inference form of ~ id .  This inference rule, which requires no axioms
       for its proof, is useful as a copy-paste mechanism during proof
       development in mmj2.  It is normally not referenced in the final version
       of a proof, since it is always redundant and can be removed using the
       'minimize *' command in the metamath program's Proof Assistant.
       Contrary to its closed form ~ id , it requires no axioms for its proof.
       (Contributed by Alan Sare, 31-Dec-2011.) $)
    idi $p |- ph $=
      (  ) B $.
  $}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
                           Propositional calculus
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

  Propositional calculus deals with general truths about well-formed formulas
  (wffs) regardless of how they are constructed.  The simplest propositional
  truth is ` ( ph -> ph ) ` , which can be read "if something is true, then it
  is true" - rather trivial and obvious, but nonetheless it must be proved from
  the axioms (see theorem ~ id ).

  Our system of propositional calculus consists of three basic axioms and
  another axiom that defines the modus-ponens inference rule.  It is attributed
  to Jan Lukasiewicz (pronounced woo-kah-SHAY-vitch) and was popularized by
  Alonzo Church, who called it system P2.  (Thanks to Ted Ulrich for this
  information.)  These axioms are ~ ax-1 , ~ ax-2 , ~ ax-3 , and (for modus
  ponens) ~ ax-mp . Some closely followed texts include [Margaris] for the
  axioms and [WhiteheadRussell] for the theorems.

  The propositional calculus used here is the classical system widely used by
  mathematicians.  In particular, this logic system accepts the "law of the
  excluded middle" as proven in ~ exmid , which says that a logical statement
  is either true or not true.  This is an essential distinction of classical
  logic and is not a theorem of intuitionistic logic.

  All 194 axioms, definitions, and theorems for propositional calculus in
  _Principia Mathematica_ (specifically *1.2 through *5.75) are axioms or
  formally proven.  See the Bibliographic Cross-References at
  ~ http://us.metamath.org/mpeuni/mmbiblio.html for a complete
  cross-reference from sources used to its formalization in the Metamath
  Proof Explorer.

$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        Recursively define primitive wffs for propositional calculus
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
$)

  $( If ` ph ` is a wff, so is ` -. ph ` or "not ` ph ` ."  Part of the
     recursive definition of a wff (well-formed formula).  In classical logic
     (which is our logic), a wff is interpreted as either true or false.  So if
     ` ph ` is true, then ` -. ph ` is false; if ` ph ` is false, then
     ` -. ph ` is true.  Traditionally, Greek letters are used to represent
     wffs, and we follow this convention.  In propositional calculus, we define
     only wffs built up from other wffs, i.e. there is no starting or "atomic"
     wff.  Later, in predicate calculus, we will extend the basic wff
     definition by including atomic wffs ( ~ weq and ~ wel ). $)
  wn $a wff -. ph $.

  $( If ` ph ` and ` ps ` are wff's, so is ` ( ph -> ps ) ` or " ` ph ` implies
     ` ps ` ."  Part of the recursive definition of a wff.  The resulting wff
     is (interpreted as) false when ` ph ` is true and ` ps ` is false; it is
     true otherwise.  Think of the truth table for an OR gate with input ` ph `
     connected through an inverter.  After we define the axioms of
     propositional calculus ( ~ ax-1 , ~ ax-2 , ~ ax-3 , and ~ ax-mp ), the
     biconditional ( ~ df-bi ), the constant true ` T. ` ( ~ df-tru ), and the
     constant false ` F. ` ( ~ df-fal ), we will be able to prove these truth
     table values: ` ( ( T. -> T. ) <-> T. ) ` ( ~ truimtru ),
     ` ( ( T. -> F. ) <-> F. ) ` ( ~ truimfal ), ` ( ( F. -> T. ) <-> T. ) `
     ( ~ falimtru ), and ` ( ( F. -> F. ) <-> T. ) ` ( ~ falimfal ).  These
     have straightforward meanings, for example, ` ( ( T. -> T. ) <-> T. ) `
     just means "the value of ` ( T. -> T. ) ` is ` T. ` ".

     The left-hand wff is called the antecedent, and the right-hand wff is
     called the consequent.  In the case of ` ( ph -> ( ps -> ch ) ) ` , the
     middle ` ps ` may be informally called either an antecedent or part of the
     consequent depending on context.  Contrast with ` <-> ` ( ~ df-bi ),
     ` /\ ` ( ~ df-an ), and ` \/ ` ( ~ df-or ).

     This is called "material implication" and the arrow is usually read as
     "implies."  However, material implication is not identical to the meaning
     of "implies" in natural language.  For example, the word "implies" may
     suggest a causal relationship in natural language.  Material implication
     does not require any causal relationship.  Also, note that in material
     implication, if the consequent is true then the wff is always true (even
     if the antecedent is false).  Thus, if "implies" means material
     implication, it is true that "if the moon is made of green cheese that
     implies that 5=5" (because 5=5).  Similarly, if the antecedent is false,
     the wff is always true.  Thus, it is true that, "if the moon made of green
     cheese that implies that 5=7" (because the moon is not actually made of
     green cheese).  A contradiction implies anything ( ~ pm2.21i ).  In short,
     material implication has a very specific technical definition, and
     misunderstandings of it are sometimes called "paradoxes of logical
     implication." $)
  wi $a wff ( ph -> ps ) $.

  $( Register '-.' and '->' as primitive expressions (lacking definitions). $)
  $( $j primitive 'wn' 'wi'; $)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        The axioms of propositional calculus
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  Propositional calculus (axioms ~ ax-1 through ~ ax-3 and rule ~ ax-mp ) can
  be thought of as asserting formulas that are universally "true" when their
  variables are replaced by any combination of "true" and "false."
  Propositional calculus was first formalized by Frege in 1879, using as his
  axioms (in addition to rule ~ ax-mp ) the wffs ~ ax-1 , ~ ax-2 , ~ pm2.04 ,
  ~ con3 , ~ notnot2 , and ~ notnot1 . Around 1930, Lukasiewicz simplified the
  system by eliminating the third (which follows from the first two, as you can
  see by looking at the proof of ~ pm2.04 ) and replacing the last three with
  our ~ ax-3 . (Thanks to Ted Ulrich for this information.)

  The theorems of propositional calculus are also called _tautologies_.
  Tautologies can be proved very simply using truth tables, based on the
  true/false interpretation of propositional calculus.  To do this, we assign
  all possible combinations of true and false to the wff variables and verify
  that the result (using the rules described in ~ wi and ~ wn ) always
  evaluates to true.  This is called the _semantic_ approach.  Our approach is
  called the _syntactic_ approach, in which everything is derived from axioms.
  A metatheorem called the Completeness Theorem for Propositional Calculus
  shows that the two approaches are equivalent and even provides an algorithm
  for automatically generating syntactic proofs from a truth table.  Those
  proofs, however, tend to be long, since truth tables grow exponentially with
  the number of variables, and the much shorter proofs that we show here were
  found manually.

$)

  ${
    $( Minor premise for modus ponens. $)
    min $e |- ph $.
    $( Major premise for modus ponens. $)
    maj $e |- ( ph -> ps ) $.
    $( Rule of Modus Ponens.  The postulated inference rule of propositional
       calculus.  See e.g.  Rule 1 of [Hamilton] p. 73.  The rule says, "if
       ` ph ` is true, and ` ph ` implies ` ps ` , then ` ps ` must also be
       true."  This rule is sometimes called "detachment," since it detaches
       the minor premise from the major premise.  "Modus ponens" is short for
       "modus ponendo ponens," a Latin phrase that means "the mode that by
       affirming affirms" - remark in [Sanford] p. 39.  This rule is similar to
       the rule of modus tollens ~ mto .

       Note:  In some web page displays such as the Statement List, the
       symbols " ` & ` " and " ` => ` " informally indicate the relationship
       between the hypotheses and the assertion (conclusion), abbreviating the
       English words "and" and "implies."  They are not part of the formal
       language.  (Contributed by NM, 30-Sep-1992.) $)
    ax-mp $a |- ps $.
  $}

  $( Axiom _Simp_.  Axiom A1 of [Margaris] p. 49.  One of the 3 axioms of
     propositional calculus.  The 3 axioms are also given as Definition 2.1 of
     [Hamilton] p. 28.  This axiom is called _Simp_ or "the principle of
     simplification" in _Principia Mathematica_ (Theorem *2.02 of
     [WhiteheadRussell] p. 100) because "it enables us to pass from the joint
     assertion of ` ph ` and ` ps ` to the assertion of ` ph ` simply."  It is
     Proposition 1 of [Frege1879] p. 26, its first axiom.  (Contributed by NM,
     30-Sep-1992.) $)
  ax-1 $a |- ( ph -> ( ps -> ph ) ) $.

  $( Axiom _Frege_.  Axiom A2 of [Margaris] p. 49.  One of the 3 axioms of
     propositional calculus.  It "distributes" an antecedent over two
     consequents.  This axiom was part of Frege's original system and is known
     as _Frege_ in the literature; see Proposition 2 of [Frege1879] p. 26.  It
     is also proved as Theorem *2.77 of [WhiteheadRussell] p. 108.  The other
     direction of this axiom also turns out to be true, as demonstrated by
     ~ pm5.41 .  (Contributed by NM, 30-Sep-1992.) $)
  ax-2 $a |- ( ( ph -> ( ps -> ch ) ) -> ( ( ph -> ps ) -> ( ph -> ch ) ) ) $.

  $( Axiom _Transp_.  Axiom A3 of [Margaris] p. 49.  One of the 3 axioms of
     propositional calculus.  It swaps or "transposes" the order of the
     consequents when negation is removed.  An informal example is that the
     statement "if there are no clouds in the sky, it is not raining" implies
     the statement "if it is raining, there are clouds in the sky."  This axiom
     is called _Transp_ or "the principle of transposition" in _Principia
     Mathematica_ (Theorem *2.17 of [WhiteheadRussell] p. 103).  We will also
     use the term "contraposition" for this principle, although the reader is
     advised that in the field of philosophical logic, "contraposition" has a
     different technical meaning.  (Contributed by NM, 30-Sep-1992.) $)
  ax-3 $a |- ( ( -. ph -> -. ps ) -> ( ps -> ph ) ) $.

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        Logical implication
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  The results in this section are based on implication only, and avoid
  ~ ax-3 , so are intuitionistic.  In an implication, the wff before the
  arrow is called the "antecedent" and the wff after the arrow is called
  the "consequent."

$)

  ${
    mp2.1 $e |- ph $.
    mp2.2 $e |- ps $.
    mp2.3 $e |- ( ph -> ( ps -> ch ) ) $.
    $( A double modus ponens inference.  (Contributed by NM, 5-Apr-1994.)
       (Proof modification is discouraged.) $)
    mp2 $p |- ch $=
      ( wi ax-mp ) BCEABCGDFHH $.
  $}

  ${
    mp2b.1 $e |- ph $.
    mp2b.2 $e |- ( ph -> ps ) $.
    mp2b.3 $e |- ( ps -> ch ) $.
    $( A double modus ponens inference.  (Contributed by Mario Carneiro,
       24-Jan-2013.) $)
    mp2b $p |- ch $=
      ( ax-mp ) BCABDEGFG $.
  $}

  ${
    $( Premise for ~ a1i . $)
    a1i.1 $e |- ph $.
    $( Inference derived from axiom ~ ax-1 .  See ~ a1d for an explanation of
       our informal use of the terms "inference" and "deduction."  See also the
       comment in ~ syld .  (Contributed by NM, 29-Dec-1992.) $)
    a1i $p |- ( ps -> ph ) $=
      ( wi ax-1 ax-mp ) ABADCABEF $.
  $}

  ${
    mp1i.a $e |- ph $.
    mp1i.b $e |- ( ph -> ps ) $.
    $( Drop and replace an antecedent.  (Contributed by Stefan O'Rear,
       29-Jan-2015.) $)
    mp1i $p |- ( ch -> ps ) $=
      ( ax-mp a1i ) BCABDEFG $.
  $}

  ${
    $( Premise for ~ a2i . $)
    a2i.1 $e |- ( ph -> ( ps -> ch ) ) $.
    $( Inference derived from axiom ~ ax-2 .  (Contributed by NM,
       29-Dec-1992.) $)
    a2i $p |- ( ( ph -> ps ) -> ( ph -> ch ) ) $=
      ( wi ax-2 ax-mp ) ABCEEABEACEEDABCFG $.
  $}

  ${
    imim2i.1 $e |- ( ph -> ps ) $.
    $( Inference adding common antecedents in an implication.  (Contributed by
       NM, 28-Dec-1992.) $)
    imim2i $p |- ( ( ch -> ph ) -> ( ch -> ps ) ) $=
      ( wi a1i a2i ) CABABECDFG $.
  $}

  ${
    mpd.1 $e |- ( ph -> ps ) $.
    mpd.2 $e |- ( ph -> ( ps -> ch ) ) $.
    $( A modus ponens deduction.  A translation of natural deduction rule
       ` -> ` E ( ` -> ` elimination), see ~ natded .  Deduction form of
       ~ ax-mp and inference associated with ~ a2i .  (Contributed by NM,
       29-Dec-1992.) $)
    mpd $p |- ( ph -> ch ) $=
      ( wi a2i ax-mp ) ABFACFDABCEGH $.
  $}

  ${
    $( First of 2 premises for ~ syl . $)
    syl.1 $e |- ( ph -> ps ) $.
    $( Second of 2 premises for ~ syl . $)
    syl.2 $e |- ( ps -> ch ) $.
    $( An inference version of the transitive laws for implication ~ imim2 and
       ~ imim1 (and ~ imim1i and ~ imim2i ), which Russell and Whitehead call
       "the principle of the syllogism...because...the syllogism in Barbara is
       derived from them" (quote after Theorem *2.06 of [WhiteheadRussell]
       p. 101).  Some authors call this law a "hypothetical syllogism."

       (A bit of trivia: this is the most commonly referenced assertion in our
       database.  In second place is ~ eqid , followed by ~ syl2anc ,
       ~ adantr , ~ syl3anc , and ~ ax-mp .  The Metamath program command 'show
       usage' shows the number of references.)  (Contributed by NM,
       30-Sep-1992.)  (Proof shortened by Mel L. O'Cat, 20-Oct-2011.)  (Proof
       shortened by Wolf Lammen, 26-Jul-2012.) $)
    syl $p |- ( ph -> ch ) $=
      ( wi a1i mpd ) ABCDBCFAEGH $.
  $}

  ${
    mpi.1 $e |- ps $.
    mpi.2 $e |- ( ph -> ( ps -> ch ) ) $.
    $( A nested modus ponens inference.  Inference associated with ~ com12 .
       (Contributed by NM, 29-Dec-1992.)  (Proof shortened by Stefan Allan,
       20-Mar-2006.) $)
    mpi $p |- ( ph -> ch ) $=
      ( a1i mpd ) ABCBADFEG $.
  $}

  ${
    mpisyl.1 $e |- ( ph -> ps ) $.
    mpisyl.2 $e |- ch $.
    mpisyl.3 $e |- ( ps -> ( ch -> th ) ) $.
    $( A syllogism combined with a modus ponens inference.  (Contributed by
       Alan Sare, 25-Jul-2011.) $)
    mpisyl $p |- ( ph -> th ) $=
      ( mpi syl ) ABDEBCDFGHI $.
  $}

  ${
    mp2OLD.1 $e |- ph $.
    mp2OLD.2 $e |- ps $.
    mp2OLD.3 $e |- ( ph -> ( ps -> ch ) ) $.
    $( Obsolete proof of ~ mp2 as of 21-Jul-2019.  Shorter proof, but uses two
       more axioms.  (Contributed by Wolf Lammen, 23-Jul-2013.)
       (New usage is discouraged.)  (Proof modification is discouraged.) $)
    mp2OLD $p |- ch $=
      ( mpi ax-mp ) ACDABCEFGH $.
  $}

  ${
    3syl.1 $e |- ( ph -> ps ) $.
    3syl.2 $e |- ( ps -> ch ) $.
    3syl.3 $e |- ( ch -> th ) $.
    $( Inference chaining two syllogisms ~ syl .  (Contributed by NM,
       28-Dec-1992.) $)
    3syl $p |- ( ph -> th ) $=
      ( syl ) ACDABCEFHGH $.
  $}

  ${
    4syl.1 $e |- ( ph -> ps ) $.
    4syl.2 $e |- ( ps -> ch ) $.
    4syl.3 $e |- ( ch -> th ) $.
    4syl.4 $e |- ( th -> ta ) $.
    $( Inference chaining three syllogisms ~ syl .  (Contributed by BJ,
       14-Jul-2018.)  The use of this theorem is marked "discouraged" because
       it can cause the "minimize" command to have very long run times.
       However, feel free to use "minimize 4syl /override" if you wish.
       Remember to update the Travis "discouraged" file if it gets used.
       (New usage is discouraged.) $)
    4syl $p |- ( ph -> ta ) $=
      ( 3syl syl ) ADEABCDFGHJIK $.
  $}

  $( Principle of identity.  Theorem *2.08 of [WhiteheadRussell] p. 101.  For
     another version of the proof directly from axioms, see ~ id1 .  Its
     associated inference, ~ idi , requires no axioms for its proof, contrary
     to ~ id .  (Contributed by NM, 29-Dec-1992.)  (Proof shortened by Stefan
     Allan, 20-Mar-2006.) $)
  id $p |- ( ph -> ph ) $=
    ( wi ax-1 mpd ) AAABZAAACAECD $.

  