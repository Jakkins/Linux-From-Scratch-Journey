#!/bin/bash

clear

# Variabili semplici

var1=24
Var1=25
var2="eh :)"

echo $var1
echo "Io sono = "$Var1
echo $var2

echo ---------------------------------
# Ma why bash legge le cose in questo modo LOL
# bash 01 02 03 li interpreta in ottale e non in decimale

# Array, Sets

# Array 1
Settimana[0]=Lunedi
Settimana[1]="Martedi'"
Settimana[2]="Mer co le di'"

# Array 2
Mesi=(
[0]=gennaio
[1]="febbraio"
)

# Array 3
Valori=( valore1 valore2 valore3 )

echo -Settimana-
echo ${Settimana[*]}
echo ${#Settimana[*]}

echo 
echo -Mesi-
echo ${Mesi[@]}
echo ${#Mesi[@]}

echo ---------------------------------


