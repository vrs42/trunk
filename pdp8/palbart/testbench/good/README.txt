sabr.pa generates an error when assembling with OS/8 PAL since it uses 
label TSK which is a permanent symbol. The label isn't referenced so the 
binary is generated without error. PALBART default handling is to allow
redefinition since it has more permanent symbols so more existing source
conflicts.
