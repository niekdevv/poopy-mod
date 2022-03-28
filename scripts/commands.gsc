#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	thread onPlayerConnected();
	thread scripts\bounces::init();
}

onPlayerConnected() {
	level endon( "disconnect" );

	for(;;) {
		level waittill( "connected", player );
		
		//register custom commands
		player setClientDvar( "die", "suicide command" );
		player setClientDvar( "cp", "carepackage command" );
		player setClientDvar( "pred", "predator missile command" );
		player setClientDvar( "drop", "drop weapon command" );
		player setClientDvar( "last", "fast last command" );
		player setClientDvar( "twopiece", "twopiece command" );

		player setClientDvar( "ufo", "ufo command" );
		player setClientDvar( "savespawnpos", "save spawn position" );
		player setClientDvar( "loadspawnpos", "load spawn position" );
		player setClientDvar( "savepos", "save your current position" );
		player setClientDvar( "loadpos", "load your saved position" );
		player setClientDvar( "alltomouse", "all bots to your mouse position" );

		//register custom notifies
		player notifyOnPlayerCommand( "cmd_suicide", "die" );
		player notifyOnPlayerCommand( "cmd_carepackage", "cp" );
		player notifyOnPlayerCommand( "cmd_predmissile", "pred" );
		player notifyOnPlayerCommand( "cmd_canswap", "drop" );
		player notifyOnPlayerCommand( "cmd_fastlast", "last" );
		player notifyOnPlayerCommand( "cmd_twopiece", "twopiece" );
		player notifyOnPlayerCommand( "cmd_ufo", "ufo" );
		player notifyOnPlayerCommand( "cmd_savepos", "savepos" );
		player notifyOnPlayerCommand( "cmd_loadpos", "loadpos" );
		player notifyOnPlayerCommand( "cmd_savespawnpos", "savespawnpos" );
		player notifyOnPlayerCommand( "cmd_loadspawnpos", "loadspawnpos" );
		player notifyOnPlayerCommand( "cmd_alltomouse", "alltomouse" );


		//setup custom command threads
		player thread cmdSuicide();
		player thread cmdDropCanswap();
		player thread cmdCarePackage();
		player thread cmdPredMissile();
		player thread cmdFastLast();
		player thread cmdTwoPiece();
		player thread cmdAllToMouse();

		player thread cmdUfo();
		player thread cmdSavePos();
		player thread cmdLoadPos();
		player thread cmdSaveSpawnPos();
		player thread cmdLoadSpawnPos();
	}
}

cmdSuicide() {
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_suicide" );
		self suicide();
	}
}

cmdDropCanswap() {
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_canswap" );
		
		weapon = self getCurrentWeapon();
		
		if( !maps\mp\_utility::isKillstreakWeapon( weapon ) )
			self dropItem( weapon );			
		else
			self iPrintln( "You cannot drop this weapon" );
	}
}

cmdCarePackage() {
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_carepackage" );
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "airdrop", true );
	}
}

cmdPredMissile() {
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_predmissile" );
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
	}
}

cmdFastLast() {
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_fastlast" );
		setKillsToLast(1);
	}
}

cmdTwoPiece(){
	self endon( "disconnect" );
	
	for(;;) {
		self waittill( "cmd_twopiece" );
		setKillsToLast(2);
	}
}


setKillsToLast(killsToLast){
		scorelimit = getDvarInt("scr_dm_scorelimit");
		killLimit = scorelimit / 50;
		score = scorelimit - (killsToLast * 50);
		kills = killLimit - killsToLast;

		self.pointstowin = kills;
		self.pers["pointstowin"] = kills;
		self.score = score;
		self.pers["score"] = score;
		self.kills = kills;
		self.pers["kills"] = kills;

		self updateScores();
		self updateDMScores();
}

cmdUfo(){
self endon( "disconnect" );
	ufo = false;
	for(;;){
		self waittill( "cmd_ufo");
		ufo = !ufo;

		if(ufo){
			maps\mp\gametypes\_spectating::setSpectatePermissions();
			self allowSpectateTeam( "freelook", true );
			self.sessionstate = "spectator";
		} else {
			self.pers["ufo"] = false;
       		self allowSpectateTeam( "freelook", false );
			self.sessionstate = "playing";
		}

	}
}


cmdLoadSpawnPos(){
	self endon( "disconnect" );
	for(;;){
		self waittill( "cmd_loadspawnpos");

		if(!isDefined(self.pers["spawnPosition"])){
			self iPrintLn( "You first need to save a spawn location" );
		} else {
			self setOrigin( self.pers["spawnPosition"] );
			
			if(isDefined(self.pers["spawnAngle"])){
				self setPlayerAngles( self.pers["spawnAngle"] );
			}
		}
	}
}

cmdSaveSpawnPos(){
	self endon( "disconnect" );

	for(;;){
		self waittill( "cmd_savespawnpos");
		self.pers["spawnPosition"] = self.origin;
		self.pers["spawnAngle"] = self.angles;
	}

}

cmdSavePos(){
	self endon( "disconnect" );
	for(;;){
		self waittill( "cmd_savepos");
		self.pers["savePos"] = self.origin;
		self.pers["saveAng"] = self.angles;
	}
}

cmdLoadPos(){
	self endon("disconnect");
	for(;;){
		self waittill( "cmd_loadpos");
		if(!isDefined(self.pers["savePos"]) || !isDefined(self.pers["saveAng"])){
			self iPrintLn( "You first need to save a location" );
		} else {
			self setOrigin( self.pers["savePos"] );
			self setPlayerAngles( self.pers["saveAng"] );
		}
	}
}

cmdAllToMouse(){
	self endon("disconnect");

	for(;;){
		self waittill("cmd_alltomouse");

		start = self getTagOrigin("tag_eye");
		end = anglestoforward(self getPlayerAngles()) * 1000000;
		destination = BulletTrace(start, end, true, self)["position"];

			foreach(player in level.players)
			{
				if (!player isBot()) continue;

				player.pers["spawnPosition"] = destination;
				player setOrigin(destination);
			}
	}
}