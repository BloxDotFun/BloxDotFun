script.Parent.Changed:Connect(function()
	script.Parent.Parent.Confirm.TextLabel.Text = script:FindFirstAncestor("Menu").Title.TextLabel.Text.. " for ".. (tonumber(script.Parent.Text) or "0").. " SOL"
end)
