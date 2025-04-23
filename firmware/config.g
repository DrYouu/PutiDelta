; DrYouu 14-05-23
; General preferences
G90                                                 ; send absolute coordinates...
M83                                                 ; ...but relative extruder moves
M550 P"PutiDelta"                                ; set printer name
M665 R140 L288.12 B100 H262                         ; Set delta radius, diagonal rod length, printable radius and homed height
M666 X0 Y0 Z0                                       ; put your endstop adjustments here, or let auto calibration find them

; Network
M552 P192.168.0.55 S1                               ; enable network and set IP address
M553 P255.255.255.0                                 ; set netmask
M554 P192.168.0.1                                   ; set gateway
M586 P0 S1                                          ; enable HTTP
M586 P1 S1                                          ; enable FTP
M586 P2 S0                                          ; disable Telnet

; Drives
M569 P0 S0 D2                                        ; physical drive 0 goes backwards
M569 P1 S0 D2                                        ; physical drive 1 goes backwards
M569 P2 S0 D2                                        ; physical drive 2 goes backwards
M569 P4 S1 F4                                         ; physical drive 4 goes forwards
M584 X0 Y1 Z2 E4                                    ; set drive mapping
M350 X16 Y16 Z16 E16 I1                             ; configure microstepping with interpolation
M92 X080.00 Y080.00 Z080.00 E692.00              ; set steps per mm
M566 X300.00 Y300.00 Z300.00 E1200.00               ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z9000.00 E6000.00         ; set maximum speeds (mm/min)
M201 X2500.00 Y2500.00 Z2500.00 E1500.00            ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E500 I50                     ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                             ; Set idle timeout

; Axis Limits
M208 Z0 S1                                          ; set minimum Z

; Endstops
M574 X2 S1 P"xstop"                                 ; configure switch-type (e.g. microswitch) endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                                 ; configure switch-type (e.g. microswitch) endstop for high end on Y via pin ystop
M574 Z2 S1 P"zstop"                                 ; configure switch-type (e.g. microswitch) endstop for high end on Z via pin zstop

; Z-Probe
M558 P8 R0.4 C"zprobe.in+zprobe.mod" H4 F1200 T6000 ; set Z probe type to effector and the dive height + speeds
G31 P100 X0 Y0 Z-0.1                               ; set Z probe trigger value, offset and trigger height
M557 R100 S30                                       ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138      ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                               ; create bed heater output on bedheat and map it to sensor 0
M307 H0 R0.312 K0.294:0.000 D7.93 E1.35 S1.00 B0
M140 H0                                             ; map heated bed to heater 0
M143 H0 S120                                        ; set temperature limit for heater 0 to 120C

M308 S1 P"e1temp" Y"thermistor" T100000 B4267       ; configure sensor 1 as thermistor on pin e1temp
M950 H1 C"e1heat" T1                                ; create nozzle heater output on e1heat and map it to sensor 1
M307 H1 R1.963 K0.244:0.276 D3.54 E1.35 S1.00 B0 V24.0
M143 H1 S260                                        ; set temperature limit for heater 1 to 250C

; Sensor
M308 S11 Y"drivers" A"Duet stepper drivers" ; defines sensor 11 as stepper driver temperature sensor

; Fans
M950 F0 C"fan0" Q500 ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1 C"Print Fan"   ; set fan 0 value. Thermostatic control is turned off

M950 F1 C"fan1" Q500 ; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T30:100   ; set fan 1 value. Thermostatic control is turned on

M308 S3 Y"mcu-temp" A"MCU" ; configure sensor 3 as on-chip MCU temperature sensor
M950 F2 C"fan2" Q500 ; create fan 2 on pin fan2 and set its frequency
M106 P2 H3 T30:40 C"Board Fan"; set fan 2 value

; Tools
M563 P0 S"CHC" D0 H1 F0                           ; define tool 0
G10 P0 X0 Y0 Z0                                     ; set tool 0 axis offsets
G10 P0 R0 S0                                        ; set initial tool 0 active and standby temperatures to 0C

; Custom settings
M950 S0 C"exp.heater3" Q50                          ; assign GPIO port 0 to heater3 on expansion connector, servo mode.
M42 P0 S25                                          ; leds Standby 25step
M912 P0 S-6.5                                    ;mcu tem offset
M207 S0.2 F3000
M572 D0 S0.074
; Miscellaneous                                      
M911 S22 R23 P"G91 M83 G1 Z3 E-5 F1000"             ; set voltage thresholds and actions to run on power loss
T0                                                  ; select first tool

M501  ; load saved parameters from non-volatile memory