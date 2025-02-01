while wait() do
	script.Parent.Parent.Icon.Icon.Image = "rbxassetid://".. if string.len(script.Parent.Text) > 0 then script.Parent.Text else script.Parent.PlaceholderText
end
