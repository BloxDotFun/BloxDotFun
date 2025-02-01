script.Parent.Touched:Connect(function(Touched)
	if game.ServerStorage.Coins:FindFirstChild(Touched.Name) then
		script:FindFirstAncestor("Tycoon"):SetAttribute("Solana", script:FindFirstAncestor("Tycoon"):GetAttribute("Solana")+Touched:GetAttribute("Value"))
		Touched:Destroy()
	end
end)
