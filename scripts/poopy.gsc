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
		player thread monitorMenus();
		 
		player.editClassNum = "none";
		player.editClassType = "none";
		player.editClassWeapon = "none";
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

monitorMenus(){
	self endon("disconnect");
	for(;;) {
		self waittill( "menuresponse", menu, response);
		
		switch(menu){
			case "muteplayer":
				if( isSubStr( response, "custom" ) ) {
					self.editClassNum = getSubStr(response, 6);
				}
				else if( isSubStr( response, "type," ) ) {
					self.editClassType = strtok(response, ",")[1];
				}
				else if( isSubStr( response, "gun," ) ) {
					self.editClassWeapon = strtok(response, ",")[1];
				}
			
				if( self.editClassNum != "none" && self.editClassType != "none" && self.editClassWeapon != "none" ) {
					classNum = int(self.editClassNum) - 1;
					
					classType = 0;
					if( self.editClassType == "secondary" )
						classType = 1;
					
					weaponInfo = strtok(self.editClassWeapon, "_");
					weapon = weaponInfo[0];
					attach1 = weaponInfo[1];
					attach2 = weaponInfo[2];
					
					self setPlayerData( "customClasses", classNum, "weaponSetups", classType, "weapon", weapon );
					self setPlayerData( "customClasses", classNum, "weaponSetups", classType, "attachment", 0, attach1 );
					self setPlayerData( "customClasses", classNum, "weaponSetups", classType, "attachment", 1, attach2 );
					
					self.editClassNum = "none";
					self.editClassType = "none";
					self.editClassWeapon = "none";
				}

			break;

			case "mapselect":
			if(response == "reload_map"){
				map_restart();
			} else {
				map(response);
			}
			break;
		}

		wait 0.25;
	}
}