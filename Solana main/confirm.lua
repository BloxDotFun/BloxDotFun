script.Parent.MouseButton1Down:Connect(function()
	local Mode = script.Parent.Parent.Mode.ModeValue.Value
	
	local Call = game.ReplicatedStorage:FindFirstChild(Mode.. "Coin"):InvokeServer(script.Parent.Parent.CA.Value, tonumber(script.Parent.Parent.Amount.Text))
	if Call[1] then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Order Success",
			Text = Call[2],
		})
		script.Parent.Parent.View:Fire(script.Parent.Parent.CA.Value)
	else
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Order Error",
			Text = Call[2],
		})
	end
end)
