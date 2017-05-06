#!/bin/bash
####################
# Character Class/Traits/Stats variables
####################
char1=$(echo Warrior)
char2=$(echo Sorcerer)
char3=$(echo Cleric)
char4=$(echo Thief)


####################
# Location Class/Traits/Stats variables
####################




####################
# Function for encounters/adventures/etc
####################



echo '  ,     \    /      ,       
       / \    )\__/(     / \       
      /   \  (_\  /_)   /   \      
 ____/_____\__\@  @/___/_____\____ 
|             |\../|              |
|              \VV/               |
|  Welcome to the bash RPG game   |
|_________________________________|
 |    /\ /      \\       \ /\    | 
 |  /   V        ))       V   \  | 
 |/     `       //        '     \| 
echo            V                ' '

echo " This game requires the use of the enter key and input to proceed.. "

read

echo " Please insert your name and press enter to continue... "

read name 

echo " Hello $name, Please pick a character class and hit enter... "

echo "1 - $char1"
echo "2 - $char2"
echo "3 - $char3"
echo "4 - $char4"

read class;

case $class in
        1) echo " You have chosen the $char1. The $char1 is a good all-round choice due to the character’s combination of high Strength and Dexterity. ";;  
        2) echo " You have chosen the sorcerer. Magic is your primary weapon. Their high Attunement and Intelligence makes learning more sorcery and pyromancy very easy.";;
        3) echo " You have chosen the cleric. Clerics have the ability to heal and are failry balanced with learning abilities.";;
        4) echo " You have chosen the thief. Thieves aren't a resilient class due to light armor, very low Vitality and a weak shield, but have high mobility. The attack speed of the Bandit's Knife makes it a solid one on one weapon.";;
        *) echo " Please pick a class from the list. ";;

esac

echo " Press enter to embark on your journey...Evil awaits you. "

read

echo " You have arrived ashore to the Lost Island.. "

read

echo " Where do you go next? "

echo "1 - The Possessed Woods."
echo "2 - City of the Dead."
echo "3 - Dragon alley."
echo "4 - Witch Central."

read next;

case $next in
      1) echo " You have chosen to wander The Possessed Woods....Be aware, Those who walk these woods become possesed by pure evil. ";;
      2) echo " You have chosen to explore the City of The Dead.....The dead never sleep and are always hungry for flesh. ";;
      3) echo " You have chosen to visit Dragon Alley......The heat will consume you...Stay away from the gold! ";;
      4) echo " You have chosen to walk Witch Central.... The magic is strong here,the sun is never present, Stay aware of your surroundings.";;
      *) echo " Please chose your destination for travel.";;
esac
