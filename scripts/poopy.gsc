#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	thread onPlayerConnect();
}


onPlayerConnect() {
	level endon("disconnect");
	
	for(;;) {
		level waittill("connected", player);
	
		player thread onPlayerSpawned();
		player thread monitorGrenades();
	}
}

onPlayerSpawned() {
	self endon("disconnect");
	
	for(;;) {
		self waittill("spawned_player");

		self.hasRadar = true;

		if(isDefined(self.pers["spawnPosition"])){
			self setOrigin( self.pers["spawnPosition"] );
		}
		
		if(isDefined(self.pers["spawnAngle"])){
			self setPlayerAngles( self.pers["spawnAngle"] );
		}
	}
}


monitorGrenades() {
	self endon("disconnect");
	
	for(;;) {
		self waittill( "grenade_fire", grenade, weaponName );
		wait 2.50;
		self maps\mp\perks\_perks::givePerk( weaponName );
	}
}
