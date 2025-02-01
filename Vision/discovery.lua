local Refreshing = false
local CoolDown = 0

function Refresh()
	if tick()-CoolDown > 5 then
		CoolDown = tick()
	else
		return
	end
	if Refreshing then return end
	Refreshing = true
	task.spawn(function()
		while Refreshing do
			script.Parent.ImageLabel.Rotation = if (script.Parent.ImageLabel.Rotation + 0.1) >= 360 then 0 else script.Parent.ImageLabel.Rotation + 0.1
			task.wait()
		end
		script.Parent.ImageLabel.Rotation = 0
	end)
	for _, Item in pairs(script.Parent.Parent.Tokens:GetChildren()) do
		if Item:IsA("Frame") then
			Item:Destroy()
		end
	end
	local Requests = game.ReplicatedStorage.GetAllCoins:InvokeServer()
	for _, Request in ipairs(Requests) do
		local New = script.Parent.Parent.Tokens.UIListLayout.Slot:Clone()
		New.Coin.Text = Request.Name or "404"
		New.Extra.Text = "<b>Time</b>: ".. (Request.Time or "404")
		New.Ticker.Text = "$".. Request.Ticker or "404"
		New.Icon.Icon.Image = Request.Image or 0
		New.CA.Text = Request.CA or "404"
		New.View.MouseButton1Down:Connect(function()
			script.Parent.Parent.Parent.Buy.View:Fire(Request.CA)
		end)
		New.Parent = script.Parent.Parent.Tokens
		if table.find(require(game.ReplicatedStorage.Developers), game.Players.LocalPlayer.Name) then
			New.Trash.MouseButton1Down:Connect(function()
				game.ReplicatedStorage.DeleteCoin:FireServer(Request.CA)
				New:Destroy()
			end)
		else
			New.Trash:Destroy()
		end
	end
	Refreshing = false
	script.Parent.ImageLabel.Rotation = 0
end

script.Parent.MouseButton1Down:Connect(function()
	Refresh()
end)

Refresh()
