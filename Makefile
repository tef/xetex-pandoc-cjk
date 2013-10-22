all: demo.pdf

# A hack for CJK fonts in XeTeX
PANDOC_TEMPLATE=pandoc.template.tex

demo.pdf: $(PANDOC_TEMPLATE)
	pandoc -t latex --template $(PANDOC_TEMPLATE) --latex-engine=xelatex demo.md -o demo.pdf

$(PANDOC_TEMPLATE):
	pandoc -D latex > $(PANDOC_TEMPLATE)
	patch $(PANDOC_TEMPLATE) pandoc.template.diff
	
clean:
	rm -f demo.md $(PANDOC_TEMPLATE)

