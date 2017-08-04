#!/bin/bash


##################################################
# echo spacers fucntion 7 spaces
##################################################
function echo_spacer_7 ()

{

echo
echo
echo
echo
echo
echo
echo

}

#########################
#echo spacer 4 spaces 
#########################
function echo_spacer_4 ()

{

echo
echo
echo
echo

}


###########################
# Character Class Variables
###########################
char1="Warrior"
char2="Assasin"
char3="Cleric"
char4="Hunter"


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
map3="Dragon's Den"
map4="Witch Valley"



########################################################################################################################################
# ALL FUNCTIONS :P
########################################################################################################################################




###############################################
# Creature  Encounters for The Possessed Woods
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
damned[2]="Damned Beast"
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
echo "|Welcome to the mini bash RPG game|"
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

echo_spacer_4
echo " Please enter your name and hit enter..."
while [[ $player_name_input = "" ]]; do
   read -r player_name_input
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

########################################
# Function for Battle Damage Number Roll
########################################
function battle_damage_dice_roll ()
{

battle_confirmation


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. "
read -r
echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "

echo_spacer_4


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
echo_spacer_4

elif [[ $battle_damage_dice_roll == 5 ]]
then
echo " You did 5 damage to this creature and took 5 damage. "

fi
}

########################################################
# Random Creature Generator Function The Possessed Woods
########################################################
function random_creature_generator_possessed_woods ()
{

random_creature_generator_possessed_woods=$(( RANDOM % 4 ))
echo  "${ghoul[$random_creature_generator_possessed_woods]}"
}

########################################################
# Random Creature Generator Function The Damned Paths
########################################################
function random_creature_generator_damned_paths ()
{
random_creature_generator_damned_paths=$(( RANDOM % 4 ))
echo  "${damned[$random_creature_generator_damned_paths]}"
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
		stat1_num_rand=$(( 1 + RANDOM % 7))
		stat1_num_final=$(( stat1_num_rand + stat1_num_base ))
		echo Your characters $stat1 is: $stat1_num_final
	        echo_spacer_4
	echo =======$stat2========================
		stat2_num_rand=$(( 1  + RANDOM % 7))
		stat2_num_final=$((stat2_num_rand + stat2_num_base))
		echo Your characters $stat2 is: $stat2_num_final
		echo_spacer_4
	echo =======$stat3=======================
		stat3_num_rand=$(( 1 + RANDOM % 7))
		stat3_num_final=$((stat3_num_rand + stat3_num_base))
		echo Your character $stat3 is: $stat3_num_final
		echo_spacer_4
	echo =======$stat4=======================
		stat4_num_rand=$(( 1 + RANDOM % 7))
		stat4_num_final=$((stat4_num_rand + stat4_num_base))
		echo Your character $stat4 is: $stat4_num_final
}

##############################
#Character Selection Function
##############################
function character_selection ()
{
echo "1 - Warrior"
echo "2 - Assassin"
echo "3 - Cleric"
echo "4 - Hunter"

read -r class;

clear

case $class in

     1) echo " You have chosen $char1. The $char1 is known for his strength in combat and has a brutal thirst for his enemies blood to stain his blade... "
          
	   echo_spacer_4
           
	   echo " Character stats are generated at random and will randomize again depending on game progression."		
           
	   echo_spacer_7		
           create_character_stats
             
            ;;
       
        
     
     2) echo " You have chosen $char2. The $char2 is known for their speed. The shadows are where they reside.."
        
      echo_spacer_4   

      echo " Character stats are generated at random and will randomize again depending on game progression."  	
       
      echo_spacer_7 
      create_character_stats
                
            ;;
        
	
     3) echo " You have chosen $char3. The $char3 is known for having great HP. The fairies have granted them with many blessings. "
        
	echo_spacer_4   
        
	echo " Character stats are generated at random and will randomize again depending on game progression."  
		
       echo_spacer_7		
       create_character_stats
                
            ;;
        
	
     4) echo " You have chosen $char4. The $char4 is out for blood and collects the heads of his enemies as trophies after battle. Their defense is strong. "
       
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

echo " You have arrived ashore to the Lost Island.. "

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
      
  
      3) echo " You have chosen to visit $map3. The heat will consume you...Stay away from the gold! "
            
	 echo_spacer_7  
	      
	  ;;
      
      4) echo " You have chosen to walk $map4 .... The magic is strong here,the sun is never present, Stay aware of your surroundings."

         echo_spacer_7

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
     1) echo " You have decided to wander the Possessed Woods and encountered a..."
     
       echo_spacer_4 

       random_creature_generator_possessed_woods 
       
       echo_spacer_4
        
       battle_damage_dice_roll
       
      
       
      

       ;;
     
     2) echo " You chose to battle creatures and will fight a... "
      
       echo_spacer_4

       random_creature_generator_possessed_woods

       echo_spacer_4

       battle_damage_dice_roll
       
     
       
      
         ;;
    

     3) echo " You have chose to leave this map.."
	unset explore
               
        ;;
    
      4) echo " With days of searching you have found $boss1's Castle...You are hit with a strong evil force as you enter the gates, sending you flying into a wall. $boss1 makes an appearance with a swing of his bewitched sword near your face as you dodge..."
        
       echo_spacer_7

       possessed_knight
      
       echo_spacer_4
       
       battle_damage_dice_roll
      
      


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
      
       echo_spacer_7
       random_creature_generator_damned_paths
       transition_screen
       echo_spacer_7
       battle_damage_dice_roll
       

        ;;
     
     2) echo " The damned are nested in almost every path , you come across a... "
       
       echo_spacer_7
       random_creature_generator_damned_paths
       echo_spacer_7  
       battle_damage_dice_roll
       
       
        ;;
    
     3) echo " You have chose to leave this map.."
	
	unset explore
        
	;;
     
     
     4)
        echo " $boss2 is the ruler of all evil in The Damned Paths ...Defeat him and you will free all enslaved from the damned paths."
       
       	echo_spacer_7
	
        battle_damage_dice_roll
       
       	;;
    

      *) echo " Please make a selection from the list....";;
esac
}

######################################################
#Dragons Den Selections
######################################################

function dragons_den ()
{
	while [ -z "$choice" ]
	do

		echo " What will you do in Dragons Den? "

		echo "1 -Search the Dragons den for Gold"
		echo "2 -Battle Dragons"
		echo "3 -Leave This Map."
		echo "4 -Find The Golden Dragon"

		read -r choice;

	clear

done

clear














#######################################################################################################################################################
# This is where the script runs in order from functions made and statements
#######################################################################################################################################################
clear

intro_ascii_art

get_player_name

get_player_confirmation

character_selection

map_selection_menu


