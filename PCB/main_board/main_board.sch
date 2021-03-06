EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5700 1200 2    50   ~ 0
UART_TX
Text Label 5700 1300 2    50   ~ 0
UART_RX
Text Label 6300 3300 3    50   ~ 0
SWCLK
Text Label 6500 3300 3    50   ~ 0
SWDIO
Text Label 7100 1300 0    50   ~ 0
VSYS
Wire Wire Line
	6400 3300 6400 3500
Text Label 7100 1200 0    50   ~ 0
USB_VBUS
Text Label 7100 3100 0    50   ~ 0
ADC_MISO
Text Label 7100 2800 0    50   ~ 0
ADC_SCK
Wire Wire Line
	7100 2900 7700 2900
Wire Wire Line
	7100 2400 7700 2400
Wire Wire Line
	7100 1900 7700 1900
Wire Wire Line
	7100 1400 7700 1400
Text Label 7100 2700 0    50   ~ 0
ADC_MOSI
Text Label 7100 2300 0    50   ~ 0
ADC_CLK
Text Label 7100 1600 0    50   ~ 0
PICO_3V3
$Comp
L Connector_Generic:Conn_01x13 J1
U 1 1 61A857D3
P 1100 3150
F 0 "J1" H 1018 2325 50  0000 C CNN
F 1 "Conn_01x13" H 1018 2416 50  0000 C CNN
F 2 "wifi_connector:PinHeader_1x13_P2.54mm_Vertical_SMD_Pin1Left_with_holes" H 1100 3150 50  0001 C CNN
F 3 "~" H 1100 3150 50  0001 C CNN
	1    1100 3150
	-1   0    0    -1  
$EndComp
Text Notes 1050 4200 0    50   ~ 0
WiFi Header
$Comp
L Pico:Pico U1
U 1 1 61363E2C
P 6400 2150
F 0 "U1" H 6400 3365 50  0000 C CNN
F 1 "Pico" H 6400 3274 50  0000 C CNN
F 2 "MCU_RaspberryPi_and_Boards:RPi_Pico_SMD" V 6400 2150 50  0001 C CNN
F 3 "" H 6400 2150 50  0001 C CNN
	1    6400 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 616DFF6D
P 5100 1400
F 0 "#PWR08" H 5100 1150 50  0001 C CNN
F 1 "GND" H 5105 1227 50  0000 C CNN
F 2 "" H 5100 1400 50  0001 C CNN
F 3 "" H 5100 1400 50  0001 C CNN
	1    5100 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 616E04F0
P 5100 1900
F 0 "#PWR09" H 5100 1650 50  0001 C CNN
F 1 "GND" H 5105 1727 50  0000 C CNN
F 2 "" H 5100 1900 50  0001 C CNN
F 3 "" H 5100 1900 50  0001 C CNN
	1    5100 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 616E074C
P 5100 2400
F 0 "#PWR010" H 5100 2150 50  0001 C CNN
F 1 "GND" H 5105 2227 50  0000 C CNN
F 2 "" H 5100 2400 50  0001 C CNN
F 3 "" H 5100 2400 50  0001 C CNN
	1    5100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 616E0B6F
P 5100 2900
F 0 "#PWR011" H 5100 2650 50  0001 C CNN
F 1 "GND" H 5105 2727 50  0000 C CNN
F 2 "" H 5100 2900 50  0001 C CNN
F 3 "" H 5100 2900 50  0001 C CNN
	1    5100 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 616E0EAD
P 7700 2900
F 0 "#PWR023" H 7700 2650 50  0001 C CNN
F 1 "GND" H 7705 2727 50  0000 C CNN
F 2 "" H 7700 2900 50  0001 C CNN
F 3 "" H 7700 2900 50  0001 C CNN
	1    7700 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 616E145D
P 7700 2400
F 0 "#PWR022" H 7700 2150 50  0001 C CNN
F 1 "GND" H 7705 2227 50  0000 C CNN
F 2 "" H 7700 2400 50  0001 C CNN
F 3 "" H 7700 2400 50  0001 C CNN
	1    7700 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 616E18ED
P 7700 1900
F 0 "#PWR021" H 7700 1650 50  0001 C CNN
F 1 "GND" H 7705 1727 50  0000 C CNN
F 2 "" H 7700 1900 50  0001 C CNN
F 3 "" H 7700 1900 50  0001 C CNN
	1    7700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 616E1DAF
P 7700 1400
F 0 "#PWR020" H 7700 1150 50  0001 C CNN
F 1 "GND" H 7705 1227 50  0000 C CNN
F 2 "" H 7700 1400 50  0001 C CNN
F 3 "" H 7700 1400 50  0001 C CNN
	1    7700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 616E4E57
P 6400 3500
F 0 "#PWR015" H 6400 3250 50  0001 C CNN
F 1 "GND" H 6405 3327 50  0000 C CNN
F 2 "" H 6400 3500 50  0001 C CNN
F 3 "" H 6400 3500 50  0001 C CNN
	1    6400 3500
	1    0    0    -1  
$EndComp
Text Label 1300 2550 0    50   ~ 0
WIFI_VIN
Text Label 1300 2650 0    50   ~ 0
WIFI_GND
Text Label 1300 2750 0    50   ~ 0
WIFI_SCK
Text Label 1300 2850 0    50   ~ 0
WIFI_MISO
Text Label 1300 2950 0    50   ~ 0
WIFI_MOSI
Text Label 1300 3050 0    50   ~ 0
WIFI_CS
Text Label 1300 3150 0    50   ~ 0
WIFI_EN
Text Label 1300 3250 0    50   ~ 0
WIFI_IRQ
Text Label 1300 3350 0    50   ~ 0
WIFI_RST
Text Label 1300 3450 0    50   ~ 0
WIFI_WAKE
Text Label 1300 3550 0    50   ~ 0
NC_WIFI_CFG
Text Label 1300 3650 0    50   ~ 0
NC_WIFI_RXD
Text Label 1300 3750 0    50   ~ 0
NC_WIFI_TXD
Text Label 5700 2700 2    50   ~ 0
WIFI_MISO
Text Label 5700 2600 2    50   ~ 0
WIFI_MOSI
Text Label 5700 2500 2    50   ~ 0
WIFI_SCK
Wire Wire Line
	5100 1400 5700 1400
Wire Wire Line
	5100 1900 5700 1900
Wire Wire Line
	5100 2400 5700 2400
Wire Wire Line
	5100 2900 5700 2900
$Comp
L TSM-107-01-T-SV:TSM-107-01-T-SV J?
U 1 1 617B718A
P 1150 1500
AR Path="/617B4D1F/617B718A" Ref="J?"  Part="1" 
AR Path="/617B718A" Ref="J2"  Part="1" 
F 0 "J2" H 1043 2117 50  0000 C CNN
F 1 "TSM-107-01-T-SV" H 1043 2026 50  0000 C CNN
F 2 "TSM-107-01-T-SV:SAMTEC_TSM-107-01-T-SV" H 1150 1500 50  0001 L BNN
F 3 "" H 1150 1500 50  0001 L BNN
F 4 "SAMTEC" H 1150 1500 50  0001 L BNN "MANUFACTURER"
	1    1150 1500
	-1   0    0    -1  
$EndComp
Text Label 1550 1400 0    50   ~ 0
SWCLK
Text Label 1550 1600 0    50   ~ 0
SWDIO
Text Label 1550 1800 0    50   ~ 0
VSYS
Text Label 1550 1300 0    50   ~ 0
UART_RX
Text Label 1550 1200 0    50   ~ 0
UART_TX
$Comp
L power:GND #PWR?
U 1 1 617B7195
P 1950 1500
AR Path="/617B4D1F/617B7195" Ref="#PWR?"  Part="1" 
AR Path="/617B7195" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 1950 1250 50  0001 C CNN
F 1 "GND" H 1955 1327 50  0000 C CNN
F 2 "" H 1950 1500 50  0001 C CNN
F 3 "" H 1950 1500 50  0001 C CNN
	1    1950 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 617B719B
P 1850 1700
AR Path="/617B4D1F/617B719B" Ref="#PWR?"  Part="1" 
AR Path="/617B719B" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 1850 1450 50  0001 C CNN
F 1 "GND" H 1855 1527 50  0000 C CNN
F 2 "" H 1850 1700 50  0001 C CNN
F 3 "" H 1850 1700 50  0001 C CNN
	1    1850 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1700 1850 1700
Wire Wire Line
	1550 1500 1950 1500
Text Notes 950  800  0    50   ~ 0
Debug Header
$Comp
L power:+3V3 #PWR?
U 1 1 617F2F17
P 7950 1600
AR Path="/617A926A/617F2F17" Ref="#PWR?"  Part="1" 
AR Path="/617F2F17" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 7950 1450 50  0001 C CNN
F 1 "+3V3" H 7965 1773 50  0000 C CNN
F 2 "" H 7950 1600 50  0001 C CNN
F 3 "" H 7950 1600 50  0001 C CNN
	1    7950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1600 7950 1600
$Comp
L power:+5V #PWR?
U 1 1 617F44AF
P 7700 1200
AR Path="/617A926A/617F44AF" Ref="#PWR?"  Part="1" 
AR Path="/617F44AF" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7700 1050 50  0001 C CNN
F 1 "+5V" H 7715 1373 50  0000 C CNN
F 2 "" H 7700 1200 50  0001 C CNN
F 3 "" H 7700 1200 50  0001 C CNN
	1    7700 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1200 7700 1200
$Sheet
S 1600 4750 1050 1350
U 61806277
F0 "Sheet61806276" 50
F1 "adc_board_interface.sch" 50
F2 "ADC_GND" I R 2650 4850 50 
F3 "ADC_5V" I R 2650 4950 50 
F4 "ADC_ENABLE" I R 2650 5050 50 
F5 "ADC_PGOOD" I R 2650 5150 50 
F6 "ADC_CLK" I R 2650 5250 50 
F7 "ADC_MISO" I R 2650 5350 50 
F8 "ADC_MOSI" I R 2650 5450 50 
F9 "ADC_SCK" I R 2650 5550 50 
F10 "ADC_CS" I R 2650 5650 50 
F11 "ADC_3V3" I R 2650 5750 50 
$EndSheet
$Comp
L power:GND #PWR07
U 1 1 6180ED9C
P 3250 4850
F 0 "#PWR07" H 3250 4600 50  0001 C CNN
F 1 "GND" H 3255 4677 50  0000 C CNN
F 2 "" H 3250 4850 50  0001 C CNN
F 3 "" H 3250 4850 50  0001 C CNN
	1    3250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4850 3250 4850
$Comp
L power:+5V #PWR?
U 1 1 61810051
P 3100 4750
AR Path="/617A926A/61810051" Ref="#PWR?"  Part="1" 
AR Path="/61810051" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3100 4600 50  0001 C CNN
F 1 "+5V" H 3115 4923 50  0000 C CNN
F 2 "" H 3100 4750 50  0001 C CNN
F 3 "" H 3100 4750 50  0001 C CNN
	1    3100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4750 3100 4950
Wire Wire Line
	3100 4950 2650 4950
Text Label 2650 5350 0    50   ~ 0
ADC_MISO
Text Label 2650 5550 0    50   ~ 0
ADC_SCK
Text Label 2650 5450 0    50   ~ 0
ADC_MOSI
Text Label 2650 5250 0    50   ~ 0
ADC_CLK
$Comp
L power:+3V3 #PWR?
U 1 1 6181A43F
P 1750 2550
AR Path="/617A926A/6181A43F" Ref="#PWR?"  Part="1" 
AR Path="/6181A43F" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1750 2400 50  0001 C CNN
F 1 "+3V3" H 1765 2723 50  0000 C CNN
F 2 "" H 1750 2550 50  0001 C CNN
F 3 "" H 1750 2550 50  0001 C CNN
	1    1750 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2550 1750 2550
$Comp
L power:GND #PWR?
U 1 1 6181BF38
P 2150 2400
AR Path="/617B4D1F/6181BF38" Ref="#PWR?"  Part="1" 
AR Path="/6181BF38" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2150 2150 50  0001 C CNN
F 1 "GND" H 2155 2227 50  0000 C CNN
F 2 "" H 2150 2400 50  0001 C CNN
F 3 "" H 2150 2400 50  0001 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2650 2000 2650
Wire Wire Line
	2000 2650 2000 2400
Wire Wire Line
	2000 2400 2150 2400
Text Label 5700 2800 2    50   ~ 0
WIFI_CS
Wire Wire Line
	1300 3150 1800 3150
Wire Wire Line
	1800 3150 1800 3450
Wire Wire Line
	1800 3450 1300 3450
Text Label 5700 3000 2    50   ~ 0
WIFI_EN
Text Label 5700 3100 2    50   ~ 0
WIFI_IRQ
Text Label 5700 2300 2    50   ~ 0
WIFI_RST
NoConn ~ 1300 3550
NoConn ~ 1300 3650
NoConn ~ 1300 3750
NoConn ~ 7100 1500
NoConn ~ 7100 1700
$Comp
L power:+3V3 #PWR?
U 1 1 618791BA
P 3100 5750
AR Path="/617A926A/618791BA" Ref="#PWR?"  Part="1" 
AR Path="/618791BA" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 3100 5600 50  0001 C CNN
F 1 "+3V3" H 3115 5923 50  0000 C CNN
F 2 "" H 3100 5750 50  0001 C CNN
F 3 "" H 3100 5750 50  0001 C CNN
	1    3100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5750 3100 5750
Text Label 2650 5650 0    50   ~ 0
ADC0_CS
$Sheet
S 3750 4800 1050 1350
U 61888512
F0 "sheet61888506" 50
F1 "adc_board_interface.sch" 50
F2 "ADC_GND" I R 4800 4900 50 
F3 "ADC_5V" I R 4800 5000 50 
F4 "ADC_ENABLE" I R 4800 5100 50 
F5 "ADC_PGOOD" I R 4800 5200 50 
F6 "ADC_CLK" I R 4800 5300 50 
F7 "ADC_MISO" I R 4800 5400 50 
F8 "ADC_MOSI" I R 4800 5500 50 
F9 "ADC_SCK" I R 4800 5600 50 
F10 "ADC_CS" I R 4800 5700 50 
F11 "ADC_3V3" I R 4800 5800 50 
$EndSheet
$Comp
L power:GND #PWR014
U 1 1 61888518
P 5400 4900
F 0 "#PWR014" H 5400 4650 50  0001 C CNN
F 1 "GND" H 5405 4727 50  0000 C CNN
F 2 "" H 5400 4900 50  0001 C CNN
F 3 "" H 5400 4900 50  0001 C CNN
	1    5400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4900 5400 4900
$Comp
L power:+5V #PWR?
U 1 1 6188851F
P 5250 4800
AR Path="/617A926A/6188851F" Ref="#PWR?"  Part="1" 
AR Path="/6188851F" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 5250 4650 50  0001 C CNN
F 1 "+5V" H 5265 4973 50  0000 C CNN
F 2 "" H 5250 4800 50  0001 C CNN
F 3 "" H 5250 4800 50  0001 C CNN
	1    5250 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4800 5250 5000
Wire Wire Line
	5250 5000 4800 5000
Text Label 4800 5400 0    50   ~ 0
ADC_MISO
Text Label 4800 5600 0    50   ~ 0
ADC_SCK
Text Label 4800 5500 0    50   ~ 0
ADC_MOSI
Text Label 4800 5300 0    50   ~ 0
ADC_CLK
$Comp
L power:+3V3 #PWR?
U 1 1 6188852B
P 5250 5800
AR Path="/617A926A/6188852B" Ref="#PWR?"  Part="1" 
AR Path="/6188852B" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 5250 5650 50  0001 C CNN
F 1 "+3V3" H 5265 5973 50  0000 C CNN
F 2 "" H 5250 5800 50  0001 C CNN
F 3 "" H 5250 5800 50  0001 C CNN
	1    5250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5800 5250 5800
Text Label 4800 5100 0    50   ~ 0
ADC1_ENABLE
$Sheet
S 5800 4800 1050 1350
U 618899A6
F0 "sheet6188999A" 50
F1 "adc_board_interface.sch" 50
F2 "ADC_GND" I R 6850 4900 50 
F3 "ADC_5V" I R 6850 5000 50 
F4 "ADC_ENABLE" I R 6850 5100 50 
F5 "ADC_PGOOD" I R 6850 5200 50 
F6 "ADC_CLK" I R 6850 5300 50 
F7 "ADC_MISO" I R 6850 5400 50 
F8 "ADC_MOSI" I R 6850 5500 50 
F9 "ADC_SCK" I R 6850 5600 50 
F10 "ADC_CS" I R 6850 5700 50 
F11 "ADC_3V3" I R 6850 5800 50 
$EndSheet
$Comp
L power:GND #PWR018
U 1 1 618899AC
P 7450 4900
F 0 "#PWR018" H 7450 4650 50  0001 C CNN
F 1 "GND" H 7455 4727 50  0000 C CNN
F 2 "" H 7450 4900 50  0001 C CNN
F 3 "" H 7450 4900 50  0001 C CNN
	1    7450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4900 7450 4900
$Comp
L power:+5V #PWR?
U 1 1 618899B3
P 7300 4800
AR Path="/617A926A/618899B3" Ref="#PWR?"  Part="1" 
AR Path="/618899B3" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 7300 4650 50  0001 C CNN
F 1 "+5V" H 7315 4973 50  0000 C CNN
F 2 "" H 7300 4800 50  0001 C CNN
F 3 "" H 7300 4800 50  0001 C CNN
	1    7300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4800 7300 5000
Wire Wire Line
	7300 5000 6850 5000
Text Label 6850 5400 0    50   ~ 0
ADC_MISO
Text Label 6850 5600 0    50   ~ 0
ADC_SCK
Text Label 6850 5500 0    50   ~ 0
ADC_MOSI
Text Label 6850 5300 0    50   ~ 0
ADC_CLK
$Comp
L power:+3V3 #PWR?
U 1 1 618899BF
P 7300 5800
AR Path="/617A926A/618899BF" Ref="#PWR?"  Part="1" 
AR Path="/618899BF" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 7300 5650 50  0001 C CNN
F 1 "+3V3" H 7315 5973 50  0000 C CNN
F 2 "" H 7300 5800 50  0001 C CNN
F 3 "" H 7300 5800 50  0001 C CNN
	1    7300 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5800 7300 5800
$Sheet
S 7950 4800 1050 1350
U 6188AE00
F0 "sheet6188ADF4" 50
F1 "adc_board_interface.sch" 50
F2 "ADC_GND" I R 9000 4900 50 
F3 "ADC_5V" I R 9000 5000 50 
F4 "ADC_ENABLE" I R 9000 5100 50 
F5 "ADC_PGOOD" I R 9000 5200 50 
F6 "ADC_CLK" I R 9000 5300 50 
F7 "ADC_MISO" I R 9000 5400 50 
F8 "ADC_MOSI" I R 9000 5500 50 
F9 "ADC_SCK" I R 9000 5600 50 
F10 "ADC_CS" I R 9000 5700 50 
F11 "ADC_3V3" I R 9000 5800 50 
$EndSheet
$Comp
L power:GND #PWR030
U 1 1 6188AE06
P 9600 4900
F 0 "#PWR030" H 9600 4650 50  0001 C CNN
F 1 "GND" H 9605 4727 50  0000 C CNN
F 2 "" H 9600 4900 50  0001 C CNN
F 3 "" H 9600 4900 50  0001 C CNN
	1    9600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4900 9600 4900
$Comp
L power:+5V #PWR?
U 1 1 6188AE0D
P 9450 4800
AR Path="/617A926A/6188AE0D" Ref="#PWR?"  Part="1" 
AR Path="/6188AE0D" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 9450 4650 50  0001 C CNN
F 1 "+5V" H 9465 4973 50  0000 C CNN
F 2 "" H 9450 4800 50  0001 C CNN
F 3 "" H 9450 4800 50  0001 C CNN
	1    9450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4800 9450 5000
Wire Wire Line
	9450 5000 9000 5000
Text Label 9000 5400 0    50   ~ 0
ADC_MISO
Text Label 9000 5600 0    50   ~ 0
ADC_SCK
Text Label 9000 5500 0    50   ~ 0
ADC_MOSI
Text Label 9000 5300 0    50   ~ 0
ADC_CLK
$Comp
L power:+3V3 #PWR?
U 1 1 6188AE19
P 9450 5800
AR Path="/617A926A/6188AE19" Ref="#PWR?"  Part="1" 
AR Path="/6188AE19" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 9450 5650 50  0001 C CNN
F 1 "+3V3" H 9465 5973 50  0000 C CNN
F 2 "" H 9450 5800 50  0001 C CNN
F 3 "" H 9450 5800 50  0001 C CNN
	1    9450 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5800 9450 5800
Text Label 4800 5200 0    50   ~ 0
ADC1_PGOOD
Text Label 4800 5700 0    50   ~ 0
ADC1_CS
Text Label 6850 5100 0    50   ~ 0
ADC2_ENABLE
Text Label 6850 5200 0    50   ~ 0
ADC2_PGOOD
Text Label 6850 5700 0    50   ~ 0
ADC2_CS
Text Label 9000 5100 0    50   ~ 0
ADC3_ENABLE
Text Label 9000 5200 0    50   ~ 0
ADC3_PGOOD
Text Label 9000 5700 0    50   ~ 0
ADC3_CS
NoConn ~ 5700 1800
NoConn ~ 7100 2200
Text Label 2650 5150 0    50   ~ 0
ADC0_PGOOD
Text Label 2650 5050 0    50   ~ 0
ADC0_ENABLE
Text Label 5700 1600 2    50   ~ 0
ADC0_PGOOD
Text Label 5700 1700 2    50   ~ 0
ADC0_ENABLE
Text Label 5700 1500 2    50   ~ 0
ADC0_CS
Text Label 5700 2100 2    50   ~ 0
ADC1_PGOOD
Text Label 5700 2200 2    50   ~ 0
ADC1_ENABLE
Text Label 5700 2000 2    50   ~ 0
ADC1_CS
Text Label 7100 2600 0    50   ~ 0
ADC2_PGOOD
Text Label 7100 2500 0    50   ~ 0
ADC2_ENABLE
Text Label 7100 3000 0    50   ~ 0
ADC2_CS
Text Label 7100 2000 0    50   ~ 0
ADC3_PGOOD
Text Label 7100 1800 0    50   ~ 0
ADC3_ENABLE
Text Label 7100 2100 0    50   ~ 0
ADC3_CS
$Comp
L power:PWR_FLAG #FLG01
U 1 1 618DCE93
P 8700 2950
F 0 "#FLG01" H 8700 3025 50  0001 C CNN
F 1 "PWR_FLAG" H 8700 3123 50  0000 C CNN
F 2 "" H 8700 2950 50  0001 C CNN
F 3 "~" H 8700 2950 50  0001 C CNN
	1    8700 2950
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 618DFC7D
P 9150 2950
F 0 "#FLG02" H 9150 3025 50  0001 C CNN
F 1 "PWR_FLAG" H 9150 3123 50  0000 C CNN
F 2 "" H 9150 2950 50  0001 C CNN
F 3 "~" H 9150 2950 50  0001 C CNN
	1    9150 2950
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 618E0A37
P 9600 2950
F 0 "#FLG03" H 9600 3025 50  0001 C CNN
F 1 "PWR_FLAG" H 9600 3123 50  0000 C CNN
F 2 "" H 9600 2950 50  0001 C CNN
F 3 "~" H 9600 2950 50  0001 C CNN
	1    9600 2950
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 618E1E44
P 9600 2950
AR Path="/617A926A/618E1E44" Ref="#PWR?"  Part="1" 
AR Path="/618E1E44" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 9600 2800 50  0001 C CNN
F 1 "+3V3" H 9615 3123 50  0000 C CNN
F 2 "" H 9600 2950 50  0001 C CNN
F 3 "" H 9600 2950 50  0001 C CNN
	1    9600 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 618E24EA
P 8700 2950
AR Path="/617A926A/618E24EA" Ref="#PWR?"  Part="1" 
AR Path="/618E24EA" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 8700 2800 50  0001 C CNN
F 1 "+5V" H 8715 3123 50  0000 C CNN
F 2 "" H 8700 2950 50  0001 C CNN
F 3 "" H 8700 2950 50  0001 C CNN
	1    8700 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 618E29EC
P 9150 2950
F 0 "#PWR026" H 9150 2700 50  0001 C CNN
F 1 "GND" H 9155 2777 50  0000 C CNN
F 2 "" H 9150 2950 50  0001 C CNN
F 3 "" H 9150 2950 50  0001 C CNN
	1    9150 2950
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 618EB031
P 10050 2950
F 0 "#FLG04" H 10050 3025 50  0001 C CNN
F 1 "PWR_FLAG" H 10050 3123 50  0000 C CNN
F 2 "" H 10050 2950 50  0001 C CNN
F 3 "~" H 10050 2950 50  0001 C CNN
	1    10050 2950
	-1   0    0    1   
$EndComp
Text Label 10050 2950 0    50   ~ 0
VSYS
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6165610D
P 3300 1950
F 0 "H2" H 3400 1999 50  0000 L CNN
F 1 "MountingHole_Pad" H 3400 1908 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3300 1950 50  0001 C CNN
F 3 "~" H 3300 1950 50  0001 C CNN
	1    3300 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 61658045
P 3300 2050
F 0 "#PWR032" H 3300 1800 50  0001 C CNN
F 1 "GND" H 3305 1877 50  0000 C CNN
F 2 "" H 3300 2050 50  0001 C CNN
F 3 "" H 3300 2050 50  0001 C CNN
	1    3300 2050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6165B58E
P 3300 2450
F 0 "H3" H 3400 2499 50  0000 L CNN
F 1 "MountingHole_Pad" H 3400 2408 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3300 2450 50  0001 C CNN
F 3 "~" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 6165B594
P 3300 2550
F 0 "#PWR033" H 3300 2300 50  0001 C CNN
F 1 "GND" H 3305 2377 50  0000 C CNN
F 2 "" H 3300 2550 50  0001 C CNN
F 3 "" H 3300 2550 50  0001 C CNN
	1    3300 2550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6165C723
P 3300 2950
F 0 "H4" H 3400 2999 50  0000 L CNN
F 1 "MountingHole_Pad" H 3400 2908 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3300 2950 50  0001 C CNN
F 3 "~" H 3300 2950 50  0001 C CNN
	1    3300 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 6165C729
P 3300 3050
F 0 "#PWR034" H 3300 2800 50  0001 C CNN
F 1 "GND" H 3305 2877 50  0000 C CNN
F 2 "" H 3300 3050 50  0001 C CNN
F 3 "" H 3300 3050 50  0001 C CNN
	1    3300 3050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 6165D642
P 3300 1450
F 0 "H1" H 3400 1499 50  0000 L CNN
F 1 "MountingHole_Pad" H 3400 1408 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3300 1450 50  0001 C CNN
F 3 "~" H 3300 1450 50  0001 C CNN
	1    3300 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 6165D648
P 3300 1550
F 0 "#PWR031" H 3300 1300 50  0001 C CNN
F 1 "GND" H 3305 1377 50  0000 C CNN
F 2 "" H 3300 1550 50  0001 C CNN
F 3 "" H 3300 1550 50  0001 C CNN
	1    3300 1550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
