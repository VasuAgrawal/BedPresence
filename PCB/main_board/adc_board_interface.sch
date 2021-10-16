EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5450 3400 0    50   ~ 0
Pico Connector
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J?
U 1 1 618094F4
P 5750 3900
AR Path="/617A926A/618094F4" Ref="J?"  Part="1" 
AR Path="/618094F4" Ref="J?"  Part="1" 
AR Path="/61806277/618094F4" Ref="J3"  Part="1" 
AR Path="/61888512/618094F4" Ref="J4"  Part="1" 
AR Path="/618899A6/618094F4" Ref="J5"  Part="1" 
AR Path="/6188AE00/618094F4" Ref="J6"  Part="1" 
F 0 "J3" H 5800 4317 50  0000 C CNN
F 1 "Conn_02x05_Counter_Clockwise" H 5800 4226 50  0000 C CNN
F 2 "2x5header:PinHeader_2x05_P2.54mm_Vertical_SMD" H 5750 3900 50  0001 C CNN
F 3 "~" H 5750 3900 50  0001 C CNN
	1    5750 3900
	1    0    0    -1  
$EndComp
Text Label 5550 4100 2    50   ~ 0
ADC_CLK
Text Label 6050 3900 0    50   ~ 0
ADC_SCK
Text Label 6050 4100 0    50   ~ 0
ADC_MISO
Text Label 6050 4000 0    50   ~ 0
ADC_MOSI
Wire Wire Line
	6050 3700 6500 3700
Text Label 5550 3900 2    50   ~ 0
ADC_ENABLE
Text Label 5550 4000 2    50   ~ 0
ADC_PGOOD
Wire Wire Line
	5550 3800 5050 3800
Wire Wire Line
	5050 3900 5550 3900
Wire Wire Line
	5050 4000 5550 4000
Wire Wire Line
	5050 4100 5550 4100
Wire Wire Line
	6500 4100 6050 4100
Wire Wire Line
	6500 4000 6050 4000
Wire Wire Line
	6500 3900 6050 3900
Wire Wire Line
	6500 3800 6050 3800
Text Label 5550 3800 2    50   ~ 0
ADC_5V
Text Label 6050 3700 0    50   ~ 0
ADC_3V3
Text Label 5550 3700 2    50   ~ 0
ADC_GND
Wire Wire Line
	5050 3700 5550 3700
Text Label 6050 3800 0    50   ~ 0
ADC_CS
Text HLabel 5050 3700 0    50   Input ~ 0
ADC_GND
Text HLabel 5050 3800 0    50   Input ~ 0
ADC_5V
Text HLabel 5050 3900 0    50   Input ~ 0
ADC_ENABLE
Text HLabel 5050 4000 0    50   Input ~ 0
ADC_PGOOD
Text HLabel 5050 4100 0    50   Input ~ 0
ADC_CLK
Text HLabel 6500 4100 2    50   Input ~ 0
ADC_MISO
Text HLabel 6500 4000 2    50   Input ~ 0
ADC_MOSI
Text HLabel 6500 3900 2    50   Input ~ 0
ADC_SCK
Text HLabel 6500 3800 2    50   Input ~ 0
ADC_CS
Text HLabel 6500 3700 2    50   Input ~ 0
ADC_3V3
$EndSCHEMATC
