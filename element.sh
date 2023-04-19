#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
SELECT_ELEMENT() {
  ELEMENTS=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1")
  
  echo "$ELEMENTS" | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  done
}

if [[ -z $1 ]]
then
 echo "Please provide an element as an argument."
else
  if [[ $1 == 1 || $1 == 'H' || $1 == 'Hydrogen' ]]
  then
    SELECT_ELEMENT 1
  elif [[ $1 == 2 || $1 == 'He' || $1 == 'Helium' ]]
  then
    SELECT_ELEMENT 2
  elif [[ $1 == 3 || $1 == 'Li' || $1 == 'Lithium' ]]
  then
    SELECT_ELEMENT 3
  elif [[ $1 == 4 || $1 == 'Be' || $1 == 'Beryllium' ]]
  then
    SELECT_ELEMENT 4
  elif [[ $1 == 5 || $1 == 'B' || $1 == 'Boron' ]]
  then
    SELECT_ELEMENT 5
  elif [[ $1 == 6 || $1 == 'C' || $1 == 'Carbon' ]]
  then
    SELECT_ELEMENT 6
  elif [[ $1 == 7 || $1 == 'N' || $1 == 'Nitrogen' ]]
  then
    SELECT_ELEMENT 7
  elif [[ $1 == 8 || $1 == 'O' || $1 == 'Oxygen' ]]
  then
    SELECT_ELEMENT 8
  elif [[ $1 == 9 || $1 == 'F' || $1 == 'Fluorine' ]]
  then
    SELECT_ELEMENT 9
  elif [[ $1 == 10 || $1 == 'Ne' || $1 == 'Neon' ]]
  then
    SELECT_ELEMENT 10
  else
    echo "I could not find that element in the database."
  fi
fi
