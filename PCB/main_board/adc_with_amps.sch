EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 16
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6800 2800 0    50   ~ 0
ADC_CH7
Text Label 4600 2900 2    50   ~ 0
ADC_CH5
Text Label 4600 2800 2    50   ~ 0
ADC_CH4
Text Label 4600 2700 2    50   ~ 0
ADC_CH3
Text Label 4600 2600 2    50   ~ 0
ADC_CH2
Text Label 4600 2500 2    50   ~ 0
ADC_CH1
Text Label 4600 2400 2    50   ~ 0
ADC_CH0
Wire Wire Line
	3500 2000 4600 2000
$Comp
L power:GNDA #PWR?
U 1 1 6192E16E
P 3500 2200
AR Path="/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/61922F04/6192E16E" Ref="#PWR030"  Part="1" 
AR Path="/619E7523/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619E99AF/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619EAC35/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619EBE22/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619ED471/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619EE6C4/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/619EF8F5/6192E16E" Ref="#PWR?"  Part="1" 
AR Path="/61CAC716/6192E16E" Ref="#PWR062"  Part="1" 
AR Path="/61CEFAB0/6192E16E" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 3500 1950 50  0001 C CNN
F 1 "GNDA" H 3505 2027 50  0000 C CNN
F 2 "" H 3500 2200 50  0001 C CNN
F 3 "" H 3500 2200 50  0001 C CNN
	1    3500 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6192E174
P 3500 2100
AR Path="/6192E174" Ref="C?"  Part="1" 
AR Path="/61922F04/6192E174" Ref="C9"  Part="1" 
AR Path="/619E7523/6192E174" Ref="C?"  Part="1" 
AR Path="/619E99AF/6192E174" Ref="C?"  Part="1" 
AR Path="/619EAC35/6192E174" Ref="C?"  Part="1" 
AR Path="/619EBE22/6192E174" Ref="C?"  Part="1" 
AR Path="/619ED471/6192E174" Ref="C?"  Part="1" 
AR Path="/619EE6C4/6192E174" Ref="C?"  Part="1" 
AR Path="/619EF8F5/6192E174" Ref="C?"  Part="1" 
AR Path="/61CAC716/6192E174" Ref="C27"  Part="1" 
AR Path="/61CEFAB0/6192E174" Ref="C45"  Part="1" 
F 0 "C45" H 3592 2146 50  0000 L CNN
F 1 "0.1uF" H 3592 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3500 2100 50  0001 C CNN
F 3 "~" H 3500 2100 50  0001 C CNN
	1    3500 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2000 7500 2000
$Comp
L Device:C_Small C?
U 1 1 6192E17C
P 7500 2100
AR Path="/6192E17C" Ref="C?"  Part="1" 
AR Path="/61922F04/6192E17C" Ref="C10"  Part="1" 
AR Path="/619E7523/6192E17C" Ref="C?"  Part="1" 
AR Path="/619E99AF/6192E17C" Ref="C?"  Part="1" 
AR Path="/619EAC35/6192E17C" Ref="C?"  Part="1" 
AR Path="/619EBE22/6192E17C" Ref="C?"  Part="1" 
AR Path="/619ED471/6192E17C" Ref="C?"  Part="1" 
AR Path="/619EE6C4/6192E17C" Ref="C?"  Part="1" 
AR Path="/619EF8F5/6192E17C" Ref="C?"  Part="1" 
AR Path="/61CAC716/6192E17C" Ref="C28"  Part="1" 
AR Path="/61CEFAB0/6192E17C" Ref="C46"  Part="1" 
F 0 "C46" H 7592 2146 50  0000 L CNN
F 1 "0.1uF" H 7592 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7500 2100 50  0001 C CNN
F 3 "~" H 7500 2100 50  0001 C CNN
	1    7500 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 6192E182
P 7500 2200
AR Path="/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/61922F04/6192E182" Ref="#PWR033"  Part="1" 
AR Path="/619E7523/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619E99AF/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619EAC35/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619EBE22/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619ED471/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619EE6C4/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/619EF8F5/6192E182" Ref="#PWR?"  Part="1" 
AR Path="/61CAC716/6192E182" Ref="#PWR065"  Part="1" 
AR Path="/61CEFAB0/6192E182" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 7500 1950 50  0001 C CNN
F 1 "GNDD" H 7504 2045 50  0000 C CNN
F 2 "" H 7500 2200 50  0001 C CNN
F 3 "" H 7500 2200 50  0001 C CNN
	1    7500 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 6192E188
P 7300 2100
AR Path="/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/61922F04/6192E188" Ref="#PWR032"  Part="1" 
AR Path="/619E7523/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619E99AF/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619EAC35/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619EBE22/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619ED471/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619EE6C4/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/619EF8F5/6192E188" Ref="#PWR?"  Part="1" 
AR Path="/61CAC716/6192E188" Ref="#PWR064"  Part="1" 
AR Path="/61CEFAB0/6192E188" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 7300 1850 50  0001 C CNN
F 1 "GNDD" H 7304 1945 50  0000 C CNN
F 2 "" H 7300 2100 50  0001 C CNN
F 3 "" H 7300 2100 50  0001 C CNN
	1    7300 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 6192E18E
P 3900 2100
AR Path="/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/61922F04/6192E18E" Ref="#PWR031"  Part="1" 
AR Path="/619E7523/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619E99AF/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619EAC35/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619EBE22/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619ED471/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619EE6C4/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/619EF8F5/6192E18E" Ref="#PWR?"  Part="1" 
AR Path="/61CAC716/6192E18E" Ref="#PWR063"  Part="1" 
AR Path="/61CEFAB0/6192E18E" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 3900 1850 50  0001 C CNN
F 1 "GNDA" H 3905 1927 50  0000 C CNN
F 2 "" H 3900 2100 50  0001 C CNN
F 3 "" H 3900 2100 50  0001 C CNN
	1    3900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2100 4600 2100
Wire Wire Line
	4500 2200 4500 2100
Wire Wire Line
	4600 2200 4500 2200
Text Notes 5550 3200 0    50   ~ 0
ADC
Connection ~ 4500 2100
Wire Wire Line
	3900 2100 4500 2100
Wire Wire Line
	6800 2100 7300 2100
Text HLabel 3500 2000 0    50   Input ~ 0
3V3_REF
$Comp
L 2021-08-17_01-02-19:MCP3564-E_ST U?
U 1 1 6192E142
P 4600 2000
AR Path="/6192E142" Ref="U?"  Part="1" 
AR Path="/61922F04/6192E142" Ref="U4"  Part="1" 
AR Path="/619E7523/6192E142" Ref="U?"  Part="1" 
AR Path="/619E99AF/6192E142" Ref="U?"  Part="1" 
AR Path="/619EAC35/6192E142" Ref="U?"  Part="1" 
AR Path="/619EBE22/6192E142" Ref="U?"  Part="1" 
AR Path="/619ED471/6192E142" Ref="U?"  Part="1" 
AR Path="/619EE6C4/6192E142" Ref="U?"  Part="1" 
AR Path="/619EF8F5/6192E142" Ref="U?"  Part="1" 
AR Path="/61CAC716/6192E142" Ref="U9"  Part="1" 
AR Path="/61CEFAB0/6192E142" Ref="U14"  Part="1" 
F 0 "U14" H 5700 2387 60  0000 C CNN
F 1 "MCP3564-E_ST" H 5700 2281 60  0000 C CNN
F 2 "‎MCP3564-E-ST:MCP3564-E&slash_ST" H 5700 2240 60  0001 C CNN
F 3 "" H 4600 2000 60  0000 C CNN
	1    4600 2000
	1    0    0    -1  
$EndComp
Text HLabel 4600 2300 0    50   Input ~ 0
3V3_REF
Text HLabel 6800 2200 2    50   Input ~ 0
ADC_CLK
Text HLabel 6800 2300 2    50   Input ~ 0
ADC_IRQ
Text HLabel 6800 2400 2    50   Input ~ 0
SPI_MISO
Text HLabel 6800 2500 2    50   Input ~ 0
SPI_MOSI
Text HLabel 6800 2600 2    50   Input ~ 0
SPI_SCK
Text HLabel 6800 2700 2    50   Input ~ 0
SPI_CS*
Text HLabel 7500 2000 2    50   Input ~ 0
DVDD
$Sheet
S 3800 4300 1300 1500
U 61994748
F0 "Bridge1" 50
F1 "bridge_interface.sch" 50
F2 "1V65_REF" I R 5100 4500 50 
F3 "ADC_DIFF+" I R 5100 4600 50 
F4 "ADC_DIFF-" I R 5100 4700 50 
$EndSheet
$Sheet
S 6050 4300 1300 1500
U 6199965E
F0 "Bridge2" 50
F1 "bridge_interface.sch" 50
F2 "1V65_REF" I R 7350 4500 50 
F3 "ADC_DIFF+" I R 7350 4600 50 
F4 "ADC_DIFF-" I R 7350 4700 50 
$EndSheet
$Sheet
S 8300 4300 1300 1500
U 6199B12D
F0 "Bridge3" 50
F1 "bridge_interface.sch" 50
F2 "1V65_REF" I R 9600 4500 50 
F3 "ADC_DIFF+" I R 9600 4600 50 
F4 "ADC_DIFF-" I R 9600 4700 50 
$EndSheet
$Sheet
S 1550 4300 1300 1500
U 6192F677
F0 "Bridge0" 50
F1 "bridge_interface.sch" 50
F2 "1V65_REF" I R 2850 4500 50 
F3 "ADC_DIFF+" I R 2850 4600 50 
F4 "ADC_DIFF-" I R 2850 4700 50 
$EndSheet
Text HLabel 2850 4500 2    50   Input ~ 0
1V65_REF
Text HLabel 5100 4500 2    50   Input ~ 0
1V65_REF
Text HLabel 7350 4500 2    50   Input ~ 0
1V65_REF
Text HLabel 9600 4500 2    50   Input ~ 0
1V65_REF
Text Label 2850 4600 0    50   ~ 0
ADC_CH0
Text Label 2850 4700 0    50   ~ 0
ADC_CH1
Text Label 5100 4600 0    50   ~ 0
ADC_CH2
Text Label 5100 4700 0    50   ~ 0
ADC_CH3
Text Label 7350 4600 0    50   ~ 0
ADC_CH4
Text Label 7350 4700 0    50   ~ 0
ADC_CH5
Text Label 6800 2900 0    50   ~ 0
ADC_CH6
Text Label 9600 4600 0    50   ~ 0
ADC_CH6
Text Label 9600 4700 0    50   ~ 0
ADC_CH7
$EndSCHEMATC
