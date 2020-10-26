--[[
ToolHandler.rbxm
Handles the giving of tools when a subject join or leaves a team


CantBuildBlox (Ryan)
September 7th, 2020
SCPF
]]

local Players = game:GetService("Players")
local TeamData = require(game:GetService("ReplicatedStorage").Modules:WaitForChild("TeamData"))
local ss = game:GetService("ServerStorage")
local tools = ss:WaitForChild("Tools")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local CollectionService = game:GetService("CollectionService")

local function onCharacterAdded(character)
	local LocalPlayer = game:GetService("Players"):FindFirstChild(character.Name)
	if TeamData.Teams[tostring(LocalPlayer.Team)] then
		for i,v in pairs(TeamData.Teams[tostring(LocalPlayer.Team)].Tools) do
			local tool = tools[tostring(v)]:Clone()
			tool.Parent = LocalPlayer.Backpack
		end
	else
		warn(tostring(LocalPlayer.Team).." DOES NOT HAVE A TEAMDATA")
	end
	
	local ui = ReplicatedStorage:WaitForChild("UI_Storage").Main:Clone()
	ui.Parent = character.HumanoidRootPart
	
	
	CollectionService:AddTag(character.HumanoidRootPart, "Interactable")
	--[[
	if MarketplaceService:UserOwnsGamePassAsync(LocalPlayer.UserId, 000000) and LocalPlayer.Team.Name == "Class-D" then
		local tool = tools["bleh"]:Clone()
		tool.Parent = LocalPlayer.Backpack
	end
	]]
end


local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)