#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

re='^[0-9]+$'
MESSAGE="I could not find that element in the database."

PRINT_INFO() {
    RESULT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;") 
    if [[ -z $RESULT ]]
    then
        echo $MESSAGE
    else
        echo "$RESULT" | while IFS='|' read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS SYMBOL NAME TYPE
        do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        done
    fi
}


if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    ATOMIC_ID=$1
    if ! [[ $1 =~ $re ]]; then
        ATOMIC_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
        if [[ -z $ATOMIC_ID ]]; then
            echo $MESSAGE
        else
            PRINT_INFO $ATOMIC_ID
        fi
    else
        PRINT_INFO $ATOMIC_ID
    fi
fi
