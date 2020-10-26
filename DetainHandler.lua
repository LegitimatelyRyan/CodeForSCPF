--[[
DetainHandler.rbxm
Handles the detaining of players serversided


CantBuildBlox (Ryan)
September 7th, 2020
SCPF
]]

local rs = game:GetService("ReplicatedStorage")
local Remotes = rs:WaitForChild("Remotes")
local DetainRemote = Remotes:WaitForChild("Detain")
local DetainInteractablesRemote = Remotes:WaitForChild("DetainInteractables")
local SearchRemote = Remotes:WaitForChild("Search")
local GrabRemote = Remotes:WaitForChild("Grab")
local ArrestRemote = Remotes:WaitForChild("Arrest")
local BlindfoldRemote = Remotes:WaitForChild("Blindfold")
local Teams = game:GetService("Teams")
local CollectionService = game:GetService("CollectionService")
local BackpackEvent = rs:WaitForChild("Remotes"):WaitForChild("BackpackEvent")
local AnimationsEvent = rs:WaitForChild("Remotes"):WaitForChild("AnimationsEvent")

local teamData = require(rs.Modules:WaitForChild("TeamData"))
local antiCheat = require(script.Parent.modules["Anti-Cheat"])

game:GetService("Players").PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Character)
		DetainInteractablesRemote:FireAllClients(script.Main, Character)
	end)
end)

function Detain(player, victimpart, value)
	print(victimpart)
	local victim = game.Players:WaitForChild(tostring(victimpart.Parent)) 
	local character = victimpart.Parent
	print("I fired!")
	if teamData.Teams[tostring(player.Team.Name)].LawEnforcement then
		if value then
			local Sound = script.DetainSFX:Clone()
			Sound.Parent = character.Head
			Sound:Play()
			print("he is cop, this is muy bueno")
			character.Humanoid.WalkSpeed = 0
			character.Humanoid.JumpPower = 0
			CollectionService:AddTag(victimpart, "Detained")
			BackpackEvent:FireClient(victim, true)
			AnimationsEvent:FireClient(victim, true)
		else
			character.Humanoid.WalkSpeed = 16
			character.Humanoid.JumpPower = 50
			CollectionService:RemoveTag(victimpart, "Detained")
			BackpackEvent:FireCliennt(victim, false)
			AnimationsEvent:FireClient(victim, false)
		end
	else
		antiCheat(player, "attempting to detain others while not law enforcement", 3)
	end
end

function Arrest(player, victimpart)
	local victim = game.Players:WaitForChild(tostring(victimpart.Parent)) 
	local character = victimpart.Parent
	print("I fired!")
	if teamData.Teams[tostring(player.Team.Name)].LawEnforcement then
		victim.Team = Teams:WaitForChild("Class-D")
		victim:LoadCharacter()
	else
		antiCheat(player, "attempting to arrest others while not law enforcement", 3)
	end
end

function Search(player, victimpart)
	local victim = game.Players:WaitForChild(tostring(victimpart.Parent)) 
	local character = victimpart.Parent
	print("I fired!")
	if teamData.Teams[tostring(player.Team.Name)].LawEnforcement then
		local tools = {}
		tools = victim:WaitForChild("Backpack"):GetChildren()
		SearchRemote:FireClient(player, tools)
	else
		antiCheat(player, "attempting to search others while not law enforcement", 3)
	end
end

function Grab(player, victimpart, value)
	local victim = game.Players:WaitForChild(tostring(victimpart.Parent)) 
	local character = victimpart.Parent
	print("I fired!")
	if teamData.Teams[tostring(player.Team.Name)].LawEnforcement and value then
		local Weld = Instance.new("Weld")
		Weld.Name = "DetainWeld"
		Weld.Parent = victimpart
		Weld.Part0 = victimpart
		Weld.Part1 = player.Character.HumanoidRootPart
		Weld.C1 = Weld.C1 * CFrame.new(0, 0, -3)
		victim.Character.Humanoid.PlatformStand = true
		CollectionService:AddTag(victimpart, "Grabbed")
	elseif teamData.Teams[tostring(player.Team.Name)].LawEnforcement and value == false then
		if victimpart:FindFirstChild("DetainWeld") then
			victimpart.DetainWeld:Destroy()
			victim.Character.Humanoid.PlatformStand = false
			CollectionService:RemoveTag(victimpart, "Grabbed")
		end
	else
		antiCheat(player, "attempting to search others while not law enforcement", 3)
	end
end

function Blindfold(player, victimpart, value)
	local victim = game.Players:WaitForChild(tostring(victimpart.Parent)) 
	local character = victimpart.Parent
	if value then
		CollectionService:AddTag(victimpart, "Blindfold")
		victim.PlayerGui.Blindfold.Enabled = true
	else
		CollectionService:RemoveTag(victimpart, "Blindfold")
		victim.PlayerGui.Blindfold.Enabled = false
	end
end


DetainRemote.OnServerEvent:Connect(Detain)
ArrestRemote.OnServerEvent:Connect(Arrest)
SearchRemote.OnServerEvent:Connect(Search)
BlindfoldRemote.OnServerEvent:Connect(Blindfold)