all : hlevel2/hq.vo hlevel2/finitesets.vo  Proof_of_Extensionality/funextfun.vo

hlevel2/hq.vo : hlevel2/hq.v hlevel2/hz.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 hq
hlevel2/hz.vo : hlevel2/hz.v hlevel2/hnat.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 hz

hlevel2/finitesets.vo : hlevel2/finitesets.v hlevel2/stnfsets.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 finitesets
hlevel2/stnfsets.vo : hlevel2/stnfsets.v hlevel2/hnat.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 stnfsets

hlevel2/hnat.vo : hlevel2/hnat.v hlevel2/algebra1d.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 hnat
hlevel2/algebra1d.vo : hlevel2/algebra1d.v hlevel2/algebra1c.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 algebra1d
hlevel2/algebra1c.vo : hlevel2/algebra1c.v hlevel2/algebra1b.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 algebra1c
hlevel2/algebra1b.vo : hlevel2/algebra1b.v hlevel2/algebra1a.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 algebra1b
hlevel2/algebra1a.vo : hlevel2/algebra1a.v hlevel2/hSet.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 algebra1a

hlevel2/hSet.vo : hlevel2/hSet.v hlevel1/hProp.vo
	cd hlevel2/ && coqc -no-sharing -R . Foundations.hlevel2 hSet

hlevel1/hProp.vo : hlevel1/hProp.v Generalities/uu0.vo
	cd hlevel1/ && coqc -no-sharing -R . Foundations.hlevel1 hProp

Proof_of_Extensionality/funextfun.vo : Proof_of_Extensionality/funextfun.v Generalities/uu0.vo
	cd Proof_of_Extensionality/ && coqc -no-sharing -R . Foundations.Proof_of_Extensionality funextfun

Generalities/uu0.vo : Generalities/uu0.v Generalities/uuu.vo
	cd Generalities/ && coqc -no-sharing -R . Foundations.Generalities uu0
Generalities/uuu.vo : Generalities/uuu.v
	cd Generalities/ && coqc -no-sharing -R . Foundations.Generalities uuu


clean : 
	rm -f Generalities/*.vo Proof_of_Extensionality/*.vo hlevel1/*.vo hlevel2/*.vo
	rm -f Generalities/*.glob Proof_of_Extensionality/*.glob hlevel1/*.glob hlevel2/*.glob



#
# The following is copied from a makefile generated by coq_makefile V8.3pl5
#


VFILES:=Generalities/uuu.v\
  Generalities/uu0.v\
  Proof_of_Extensionality/funextfun.v\
  hlevel1/hProp.v\
  hlevel2/hSet.v\
  hlevel2/algebra1a.v\
  hlevel2/algebra1b.v\
  hlevel2/algebra1c.v\
  hlevel2/algebra1d.v\
  hlevel2/hnat.v\
  hlevel2/stnfsets.v\
  hlevel2/finitesets.v\
  hlevel2/hz.v\
  hlevel2/hq.v
VOFILES:=$(VFILES:.v=.vo)

COQLIB:=$(shell $(COQBIN)coqtop -where | sed -e 's/\\/\\\\/g')

install : 
	mkdir -p $(COQLIB)/user-contrib
	(for i in $(VOFILES); do \
	 install -d `dirname $(COQLIB)/user-contrib/Foundations/$$i`; \
	 install $$i $(COQLIB)/user-contrib/Foundations/$$i; \
	 done)

