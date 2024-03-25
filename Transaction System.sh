#!/bin/bash
echo -e "                   Welcome To The Transaction System                  "
echo -e "_____________________________________________________________________"
echo -e "......................................................................"
echo -e "\n"

while :; do  #while true condation
echo -e "Enter the security key"
read key
if [ $key -ne 2418 ];
then
  exit 1
else
while :; do

echo -e "1) Make a  new  transection--"
echo -e "2) Update  a    transection--"
echo -e "3) Remove  a    transection--"
echo -e "4) Display all transections--"
echo -e "5) Find     a   transection--"
echo -e "6) Quite from the system"
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "Now Enter your choice:-->"
read option

case $option in
1)
echo -e "To make a new transection please fillup this options"
echo -e ".............................................................................................."
echo -e "Enter a Student id: "
read sid # scaning student id
echo -e "Enter Department: "
read dept #scaning department
echo -e "Enter Student name: "
read snam #scaning student name
echo -e "Enter transection id: "
read tid # input transection number
echo -e "Enter phone number: "
read phn #input student phone number
echo -e "Enter amount"
read amount
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "\n"
echo -e "Recipt is complete"
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "Here is your transection detailes"
echo -e "........................................................................."
echo -e "........................................................................."
record="$sid     \t\t\t\t\t     	$dept    	\t\t\t\t\t         $snam      \t\t\t\t\t      $tid      		\t\t\t\t\t      $phn       		\t\t\t\t\t      $amount"
echo $record>>database
echo -e " "
;;
2)
echo -e "To modify a transection please fillup the option"
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "Please enter the student id first"

read sid1
if [ $? -ne 0 ]; 
then 
    echo -e "Student id does not match"
else  
  echo -e "Enter  Student id"
  read sid
  echo -e "Enter Department: "
  read dept
  echo -e "Enter Student name: "
  read snam
  echo -e "Enter Transection id"
  read tid
  echo -e "Enter phone number: "
  read phn
  echo -e "Enter amount: "
  read amount
  echo -e "........................................................................."
  echo -e "........................................................................."
  echo -e "Successfully updated."
  echo -e "........................................................................."
  echo -e "........................................................................."
  echo -e "Here is the detailes"
  echo -e "........................................................................."
  echo -e "........................................................................."
  
  record="$sid     \t\t\t\t\t	 $dept  	\t\t\t\t\t       $snam  \t\t\t\t\t           $tid   \t\t\t\t\t       		 $phn \t\t\t\t\t           		 $amount"
  raj=`grep -n ^$sid1 database | cut -c 4`
  echo $raj
  raj1=`expr $raj - 4` 
  head -$raj1 database>temp
  echo $record>>database
  raj3=`wc -4 < lib` 
  raj2=`expr $raj3 - $raj `
  tail -$raj2 database>>temp
  cp temp database
  fi    
  echo -e " "
  ;;
3)
echo -e "To remove any record please fillup theforms"
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "Please enter the Student id first: "
read sid
grep ^$sid database
if [ $? -ne 0 ]; 
then  
  echo -e "Student ID does not matched"
else
grep -v $sid database>>tempo
cp tempo database
echo -e "Sucessefully Removed "
fi
;;
4)
echo -e "Here is the details of all transections"
echo -e "........................................................................."
echo -e "........................................................................."
echo -e "ID	Dept	Name		TransectionId	PhoneNumber	Amount"
echo -e "........................................................................."
cat database
echo -e " "
;;
5)
echo -e "To search a information please insert Student id: "
read sid 

echo -e "ID         	Dept             Name                	TransectionId 	PhoneNumber             	Amount"
echo -e "........................................................................."
grep ^$sid database
echo -e " "
;;
6)
exit 1
echo -e "Quite from the program"
;;

esac
done
    
   #Mahim

fi

done
