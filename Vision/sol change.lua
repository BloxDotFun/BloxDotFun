if not table.find(require(game.ReplicatedStorage.Developers), game.Players.LocalPlayer.Name) then
	script.Parent:Destroy()
end

script.Parent.FocusLost:Connect(function()
	game.ReplicatedStorage.SetSolana:FireServer(tonumber(script.Parent.Text))
end)
