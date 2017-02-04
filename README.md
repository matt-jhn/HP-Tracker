#HP Tracker
##by Matt Johnson

#**NOTE: Entering in non-numerical characters for numeric entries will cause a crash!**

##Healing

	When a player is healing, designate "heal" as the target. This will let healing points to be tracked equivalent to damage points.

##Inputs
	
	Target - The enemy the player is attacking.
	Damage - Amount of damage being dealt.
	Attacker - Player dealing the damage.

##Calculations
	
	If player does more damage than the target has hit points, the player will only receive the remaining hit points of the enemy as damage points.