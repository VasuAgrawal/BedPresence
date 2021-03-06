EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L bridge_board-rescue:54-00177-54-00177 J1
U 1 1 612B7BBF
P 3800 3650
F 0 "J1" H 3833 4175 50  0000 C CNN
F 1 "54-00177" H 3833 4084 50  0000 C CNN
F 2 "54-00177:54-00177" H 3800 4050 50  0001 C CNN
F 3 "https://tensility.s3-us-west-2.amazonaws.com/uploads/product_doc/document/4373/54-00177.pdf" H 3800 4050 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L 1702473:1702473 J2
U 1 1 612B8589
P 6250 3250
F 0 "J2" H 6778 3253 60  0000 L CNN
F 1 "1702473" H 6778 3147 60  0000 L CNN
F 2 "1702473:1702473" H 6650 3190 60  0001 C CNN
F 3 "" H 6250 3250 60  0000 C CNN
	1    6250 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 612BA8A0
P 5450 3300
F 0 "R1" V 5245 3300 50  0000 C CNN
F 1 "120R" V 5336 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5490 3290 50  0001 C CNN
F 3 "~" H 5450 3300 50  0001 C CNN
	1    5450 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 612BBBDE
P 5450 3850
F 0 "R2" V 5655 3850 50  0000 C CNN
F 1 "120R" V 5564 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5490 3840 50  0001 C CNN
F 3 "~" H 5450 3850 50  0001 C CNN
	1    5450 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R3
U 1 1 612BBF3B
P 6100 3850
F 0 "R3" V 6305 3850 50  0000 C CNN
F 1 "120R" V 6214 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6140 3840 50  0001 C CNN
F 3 "~" H 6100 3850 50  0001 C CNN
	1    6100 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 3350 5050 3350
Wire Wire Line
	5050 3350 5050 3300
Wire Wire Line
	5050 3300 5300 3300
Wire Wire Line
	5050 3350 5050 3850
Wire Wire Line
	5050 3850 5300 3850
Connection ~ 5050 3350
Wire Wire Line
	5600 3300 5800 3300
Wire Wire Line
	5950 3300 5950 3250
Wire Wire Line
	5950 3250 6250 3250
Wire Wire Line
	6250 3850 6250 3600
Wire Wire Line
	6250 3600 6350 3600
Wire Wire Line
	6350 3600 6350 4000
Wire Wire Line
	6350 4000 5150 4000
Wire Wire Line
	4500 4000 4500 3850
Wire Wire Line
	4500 3850 4400 3850
Connection ~ 6250 3600
Wire Wire Line
	6250 3600 6250 3350
Wire Wire Line
	5600 3850 5800 3850
Wire Wire Line
	5800 3850 5800 3950
Wire Wire Line
	5800 3950 4550 3950
Wire Wire Line
	4550 3950 4550 3750
Wire Wire Line
	4550 3750 4400 3750
Connection ~ 5800 3850
Wire Wire Line
	5800 3850 5950 3850
Wire Wire Line
	5800 3300 5800 3450
Wire Wire Line
	5800 3450 5650 3450
Connection ~ 5800 3300
Wire Wire Line
	5800 3300 5950 3300
NoConn ~ 4400 3550
NoConn ~ 4400 3650
Text Label 4650 3350 0    50   ~ 0
3V3
Text Label 5900 4000 0    50   ~ 0
AGND
Text Label 4650 3450 0    50   ~ 0
V1
Text Label 4700 3950 0    50   ~ 0
V2
$Comp
L Connector:TestPoint TP1
U 1 1 612F01C8
P 4650 4350
F 0 "TP1" H 4592 4376 50  0000 R CNN
F 1 "3V3" H 4592 4467 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 4850 4350 50  0001 C CNN
F 3 "~" H 4850 4350 50  0001 C CNN
	1    4650 4350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 612F1E52
P 5150 4350
F 0 "TP2" H 5092 4376 50  0000 R CNN
F 1 "GND" H 5092 4467 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5350 4350 50  0001 C CNN
F 3 "~" H 5350 4350 50  0001 C CNN
	1    5150 4350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 612F22C0
P 5650 4350
F 0 "TP3" H 5592 4376 50  0000 R CNN
F 1 "V1" H 5592 4467 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5850 4350 50  0001 C CNN
F 3 "~" H 5850 4350 50  0001 C CNN
	1    5650 4350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 612F26F0
P 6150 4350
F 0 "TP4" H 6092 4376 50  0000 R CNN
F 1 "V2" H 6092 4467 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 6350 4350 50  0001 C CNN
F 3 "~" H 6350 4350 50  0001 C CNN
	1    6150 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 3850 5050 4200
Wire Wire Line
	5050 4200 4650 4200
Wire Wire Line
	4650 4200 4650 4350
Connection ~ 5050 3850
Wire Wire Line
	5150 4000 5150 4350
Connection ~ 5150 4000
Wire Wire Line
	5150 4000 4500 4000
Wire Wire Line
	5650 3450 5650 4350
Connection ~ 5650 3450
Wire Wire Line
	5650 3450 4400 3450
Wire Wire Line
	5800 3950 5800 4200
Wire Wire Line
	5800 4200 6150 4200
Wire Wire Line
	6150 4200 6150 4350
Connection ~ 5800 3950
$EndSCHEMATC
