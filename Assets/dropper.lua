while wait(3) do
	local Tycoon = script:FindFirstAncestor("Tycoon")
	
	pcall(function()
		local New = game.ServerStorage.Coins:FindFirstChild(Tycoon:GetAttribute("Type")):Clone()
		New.Parent = workspace
		New.Position = script.Parent.Position - Vector3.new(0, 2, 0)
	end)
end
