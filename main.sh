#!/bin/sh

# Alliance Mbonigaba
# Cohort 2
# Final Project
# Address book (Question 3)


trap 'do_menu' 2

. ./menu_functions.sh  # import all other functions


#display menuof all functions
show_menu()
{
  
  
  echo
  echo 
  echo
  echo "-- Address Book Menu --"
  echo "1. List items or Search an item"
  echo "2. Add"
  echo "3. Edit"
  echo "4. Remove"
  echo "q. Quit"
  echo -en "Enter your selection: "
}

# A menu with all functionalities
menu()
{
  i=-1

  while [ "$i" != "q" ]; do
    show_menu
    read i
    i=`echo $i | tr '[A-Z]' '[a-z]'`
    case "$i" in 
	"1")
	list_items #list all the items that are available in the book
	;;
	"2")
	add_item #Add an item to a book
	;;
	"3")
	edit_item #Allow user to edit a selected item from the book
	;;
	"4")
	remove_item #Remove an item from the book
	;;
	"q")
	# Let the user know that they are quitting the program!
	echo "You are quitting the program...."
	exit 0
	;;
	*)
	echo "Unrecognised input."
	;;
    esac
  done
}


## Main engine of the program ##


#check the availability and contraints of the book
if [ ! -f $BOOK ]; then
  echo "Creating $BOOK ..."
  touch $BOOK
fi

if [ ! -r $BOOK ]; then
  echo "Error: $BOOK not readable"
  exit 1
fi

if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  exit 2
fi

menu #call menu function
