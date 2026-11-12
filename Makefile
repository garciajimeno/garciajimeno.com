# garciajimeno.com — site tasks
#
# The CV LaTeX source lives in cv/ and is gitignored (local only). The copy
# the website serves is static/files/cv.pdf, which IS committed. `make cv`
# rebuilds the source and refreshes that served copy in one step, so the two
# can never drift. After it runs, commit & push to deploy.

.PHONY: cv
cv:
	cd cv && pdflatex -interaction=nonstopmode -halt-on-error cv.tex >/dev/null
	cp cv/cv.pdf static/files/cv.pdf
	@echo "CV rebuilt -> static/files/cv.pdf"
	@echo "To publish: git add static/files/cv.pdf && git commit && git push"
