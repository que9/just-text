
#!/bin/bash

# PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# #) <service>. For example, 1) cut, where 1 is the service_id

# LOAD_SERVICES() {
#   SERVICES=$($PSQL "SELECT * FROM services;")
#   echo "$SERVICES" | while IFS='|' read SERVICE_ID NAME ; do
#     echo "$SERVICE_ID) $NAME"
#   done
# }

# MAIN() {

#   LOAD_SERVICES

#   echo "Pick a service :"
#   read SERVICE_NUMBER

#   # Check if the service exists
#   SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_NUMBER")
#   if [[ -z $SERVICE_NAME ]]; then
#     MAIN
#   else
#       echo "Please enter your contact number :"
#       read CONTACT

#       CUTOMER_ID=$($PSQL "SELECT * FROM customers WHERE phone = '$CONTACT'")
#       if [[ -z $CUTOMER_ID ]]; then
#             echo "Please give us below information."
#             echo "Enter your name: "
#             read NAME
#             echo "Enter service time:"
#             read TIME

#             INSERT_USER=$($PSQL "INSERT INTO customers VALUES('$CONTACT', '$NAME')")
#             INSERT_SERVICE=$($PSQL "INSERT INTO appointments VALUES($CUTOMER_ID, $SERVICE_NUMBER, '$TIME')")
#             echo "I have put you down for a $SERVICE_NAME at $TIME, $NAME."
#           else
#             echo "User found"
#       fi
#   fi
# }

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ My Salon ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #get services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  #if services empty
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    MAIN_MENU "System error."
  else
      #display services
      echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
      do
        echo "$SERVICE_ID) $NAME"
      done

      #selected service
      read SERVICE_ID_SELECTED

      #if invalid input
      SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      if [[ -z $SERVICE_NAME_SELECTED ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        BOOKING_MENU
      fi

  fi

}

BOOKING_MENU(){
    #get customer details
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
        #get customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # add new customer to db
        INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

        #get booking time
        echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME"
        read SERVICE_TIME

    else
        #get booking time
        echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME"
        read SERVICE_TIME

    fi

    #get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #insert booking
    INSERT_BOOKING_DETAILS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
