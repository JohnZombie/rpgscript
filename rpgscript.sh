#!/bin/bash
######################################################################################
# Game Variables
######################################################################################
###########################
# Character Class Variables
###########################
char1="The Warrior"
char2="The Assasin"
char3="The Cleric"
char4="The Hunter"

##########################
# Character Stat Variables
##########################
stat1="Strength"
stat2="Defense"
stat3="HP"
stat4="Speed"

##################################
# Declare varible types as integers
###################################
declare -i stat1_num_base
declare -i stat2_num_base
declare -i stat3_num_base
declare -i stat4_num_base

declare -i stat1_num_rand
declare -i stat2_num_rand
declare -i stat3_num_rand
declare -i stat4_num_rand

declare -i stat1_num_final
declare -i stat2_num_final
declare -i stat3_num_final
declare -i stat4_num_final

####################
# Map Variables
####################
map1="The Possessed Woods"
map2="The Damned Paths"
map3="The Golden Den"
map4="The Witch Valley"

#############################################
# Creature Variables for The Possessed Woods
###############################################
ghost[0]="Tormented Soul"
ghost[1]="Demented Ghost"
ghost[2]="Ghostly Knight"
ghost[3]="Possessed Swordsman"
boss1="The Possessed Knight"

########################################################
# Creature Variables for The Damned Paths
#######################################################
damned[0]="Damned Traveler"
damned[1]="Damned Soldier"
damned[2]="Damned Beast"
damned[3]="Damned Hunter"
boss2="The King of The Damned"

###############################################
# Creature Variables for Dragons Den
##############################################
dragon[0]="Ice Dragon"
dragon[1]="Flame Dragon"
dragon[2]="Water Dragon"
dragon[3]="Zombie Dragon"
boss3="The Golden Dragon"

###################################################
# Creature Variables for Witch Valley
####################################################
witch[0]="Warlock"
witch[1]="Witch Doctor"
witch[2]="Black Mage"
witch[3]="Witches Apprentice"
boss4="The Wicked Witch of The Valley"

########################################################################################################################################
# ALL FUNCTIONS :P
########################################################################################################################################
#################################################
# spacing function 7 spaces
##################################################
function echo_spacer_7 () {
echo
echo
echo
echo
echo
echo
echo
}

###############################
# Spacing Function 4 spaces
###############################
function echo_spacer_4 () {
echo
echo
echo
echo
}

###################################
# ASCII Art Functions
###################################
function intro_ascii_art () {
echo "        ,     \    /      ,        "
echo "       / \    )\__/(     / \       "
echo "      /   \  (_\  /_)   /   \      "
echo " ____/_____\__\@  @/___/_____\____ "
echo "|             |\../|              |"
echo "|              \VV/               |"
echo "|Welcome to the mini bash RPG game|"
echo "|_________________________________|"
echo " |    /\ /      \\       \ /\    | "
echo " |  /   V        ))       V   \  | "
echo " |/            //               \| "
echo "               \V                  "
echo
echo
echo " ~This is a game of pure luck~ "

}

function map_ascii_art () {
echo "                 __           '.   \  :  /   .'
                     /. _\            '.  \ : /  .'
                .--.|/_/__      -----____   _  _____-----
_______________''.--o/___  \_______________(_)___________
       ~        /.'o|_o  '.|  ~                   ~   ~
  ~            |/   |_|  ~'         ~
               '  ~ |_|        ~       ~     ~     ~
      ~    ~        |_|O  ~                       ~
             ~      |_||_____     ~       ~    ~
   ~    ~      .'':.|_|A:. ..::''.
             /:.  .:|_|.\ .:.  :.:\   ~
  ~         :..:. .:. .::..:  .:  ..:.       ~   ~    ~
             \.: .:  :. .: ..:: . /
    ~      ~      ~    ~    ~         ~
               ~           ~    ~   ~             ~
        ~         ~            ~   ~                 ~
   ~                  ~    ~ ~                 ~        "

}

function possessed_knight ()
{
echo -n $'\E[31m'
echo $''
echo $'      _,.'
echo $'    ,` -.)'
echo $'   \'( _/\'-\\\\-.'
echo $'  /,|`--._,-^|          ,'
echo $'  \\_| |`-._/||          ,\'|'
echo $'    |  `-, / |         /  /'
echo $'    |     || |        /  /'
echo $'     `r-._||/   __   /  /'
echo $' __,-<_     )`-/  `./  /'
echo $'\'  \\   `---\'   \\   /  /'
echo $'    |           |./  /'
echo $'    /           //  /'
echo $'\\_/\' \\         |/  /'
echo $' |    |   _,^-\'/  /'
echo $' |    , ``  (\\/  /_'
echo $'  \\,.->._    \\X-=/^'
echo $'  (  /   `-._//^`'
echo $'   `Y-.____(__}'
echo $'    |     {__)'
echo $'          ()`'
}

############################################################
# Game Over Function
############################################################
function game_over () {
echo '
  _______
 /  _____/_____    _____   ____   \_____  \___  __ ___________
/   \  ___\__  \  /     \_/ __ \   /   |   \  \/ // __ \_  __ \
\    \_\  \/ __ \|  Y Y  \  ___/  /    |    \   /\  ___/|  | \/
 \______  (____  /__|_|  /\___  > \_______  /\_/  \___  >__|
        \/     \/      \/     \/          \/          \/
                                                                  '

read
clear
exit
}

###################################
# Transition Function
###################################
function transition_screen ()
{

echo "
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
Name: $player_name_input ****  $stat1: $stat1_num_final **** $stat2: $stat2_num_final **** $stat3: $stat3_num_final ****  $stat4: $stat4_num_final
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
"
}

################################
#unset fucntion
################################
function unset_function ()

{

    unset explore
    unset select
    unset choice

}



#################################################################
# Randomizing of stats after battle function
################################################################
function randomizing_stats ()

{


clear

echo " Your stats will now be randomized due to battle victory. "


echo_spacer_4




        if [[ $class == "1" ]]; then
                stat1_num_base=3
                stat2_num_base=1
                stat3_num_base=1
                stat4_num_base=1
        elif [[ $class == "2" ]]; then
                stat1_num_base=1
                stat2_num_base=3
                stat3_num_base=1
                stat4_num_base=1
        elif [[ $class == "3" ]]; then
                stat1_num_base=1
                stat2_num_base=1
                stat3_num_base=3
                stat4_num_base=1
        elif [[ $class == "4" ]]; then
                stat1_num_base=1
                stat2_num_base=1
                stat3_num_base=1
                stat4_num_base=3
        fi




        echo =======$stat1~~~~~~~~~~~~~~~~~~~~~~~~~~
                stat1_num_rand=$(( 1 + RANDOM % 10))
                stat1_num_final=$(( stat1_num_rand + stat1_num_base ))
                echo Your characters $stat1 is now: $stat1_num_final
                echo_spacer_4
        echo =======$stat2~~~~~~~~~~~~~~~~~~~~~~~~~~
                stat2_num_rand=$(( 1  + RANDOM % 10))
                stat2_num_final=$((stat2_num_rand + stat2_num_base))
                echo Your characters $stat2 is now: $stat2_num_final
                echo_spacer_4
        echo =======$stat3~~~~~~~~~~~~~~~~~~~~~~~~~~
                stat3_num_rand=$(( 1 + RANDOM % 10))
                stat3_num_final=$((stat3_num_rand + stat3_num_base))
                echo Your character $stat3 is now: $stat3_num_final
                echo_spacer_4
        echo =======$stat4~~~~~~~~~~~~~~~~~~~~~~~~~
                stat4_num_rand=$(( 1 + RANDOM % 10))
                stat4_num_final=$((stat4_num_rand + stat4_num_base))
                echo Your character $stat4 is now: $stat4_num_final







}




###################################
# Function for Name Input
####################################
function get_player_name ()
{

echo_spacer_4
echo " Please enter your name and hit enter..."
while [[ $player_name_input = "" ]]; do
   read -r player_name_input
done
clear
}

######################################
# Function for Player Confirmation
######################################
function get_player_confirmation ()
{
while [[ $response != "y" ]]; do
        read -r -p "Are you sure? [y/n] " response
        if [[ "$response" =~ ^(y)$ ]]; then
                clear
        elif [[ "$response" =~ ^(n)$ ]]; then
                player_name_input=""
                clear
                get_player_name
        fi
done

clear

echo " Hello $player_name_input, Please pick a character class and hit enter. "
}

##########################################
# Battle Confirmation Function
##########################################
function battle_confirmation ()
{
while [[ $confirmation != "y" ]]; do
        read -r -p " Do you wish to battle thy enemy? [y/n] " confirmation
        if [[ "$confirmation" =~ ^(y)$ ]]; then
                echo ""

        elif [[ "$confirmation" =~ ^(n)$ ]]; then
                echo " Dont be a coward!!!..... "
               battle_confirmation

       fi


done


}



####################################################################################
## You died action function
###################################################################################
function you_died_action ()

{

clear

echo '
                                                  _            _
			  _   _  ___  _   _    __| |_  ___  __| |
			 | | | |/ _ \| | | |  / _` | |/ _ \/ _` |
			 | |_| | (_) | |_| | | (_| | |  __| (_| |
			  \__, |\___/ \__,_|  \__,_|_|\___|\__,_|
			   __/ |
                           |___|



                                                                       '


game_over






}







###################################################################################################
# Function for Battle Damage Number Roll Max 10 Damage for creature encounters in Possessed Woods
###################################################################################################
function battle_damage_dice_roll_10_possessed_woods ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "
echo_spacer_4
randomizing_stats
battle_victory_action_possessed_woods



elif [[ $battle_damage_dice_roll -lt 5 ]]
then
you_died_action





elif [[ $battle_damage_dice_roll == 5 ]]
then
echo " You are clashing with this enemy and are blocking each others moves. Please roll again to determine the finishing outcome... "
echo_spacer_4
battle_damage_dice_roll_10_possessed_woods


fi


}

#################################################################################
#  Function for Battle Damage Number Roll Max 20 Damage boss possessed Woods
#################################################################################
function battle_damage_dice_roll_20_possessed_woods ()

{



echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 10 to destroy this creature. "
read -r
echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 20 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to $boss1. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 10 ]]
then
echo " *** You have defeated $boss1 *** "
read
echo " You have other destinations to visit...This is only the beginning. "
echo_spacer_4
unset_function
map_selection_menu


elif  [[ $battle_damage_dice_roll -lt 10 ]]
then

you_died_action



elif [[ $battle_damage_dice_roll == 10 ]]
then
echo " You are clashing with this opponent.. Please re-roll for final outcome. "

battle_damage_dice_roll_20_possessed_woods



fi


}


##################################################################################################################################################
# Function for Battle Damage Number Roll Max 10 Damage for creature encounters in damned paths
#########################################################################################################################################################################
function battle_damage_dice_roll_10_damned_paths ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "
echo_spacer_4
randomizing_stats
battle_victory_action_damned_paths

elif [[ $battle_damage_dice_roll -lt 5 ]]
then
you_died_action



elif [[ $battle_damage_dice_roll == 5 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "
echo_spacer_4
battle_damage_dice_roll_10_damned_paths


fi


}
#####################################################################################
#Function for Battle Damage Number Roll Max 20 Damage for boss encounter in damned paths
#####################################################################################

function battle_damage_dice_roll_20_damned_paths ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 20 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 10 ]]
then
echo " You have defeated this creature. "



echo_spacer_4

randomizing_stats
unset_function
map_selection_menu

elif [[ $battle_damage_dice_roll -lt 10 ]]
then
                                                  _            _

you_died_action



elif [[ $battle_damage_dice_roll == 10 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "

echo_spacer_4

battle_damage_dice_roll_20_damned_paths


fi


}












####################################################################################
# Function for Battle Damage Number Roll Max 10 Damage for creature encounters in golden den
#####################################################################################

function battle_damage_dice_roll_10_golden_den ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "

echo_spacer_4
randomizing_stats
battle_victory_action_golden_den

elif [[ $battle_damage_dice_roll -lt 5 ]]
then

you_died_action


elif [[ $battle_damage_dice_roll == 5 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "

echo_spacer_4

battle_damage_dice_roll_10_golden_den


fi


}









####################################################################################
# Function for Battle Damage Number Roll Max 20 Damage for boss encounter in golden den
#####################################################################################
function battle_damage_dice_roll_20_golden_den ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 20 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 10 ]]
then
echo " You have defeated this creature. "



echo_spacer_4

randomizing_stats
unset_function
map_selection_menu



elif [[ $battle_damage_dice_roll -lt 10 ]]
then



you_died_action            _


elif [[ $battle_damage_dice_roll == 10 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "

echo_spacer_4

battle_damage_dice_roll_20_golden_den


fi


}













#################################################################################################
# Function for Battle Damage Number Roll Max 10 Damage for creature encounters in witch valley
################################################################################################################

function battle_damage_dice_roll_10_witch_valley ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "



echo_spacer_4

randomizing_stats


elif [[ $battle_damage_dice_roll -lt 5 ]]
then


you_died_action


elif [[ $battle_damage_dice_roll == 5 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "

echo_spacer_4

battle_damage_dice_roll_10_witch_valley


fi


}


















####################################################################################
# Function for Battle Damage Number Roll Max 20 Damage for boss encounter in witch valley
#####################################################################################


function battle_damage_dice_roll_20_witch_valley ()

{


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. All number clashes will result in a re-roll. "

read -r

echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 20 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 10 ]]
then
echo " You have defeated this creature. "



echo_spacer_4

randomizing_stats
unset_function
map_selection_menu

elif [[ $battle_damage_dice_roll -lt 10 ]]
then


you_died_action


elif [[ $battle_damage_dice_roll == 10 ]]
then
echo " You are clashing with this enemy and blocking each others moves. Please roll again to determine the finishing outcome... "

echo_spacer_4

battle_damage_dice_roll_20_witch_valley


fi


}






















##########################################################
# After Battle Victory Actions Function 1 possessed woods
##########################################################
function battle_victory_action_possessed_woods ()

{


echo_spacer_4


         while [ -z $selection ]

do




echo " Victory is yours, what will you do now in $map1 ? "

     echo "1 -Battle More Creatures"
     echo "2 -Leave The Possessed Woods"
     echo "3 -Find The Possessed Knight"

read -r selection;

clear

done

case $selection in

    1) echo " You are a savage! You wander in search of more creatures to battle and come across a.... "
          echo_spacer_4
          random_creature_generator_possessed_woods
          echo_spacer_4
          unset_function
          unset -f battle_victory_action_possessed_woods 
          battle_damage_dice_roll_10_possessed_woods
          battle_victory_action_possessed_woods_2
         ;;

    2) echo " You chose to leave $map1. "
        unset_function
        echo_spacer_4
        map_selection_menu

        ;;





    3) echo " After defeating your creature encounters you chose to keep some alive for interrogation to gather information on $boss1 and found the dark castle where he resides. You must defeat this creature to proceed to the next map. If you die battling this creature it is GAME OVER....His Dark blade collect the souls of his enemies after victory. "
      echo_spacer_4
      possessed_knight
      battle_damage_dice_roll_20_possessed_woods
      
      ;;

esac


}

##############################################################################
# After Battle Victory Actions Function 2 possessed woods

###############################################################################
function battle_victory_action_possessed_woods_2 ()

{
clear
	while [ -z $choice ]
do
echo " What will you do next as you wander $map1 ? "
    
     echo "1 -Leave $map1"
     echo "2 -Find $boss1"

read -r choice;
clear
done
   
case $choice in
    1) echo " You chose to leave $map1. "
       unset_function 
       map_selection_menu
        ;;
    2) echo " After defeating your creature encounters you chose to keep some alive for interrogation to gather information on $boss1 and found the dark castle where he resides. You must defeat this creature to proceed to the next map. If you die battling this creature it is GAME OVER....His Dark blade collect the souls of his enemies after victory. "
      echo_spacer_4
      possessed_knight
      battle_damage_dice_roll_20_possessed_woods
     
      ;;
esac

}



#########################################################################
# After Battle Victory actions damned paths
########################################################################
function battle_victory_action_damned_paths ()

{

echo_spacer_4


   while [ -z $selection ]
do

       echo " You are beast! All enemies fall in your path. "
  
          echo "1 - Battle More Creatures To The Death"
          echo "2 - Leave $map2"
          echo "3 - Rip $boss2's Head off"

read -r selection;

clear

done

case $selection in

   1)  echo " Dont get too cocky now..... "
          echo_spacer_4
          random_creature_generator_damned_paths
          echo_spacer_4
          unset -f battle_victory_action_damned_paths
          unset_function
          battle_damage_dice_roll_10_damned_paths
          battle_victory_action_damned_paths_2
          
          ;;

    2) echo " You chose to leave $map2. "
        unset_function
        echo_spacer_4
        map_selection_menu

        ;;
esac

}
#########################################################################
# After Battle Victory actions function 2 damned paths
###########################################################################
function battle_victory_action_damned_paths_2 ()

{

   clear

       while [ -z $choice ]
do
echo " what will you do next? "
       
    echo " 1 - Leave $map2 "
    echo " 2 - Find $boss2 "

read -r choice; 
clear
done

case $choice in

	1) echo " You chose to leave $map2."
           unset_function
	   map_selection_menu
	   ;;

	2) echo " You have no mercy for thy enemies and will destroy anything that gets in your path. The paths have many damned souls begging for freedom from the paths. Only defeating the $boss2 will free these souls. You must collect his head with the dark crown and set it on fire to free the souls."
	echo_spacer_4
	battle_damage_dice_roll_20_damned_paths
	;;


esac

}


########################################################
After Battle Victory Actions Function 1 Golden Den
##########################################################
function battle_victory_action_golden_den ()

{


echo_spacer_4


         while [ -z $selection ]

do




echo " Victory is yours, what will you do now in $map3 ? "

     echo "1 -Battle More Dragons to the Death!"
     echo "2 -Leave $map3"
     echo "3 -Find $boss3"

read -r selection;

clear

done

case $selection in

    1) echo " Dragons are among the strongest creatures. You wander in search of more dragons to battle and come across a.... "
          echo_spacer_4
          random_creature_generator_golden_den
          echo_spacer_4
          unset -f battle_victory_action_golden_den
          unset_function 
          battle_damage_dice_roll_10_golden_den
          battle_victory_action_golden_den_2
         ;;

    2) echo " You chose to leave $map3. "
        unset_function
        echo_spacer_4
        map_selection_menu

        ;;





    3) echo " The dragons are near extinction, legend has it that there is a $boss3 guarding all the riches in these dens. If you defeat this creature you will be rich for eternity. "
      echo_spacer_4
      battle_damage_dice_roll_20_golden_den
      ;;

esac


}

##############################################################################
# After Battle Victory Actions Function 2 golden den

###############################################################################
function battle_victory_action_golden_den_2 ()

{
clear
         while [ -z $choice ]
do
echo " What will you do next as you search $map3 ? "
    
     echo "1 -Leave The Possessed Woods"
     echo "2 -Find $boss3"

read -r choice;
clear
done
   
case $choice in
    1) echo " You chose to leave $map3. "
       unset_function 
       map_selection_menu
        ;;
    2) echo " You must defeat $boss3 in order Collect its head and acquire all of its gold."
      echo_spacer_4
      battle_damage_dice_roll_20_golden_den
     
      ;;
esac

}


#########################################################
#After Battle Victory Actions Function 1 Witch Valley
##########################################################
function battle_victory_action_witch_valley ()

{


echo_spacer_4


         while [ -z $selection ]

do




echo " You are Fierce!, what will you do now in $map4 ? "

     echo "1 -Battle Enemies"
     echo "2 -Leave $map4"
     echo "3 -Find $boss4"

read -r selection;

clear

done

case $selection in

    1) echo " You are wounded from some of your previous battles and are in need of potions and healing components. You search the valley extensively and encounter a..."
          echo_spacer_4
          random_creature_generator_witch_valley
          echo_spacer_4
          unset -f battle_victory_action_witch_valley
          unset_function 
          battle_damage_dice_roll_10_witch_valley
          battle_victory_action_witch_valley_2
         ;;

    2) echo " You chose to leave $map4. "
        unset_function
        echo_spacer_4
        map_selection_menu

        ;;





    3) echo " $boss4 is the ruler of all powerful dark forces. Her spells are so strong that those who are exposed to it become paralayzed. You must defeat her to leave this lost land for good. She controls this land and all others."
      echo_spacer_4
      battle_damage_dice_roll_20_witch_valley
      ;;

esac


}

##############################################################################
# After Battle Victory Actions Function 2 witch valley

###############################################################################
function battle_victory_action_witch_valley ()

{
clear
         while [ -z $choice ]
do
echo " What will you do next as you search $map4 ? "
    
     echo "1 -Leave $map4"
     echo "2 -Find $boss4"

read -r choice;
clear
done
   
case $choice in
    1) echo " You chose to leave $map4. "
       unset_function 
       map_selection_menu
        ;;
    2) echo " You must defeat $boss4 in order to bring light to this valley."
      echo_spacer_4
      battle_damage_dice_roll_20_witch_valley
     
      ;;
esac

}


########################################################
# Random Creature Generator Function The Possessed Woods
########################################################
function random_creature_generator_possessed_woods ()
{

random_creature_generator_possessed_woods=$(( RANDOM % 4 ))
echo  "${ghost[$random_creature_generator_possessed_woods]}"
}

########################################################
# Random Creature Generator Function The Damned Paths
########################################################
function random_creature_generator_damned_paths ()
{
random_creature_generator_damned_paths=$(( RANDOM % 4 ))
echo  "${damned[$random_creature_generator_damned_paths]}"
}

########################################################
# Random Creature Generator Function Dragons Den
#######################################################
function random_creature_generator_golden_den ()

{
random_creature_generator_golden_den=$(( RANDOM % 4 ))
echo "${dragon[$random_creature_generator_golden_den]}"
}

##########################################################
# Random Creature Generator Function Witch Valley
#########################################################

function random_creature_generator_witch_valley ()

{

random_creature_generator_witch_valley=$(( RANDOM % 4 ))
echo "${witch[$random_creature_generator_witch_valley]}"

}






####################################
# Function for character stats
####################################
function set_base_stats ()
{
	if [[ $class == "1" ]]; then
		stat1_num_base=3
		stat2_num_base=1
		stat3_num_base=1
		stat4_num_base=1
	elif [[ $class == "2" ]]; then
		stat1_num_base=1
		stat2_num_base=3
		stat3_num_base=1
		stat4_num_base=1
	elif [[ $class == "3" ]]; then
		stat1_num_base=1
		stat2_num_base=1
		stat3_num_base=3
		stat4_num_base=1
	elif [[ $class == "4" ]]; then
		stat1_num_base=1
		stat2_num_base=1
		stat3_num_base=1
		stat4_num_base=3
	fi
}

function create_character_stats ()
{
	set_base_stats
	echo =======$stat1=======================
		stat1_num_rand=$(( 1 + RANDOM % 10))
		stat1_num_final=$(( stat1_num_rand + stat1_num_base ))
		echo Your characters $stat1 is: $stat1_num_final
	        echo_spacer_4
	echo =======$stat2========================
		stat2_num_rand=$(( 1  + RANDOM % 10))
		stat2_num_final=$((stat2_num_rand + stat2_num_base))
		echo Your characters $stat2 is: $stat2_num_final
		echo_spacer_4
	echo =======$stat3=======================
		stat3_num_rand=$(( 1 + RANDOM % 10))
		stat3_num_final=$((stat3_num_rand + stat3_num_base))
		echo Your character $stat3 is: $stat3_num_final
		echo_spacer_4
	echo =======$stat4=======================
		stat4_num_rand=$(( 1 + RANDOM % 10))
		stat4_num_final=$((stat4_num_rand + stat4_num_base))
		echo Your character $stat4 is: $stat4_num_final
}

##############################
#Character Selection Function
##############################
function character_selection ()
{
echo "1 - $char1"
echo "2 - $char2"
echo "3 - $char3"
echo "4 - $char4"

read -r class;

clear

case $class in

     1) echo " You have chosen $char1. $char1 is known for his skill in combat and has a brutal thirst for his enemies blood to stain his blade... "

	   echo_spacer_4

	   echo " Character stats are generated at random and will randomize again depending on game progression."

	   echo_spacer_7
           create_character_stats

            ;;



     2) echo " You have chosen $char2. $char2 is known for being quick and stealthy. The shadows are where they reside.."

      echo_spacer_4

      echo " Character stats are generated at random and will randomize again depending on game progression."

      echo_spacer_7
      create_character_stats

            ;;


     3) echo " You have chosen $char3. $char3 are known for their healing powers. The fairies have granted them with many blessings. "

	echo_spacer_4

	echo " Character stats are generated at random and will randomize again depending on game progression."

       echo_spacer_7
       create_character_stats

            ;;


     4) echo " You have chosen $char4. $char4 is out for blood and collects the heads of his enemies as trophies after battle. "

       echo_spacer_4

     echo " Character stats are generated at random and will randomize again depending on game progression."
     echo_spacer_7

     create_character_stats

         ;;



     *) echo " Please pick a class from the list. "
		character_selection
		;;
esac

echo_spacer_7

}

##################################
# Map Selection Function Loop
##################################
function map_selection_loop ()
{

while [ -z "$explore" ]
do

echo "Choose a map that you wish to explore. "

echo_spacer_4

echo "1 - $map1"
echo "2 - $map2"
echo "3 - $map3"
echo "4 - $map4"

read -r explore;

clear

done
}

############################################
# Map Selections
###########################################
function map_selection_menu ()
{
echo " Press enter to embark on your journey...Evil awaits you. "

read -r

clear

transition_screen

echo " You have arrived ashore to The Lost land in search of glory and riches. Many have said this land is a myth, others have searched for many years and never came back from their expeditions...You are here to bring this myth to reality. "

read -r

map_ascii_art

map_selection_loop

clear

case $explore in
      1) echo " You have chosen to wander $map1. Be aware, Those who wander these woods become possessed by pure evil. "


	 echo_spacer_7
	 possessed_woods


	 ;;


      2) echo " You have chosen to explore the $map2 .....The Damned never sleep and are hungry for flesh. "


        echo_spacer_7
        damned_paths

          ;;


      3) echo " You have chosen to visit $map3. The heat in these dens keep strangers out.. The gold is said to be precious and breathe taking, many have died in attempt to leave the den with these riches."

	 echo_spacer_7
	 golden_den
	  ;;

      4) echo " You have chosen to walk $map4 .... The magic is strong here,the sun is never present, Stay aware of your surroundings."


         echo_spacer_7
         witch_valley
           ;;

      *) echo " Please chose your destination for travel.";;
esac

}
###########################################
#Possessed Woods Selections
###########################################
function possessed_woods ()
{
while [ -z "$choice" ]
do

echo " You have entered $map1, What will you do next? "

echo "1 -Wander the woods"
echo "2 -Battle creatures"
echo "3 -Leave The Possessed Woods"
echo "4 -Find The Possessed Knight"

read -r choice;

clear

done

clear

case $choice in
     1) echo " You have decided to wander $map1 and hear footsteps with leaves crumbling behind you.... You turn around and nothing is there. The crumbling begins to grow louder as you keep walking this time you feel a cold breeze on the back of your neck. You turn around once more and encounter a....."

      echo_spacer_4
      random_creature_generator_possessed_woods
      echo_spacer_4
      battle_damage_dice_roll_10_possessed_woods
       ;;

     2) echo " You chose to battle creatures and will fight a... "

       echo_spacer_4
       random_creature_generator_possessed_woods
       echo_spacer_4
       battle_damage_dice_roll_10_possessed_woods
         ;;


     3) echo " You have chose to leave this map.."
	unset explore
	unset select
 	unset choice
        map_selection_menu

        ;;

      4) echo " With days of searching you have found $boss1's Castle...You are hit with a strong evil force as you enter the gates, sending you flying into a wall. $boss1 makes an appearance with a swing of his bewitched sword near your face as you dodge..."

       echo_spacer_7

       possessed_knight

       echo_spacer_4

       battle_damage_dice_roll_20_possessed_woods




        ;;


      *)  echo " Please make a selection from the list...."

        ;;

esac
}

#########################################################################
# City of The Damned
#########################################################################
function damned_paths ()
{
while [ -z "$choice" ]
do

echo " What will you do next? "

echo "1 -Walk The Damned Paths"
echo "2 -Battle The Damned"
echo "3 -Leave The Damned Paths"
echo "4 -Find The King of The Damned"

read -r choice;

clear

done

clear

case $choice in
     1) echo " You have decided to walk The Damned Paths and encountered...."

       echo_spacer_4
       random_creature_generator_damned_paths
       echo_spacer_4
       battle_damage_dice_roll_10_damned_paths
       



        ;;

     2) echo " The damned are nested in almost every path , you come across a... "

       echo_spacer_4
       random_creature_generator_damned_paths
       echo_spacer_4
       battle_damage_dice_roll_10_damned_paths
       



        ;;

     3) echo " You have chose to leave this map.."
	unset_function
        map_selection_menu
	;;


     4)
        echo " $boss2 is the ruler of all evil in The Damned Paths ...Defeat him and you will free all enslaved from the damned paths."

       	echo_spacer_4
	battle_damage_dice_roll_20_damned_paths



       	;;


      *) echo " Please make a selection from the list....";;
esac
}

######################################################
#Golden Den Selections
######################################################

function golden_den ()
{
	while [ -z "$choice" ]
	do

		echo " What will you do in The Golden Den? "

		echo "1 -Search $map3 for gold"
		echo "2 -Battle Dragons"
		echo "3 -Leave this map"
		echo "4 -Find The Golden Dragon"

		read -r choice;

	clear

done

clear

case $choice in
     1) echo " You are searching for Gold and have awoken Dragon from its slumber.... He then lunges towards you with all of his might. What will you do next? "

       echo_spacer_7
       random_creature_generator_golden_den
       echo_spacer_7
       battle_damage_dice_roll_10_golden_den


        ;;

     2) echo " You ignore all of the precious gold and decide to wake up dragons for battle. "

       echo_spacer_7
       random_creature_generator_golden_den
       echo_spacer_7
       battle_damage_dice_roll_10_golden_den


        ;;

     3) echo " You have chose to leave this map.."
        unset_function
        map_selection_menu

	;;


     4)
        echo " $boss3 is the ruler of all gold on The Lost Island...You come across his nest of gold as you are wandering the den. He makes an appearance in gold so bright that the sun has no chance. You are blinded by his golden presence and lose site of him. $boss3 is not very happy to see you in his dens."

        echo_spacer_7
        battle_damage_dice_roll_20_golden_den


       	;;


      *) echo " Please make a selection from the list....";;
esac
}




##########################################################
# Witch Valley Selections
#########################################################


function witch_valley ()
{
	while [ -z "$choice" ]
	do

		echo " What will you do in $map4 first? "

		echo "1 -Walk the $map4 in search of potions and remedies."
		echo "2 -Train your skills with battling creatures in the valley."
		echo "3 -Leave this map"
		echo "4 -Visit the $boss4"

		read -r choice;

	clear

done

clear

case $choice in
     1) echo " You are strolling through the $map4 for potions and remedies to heal your wounds from your on-going battles. The valley is pitch black with little light in sight. A pair of red glowing eyes make an appearance and the air becomes cold. You cannot get a visual of this creature. What will you do next? "

       echo_spacer_7
       random_creature_generator_witch_valley
       echo_spacer_7



        ;;

     2) echo " You scream a battle cry in the valley calling out onto all creatures for a challenge. It is silent and all you hear are echoes of your voice. Red lights begin to flicker in all directions...but these are not lights, these are the eyes of blood thirsty enemies. You are now surrounded, what do you do? "

       echo_spacer_7
       random_creature_generator_witch_valley
       echo_spacer_7
       battle_damage_dice_roll_10_witch_valley



        ;;

     3) echo " You have chose to leave this map.."
 	unset_function
        map_selection_menu
	;;


     4)
        echo " You see lights up ahead as you are wandering the dark valley. Goblets of fire light your path to the entrance. The door is slightly open with the smell of death lingering through its cracks. What do you do next?"
        echo_spacer_7
        battle_damage_dice_roll_20_witch_valley
       	;;


      *) echo " Please make a selection from the list....";;
esac
}

#######################################################################################################################################################
# This is where the script runs in order from functions made and statements
#######################################################################################################################################################
clear
intro_ascii_art
get_player_name
get_player_confirmation
character_selection
map_selection_menu
