nes-forth.nes: ines_header.bin nes-forth.bin smb.chr
	cat $^ > $@

nes-forth.bin nes-forth.labels: nes-forth.o link.cfg
	ld65 -C link.cfg -Ln nes-forth.labels -o $@ $<

nes-forth.o: nes-forth.s
	ca65 $< -g -o $@

ines_header.bin: ines_header.hex
	xxd -r -p $< > $@
