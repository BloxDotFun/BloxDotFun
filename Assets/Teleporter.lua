script.Parent:SetAttribute("Floor", 1)

game.ReplicatedStorage.Teleporter.OnClientEvent:Connect(function(Open, Floor)
	pcall(function()
		script.Parent.Enabled = Open
		script.Parent.Floor.Text = "F".. Floor
		script.Parent:SetAttribute("Floor", Floor)
	end)
end)

script.Parent.Up.MouseButton1Down:Connect(function()
	game.ReplicatedStorage.Teleporter:FireServer(true, script.Parent:GetAttribute("Floor"))
end)

script.Parent.Down.MouseButton1Down:Connect(function()
	game.ReplicatedStorage.Teleporter:FireServer(false, script.Parent:GetAttribute("Floor"))
end)
