script.Parent.Touched:Connect(function(Touched: Part)
	local Player = game.Players:GetPlayerFromCharacter(Touched.Parent)
	if not Player then
		return
	end
	if script:FindFirstAncestor("Tycoon"):GetAttribute("Owner") ~= Player.Name then
		return
	end
	
	local Sol = script:FindFirstAncestor("Tycoon"):GetAttribute("Solana")
	script:FindFirstAncestor("Tycoon"):SetAttribute("Solana", 0)
	Player.leaderstats.Solana.Value += Sol
end)
