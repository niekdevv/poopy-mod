#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

init()
{
	thread manageBotCounts();

	setDvar("botcount", "16");

    setDvar("bots_domove", "0");

	setDvar("testclients_doattack", "0");
	setDvar("testclients_domove", "0");
    setDvar("testclients_watchkillcam", "0");
}

/**
    Manage the bot counts for the game.
    Spawns bots and kicks them when there is no room left.
 */
manageBotCounts(){
	level endon( "exitLevel_called" );

    for(;;) {
         botCount = GetDvarInt( "botcount" );
            
         if( level.gametype != "sd" && level.players.size < botCount ) {
            addBot();
            wait 1;
         } else if ( level.players.size > botCount ) {
            //Kick the first bot
            foreach( player in level.players ){
                if( player isBot() ){
                    kick( player getEntityNumber() );
                }
            }    
                
         }
            
         wait 0.05;
    }
}

/**
    Add a single bot
*/
addBot() {
	ent = addtestclient();

	if ( isDefined(ent) ) {
		ent setPlayerData( "prestige", randomintrange(0, 10));
		ent setPlayerData( "experience", RandomInt(2516000));
		ent thread initIndividualBot();
	}

}

initIndividualBot() {
    //Wait until the bot is assigned to a team
	while( !isDefined( self.pers["team"] ) )
		wait .1;

	self notify( "menuresponse" , game["menu_team"], "autoassign" );
	wait 0.3;

    //Set a random class for the bot
	self notify( "menuresponse", "changeclass", "class" + randomInt( 5 ) );

	self waittill( "spawned_player" );
    //Clear all perks for the bot
	self _clearPerks();
    //Handle the bot's movement
    self thread handleBotMovement();
}

/**
    Handles the moving of the bot when the dvar bots_domove = 1
 */
// handleBotMovement(){
// 	self endon("disconnect");

//     for (;;) {
//         botsDoMove = GetDvarInt( "bots_domove" );

//         if (botsDoMove != 1) {
//             self botStop();
//             continue;
//         }

//         //Pick a random forward and right int.
//         forward = randomIntRange(-127, 127);
//         right = randomIntRange(-127, 127);

//         //Move the bot
//         self botMovement(forward, right);
      
//         wait 3.5;
//     }
// }

handleBotMovement(){
	self endon("disconnect");

    for (;;) {
        self waittill ("bots_domove");
        wait 3.5;
    }
}