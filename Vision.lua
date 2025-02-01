local Functions = require(game.ReplicatedStorage.Functions)

script.Parent.View.Event:Connect(function(CA)
	local Coin = game.ReplicatedStorage.GetCoin:InvokeServer(CA)

	if not Coin[1] then
		return
	end
	script.Parent.CA.Value = CA

	local Portfolio = Coin[3]
	Coin = Coin[2]

	script:FindFirstAncestor("Menu").Title.TextLabel.Text = Coin.Ticker
	script.Parent.Confirm.TextLabel.Text = Coin.Ticker.. " for ".. (tonumber(script.Parent.Amount.Text) or "0").. " SOL"

	script.Parent.MarketCap.Value.Text = Functions.ConvertNumber(Coin.MarketCap)

	require(script.Parent.Chart.ChartModule).Generate(Coin.History)

	for _, Order in pairs(script.Parent.Orders:GetChildren()) do
		if Order:IsA("Frame") then
			Order:Destroy()
		end
	end

	for _, Order in pairs(Coin.Orders) do
		local New = script.Parent.Orders.UIListLayout.Order:Clone()
		if Order.Type == 1 then
			New.Total.TextColor3 = Color3.fromRGB(221, 46, 68)
			New.Time.TextColor3 = Color3.fromRGB(221, 46, 68)
			New.USD.TextColor3 = Color3.fromRGB(221, 46, 68)
			New.Type.BackgroundColor3 = Color3.fromRGB(221, 46, 68)
			New.Type.TextLabel.Text = "S"
		end
		New.Total.Text = Functions.ConvertNumber(math.floor(Order.Total * 100) / 100) .. " SOL"
		New.USD.Text =  Functions.ConvertNumber(math.floor(Order.USD * 100) / 100) .. "$"
		New.Time.Text = Functions.TimeConvert(math.round(tick()-Order.Time))
		New.Parent = script.Parent.Orders
	end
	print(Portfolio)
	script.Parent.PlayerStats.Sold.Value.Text = Functions.ConvertNumber(math.floor(Portfolio.Sold*100) / 100) .. " SOL"
	script.Parent.PlayerStats.Invested.Value.Text = Functions.ConvertNumber(math.floor(Portfolio.Invested*100) / 100) .. " SOL"
	script.Parent.PlayerStats.Remaining.Value.Text = Functions.ConvertNumber(math.floor(Portfolio.Remaining*Coin.Price*100) / 100) .. " SOL"
	local PL = (Portfolio.Sold) + (Portfolio.Remaining*Coin.Price) - (Portfolio.Invested)
	local PLColor = if PL > 0 then Color3.fromRGB(102, 255, 102) elseif PL < 0 then Color3.fromRGB(221, 46, 68) else Color3.fromRGB(177, 177, 177)
	if PL < 0 then
		PL *= -1
	end
	script.Parent.PL.Value.Text = Functions.ConvertNumber(math.floor(PL*100) / 100) .. " SOL"
	script.Parent.PL.Value.TextColor3 = PLColor
	script.Parent.PLP.Value.Text = math.floor((Portfolio.Invested - PL) / Portfolio.Invested * 100) / 100 .. "%"
	script.Parent.PLP.Value.TextColor3 = PLColor
	
	for _, Frame in pairs(script:FindFirstAncestor("Frames"):GetChildren()) do
		Frame.Visible = false
	end
	script.Parent.Visible = true
end)
