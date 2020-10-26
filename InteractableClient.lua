--[[
InteractableClient.rbxm
Interactable checks which fires RemoteEvent to server

aerophobes (Ollie)
CantBuildBlox (Ryan)
September 11th, 2020
SCPF
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local teamData = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TeamData"))

local Player = Players.LocalPlayer
local Character1 = Player.Character

local InteractDistance = 7
local Debounce = false

local LawEnforcement = false -- defaults to no xd

if teamData.Teams[tostring(Player.Team.Name)].LawEnforcement then
	LawEnforcement = true
end

local Interactables = CollectionService:GetTagged("Interactable")

local function GetInteractable()
	-- ryan, if youre looking back, this looks very scary, i know, i will break it down for you
	local ClosestObject = {false, InteractDistance} -- this is a table to make sure we can change the second arg if we find a closer object
	for Index, Int in pairs(Interactables) do
		local DistanceFromChar = Player:DistanceFromCharacter(Int.Position)
		if DistanceFromChar < ClosestObject[2] and not Int:IsDescendantOf(Character1) then -- if door distance < current closest object saved in table then
			ClosestObject = {Int, DistanceFromChar} -- change the second arg to that object
		end
	end
	return ClosestObject -- return that table with the object and its distance in it
end


local function Interact(key)
	local ClosestInteractable = GetInteractable()
	print(tostring(ClosestInteractable[1]))
	if key == "e" then
		if ClosestInteractable[1] and not Debounce then
			Debounce = true
			if ClosestInteractable[1].Name == "Locker" then
				Player.PlayerGui:WaitForChild("On-Screen").Uniforms.Visible = true
			elseif ClosestInteractable[1].Name == "HumanoidRootPart" and LawEnforcement and not ClosestInteractable[1]:IsDescendantOf(Character1) then
				print(ClosestInteractable[1])
				if CollectionService:HasTag(ClosestInteractable[1], "Detained") then
					ReplicatedStorage.Remotes:WaitForChild("Detain"):FireServer(ClosestInteractable[1], false)
				elseif not CollectionService:HasTag(ClosestInteractable[1], "Grabbed") then
					ReplicatedStorage.Remotes:WaitForChild("Detain"):FireServer(ClosestInteractable[1], true)
				end
			else
				ReplicatedStorage.Remotes:WaitForChild("OpenDoor"):FireServer(ClosestInteractable[1])
			end
			wait(1)
			Debounce = false
		end
	else
		if key == "f" then
			if ClosestInteractable[1] and not Debounce then
				Debounce = true
				if ClosestInteractable[1].Name == "HumanoidRootPart" and LawEnforcement and not ClosestInteractable[1]:IsDescendantOf(Character1) then
					if CollectionService:HasTag(ClosestInteractable[1], "Detained") then
						ReplicatedStorage.Remotes:WaitForChild("Search"):FireServer(ClosestInteractable[1])
					end
				end
				wait(1)
				Debounce = false
			end
		elseif key == "t" then
			if ClosestInteractable[1] and not Debounce then
				Debounce = true
				if ClosestInteractable[1].Name == "HumanoidRootPart" and LawEnforcement and not ClosestInteractable[1]:IsDescendantOf(Character1) then
					if CollectionService:HasTag(ClosestInteractable[1], "Detained") and not CollectionService:HasTag(ClosestInteractable[1], "Grabbed") then
						ReplicatedStorage.Remotes:WaitForChild("Grab"):FireServer(ClosestInteractable[1], true)
					elseif CollectionService:HasTag(ClosestInteractable[1], "Detained") and CollectionService:HasTag(ClosestInteractable[1], "Grabbed") then
						ReplicatedStorage.Remotes:WaitForChild("Grab"):FireServer(ClosestInteractable[1], false)
					end
				end
				wait(1)
				Debounce = false
			end
		elseif key == "r" then
			if ClosestInteractable[1] and not Debounce then
				Debounce = true
				if ClosestInteractable[1].Name == "HumanoidRootPart" and LawEnforcement and not ClosestInteractable[1]:IsDescendantOf(Character1) then
					if CollectionService:HasTag(ClosestInteractable[1], "Detained") and not CollectionService:HasTag(ClosestInteractable[1], "Blindfold") then
						ReplicatedStorage.Remotes:WaitForChild("Blindfold"):FireServer(ClosestInteractable[1], true)
					elseif CollectionService:HasTag(ClosestInteractable[1], "Detained") and CollectionService:HasTag(ClosestInteractable[1], "Blindfold") then
						ReplicatedStorage.Remotes:WaitForChild("Blindfold"):FireServer(ClosestInteractable[1], false)
					end
				end
				wait(1)
				Debounce = false
			end
		end
	end
end

UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if Input.UserInputType == Enum.UserInputType.Keyboard and not GameProcessed and not CollectionService:HasTag(Character1:WaitForChild("HumanoidRootPart"), "Detained") then
		if Input.KeyCode == Enum.KeyCode.E then
			Interact("e")
		elseif Input.KeyCode == Enum.KeyCode.F then 
			Interact("f")
		elseif Input.KeyCode == Enum.KeyCode.T then 
			Interact("t")
		elseif Input.KeyCode == Enum.KeyCode.R then 
			Interact("r")	
		end
	end
end)
