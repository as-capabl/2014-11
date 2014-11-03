
.SUFFIXES : .txt .tex .dvi .pdf 
.PHONY : all

# variable
ENC = ja_JP.utf8

SRCDIR=../src

TTT=../common/ttt.rb

FROMSJIS=iconv -f cp932 -t utf-8 < "$<" | tr -d \\r | LC_CTYPE="ja_JP.utf-8" ruby -Ku $(TTT) > $@

#FROMUTF=cat < "$<"  | tr -d \\r | LC_CTYPE="ja_JP.utf-8" ruby -Ku ttt.rb > $@
FROMUTF=iconv -f utf-8 -t utf-8 < "$<"  | tr -d \\r | LC_CTYPE="ja_JP.utf-8" ruby -Ku $(TTT) > $@

FROMUTF16=iconv -f utf-16le -t utf-8 < "$<"  | tr -d \\r | LC_CTYPE="ja_JP.utf-8" ruby -Ku $(TTT) > $@

#goal
all : as_capabl.pdf
	cp $< ../

# system
as_capabl.pdf : as_capabl.dvi cid-x.map
	dvipdfmx -p a5 -f cid-x.map $<

texinputs :
	export TEXINPUTS=../sashie/:../tobira:

as_capabl.dvi : \
texinputs \
as_capabl.tex \
1-classroom.tex \
a5book.cls \
indent.sty \
my_layout.sty

#

# common
COMMON=../common

as_capabl.tex : $(SRCDIR)/as_capabl.tex
	cp $< $@

a5book.cls : $(COMMON)/a5book.cls
	cp $< $@

cid-x.map : $(COMMON)/cid-x.map
	cp $< $@

indent.sty : $(COMMON)/indent.sty
	cp $< $@

my_layout.sty : $(COMMON)/my_layout.sty
	cp $< $@

# text
1-classroom.tex : $(SRCDIR)/1-classroom.txt
	$(FROMUTF)


.tex.dvi :
	platex $<
