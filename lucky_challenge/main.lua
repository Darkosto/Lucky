local lucky_challenge = RegisterMod("Lucky!1!", 1)
local game = Game()

local Challenges = {
	CHALLENGE_LUCKY = Isaac.GetChallengeIdByName("Lucky!1!")
}

--Set starting coins to 0, 3 soul hearts, and add 10 luck
function lucky_challenge:onPlayerInit(player)
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
	player:AddCoins(-10)
	player:AddSoulHearts(-2)

	    --Add 10 Luck
		for i = 1, 10, 1	do
		    player:UsePill(PillEffect.PILLEFFECT_LUCK_UP, PillColor.PILL_NULL)
		end
	end
end

--If player picks up a coin then luck down is applied
local currCoins = 0;
local isStarted = false;
 
function lucky_challenge:setStartingConsumables()
	player = Isaac.GetPlayer(0);
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
		if(isStarted == false) then
			currCoins = player:GetNumCoins();
			isStarted = true;
		end
	end
end

function lucky_challenge:checkConsumables()
    player = Isaac.GetPlayer(0);
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 
   
		if(currCoins < player:GetNumCoins()) then
			player:UsePill(PillEffect.PILLEFFECT_LUCK_DOWN, PillColor.PILL_NULL)
			player:EvaluateItems()
		end
			currCoins = player:GetNumCoins();
	end
end
lucky_challenge:AddCallback(ModCallbacks.MC_POST_UPDATE, lucky_challenge.setStartingConsumables);
lucky_challenge:AddCallback(ModCallbacks.MC_POST_UPDATE, lucky_challenge.checkConsumables);
lucky_challenge:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, lucky_challenge.onPlayerInit)