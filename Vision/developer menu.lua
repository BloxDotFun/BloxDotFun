local Usernames = require(game.ReplicatedStorage.Developers)

if not table.find(Usernames, game.Players.LocalPlayer.Name) then
	script.Parent.Parent.Parent.DeveloperMenu:Destroy()
	script.Parent:Destroy()
end
