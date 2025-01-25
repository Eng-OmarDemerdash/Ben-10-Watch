	AREA MYDATA, DATA, READONLY

	EXPORT Stopwatch
	EXPORT ArrowSelect
	EXPORT Alarm 
	EXPORT UpArrow	

Stopwatch   DCB 0x00, 0x03, 0xFF, 0xC0, 0x00
			DCB 0x00, 0x07, 0xFF, 0xE0, 0x00
			DCB 0x00, 0x03, 0xFF, 0xC0, 0x00
			DCB 0x00, 0x00, 0x3C, 0x00, 0x00
			DCB 0x00, 0x00, 0x3C, 0x00, 0x00
			DCB 0x00, 0x00, 0xFF, 0x00, 0x00
			DCB 0x00, 0x07, 0xFF, 0xE0, 0x30
			DCB 0x00, 0x1F, 0xFF, 0xF8, 0x78
			DCB 0x00, 0x3F, 0xFF, 0xFC, 0xF0
			DCB 0x00, 0xFF, 0xFF, 0xFF, 0xE0
			DCB 0x01, 0xFF, 0xFF, 0xFF, 0xC0
			DCB 0x03, 0xFF, 0xFF, 0xFF, 0xC0
			DCB 0x03, 0xFF, 0xE7, 0xFF, 0xC0
			DCB 0x07, 0xFF, 0xC3, 0xFF, 0xE0
			DCB 0x0F, 0xFF, 0xC3, 0xFF, 0xF0
			DCB 0x0F, 0xFF, 0xC3, 0xFF, 0xF0
			DCB 0x0F, 0xFF, 0xC3, 0xFF, 0xF0
			DCB 0x1F, 0xFF, 0xC3, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xC3, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xC3, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xC3, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xC3, 0xFF, 0xF8
			DCB 0x3F, 0xFF, 0xC3, 0xFF, 0xFC
			DCB 0x1F, 0xFF, 0xE1, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xE0, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xF0, 0xFF, 0xF8
			DCB 0x1F, 0xFF, 0xF8, 0x7F, 0xF8
			DCB 0x1F, 0xFF, 0xFC, 0x3F, 0xF8
			DCB 0x0F, 0xFF, 0xFC, 0x1F, 0xF0
			DCB 0x0F, 0xFF, 0xFE, 0x1F, 0xF0
			DCB 0x0F, 0xFF, 0xFF, 0x3F, 0xF0
			DCB 0x07, 0xFF, 0xFF, 0xFF, 0xE0
			DCB 0x03, 0xFF, 0xFF, 0xFF, 0xC0
			DCB 0x03, 0xFF, 0xFF, 0xFF, 0xC0
			DCB 0x01, 0xFF, 0xFF, 0xFF, 0x80
			DCB 0x00, 0xFF, 0xFF, 0xFF, 0x00
			DCB 0x00, 0x3F, 0xFF, 0xFC, 0x00
			DCB 0x00, 0x1F, 0xFF, 0xF8, 0x00
			DCB 0x00, 0x07, 0xFF, 0xE0, 0x00
			DCB 0x00, 0x00, 0xFF, 0x00, 0x00
			
Alarm	DCB 0x07, 0x80, 0x00, 0x03, 0xE0
		DCB 0x1F, 0xE0, 0x00, 0x0F, 0xF8
		DCB 0x3F, 0xF0, 0x00, 0x0F, 0xFC
		DCB 0x7F, 0xF8, 0x00, 0x1F, 0xFE
		DCB 0x7F, 0xF0, 0x00, 0x0F, 0xFE
		DCB 0xFF, 0xE0, 0x00, 0x07, 0xFF
		DCB 0xFF, 0xC1, 0xFF, 0x83, 0xFF
		DCB 0xFF, 0x87, 0xFF, 0xE1, 0xFF
		DCB 0xFF, 0x1F, 0xFF, 0xF8, 0xFF
		DCB 0xFE, 0x3F, 0xFF, 0xFC, 0x7E
		DCB 0x7C, 0x7F, 0xFF, 0xFE, 0x3E
		DCB 0x78, 0xFF, 0xFF, 0xFF, 0x1C
		DCB 0x11, 0xFF, 0xE7, 0xFF, 0x88
		DCB 0x03, 0xFF, 0xE7, 0xFF, 0xC0
		DCB 0x03, 0xFF, 0xE7, 0xFF, 0xC0
		DCB 0x07, 0xFF, 0xE7, 0xFF, 0xE0
		DCB 0x07, 0xFF, 0xE7, 0xFF, 0xE0
		DCB 0x07, 0xFF, 0xE7, 0xFF, 0xE0
		DCB 0x07, 0xFF, 0xE7, 0xFF, 0xE0
		DCB 0x0F, 0xFF, 0xE7, 0xFF, 0xF0
		DCB 0x0F, 0xFF, 0xE7, 0xFF, 0xF0
		DCB 0x0F, 0xFF, 0xC7, 0xFF, 0xF0
		DCB 0x0F, 0xFF, 0x87, 0xFF, 0xF0
		DCB 0x0F, 0xFF, 0x8F, 0xFF, 0xF0
		DCB 0x07, 0xFF, 0x1F, 0xFF, 0xE0
		DCB 0x07, 0xFE, 0x1F, 0xFF, 0xE0
		DCB 0x07, 0xFC, 0x3F, 0xFF, 0xE0
		DCB 0x07, 0xFC, 0x7F, 0xFF, 0xC0
		DCB 0x03, 0xFE, 0xFF, 0xFF, 0xC0
		DCB 0x01, 0xFF, 0xFF, 0xFF, 0x80
		DCB 0x01, 0xFF, 0xFF, 0xFF, 0x80
		DCB 0x00, 0xFF, 0xFF, 0xFF, 0x00
		DCB 0x00, 0xFF, 0xFF, 0xFF, 0x00
		DCB 0x00, 0xFF, 0xFF, 0xFF, 0x00
		DCB 0x01, 0xFF, 0xFF, 0xFF, 0x80
		DCB 0x03, 0xC7, 0xFF, 0xE3, 0xC0
		DCB 0x07, 0x80, 0xFF, 0x01, 0xC0
		DCB 0x07, 0x00, 0x00, 0x00, 0xE0
		DCB 0x0F, 0x00, 0x00, 0x00, 0xF0
		DCB 0x06, 0x00, 0x00, 0x00, 0x60\

ArrowSelect DCB 0x00, 0x00, 0x00
            DCB 0x40, 0x00, 0x00
            DCB 0x70, 0x00, 0x00
            DCB 0x3C, 0x00, 0x00
            DCB 0x1F, 0x80, 0x00
            DCB 0x1F, 0xE0, 0x00
            DCB 0x0F, 0xF8, 0x00
            DCB 0x07, 0xFE, 0x00
            DCB 0x07, 0xFF, 0x80
            DCB 0x03, 0xFF, 0xE0
            DCB 0x03, 0xFF, 0xE0
            DCB 0x07, 0xFF, 0x80
            DCB 0x07, 0xFE, 0x00
            DCB 0x0F, 0xF8, 0x00
            DCB 0x1F, 0xE0, 0x00
            DCB 0x1F, 0x80, 0x00
            DCB 0x3C, 0x00, 0x00
            DCB 0x70, 0x00, 0x00
            DCB 0x40, 0x00, 0x00
            DCB 0x00, 0x00, 0x00

RightArrow  DCB 0x30, 0x00, 0x00
            DCB 0x78, 0x00, 0x00
            DCB 0x7E, 0x00, 0x00
            DCB 0x7F, 0x80, 0x00
            DCB 0x7F, 0xE0, 0x00
            DCB 0x7F, 0xF0, 0x00
            DCB 0x7F, 0xFC, 0x00
            DCB 0x7F, 0xFF, 0x00
            DCB 0x7F, 0xFF, 0xC0
            DCB 0x7F, 0xFF, 0xE0
            DCB 0x7F, 0xFF, 0xE0
            DCB 0x7F, 0xFF, 0xC0
            DCB 0x7F, 0xFF, 0x00
            DCB 0x7F, 0xFC, 0x00
            DCB 0x7F, 0xF0, 0x00
            DCB 0x7F, 0xE0, 0x00
            DCB 0x7F, 0x80, 0x00
            DCB 0x7E, 0x00, 0x00
            DCB 0x78, 0x00, 0x00
            DCB 0x30, 0x00, 0x00

LeftArrow   DCB 0x00, 0x00, 0xC0
            DCB 0x00, 0x01, 0xE0
            DCB 0x00, 0x07, 0xE0
            DCB 0x00, 0x1F, 0xE0
            DCB 0x00, 0x7F, 0xE0
            DCB 0x00, 0xFF, 0xE0
            DCB 0x03, 0xFF, 0xE0
            DCB 0x0F, 0xFF, 0xE0
            DCB 0x3F, 0xFF, 0xE0
            DCB 0x7F, 0xFF, 0xE0
            DCB 0x7F, 0xFF, 0xE0
            DCB 0x3F, 0xFF, 0xE0
            DCB 0x0F, 0xFF, 0xE0
            DCB 0x03, 0xFF, 0xE0
            DCB 0x00, 0xFF, 0xE0
            DCB 0x00, 0x7F, 0xE0
            DCB 0x00, 0x1F, 0xE0
            DCB 0x00, 0x07, 0xE0
            DCB 0x00, 0x01, 0xE0
            DCB 0x00, 0x00, 0xC0
			
UpArrow DCB 0x00, 0x00, 0x00
        DCB 0x00, 0x00, 0x00
        DCB 0x00, 0x60, 0x00
        DCB 0x00, 0x60, 0x00
        DCB 0x00, 0xF0, 0x00
        DCB 0x00, 0xF0, 0x00
        DCB 0x01, 0xF8, 0x00
        DCB 0x01, 0xF8, 0x00
        DCB 0x03, 0xFC, 0x00
        DCB 0x07, 0xFC, 0x00
        DCB 0x07, 0xFE, 0x00
        DCB 0x0F, 0xFF, 0x00
        DCB 0x0F, 0xFF, 0x00
        DCB 0x1F, 0xFF, 0x80
        DCB 0x1F, 0xFF, 0x80
        DCB 0x3F, 0xFF, 0xC0
        DCB 0x3F, 0xFF, 0xC0
        DCB 0x7F, 0xFF, 0xE0
        DCB 0x00, 0x00, 0x00
        DCB 0x00, 0x00, 0x00			

	
	END	
		