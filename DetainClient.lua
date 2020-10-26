local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local BackpackEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BackpackEvent")
local SearchEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Search")
local DetainInteractablesRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DetainInteractables")
local AnimationsEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("AnimationsEvent")

local DetainedAnim = script:WaitForChild("Detained")
local DetainedTrack

local function pack(value)
	if value then
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
	else
		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	end
end

local function search(array)
	for i,_ in pairs(array) do
		print(array[i])
	end
end

local function animations(animation, bool)
	if bool == true then
		DetainedTrack = player.Character.Humanoid:LoadAnimation(DetainedAnim)
		DetainedTrack:Play()
	else
		DetainedTrack:Stop()
	end
end

local function interactables(main, character)
	for i,v in pairs(Players:GetPlayers()) do
		if workspace:FindFirstChild(v.Name).UpperTorso:FindFirstChild("Main") then return end
		if v.Name == game.Players.LocalPlayer.Name then return end
		
		local clone = main:Clone()
		clone.Parent = workspace:FindFirstChild(v.Name).UpperTorso
	end
end

BackpackEvent.OnClientEvent:Connect(pack)
SearchEvent.OnClientEvent:Connect(search)
DetainInteractablesRemote.OnClientEvent:Connect(interactables)
AnimationsEvent.OnClientEvent:Connect(animations)