MD	= $(wildcard md*)
A	= $(wildcard a*)
ALL	= $(MD) $(A)

test:	files.txt
	./collisions

files.txt: $(ALL)
	./tofiles $(ALL)
