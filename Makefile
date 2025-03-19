TAR_DIR   := tool-install
PRIO_DIRS := tool-install tirpc ncurses zlib xz bz2 pcre readline ssl 	\
			lz4 zstd gmp mpfr isl mpc ffi expat iconv ucontext gdbm ul 	\
			nsl sl atomic htop nano bash bu python gdb frida
IGN_DIRS  := make mussel cross
APP_DIRS  := $(PRIO_DIRS) 
TIMEFILE  := .time_start.txt
CMN_CROSS ?= arm-linux-musleabihf

default: start_time clean $(APP_DIRS) stop_time

start_time:
	@echo "#########################################################"
	@echo "STARTING BUILD OF: ${APP_DIRS}"
	@echo "#########################################################"
	@date +%s > $(TIMEFILE)

stop_time:
	@echo "#########################################################"
	@echo "BUILD TOOK $$(($$(date +%s)-$$(cat $(TIMEFILE)))) SECONDS"
	@rm -f $(TIMEFILE)

$(APP_DIRS):
	@if [ -e "$@/makefile" ]; then      								\
	    echo "\033[0;33mBuilding '$@'\033[0m";       					\
	    (cd $@; CMN_CROSS=$(CMN_CROSS) make );							\
        if [ $$? -ne 0 ]; then                          				\
            echo "\033[0;31mBuild target for '$@' failed!\033[0m"; 		\
            exit 1;                                     				\
        fi;                                             				\
	fi

install:
	@for DIR in $(APP_DIRS); do                     		\
        if [ -e "$$DIR/makefile" ]; then            		\
	        echo "\033[0;33mInstalling '$$DIR'\033[0m";		\
	        (cd $$DIR; CMN_CROSS=$(CMN_CROSS) make -s $@); 	\
        fi                                          		\
    done
	@echo "\033[0;33mFINALLY MAKING A TARBALL....\033[0m"
	@(cd $(TAR_DIR); /usr/bin/time -f "Tar took: %E m:s" make tar)

clean:
	@for DIR in $(APP_DIRS); do                     		\
        if [ -e "$$DIR/makefile" ]; then            		\
	        echo "\033[0;33mCleaning '$$DIR'\033[0m";		\
	        (cd $$DIR; make -s $@); 						\
        fi                                          		\
    done

.PHONY: $(APP_DIRS) clean start_time stop_time
