--[[
AvatarEditor.rbxm
AvatarEditor stuff and morphes idfk

CantBuildBlox (Ryan)
September 11th, 2020
SCPF
]]

local Players = game:GetService("Players")
local TeamData = require(game:GetService("ReplicatedStorage").Modules:WaitForChild("TeamData"))
local rs = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local MorphEvent = rs:WaitForChild("Remotes"):WaitForChild("MorphEvent")

function Attach(part, model)
	part.Anchored = true
	if not part.Parent:FindFirstChild("Morph_Storage") then
		local t = Instance.new("Folder")
		t.Parent = part.Parent
		t.Name = "Morph_Storage"
	end
	model.Parent = part.Parent["Morph_Storage"]
	model:SetPrimaryPartCFrame(part.CFrame)
	for i,v in pairs(model:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
			v.Anchored = true
			local weld = Instance.new("ManualWeld")
			weld.C0 = v.CFrame:Inverse() * part.CFrame
			weld.Part0 = v
			weld.Part1 = part
			weld.Parent = v
			v.Anchored = false
		end
	end
	part.Anchored = false
end

local function MorphChosen(player, Morph)
	
	local newMorph
	
	if game.Workspace:WaitForChild(player.Name):FindFirstChild("Morph_Storage") then
		for i,v in pairs(game.Workspace:WaitForChild(player.Name)["Morph_Storage"]:GetChildren()) do
			v:Destroy()
		end
	end
	
	for i,v in pairs(rs:WaitForChild("Morphs"):GetDescendants()) do
		if v.Name == Morph then
			newMorph = v:Clone()
		end
	end
	
	local LocalPlayerChar = game.Workspace:WaitForChild(player.Name)
	
	if newMorph:FindFirstChild("RemoveHats") then
		if newMorph.RemoveHats.Value then
			for i,v in pairs(LocalPlayerChar:GetDescendants()) do
				if v:IsA("Accessory") then
					v:Destroy()
				end
			end
		end
	end
	
	for i,v in pairs(newMorph:GetChildren()) do
		if LocalPlayerChar:FindFirstChild(v.Name) and v:IsA("Model") then
			if v.PrimaryPart == nil then
				if v:FindFirstChild("Middle") then
					v.PrimaryPart = v.Middle
				else
					warn(v.Name.." does not have a middle or a primarypart!")
					return
				end
			end
			Attach(LocalPlayerChar:WaitForChild(v.Name), v)
		end
	end
	
	----- shirt stuff lol -----
	
	if newMorph:FindFirstChild("Shirt") then
		if LocalPlayerChar:FindFirstChild("Shirt") then
			LocalPlayerChar.Shirt:Destroy()
		end
		
		newMorph.Shirt.Parent = LocalPlayerChar
	end
	
	if newMorph:FindFirstChild("Pants") then
		if LocalPlayerChar:FindFirstChild("Pants") then
			LocalPlayerChar.Pants:Destroy()
		end
		
		newMorph.Pants.Parent = LocalPlayerChar
	end
	
	-- destroy the shit at the end we dont use so we dont clog up the serverstorage
	newMorph:Destroy()
end

MorphEvent.OnServerEvent:Connect(MorphChosen)