script.Parent.MouseButton1Down:Connect(function()
	if script.Parent.Parent.StatusT.Text == "Status: <font color='rgb(119, 178, 85)'>Eligible ✅</font>" then
		local Result = game.ReplicatedStorage.CreateCoin:InvokeServer(script.Parent.Parent.Coin.Text, script.Parent.Parent.Ticker.Text, script.Parent.Parent.Description.Text, script.Parent.Parent.Icon.Icon.Image)
		if Result[1] then
			script.Parent.Parent.Coin.Text = ""
			script.Parent.Parent.Ticker.Text = ""
			script.Parent.Parent.Description.Text = ""
			game:GetService("StarterGui"):SetCore("SendNotification",{
				Title = "Creation Success",
				Text = "Coin has been requested! Go to Blox Vision for updates.",
			})
		else
			game:GetService("StarterGui"):SetCore("SendNotification",{
				Title = "Creation Error",
				Text = Result[2],
			})
		end
	else
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Creation Error",
			Text = "Your coin is not eligible! Check out the fields with red coloring.",
		})
	end
end)
