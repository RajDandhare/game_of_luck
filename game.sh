#!/bin/bash

echo "Wellcome Traveler!. Select your Charater:
1 - Samurai
2 - Prisoner
3 - Warrior
4 - Hero"
read -p "-> " ch

wins=0

function opt()
{
	#echo -e "  Attack. (atk)\n  Defence. (def)"
	read -p "
	Attack. (atk)
      	Defence. (def)
       	=> " atd
	echo -e "\n"
}

function defs()
{
        def=0
        echo -e "Your Defence is '0' you cannot defend!!!\n"
}

function lvl1()
{
  #Level 1
  echo -e "Your First fight with Beast. Get Ready!!!\n" 
  sleep 3

  beast=25
  
  while [ $beast -gt 0 ] && [ $hp -gt 0 ];
  do
	opt
  	batk=$(($RANDOM%2+1))
	if [[ $atd == "atk" ]];
	then
		hp=$((hp-batk))
		beast=$((beast-atk))
	else
		if [[ $def -le 0 ]];
                then
			defs
                        hp=$((hp-batk))
                else
                        beast=$((beast-($RANDOM%atk)));
		       	def=$((def-batk%2))
                fi
	
	fi

        if [[ $beast -lt 0 ]] && [[ $hp -lt 0 ]];
        then
                echo -e "You Sacrifice yourself to save the World!!, But There are still some enimes left to Defete.\n"
        fi

	if [[ $beast -lt 0 ]];
	then
		win=1
		beast=0
	fi
	if [[ $hp -lt 0 ]];
	then
		win=0
		hp=0
	fi       
	
	echo -e "\n$type : HP $hp 	DEF $def\n Beast : HP $beast\n"

  done

  if [[ $win == 1 ]]; 
  then
	  wins=$((wins+1))
  	  echo -e "Beast VANQUISHED!! Congrats fellow Travler\n"
  else 
	echo "You Died!!!"
        exit 1	
  fi
}

function lvl2()
{
  #Level 2
 
  echo -e "Your Second fight with Vampire. Get Ready!!!\n"
  sleep 3
  vamp=30

  while [ $vamp -gt 0 ] && [ $hp -gt 0 ];
  do
	opt
  	vatk=$(($RANDOM%3+1))
        if [[ $atd -eq "atk" ]];
	then
		hp=$((hp-vatk))
        	vamp=$((vamp-atk))
	else
		if [[ $def -le 0 ]];
                then
			defs
			echo -e "Your Defence is '0' you cannot defend!!!\n"
                else
                        def=$((def-vatk%3))
                        vamp=$((vamp-($RANDOM%atk)));
                fi
	fi

	if [[ $vamp -lt 0 ]] && [[ $hp -lt 0 ]];
        then
                echo -e "You Sacrifice yourself to save the World!!, But There are still some enimes left to Defete\n"
        fi


        if [[ $vamp -lt 0 ]];
        then
                win=1
		vamp=0
        fi 
        
	if [[ $hp -lt 0 ]];
        then
                win=0
		hp=0
        fi

	echo -e "\n$type : HP $hp 	DEF $def \nVampier : HP $vamp\n"


  done

  if [[ $win == 1 ]];
  then
	  wins=$((wins+1))
          echo -e "Vampier VANQUISHED!! Congrats fellow Travler\n"
  else
        echo "You Died!!!\n"
        exit 1
  fi
}

function lvl3()
{
  #Level 3

  echo -e "Your Third Fight with Green Goblin. Get Ready!!!\n"
  sleep 3

  gob=40

  while [ $gob -gt 0 ] && [ $hp -gt 0 ];
  do
	opt
	if [[ $atd == "Spiderman" ]];
	then
		win=1
		sleep 2
		echo -e "Spiderman come to Rescue!!!!"
		break
	fi
  	gatk=$(($RANDOM%4+1))        
	if [[ $atd -eq "atk" ]];
	then
		hp=$((hp-gatk))
        	gob=$((gob-atk))
	else
		if [[ $def -le 0 ]];
		then
			defs
			hp=$((hp-gatk))
		else
			def=$((def-gatk%4))
                        gob=$((gob-($RANDOM%atk)));
		fi
	fi

	if [[ $gob -lt 0 ]] && [[ $hp -lt 0 ]];
	then
		echo -e "You Sacrifice yourself to save the World!!!\n"
		break
	fi

        if [[ $gob -lt 0 ]];
        then
                win=1
		gob=0
        fi

        if [[ $hp -lt 0 ]];
        then
                win=0
		hp=0
        fi

	echo -e "\n$type : HP $hp	DEF $def \nGreen Goblin : HP $gob\n"

  done

  if [[ $win == 1 ]];
  then
	wins=$((wins+1))
	sleep 2
        echo -e "Green Goblin VANQUISHED!! Congrats fellow Travler\n"
  else
        echo "\nYou Died!!!"
        exit 1
  fi

}

function lvls()
{
	lvl1
	lvl2
	lvl3

	if [[ $wins == 3 ]];
	then
     		echo "Congratulations!! You Win the Game!!! "
	fi
}
case $ch in
	1)
		type="Samurai"
		hp=15
		atk=12
		def=4	
		echo -e "\nYou chosen the $type Charater. Your HP is $hp and Attack is $atk.\n"
		lvls
		;;
	2)
		type="Prisoner"
		hp=8
		atk=10
		def=2
		echo -e "\nYou chosen the $type Charater. Your HP is $hp and Attack is $atk.\n"
		lvls
		;;
	3)
		type="Warrior"
		hp=12
		atk=12
		def=8
		echo -e "\nYou chosen the $type Charater. Your HP is $hp and Attack is $atk.\n"
		lvls
		;;
	4)
		type="Hero"
		hp=10
		atk=15
		def=6
		echo -e "\nYou chosen the $type Charater. Your HP is $hp and Attack is $atk.\n"
		lvls
		;;
esac

