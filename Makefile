all clean:
	@for dir in $$(find * -prune -type d -print ) ; do \
		echo ======================================== ;\
		$(MAKE) -w -C $$dir $(MAKEFLAGS) $(MFLAGS) $@ ;\
	done
	@echo ========================================
