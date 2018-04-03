PROC=ppcaltivec

include ../plugin.mak

# Hack so I don't have to rename plugin.cpp and break the windows solution
$(F)ppcaltivec$(O): $(F)plugin$(O)
	mv $(F)plugin$(O) $(F)ppcaltivec$(O)

# MAKEDEP dependency list ------------------
$(F)plugin$(O): $(I)bitrange.hpp $(I)bytes.hpp $(I)config.hpp $(I)fpro.h  \
	          $(I)funcs.hpp $(I)ida.hpp $(I)idp.hpp $(I)kernwin.hpp     \
	          $(I)lines.hpp $(I)llong.hpp $(I)loader.hpp $(I)nalt.hpp   \
	          $(I)netnode.hpp $(I)pro.h $(I)range.hpp $(I)segment.hpp   \
	          $(I)ua.hpp $(I)xref.hpp plugin.cpp
