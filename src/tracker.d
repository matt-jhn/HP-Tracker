import std.stdio;
import std.string;

void main() {
	while (true) {
		
		writeln("\n~Welcome to the HP Tracker by Matt Johnson~\n\n 1 - Start Battle\n 2 - Exit\n\nEnter choice: ");
		int menuChoice;
		readf(" %s", &menuChoice);

		if (menuChoice == 1)
		{
			int playerCount = 0;
			writeln("\nPlayer Count: ");
			readf(" %s\n", &playerCount);

			string[] players;
			players.length = playerCount;

			for (int i = 0; i < playerCount; i++)
			{
				writeln("\nPlayer ", i+1, " name: ");
				players[i] = chomp(readln());
			}

			int innerMenu;
			do {
				writeln("\nEnemy Count: ");
				int enemyCount;
				readf(" %s\n", &enemyCount);

				string[] enemies;
				int[] enemyHP;
				enemies.length = enemyCount + 1;
				enemyHP.length = enemyCount + 1;

				for (int i = 0; i < enemyCount; i++)
				{
					writeln("\nEnemy ", i+1, " name: ");
					enemies[i] = chomp(readln());
					writeln("\n", enemies[i], "'s health: ");
					readf(" %s\n", &enemyHP[i]);
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

					writeln("\nDamage: ");
					int damage;
					readf(" %s\n", &damage);
					
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
					writeln("\n~Options~\n 1 - Start New Battle with Same Players\n 2 - Main Menu\n\nEnter Choice: ");
					readf(" %s\n", &innerMenu);
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