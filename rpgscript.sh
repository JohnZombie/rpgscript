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
map3="Golden Den"
map4="Witch Valley"



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

boss2="King of The Damned"


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


boss4="Wicked Witch of The Valley"






########################################################################################################################################
# ALL FUNCTIONS :P
########################################################################################################################################




################################################# 
# spacing function 7 spaces
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

###############################
# Spacing Function 4 spaces 
###############################
function echo_spacer_4 ()

{

echo
echo
echo
echo

}

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
# Function for Battle Damage Number Roll Max 10 Damage
#####################################################################################
function battle_damage_dice_roll_10 ()
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

#######################################################
#  Function for Battle Damage Number Roll Max 20 Damage
#######################################################
function battle_damage_dice_roll_20 ()

{ 

 battle_confirmation


echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 10 to destroy this creature. "
read -r
echo_spacer_4


battle_damage_dice_roll=$((( RANDOM % 20 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to this creature. "

echo_spacer_4

if [[ $battle_damage_dice_roll -gt 10 ]]
then
echo " You have defeated this creature. "

echo_spacer_4


elif [[ $battle_damage_dice_roll -lt 10 ]]
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

elif [[ $battle_damage_dice_roll == 10 ]]
then
echo " You did 10 damage to this creature and took 10 damage. "

fi


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




##########################################################################
# What will you do next case selection functions for The possessed woods
##########################################################################

function what_will_you_do_next_possessed_woods ()

{


while [ -z "$select" ]
      do
         
        echo " What will you do next? "
        
        echo_spacer_4

        echo "1 -Battle this creature"
        echo
        echo "2 -Flee from this creature"
        
read -r select;

clear

done

clear

case $choice in

        1) echo " You chose to stay and battle this creature to the death."
           echo_spacer_4           
           battle_damage_dice_roll_10       
           ;;

        2) echo " You sense this enemies power and decide not to battle him and flee..Only true cowards flee from thy enemies."
             ;;

        *) echo " Please make a selection from the list. "
             ;;

esac

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

     1) echo " You have chosen $char1. $char1 is known for his strength in combat and has a brutal thirst for his enemies blood to stain his blade... "
          
	   echo_spacer_4
           
	   echo " Character stats are generated at random and will randomize again depending on game progression."		
           
	   echo_spacer_7		
           create_character_stats
             
            ;;
       
        
     
     2) echo " You have chosen $char2. $char2 is known for their speed. The shadows are where they reside.."
        
      echo_spacer_4   

      echo " Character stats are generated at random and will randomize again depending on game progression."  	
       
      echo_spacer_7 
      create_character_stats
                
            ;;
        
	
     3) echo " You have chosen $char3. $char3 is known for having great HP. The fairies have granted them with many blessings. "
        
	echo_spacer_4   
        
	echo " Character stats are generated at random and will randomize again depending on game progression."  
		
       echo_spacer_7		
       create_character_stats
                
            ;;
        
	
     4) echo " You have chosen $char4. $char4 is out for blood and collects the heads of his enemies as trophies after battle. Their defense is strong. "
       
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
      
  
      3) echo " You have chosen to visit $map3. The heat in these dens keep strangers out.. The gold is said to be precious and breathe taking, many have died in attempt toleave the den with these riches."
            
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
     1) echo " You have decided to wander $map1 and hear footsteps with leaves crumbling behind you.... You turn around and nothing is there. The crumbling begins to grow louder as you keep walking this time you feel a cold breeze surface the back of your neck. You turn around once more and it is a....."
     
      echo_spacer_4 

      random_creature_generator_possessed_woods
      
      echo_spacer_4
      
      what_will_you_do_next_possessed_woods

      echo_spacer_4
        
       
      
       
      

       ;;
     
     2) echo " You chose to battle creatures and will fight a... "
      
       echo_spacer_4

       random_creature_generator_possessed_woods

       echo_spacer_4

       battle_damage_dice_roll_10
       
     
       
      
         ;;
    

     3) echo " You have chose to leave this map.."
	unset explore
               
        ;;
    
      4) echo " With days of searching you have found $boss1's Castle...You are hit with a strong evil force as you enter the gates, sending you flying into a wall. $boss1 makes an appearance with a swing of his bewitched sword near your face as you dodge..."
        
       echo_spacer_7

       possessed_knight
      
       echo_spacer_4
       
       battle_damage_dice_roll_10
      
      


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
       
       

        ;;
     
     2) echo " The damned are nested in almost every path , you come across a... "
       
       echo_spacer_7
       random_creature_generator_damned_paths
       echo_spacer_7  
      
       
       
        ;;
    
     3) echo " You have chose to leave this map.."
	
	unset explore
        
	;;
     
     
     4)
        echo " $boss2 is the ruler of all evil in The Damned Paths ...Defeat him and you will free all enslaved from the damned paths."
       
       	echo_spacer_7
	
        
       
       	;;
    

      *) echo " Please make a selection from the list....";;
esac
}

######################################################
#Dragons Den Selections
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
       
       

        ;;
     
     2) echo " You ignore all of the precious gold and decide to wake up dragons for battle. "
       
       echo_spacer_7
       random_creature_generator_golden_den
       echo_spacer_7  
      
       
       
        ;;
    
     3) echo " You have chose to leave this map.."
	
	unset explore
        
	;;
     
     
     4)
        echo " $boss3 is the ruler of all gold on The Lost Island...You come across his nest of gold as you are wandering the den. He makes an appearance in gold so bright that the sun has no chance. You are blinded by his golden presence and lose site of him. $boss3 is not very happy to see you in his dens."       
       	
        echo_spacer_7
	
        
       
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
       random_creature_generator_golden_den
       echo_spacer_7
       
       

        ;;
     
     2) echo " You scream a battle cry in the valley calling out onto all creatures for a challenge. It is silent and all you hear are echoes of your voice. Red lights begin to flicker in all directions...but these are not lights, these are the eyes of blood thirsty enemies. You are now surrounded, what do you do? "
       
       echo_spacer_7
       random_creature_generator_golden_den
       echo_spacer_7  
      
       
       
        ;;
    
     3) echo " You have chose to leave this map.."
	
	unset explore
        
	;;
     
     
     4)
        echo " You see lights up ahead as you are wandering the dark valley. Goblets of fire light your path to the entrance. The door is slightly open with the smell of death lingering through its cracks. What do you do next?"       
       	
        echo_spacer_7
	
        
       
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


