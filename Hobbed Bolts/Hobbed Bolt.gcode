(Clough42 Hobbed Bolt)
(.125 Flat End Mill)
(2016-01-30)

#101 = -.275 (clearance Y)
#102 = -.307 (waist depth)
#103 = -.346 (tooth depth)
#104 = -.561 (waist position)
#105 = [#104 - .0175 + .006] (waist cut 1 - last term is compensation for measured width)
#106 = [#104 + .0175] (waist cut 2)
#107 = -.420 (waist cut height)
#108 = -.324 (tooth cut height)
#109 = [-1.00 - #101 + .007] (clearance Y on front side - last term is adjustment for off-center)
#110 = [-1.00 - #102 + .007] (waist cut Y on front side - last term is adjustment for off-center)
#111 = 0.00 (Z clearance height)

G90 G94 G91.1 G40 G49 G17 (reset everything)
G20 (inch)

(go to start position)
G0 Z1
X#104 Y#109 A0 (move to clearance position in front)
G0 Z#107

S2100 M3 (spindle on)
M7 (mist coolant)

(cut Waist)
G0 Z#107 (plunge down in front of bolt)
G1 Y#110 F4 (cut in)
G1 X#105 F4 (feed over)
G1 A1 F8.6 (rotate)
G0 Y#109 (pull out)
G0 Z#111 (raise above bolt)
G0 X#104 Y#101 (move to clearance position in back)
G0 Z#107 (plunge down behind bolt)
G1 Y#102 F4 (cut in)
G1 X#106 F4 (feed over)
G1 A0 F8.6 (rotate again)
G0 Y#101 (retract)

(cut teeth)
G0 X#104 Y#101 Z#108 (tooth cut height)
#100 = -0
M98 P0002 L20 (run the tooth cut 20 times)


(unload)
G0 Z6 X#104 Y.5 A0 (unload position)
M5 (spindle off)
M9 (coolant off)
M30 (end and rewind)




(subprogram for individual tooth cut)
O0002
	G0 A#100 (index the A axis)
	(G4 P0.2)
	G1 Y#103 F4 (take a cut to tooth depth)
	G0 Y#101 (retract)
	#100 = [#100 + 0.05]
M99
