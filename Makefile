# Makefile for WimpIconBorderExample
#

COMPONENT  = WimpIconBorderExample
TYPE       = aif
INCLUDES   = 
LIBS       = ${CLIB}
CDEFINES   = -DTEST
OBJS       = o.borders \
             o.graphics \
             o.testborders

# (from Env:Makefiles.LibraryCommand)
TARGET   = ${COMPONENT}
INCLUDES = -IC:
CLIB     = C:o.stubs
LD      = link
CC      = cc
CMHG    = cmunge
WIPE    = -wipe
CMHGFLAGS   = ${THROWBACK} -p -DCMHG ${INCLUDES}
CFLAGS      = ${THROWBACK} -c -depend !Depend -Wc -fa ${CDEFINES} ${INCLUDES}
CFLAGS_ZM   = ${CFLAGS} -zM -zps1
WFLAGS      = ~c~v
LDFLAGS     = -aif

#
# Rule patterns
#
.SUFFIXES: .o .aif .util .s .c
.c.o:;    ${CC} ${CFLAGS} -o $@ $<
.aif.o:;  ${LD} ${LDFLAGS} -o $@ $<
          ${SQUEEZE} $@

# everything
all: ${TYPE}.${TARGET}
        @echo ${COMPONENT}: All built (Disc)

${TYPE}.${TARGET}: ${OBJS} ${CLIB}
          ${LD} -aif -o aif.${TARGET} ${OBJS} ${LIBS}

#---------------------------------------------------------------------------
# Dynamic dependencies: