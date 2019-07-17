Experiment 11: Parameterstudie eines LDO's
==========================================

Kurze Theorie und Motivation
----------------------------
Ziel dieses Experiments ist es, die Parameter des Low Dropout Regulator (LDO) IC TPS7250 zu verstehen. 
Der TPS7250 ist ein Linearregler von Texas Instruments und kann einen Ausgangsstrom von 200 mA bei einer festen 
Ausgangsspannung von 5 V liefern. Er zeichnet sich aus durch einen niedrigen Ruhestrom, geringes Rauschen, 
hohe PSRR, schneller LDO-Start mit ausgezeichnetem Einschwingverhalten. Der Versorgungsspannungsdurchgriff,
(Power supply rejection ratio) gibt an, wie stark sich die Ausgangsspannung eines Verst�rkers �ndert, 
wenn sich die Versorgungsspannung ver�ndert. Die Dropout-Spannung definiert als die Differenz zwischen 
den Eingangs- und den Ausgangsspannungen zu dem Punkt, zu dem ein weiterer Abfall der Eingangsspannung dazu f�hrt, 
dass die Regelung der Ausgangsspannung fehlschl�gt.
Unterschied zu anderen Spannungsreglern. Die minimal erforderliche Differenz zwischen Ein- und 
Ausgangsspannung liegt bei 0,1 V bis 1 V, statt 1,5 V bis 3 V bei anderen Reglern.


Funktionsweise
--------------

.. figure:: img/Experiment_11/low_dropout_regulator.png
	    :name:  11_fig_01
	    :align: center
	   

	    LDO Prizip

Der LDO besteht im Prinzip aus einer Referenzspannung, einem Operationsverst�rker, einem Durchgangselement 
und einem Widerstand am Ausgang. Eine einfache Referenzspannungsquelle kann mit einem Widerstand, 
sowie einer Z-Diode erzeugt werden. Als Durchgangselements wurde ein MOSFET gew�hlt. Er ist daf�r da, 
die Ausgangsspannung durch �nderung des Kanalstromes anzupassen. Er zeichnet sich dadurch aus, dass er 
eine kleinere Dropout-Spannung hat. Da es sich bei dem PMOS-Durchlasselement um ein spannungsgesteuertes 
Ger�t handelt, ist der Ruhestrom sehr niedrig (maximal 300 �A) und �ber den gesamten Bereich des 
Ausgangslaststroms (0 mA bis 200 mA) stabil. Der Operationsverst�rker vergleicht die Spannung, 
welche durch den Spannungsteiler am Ausgang gebildet wird, mit einer Referenzspannung. 
Je nach Eingangsspannungsdifferenz stellt sich eine h�here oder niedrigere Ausgangsspannung am 
Operationsverst�rker ein, so dass die Spannung zwischen Gate und Source des Transistors anw�chst oder 
kleiner wird. Dadurch flie�t mehr oder weniger Strom zum Regler Ausgang.

Aufbau der Schaltung
--------------------
.. figure:: img/Experiment_11/Schematic_diagram_of_on_board_evaluation_module.png
	    :name:  11_fig_02
	    :align: center
	    :scale: 40%

	    on-board Schaltung

-Eingangsspannung: 5,5-11V
-Ausgangsspannung: 5V
-Der Kondensator C102 verbessert die �bergangfunktion des Reglers. 
-Der Kondensator C101 hilft, die St�rungen am Eingang zu reduzieren, wenn die Zuleitungen zu lang sind.
-Der Kondensator C103 am Ausgang dient als Speicher und definiert meist auch die Bandbreite bzw. die Reaktionszeit des LDO.
-Die Diode zeigt, dass der Chip Funktionsf�hig ist


Aufgabe
-------
Ermitteln der Leitungsregelung: 
die Ausgangsspannung als Funktion der Eingangsspannung f�r eine feste Ausgangslast. 

Unter Leitungsregelung versteht man die �nderung der Ausgangsspannung bei einer 
vorgegebenen �nderung der Eingangsspannung. Bei linearen Spannungsreglern sollte die Ausgangsspannung 
m�glichst unabh�ngig von der Eingangsspannung sein. In der Praxis existiert jedoch eine kleine Abh�ngigkeit
zwischen der Ein- und der Ausgangsspannung. Diese Abh�ngigkeit h�ngt stark vom Verst�rkungsfaktor des 
Operationsverst�rkers ab. Bei der Wahl des Verst�rkungsfaktors muss darauf geachtet werden, 
dass die Verst�rkung nicht zu gro� ist. Ein zu gro�er Verst�rkungsfaktor kann die Stabilit�t des Reglers 
beeinflussen.

Ermitteln der Lastregelung: 
Lastregelung wird definiert als die �nderung der Ausgangsspannung bei einer vorgegebenen Last�nderung. 

Wie bei der Leitungsregelung muss ein Regler auch bei einem Lastwechsel in der Lage sein, 
eine konstante Ausgangsspannung zur Verf�gung zu stellen. Dieser Strom wird aber nicht immer 
konstant bleiben und schwanken. 

Leitungsregelung: Schaltungsaufbau - Simulation
------------------------------------------------
Mithilfe der Software LTSpice XII ist es m�glich, den Schaltungsaufbau
zu simulieren. Die Schaltung wird hierbei nach dem Schema aus
:numref:`11_fig_02` entworfen. 

.. figure:: img/Experiment_11/Simulation_der_SchaltungTeil1.png
	    :name:  11_fig_03
	    :align: center
	    :scale: 40%

	    Simulation Leitungsregelung

Leitungsregelung: Vergleich Messung & Simulation
------------------------------------------------
Nachdem die Simulationen f�r die Schaltung durhcgef�hrt sind, werden
die Messungen am Texas Instruments Board durchgef�hrt. Hierdurch kann
ein klarer Vergleich zur Simulation hergestellt werden. 

.. figure:: img/Experiment_11/Vergleich_Messung1_&_Simulation1.png
	    :name:  11_fig_04
	    :align: center
	    

	    Leitungsregelung: Vergleich Messung & Simulation

Die :numref:`11_fig_04` zeigt das Verh�ltnis der Spannungen
:math:`V_{in}` zu :math:`V_{out}`. Die Messung wurden jeweils fuer eine gro�e Last, 
eine kleine Last und ohne Last druchgef�hrt. Die Simulation erfolgte auch ohne Last. 


Lastregelung: Schaltungsaufbau - Simulation
-------------------------------------------
.. figure:: img/Experiment_11/Simulation_Teil2.png
	    :name:  11_fig_05
	    :align: center
	    :scale: 40%

	    Schaltungsaufbau - Simulation


Lastregelung: Vergleich Messung & Simulation
------------------------------------------------

.. figure:: img/Experiment_11/Vergleich_Messung2_&_Simulation2.png
	    :name:  11_fig_06
	    :align: center
	    

	    Lastregelung: Vergleich Messung & Simulation

