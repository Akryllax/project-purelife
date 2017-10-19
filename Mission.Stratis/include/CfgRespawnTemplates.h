class CfgRespawnTemplates
{
	// Class used in respawnTemplates entry
	class PurelifeDefault
	{
		// Function or script executed upon death. Parameters passed into it are the same as are passed into onPlayerKilled.sqf file
		onPlayerKilled = "core\EventHandlers\OnPlayerKilled.sqf";
		// Function or script executed upon respawn. Parameters passed into it are the same as are passed into onPlayerRespawn.sqf file
		onPlayerRespawned = "core\EventHandlers\onRespawn.sqf";
		// Default respawn delay (can be overwitten by description.ext entry of the same name)
		respawnDelay = 0;
		// 1 to respawn player when he joins the game. Available only for INSTANT and BASE respawn types
		// Can be overridden by description.ext attribute of the same name
		respawnOnStart = 1;
	};
};
