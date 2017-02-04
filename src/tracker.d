import std.stdio;
import std.string;
import std.regex;
import std.conv;

void main() {
	while (true) {


		writeln("\n~Welcome to the HP Tracker by Matt Johnson~\n\n 1 - Start Battle\n 2 - Exit\n\nEnter choice: ");
		int menuChoice;
		string menuChoiceUn;
		menuChoiceUn = chomp(readln());
		menuChoiceUn = replaceAll(menuChoiceUn, regex("[a-zA-Z]"), "");

		if (menuChoiceUn != "")
		{
			menuChoice = to!int(menuChoiceUn);
		}
		else
		{
			writeln("Invalid Input. Returning to Menu.");
			menuChoice = 0;
		}

		if (menuChoice == 1)
		{
			string playerCountUn;
			int playerCount = 0;
			do
			{
				writeln("\nPlayer Count: ");
				playerCountUn = chomp(readln());

				playerCountUn = replaceAll(playerCountUn, regex("[a-zA-Z]"), "");

				if (playerCountUn != "")
				{
					playerCount = to!int(playerCountUn);
				}
				else
				{
					writeln("\nInvalid Input. Please Try Again.");
					playerCount = 0;
				}
			}
			while(playerCount <= 0);

			string[] players;
			players.length = playerCount;

			for (int i = 0; i < playerCount; i++)
			{
				writeln("\nPlayer ", i+1, " name: ");
				players[i] = chomp(readln());
			}

			int innerMenu;
			do {

				int enemyCount;
				string enemyCountUn;

				do {
					writeln("\nEnemy Count: ");
					enemyCountUn = chomp(readln());
					enemyCountUn = replaceAll(enemyCountUn, regex("[a-zA-Z]"), "");

					if (enemyCountUn != "")
					{
						enemyCount = to!int(enemyCountUn);
					}
					else
					{
						writeln("\nInvalid Input. Please Try Again.");
						enemyCount = 0;
					}
				}
				while(enemyCount <= 0);

				string[] enemies;
				int[] enemyHP;
				enemies.length = enemyCount + 1;
				enemyHP.length = enemyCount + 1;

				for (int i = 0; i < enemyCount; i++)
				{
					writeln("\nEnemy ", i+1, " name: ");
					enemies[i] = chomp(readln());

					string healthUn;
					do {
						writeln("\n", enemies[i], "'s health: ");
						healthUn = chomp(readln());
						healthUn = replaceAll(healthUn, regex("[a-zA-Z]"), "");

						if (healthUn != "")
						{
							enemyHP[i] = to!int(healthUn);
						}

						else
						{
							writeln("\nInvalid Input. Please Try Again.");
							enemyHP[i] = 0;
						}
					}
					while(enemyHP[i] <= 0);
				}

				//healing target
				enemies[enemyCount] = "heal";
				enemyHP[enemyCount] = 100000;

				int[] playerDamages;
				playerDamages.length = playerCount;
				int totalHP = 0;

				do {
					writeln("\n~~~~~~Enemy Update~~~~~~\n");

					for (int i = 0; i < enemyCount; i++) 
					{
						writeln(enemies[i], "\nHP: ", enemyHP[i], "\n");
					}
					writeln("~~~~~~~~~~~~~~~~~~~~~~~~\n");
					bool retryTarget = true;
					int attackerIndex;
					int targetIndex;
					do {
						writeln("Target: ");
						string target = chomp(readln());

						for (int i = 0; i < enemyCount; i++)
						{
							if (target == enemies[i])
							{
								retryTarget = false;
								targetIndex = i;
							}
						}
					}
					while (retryTarget == true);

					string damageUn;
					int damage;

					do {
						writeln("\nDamage: ");
						damageUn = chomp(readln());
						damageUn = replaceAll(damageUn, regex("[a-zA-Z]"), "");

						if (damageUn != "")
						{
							damage = to!int(damageUn);
						}
						else 
						{
							writeln("\nInvalid Input. Please Try Again.");
							damage = 0;
						}
					}
					while (damage <= 0);
					
					bool retryAttacker = true;
					do {
						writeln("\nAttacker: ");
						string attacker = chomp(readln());

						for (int i = 0; i < playerCount; i++)
						{
							if (attacker == players[i])
							{
								retryAttacker = false;
								attackerIndex = i;
							}
						}
					}
					while (retryAttacker == true);

					if (enemyHP[targetIndex] > damage) 
					{
						playerDamages[attackerIndex] = playerDamages[attackerIndex] + damage;
					}
					else
					{
						playerDamages[attackerIndex] = playerDamages[attackerIndex] + enemyHP[targetIndex];
					}

					if (enemyHP[targetIndex] > damage)
					{
						enemyHP[targetIndex] = enemyHP[targetIndex] - damage;
					}
					else
					{
						enemyHP[targetIndex] = 0;
					}

					totalHP = 0;
					for (int i = 0; i < enemyCount; i++)
					{
						totalHP = totalHP + enemyHP[i];
					}
				} 
				while(totalHP > 0);

				writeln("\n~~~~~~Damage Tally~~~~~~\n");

				for (int i = 0; i < playerCount; i++)
				{
					writeln(players[i], ": ", playerDamages[i], "\n");
				}

				writeln("~~~~~~~~~~~~~~~~~~~~~~~~\n");

				do {
					string innerMenuUn;
					do {
						writeln("\n~Options~\n 1 - Start New Battle with Same Players\n 2 - Main Menu\n\nEnter Choice: ");
						innerMenuUn = chomp(readln());
						innerMenuUn = replaceAll(innerMenuUn, regex("[a-zA-Z]"), "");

						if (innerMenuUn != "")
						{
							innerMenu = to!int(innerMenuUn);
						}
						else
						{
							writeln("\nInvalid Input. Please Try Again.");
							innerMenu = 0;
						}
					}
					while(innerMenu <= 0);
				}
				while (innerMenu != 1 && innerMenu != 2);
			}
			//whole battle
			while (innerMenu == 1);
		}
		else if (menuChoice == 2)
		{
			break;
		}
	}
}