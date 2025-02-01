script.Parent.Parent.ModeValue.Changed:Connect(function(Value)
	game:GetService("TweenService"):Create(script.Parent.Parent.Selected, TweenInfo.new(1), {Position = script.Parent.Parent:FindFirstChild(Value).Position, BackgroundColor3 = script.Parent.Parent:FindFirstChild(Value).BackgroundColor3}):Play()
	game:GetService("TweenService"):Create(script.Parent.Parent.Parent.Confirm, TweenInfo.new(1), {BackgroundColor3 = script.Parent.Parent:FindFirstChild(Value).BackgroundColor3}):Play()
end)
