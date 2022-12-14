# REV05: Wed 20 Jul 2022 00:00
# REV04: Fri 15 Jul 2022 06:00
# REV03: Thu 14 Jul 2022 07:00
# REV02: Thu 02 Jun 2022 06:00
# REV01: Sat 29 Jan 2022 13:00
# START: Mon 15 Feb 2021 09:00

SITEURL="doit.vlsm.org"

ALL: 004.md 005.md 006.md 007.md 008.md 009.md .siteHack

004.md: 004.pmd _config.yml Gemfile _layouts/default.html Makefile \
        _includes/navbar.html \
        _includes/footer.html _includes/head.html _includes/google-analytics.html \
	assets/css/style.css assets/scripts/includeScript.py 
	python assets/scripts/includeScript.py < 004.pmd > 004.md

005.md: 005.pmd assets/scripts/sources.list assets/scripts/clean-system.sh \
        assets/scripts/debs.sh 
	python assets/scripts/includeScript.py < 005.pmd > 005.md

006.md: 006.pmd assets/scripts/clean-home.sh \
        assets/scripts/set-rbenv1.sh
	python assets/scripts/includeScript.py < 006.pmd > 006.md

007.md: 007.pmd
	python assets/scripts/includeScript.py < 007.pmd > 007.md

008.md: 008.pmd assets/configs/config-linux-kernel.txt
	python assets/scripts/includeScript.py < 008.pmd > 008.md

009.md: 009.pmd
	python assets/scripts/includeScript.py < 009.pmd > 009.md

.siteHack: _site/sitemap.xml
	@bash  .siteHack $(SITEURL)
	@touch .siteHack

.phony: ALL
