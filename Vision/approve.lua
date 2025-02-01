CurrentData = nil
CurrentFrame = nil

script.Parent.Parent.Info.Event:Connect(function(Data, Frame)
	CurrentData = Data
	CurrentFrame = Frame
end)

script.Parent.MouseButton1Down:Connect(function()
	game.ReplicatedStorage.Approve:FireServer(CurrentData, script.Parent.Parent.CA.Text)
	script.Parent.Parent.Visible = false
	CurrentFrame:Destroy()
end)
