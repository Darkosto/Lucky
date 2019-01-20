local mod = RegisterMod("Lucky!1!", 1)
local game = Game()

local Challenges = {
	CHALLENGE_LUCKY = Isaac.GetChallengeIdByName("Lucky!1!")
}

--Set starting coins to 0 and add 10 luck
function mod:onPlayerInit(player)
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
	player:AddCoins(-99)

	    --Add 10 Luck
		for i = 1, 10, 1	do
		    player:UsePill(PillEffect.PILLEFFECT_LUCK_UP, PillColor.PILL_NULL)
		end
	end
end

--If player picks up a coin then luck down is applied
local currCoins = 0;
local isStarted = false;
 
function mod:setStartingConsumables()
	player = Isaac.GetPlayer(0);
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
		if(isStarted == false) then
			currCoins = player:GetNumCoins();
			isStarted = true;
		end
	end
end

function mod:checkConsumables()
    player = Isaac.GetPlayer(0);
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
   
		if(currCoins < player:GetNumCoins()) then
			player:UsePill(PillEffect.PILLEFFECT_LUCK_DOWN, PillColor.PILL_NULL)
			player:EvaluateItems()
		end
			currCoins = player:GetNumCoins();
	end
end
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.setStartingConsumables);
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.checkConsumables);
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod.onPlayerInit)