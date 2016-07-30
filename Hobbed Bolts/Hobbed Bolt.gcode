(Clough42 Hobbed Bolt)
(.125 Flat End Mill)
(2016-01-30)

#101 = -.275 (clearance Y)
#102 = -.307 (waist depth)
#103 = -.346 (tooth depth)
#104 = -.576 (waist position)
#105 = [#104 - .0175] (waist cut 1)
#106 = [#104 + .0175] (waist cut 2)
#107 = -.420 (waist cut height)
#108 = -.324 (tooth cut height)

G90 G94 G91.1 G40 G49 G17 (reset everything)
G20 (inch)

(go to start position)
G0 Z1
X#104 Y#101 A0
G0 Z#107

S2100 M3 (spindle on)
M7 (mist coolant)

(cut Waist)
G0 X#104 Y#101 Z#107
G1 Y#102 F4 (cut in)
G1 X#105 F4 (feed over)
G1 A-1 F8.6 (rotate)
G1 X#106 F4 (feed over)
G1 A-2 F8.6 (rotate again)
G0 Y#101 (retract)

(cut teeth)
G0 X#104 Y#101 Z#108 (tooth cut height)
#100 = -2.0
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
