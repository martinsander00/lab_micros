import serial

arduino = serial.Serial(port='/tmp/ttyS1')


import csv
header = ['Set Point', 'Humedad', 'Temp sensada', 'Salida']
data = ['', '', '', '']
arduino = serial.Serial(port='/tmp/ttyS1')

# Abrir file en write mode
f = open('incubadora_resultados.csv', 'w', encoding='UTF8')

# Escribir en el csv
writer = csv.writer(f)
print(header)
writer.writerow(header)  # Header
while True:
    	# Escribe en una fila
    	i = 0
    	search = arduino.readline().decode('utf-8').replace('\r\n', "") 
    	if search == 'loop':       # If start ...
    		for i in range(4):
	    		data[i] = arduino.readline().decode('utf-8')
	    		data[i] = data[i].replace('\r\n', "") 
	    		
	    	print(data)
	    	writer.writerow(data)

    	
f.close()
