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
# Function for Name Input
####################################
function get_player_name ()
{
echo " Please enter your name and hit enter..."
get_player_name_input=
while [[ $get_player_name_input = "" ]]; do
   read get_player_name_input
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
function create_character_stats ()
{
	echo $stat1
	stat1_num=$(echo $((1 + RANDOM % 10)))
	echo $stat1_num
	echo $stat2
	stat2_num=$(echo $((1 + RANDOM % 10)))
	echo $stat2_num
	echo $stat3
	stat3_num=$(echo $((1 + RANDOM % 10)))
	echo $stat3_num
	echo $stat4
	stat4_num=$(echo $((1 + RANDOM % 10)))
	echo $stat4_num
}


####################################
# Function for Maps
####################################


##################
# Name Entering
##################
intro_ascii_art

get_player_name
echo
echo
echo
echo

clear

get_player_confirmation
echo
echo
echo
echo
echo

clear

#######################
#Character Selection
#######################


echo " Hello $name, Please pick a character class and hit enter. "

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
        2) echo " You have chosen the $char2. Magic is your primary weapon. Their high Attunement and Intelligence makes learning more sorcery and pyromancy very easy.";;
        3) echo " You have chosen the $char3. $char3's have the ability to heal and are fairly balanced with learning abilities.";;
        4) echo " You have chosen the $char4. $char4's aren't a resilient class due to light armor, very low Vitality and a weak shield, but have high mobility. The attack speed of the $char4's Knife makes it a solid one on one weapon.";;
        *) echo " Please pick a class from the list. ";;

esac

echo " Press enter to embark on your journey...Evil awaits you. "

read

clear

echo " You have arrived ashore to the Lost Island.. "

read


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


