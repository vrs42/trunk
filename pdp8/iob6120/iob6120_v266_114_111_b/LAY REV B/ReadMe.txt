Layers:		4
Material:	FR4
Thickness:	0.062"
Dimensions:	6.2" x 4.2"

trace/space:	 7 mil
annuli		 7 mil
Drill		15 mil

Note: board outline is in *.fab, and the top and bottom
copper have NW and SE angles _outside_ the outline.

Files:

*.drl	drill rack
*.drd	Excellon drill file 2.4 trailing
*.fab	fabrication print & drill plan

*.plc	top side silkscreen (+)
*.stc	top side solder mask (-)
*.cmp	top copper (+)
*.l2	layer 2 copper (+)
*.l3	layer 3 copper (-)
*.sol	bottom copper (+)
*.sts	bottom solder mask (-)
*.pls	bottom silkscreen (+)
