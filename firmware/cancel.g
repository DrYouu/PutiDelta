; stop.g
; called when a print is cancelled after a pause.
G28  ;home
M84  ;motors idle
M144 S0   ;cool down bed
M568 A0    ;cool down heater
M42 P0 S25 ;leds standby