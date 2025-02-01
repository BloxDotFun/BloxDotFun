local Upgraded = {}

script.Parent.Touched:Connect(function(Touched)
	if game.ServerStorage.Coins:FindFirstChild(Touched.Name) and not table.find(Upgraded, Touched) then
		table.insert(Upgraded, Touched)
		Touched:SetAttribute("Value", Touched:GetAttribute("Value") + script.Parent:GetAttribute("Upgrade"))
	end
end)
