--[[
TeamHandler.rbxm
Handles the joining of teams via the RemoteEvent


CantBuildBlox (Ryan)
September 7th, 2020
SCPF
]]

local rs = game:GetService("ReplicatedStorage")
local Remotes = rs:WaitForChild("Remotes")
local ChangeTeam = Remotes:WaitForChild("ChangeTeam")
local LoadCharacter = Remotes:WaitForChild("OnLoadCharacter")
local Teams = game:GetService("Teams")

local teamData = require(rs.Modules:WaitForChild("TeamData"))
local antiCheat = require(script.Parent.modules["Anti-Cheat"])

local Bypass = {
	41584259,
	130668355,
	6503173,
}

function ChangeTeams(player,team)
	print(player.Name.." has attempted to join ".. tostring(team))
	if game.Players:WaitForChild(player.Name):GetRankInGroup(teamData.Teams[tostring(team)].Group) >= teamData.Teams[tostring(team)].Rank or table.find(Bypass, player.UserId) then
		print(player.Name.." has joined team ".. tostring(team))
		game.Players:WaitForChild(player.Name).Team = Teams:WaitForChild(tostring(team))
	else
		antiCheat(player, "attempting to manipulate player team", 3)
	end
	
end

function OnLoadCharacter(player)
	game.Players:WaitForChild(player.Name):LoadCharacter()
end


LoadCharacter.OnServerEvent:Connect(OnLoadCharacter)
ChangeTeam.OnServerEvent:Connect(ChangeTeams)

