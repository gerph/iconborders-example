# Makefile for IconBorderExample
#

#
# Program specific options:
#
COMPONENT  = IconBorderExample
EXPORTS    = 
LIBS       = 
CDEFINES   = 
OBJS       = \
             oz.borders \
             oz.veneer \
             oz.graphics \
             oz.header

# (from Env:Makefiles.CModule)
RAM_MODULE = rm.${COMPONENT}
INCLUDES   = -IC:
CLIB         = C:o.stubs
LD      = link
CC      = cc
CMHG    = cmunge
WIPE    = -wipe
CMHGFLAGS   = ${THROWBACK} -p -DCMHG ${INCLUDES}
CFLAGS      = ${THROWBACK} -c -depend !Depend -Wc -fa ${CDEFINES} ${INCLUDES}
CFLAGS_ZM   = ${CFLAGS} -zM -zps1
WFLAGS      = ~c~v

#
# Rule patterns:
#
.SUFFIXES: .o .oz .rm .aof .s .c .cmhg
.c.o:;     ${CC} ${CFLAGS} -o $@ $<
.c.oz:;    ${CC} ${CFLAGS_ZM} -o $@ $<
.cmhg.oz:; ${CMHG} $(CMHGFLAGS) -o $@ $<
.cmhg.h:;  ${CMHG} $(CMHGFLAGS) -d $@ $<

ram: ${RAM_MODULE}
        @echo ${COMPONENT}: Module built (RAM)

clean: ${CLEANTARGET}
        ${WIPE} o.* ${WFLAGS}
        ${WIPE} oz.* ${WFLAGS}
        ${WIPE} rm.* ${WFLAGS}
        @echo ${COMPONENT}: cleaned

${RAM_MODULE}: ${OBJS} ${CSTUBS} ${LIBS}
        ${LD} -rmf ${LDFLAGS} -o $@ ${OBJS} ${CLIB} ${LIBS}

# additional dependencies
oz.veneer: h.header

#---------------------------------------------------------------------------
# Dynamic dependencies:
