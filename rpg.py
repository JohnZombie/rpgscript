#!/usr/bin/env python3

import os
import random

class Character(object):
    #This explains character attributes in the game
    def __init__(self):
       self.defense = random.randint(1,11)
       self.attack = random.randint(1,11)
       self.hp = random.randint(1,11)
    
class Game(object):
    def main(self):
        Warrior = Character()
        print(Warrior.attack)
        print(Warrior.defense)

Game().main()
