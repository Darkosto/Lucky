local mod = RegisterMod("Lucky!1!", 1)
local game = Game()
	

local Challenges = {
	CHALLENGE_LUCKY = Isaac.GetChallengeIdByName("Lucky!1!")
}


function mod:onPlayerInit(player)
	if game.Challenge == Challenges.CHALLENGE_LUCKY then 


	    --Add 10 Luck
		for i = 1, 10, 1	do
		    player:UsePill(PillEffect.PILLEFFECT_LUCK_UP, PillColor.PILL_NULL)
		end
	end
end

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod.onPlayerInit)