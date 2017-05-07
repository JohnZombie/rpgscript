#!/bin/bash
##########################
# Character Class Variables
##########################
char1=$(echo Warrior)
char2=$(echo Sorcerer)
char3=$(echo Cleric)
char4=$(echo Thief)


#########################
# Character Stat Variables
#########################
stat1=$(echo Strength)
stat2=$(echo Intelligance)
stat3=$(echo Healing)
stat4=$(echo Speed)



#########################
# Declare varible types as integers
#########################
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
map1=$(echo The Possessed Woods)
map2=$(echo City of The Dead)
map3=$(echo Dragon Alley)
map4=$(echo Witch Central)


###################################
# ASCII Art Functions 
###################################
function intro_ascii_art ()
{
echo "        ,     \    /      ,        "
echo "       / \    )\__/(     / \       "
echo "      /   \  (_\  /_)   /   \      "
echo " ____/_____\__\@  @/___/_____\____ "
echo "|             |\../|              |"
echo "|              \VV/               |"
echo "|  Welcome to the bash RPG game   |"
echo "|_________________________________|"
echo " |    /\ /      \\       \ /\    | "
echo " |  /   V        ))       V   \  | "
echo " |/            //               \| "
echo "               \V                  "
}

function warrior_ascii_art ()
{
echo "      /( /\ )\      "
echo "      |/ \/ \|      "
echo "      |- __ -|      "
echo "      | -  - |      "
echo "      |  ||  |      " 
echo "  \\\_ ,_||_, _///  "
echo "| \\\\        //// |"
}


###################################
# Transition Function
###################################
function transition_screen ()
{
echo
echo
echo
echo

clear
}


###################################
# Function for Name Input
####################################
function get_player_name ()
{
echo " Please enter your name and hit enter..."
get_player_name_input=
while [[ $player_name_input = "" ]]; do
   read player_name_input
done
}

function get_player_confirmation ()
{
while [[ $response != "y" ]]; do
	read -r -p "Are you sure? [y/N] " response
	if [[ "$response" =~ ^(yes|y)$ ]]
	then
		clear
	else
		get_player_name
	fi
   echo " Please make a selection of y/N..."
done
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
	echo $stat1
		stat1_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat1_num_final=$(( stat1_num_rand + stat1_num_base ))
		echo Your character stat is: $stat1_num_final
	echo $stat2
		stat2_num_rand=$(echo $(( 1  + RANDOM % 7)))
		stat2_num_final=$((stat2_num_rand + stat2_num_base))
		echo Your character stat is: $stat2_num_final
	echo $stat3
		stat3_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat3_num_final=$((stat3_num_rand + stat3_num_base))
		echo Your character stat is: $stat3_num_final
	echo $stat4
		stat4_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat4_num_final=$((stat4_num_rand + stat4_num_base))
		echo Your character stat is: $stat4_num_final
}

####################################
# Function for Maps
####################################


##################
# Name Entering
##################
intro_ascii_art

get_player_name

transition_screen

get_player_confirmation

transition_screen

#######################
#Character Selection
#######################

echo " Hello $player_name_input, Please pick a character class and hit enter. "

echo "1 - $char1"
echo "2 - $char2"
echo "3 - $char3"
echo "4 - $char4"

read class;

case $class in
        1) echo " You have chosen the $char1. The $char1 is a good all-round choice due to the character’s combination of high Strength and Dexterity. "
		warrior_ascii_art
		create_character_stats
		;;
        2) echo " You have chosen the $char2. Magic is your primary weapon. Their high Attunement and Intelligence makes learning more sorcery and pyromancy very easy."
		
		create_character_stats
		;;
        3) echo " You have chosen the $char3. $char3's have the ability to heal and are fairly balanced with learning abilities."
		
		create_character_stats
		;;
        4) echo " You have chosen the $char4. $char4's aren't a resilient class due to light armor, very low Vitality and a weak shield, but have high mobility. The attack speed of the $char4's Knife makes it a solid one on one weapon."
		
		create_character_stats
		;;
        *) echo " Please pick a class from the list. ";;
esac

transition_screen

echo " Press enter to embark on your journey...Evil awaits you. "

read

transition_screen

echo " You have arrived ashore to the Lost Island.. "

read

transition_screen

echo " Where do you go next? "

echo "1 - $map1"
echo "2 - $map2"
echo "3 - $map3"
echo "4 - $map4"

read next;

case $next in
      1) echo " You have chosen to wander $map1. Be aware, Those who walk these woods become possesed by pure evil. ";;
      2) echo " You have chosen to explore the $map2 .....The dead never sleep and are always hungry for flesh. ";;
      3) echo " You have chosen to visit $map3. The heat will consume you...Stay away from the gold! ";;
      4) echo " You have chosen to walk $map4 .... The magic is strong here,the sun is never present, Stay aware of your surroundings.";;
      *) echo " Please chose your destination for travel.";;
esac


