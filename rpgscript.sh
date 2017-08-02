#!/bin/bash
##########################################
# Clears entire screen before game launches
##########################################

clear


###########################
# Character Class Variables
###########################
char1=$(echo Warrior)
char2=$(echo Sorcerer)
char3=$(echo Cleric)
char4=$(echo Thief)


##########################
# Character Stat Variables
########################## 
stat1=$(echo Strength)
stat2=$(echo Intelligance)
stat3=$(echo HP)
stat4=$(echo Speed)
stat4=$(echo Defense)





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
map1=$(echo The Possessed Woods)
map2=$(echo The Damned Paths)
map3=$(echo Dragon Alley)
map4=$(echo Witch Valley)




#######################################################################################################################################################
# ALL FUNCTIONS :P
########################################################################################################################################################





###############################################
# Creature  Encounters for The Possesed Woods
###############################################

ghoul[0]="Possessed Ghoul"
ghoul[1]="Demented Ghost"
ghoul[2]="Ghost Knight"
ghoul[3]="Possessed Swordsman"


boss1="The Possessed Knight"


########################################################
# Creature Encounters for The Damned Paths
#######################################################
damned[0]="Damned Traveler"
damned[1]="Damned Soldier"
damned[2]="Damned Dog"
damned[3]="Damned Hunter"

boss2="King of The Damned"
















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
 






function map_ascii_art ()
{

echo "        '(___(_____)      __           '.   \  :  /   .'
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
             \.: .:  :. .: ..:: .lcf/
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




###################################
# Transition Function
###################################


function transition_screen ()
{
clear
echo "
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
Name: $player_name_input ****  $stat1: $stat1_num_final **** $stat2: $stat2_num_final **** $stat3: $stat3_num_final ****  $stat4: $stat4_num_final
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
"

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


clear


}


################################
# Function for Player Confirmation
###############################
function get_player_confirmation ()
{
	


	
while [[ $response != "y" ]]; do
        read -r -p "Are you sure? [y/n] " response
        if [[ "$response" =~ ^(y)$ ]]; then
                clear
        elif [[ "$response" =~ ^(n)$ ]]; then
                player_name_input=$(echo "")
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
        read -r -p " Do you wish to battle this creature? [y/n] " confirmation
        if [[ "$confirmation" =~ ^(y)$ ]]; then
                echo "You have chose to battle this creature"
                 
        elif [[ "$confirmation" =~ ^(n)$ ]]; then
                echo " Dont be a coward!!!..... "
               battle_confirmation
                
        fi
done

clear


}


########################################
# Function for Battle Damage Number Roll
########################################
function battle_damage_dice_roll ()
{


battle_confirmation

clear

echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. "
read
echo
echo
echo
echo


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "
echo
echo
echo
echo

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "
echo
echo
echo


elif [[ $battle_damage_dice_roll -lt 5 ]]
then 
echo '                   
                                                  _            _
			  _   _  ___  _   _    __| |_  ___  __| | 
			 | | | |/ _ \| | | |  / _` | |/ _ \/ _` | 
			 | |_| | (_) | |_| | | (_| | |  __| (_| | 
			  \__, |\___/ \__,_|  \__,_|_|\___|\__,_| 
			   __/ |                                  
			  |___/                                   '
echo
echo
echo
echo



fi

}


########################################################
# Random Creature Generator Function The Possessed Woods
########################################################
function random_creature_generator_possessed_woods ()
{

random_creature_generator_lost_woods=$(( RANDOM % 4 ))

echo  ${ghoul[$random_creature_generator_possessed_woods]} 

}

########################################################
# Random Creature Generator Function The Damned Paths
########################################################
function random_creature_generator_damned_paths ()
{

random_creature_generator_damned_paths=$(( RANDOM % 4 ))

echo  ${damned[$random_creature_generator_damned_paths]} 

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




##############################
#Character Selection Function
##############################


function character_selection ()

{
echo "1 - Warrior"
echo "2 - Sorcerer"
echo "3 - Cleric"
echo "4 - Thief"

read class;

clear


case $class in
        


        1) echo " You have chosen the $char1. The $char1 is known for his strength in combat. "
	   echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
          
      create_character_stats
             ;;
       
        2) echo " You have chosen the $char2. Magic is your primary weapon. Their high Attunement and Intelligence makes learning more sorcery and pyromancy very easy."
		
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo 
                 
      create_character_stats
                ;;
        3) echo " You have chosen the $char3. $char3's have the ability to heal and are fairly balanced with learning abilities."
	   echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo	
		
      create_character_stats
                ;;
        4) echo " You have chosen the $char4. $char4's aren't a resilient class due to light armor, very low Vitality and a weak shield, but have high mobility. The attack speed of the $char4's Knife makes it a solid one on one weapon."
		
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo 
		
     create_character_stats
                ;;
                
        *) echo " Please pick a class from the list. "
		character_selection
		;;
esac

echo
echo
echo
echo
echo
echo




}





##################################
# Map Selection Function Loop
##################################
function map_selection_loop ()
{


while [ -z "$explore" ]
do

echo "Choose a map that you wish to explore. "
echo
echo
echo
echo "1 - $map1"
echo "2 - $map2"
echo "3 - $map3"
echo "4 - $map4"

read explore;

clear

done



}








############################################
# Map Selections
###########################################
function map_selection_menu ()

{



echo " Press enter to embark on your journey...Evil awaits you. "


read


clear


transition_screen 

echo " You have arrived ashore to the Lost Island.. "

read

map_ascii_art 

map_selection_loop

clear

case $explore in
      1) echo " You have chosen to wander $map1. Be aware, Those who wander these woods become possessed by pure evil. "
           echo
           echo
           echo
           echo
           echo
           echo
           echo
        possessed_woods
            ;;
      2) echo " You have chosen to explore the $map2 .....The Damned never sleep and are hungry for flesh. "


           echo
           echo
           echo
           echo
           echo
           echo
           echo
       the_damned_paths
            ;;
      3) echo " You have chosen to visit $map3. The heat will consume you...Stay away from the gold! "
           echo
           echo
           echo
           echo
           echo
           echo
           echo


            ;;
      4) echo " You have chosen to walk $map4 .... The magic is strong here,the sun is never present, Stay aware of your surroundings."


           echo
           echo
           echo
           echo
           echo
           echo
           echo

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

read choice;

clear

done

clear

case $choice in
     1) echo " You have decided to wander the woods and encountered a..."
      
        echo
        echo
        echo
        echo

       random_creature_generator_possessed_woods 
       
        echo
        echo
        echo
        echo

       battle_damage_dice_roll
       ;;
     
     2) echo " You chose to battle creatures and will fight a... "
       random_creature_generator_possessed_woods
       battle_damage_dice_roll
       battle_confirmation
        ;;
    

     3) echo " You have chose to leave this map.."
	unset explore
               
        ;;
     4) echo " Are you ready to face $boss1 ?...This enemy is powerful."
        echo
        echo
        echo
        echo
        echo
        echo
        echo

       possessed_knight
       battle_damage_dice_roll
      

        ;;
     
     
      *)  echo " Please make a selection from the list...."

        ;;

esac

}

#########################################################################
# City of The Damned
#########################################################################
function the_damned_paths ()

{

while [ -z "$choice" ]
do

echo " What will you do next? "

echo "1 -Walk The Damned Paths"
echo "2 -Battle The Damned"
echo "3 -Leave The Damned Paths"
echo "4 -Find The King of The Damned"

read choice;

clear

done

clear

case $choice in
     1) echo " You have decided to walk The Damned Paths and encountered...."
      
        echo
        echo
        echo
        echo

       random_creature_generator_damned_paths 
       
        echo
        echo
        echo
        echo
       
        battle_damage_dice_roll
        ;;
     
     2) echo " You chose to battle The damned and will fight a... "
       random_creature_generator_damned_paths
       battle_damage_dice_roll
       battle_confirmation
        ;;
     3) echo " You have chose to leave this map.."
	unset explore
               
        ;;
     4) echo " Are you ready to face The King of The Damned?...This enemy is harvests large amounts of evil energy."
        echo
        echo
        echo
        echo
        echo
        echo
        echo
        
     battle_damage_dice_roll
      
          
         ;;
    

      *) echo " Please make a selection from the list....";;

esac

}















#######################################################################################################################################################
# This is where the script runs in order from functions made and statements
#######################################################################################################################################################



intro_ascii_art

get_player_name

get_player_confirmation


character_selection

map_selection_menu



