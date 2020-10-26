local module = {
	Teams = {
		["Foundation Personnel"] = {
			Group = 4944453,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Pearl"),
			OfficialColor = Color3.fromRGB(82, 124, 174),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},	
		["Administrative Department"] = {
			Group = 7714948,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Sand blue"),
			OfficialColor = Color3.fromRGB(116, 134, 157),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Class-D"] = {
			Group = 4944453,
			Rank = 0,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Br. yellowish orange"),
			OfficialColor = Color3.fromRGB(226, 155, 64),
			Tools = {"M4A1","AK-47","P90","SCAR-H","Glock-17", "G36C"},
			Morphs = {}
		},	
		["Manufacturing Department"] = {
			Group = 7714934,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Gold"),
			OfficialColor = Color3.fromRGB(239, 184, 56),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Logistics Department"] = {
			Group = 7714954,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Dark green"),
			OfficialColor = Color3.fromRGB(40, 127, 71),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Engineering and Technical Department"] = {
			Group = 7714941,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Bright yellow"),
			OfficialColor = Color3.fromRGB(245, 205, 48),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Security Department"] = {
			Group = 7207550,
			Rank = 1,
			Undercover = false,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Medium stone grey"),
			OfficialColor = Color3.fromRGB(163, 162, 165),
			Tools = {"Keycard", "P90", "Glock-17"},
			Morphs = {
				CombatMedic_One = {
					Name = "Combat Medic One",
					Group = 7755378,
					Rank = 1,
					RequireRank = "N/A",
				},
				CombatMedic_Two = {
					Name = "Combat Medic Two",
					Group = 7755378,
					Rank = 1,
					RequireRank = "N/A",
				},
				CombatMedic_Three = {
					Name = "Combat Medic Three",
					Group = 7755378,
					Rank = 1,
					RequireRank = "N/A",
				},
				CombatMedic_Four = {
					Name = "Combat Medic Four",
					Group = 7755378,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_One = {
					Name = "Security Guard One",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_Two = {
					Name = "Security Guard Two",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_Three = {
					Name = "Security Guard Three",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_Four = {
					Name = "Security Guard Four",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_Five = {
					Name = "Security Guard Five",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				Security_Guard_Six = {
					Name = "Security Guard Six",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
			}
		},
		["Mobile Task Forces"] = {
			Group = 7207569,
			Rank = 1,
			Undercover = false,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Bright red"),
			OfficialColor = Color3.fromRGB(196, 40, 28),
			Tools = {"Keycard", "G36C", "Glock-41"},
			Morphs = {
				AlphaOne_One = {
					Name = "AlphaOne Executive",
					Group = 7207569,
					Rank = 6,
					RequireRank = "N/A",
				},
				AlphaOne_Two = {
					Name = "AlphaOne Leader",
					Group = 7207569,
					Rank = 7,
					RequireRank = "N/A",
				},
				AlphaOne_Three = {
					Name = "AlphaOne Operative",
					Group = 7207569,
					Rank = 4,
					RequireRank = "N/A",
				},
				AlphaOne_Four = {
					Name = "AlphaOne Sergeant",
					Group = 7207569,
					Rank = 5,
					RequireRank = "N/A",
				},
				BetaSeven_One = {
					Name = "BetaSeven Executive",
					Group = 7207569,
					Rank = 6,
					RequireRank = "N/A",
				},
				BetaSeven_Two = {
					Name = "BetaSeven Leader",
					Group = 7207569,
					Rank = 7,
					RequireRank = "N/A",
				},
				BetaSeven_Three = {
					Name = "BetaSeven Operative",
					Group = 7207569,
					Rank = 2,
					RequireRank = "N/A",
				},
				BetaSeven_Four = {
					Name = "BetaSeven Sergeant",
					Group = 7207569,
					Rank = 5,
					RequireRank = "N/A",
				},
				IotaTen_One = {
					Name = "IotaTen Executive",
					Group = 7207569,
					Rank = 6,
					RequireRank = "N/A",
				},
				IotaTen_Two = {
					Name = "IotaTen Leader",
					Group = 7207569,
					Rank = 7,
					RequireRank = "N/A",
				},
				IotaTen_Three = {
					Name = "IotaTen Operative",
					Group = 7207569,
					Rank = 3,
					RequireRank = "N/A",
				},
				IotaTen_Four = {
					Name = "IotaTen Sergeant",
					Group = 7207569,
					Rank = 5,
					RequireRank = "N/A",
				},
				NuSeven_One = {
					Name = "NuSeven Executive",
					Group = 7207569,
					Rank = 6,
					RequireRank = "N/A",
				},
				NuSeven_Two = {
					Name = "NuSeven Leader",
					Group = 7207569,
					Rank = 7,
					RequireRank = "N/A",
				},
				NuSeven_Three = {
					Name = "NuSeven Operative",
					Group = 7207569,
					Rank = 1,
					RequireRank = "N/A",
				},
				NuSeven_Four = {
					Name = "NuSeven Sergeant",
					Group = 7207569,
					Rank = 5,
					RequireRank = "N/A",
				},
			}
		},
		["Internal Security Department"] = {
			Group = 7207552,
			Rank = 1,
			Undercover = false,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Persimmon"),
			OfficialColor = Color3.fromRGB(255, 89, 89),
			Tools = {"Keycard", "MP5SD", "Glock-17"},
			Morphs = {
				ISD_One = {
					Name = "ISD One",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				ISD_Two = {
					Name = "ISD Two",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
				ISD_Three = {
					Name = "ISD Three",
					Group = 7207550,
					Rank = 1,
					RequireRank = "N/A",
				},
			}
		},
		["Internal Security Undercover"] = {
			Group = 7207552,
			Rank = 1,
			Undercover = true,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Terra Cotta"),
			OfficialColor = Color3.fromRGB(82, 124, 174),
			Tools = {"Keycard", "MP5SD", "Glock-17"},
			Morphs = {

			}
		},
		["Ethics Committee"] = {
			Group = 7207596,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Shamrock"),
			OfficialColor = Color3.fromRGB(91, 154, 76),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Tactical Response Squadron"] = {
			Group = 7256225,
			Rank = 1,
			Undercover = false,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Royal purple"),
			OfficialColor = Color3.fromRGB(98, 37, 209),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Intelligence Agency"] = {
			Group = 7714915,
			Rank = 1,
			Undercover = false,
			LawEnforcement = true,
			TeamColor = BrickColor.new("Bright bluish green"),
			OfficialColor = Color3.fromRGB(0, 143, 156),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Scientific Department"] = {
			Group = 7207580,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Electric blue"),
			OfficialColor = Color3.fromRGB(4, 175, 236),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
		["Medical Department"] = {
			Group = 7714766,
			Rank = 1,
			Undercover = false,
			LawEnforcement = false,
			TeamColor = BrickColor.new("Maroon"),
			OfficialColor = Color3.fromRGB(117, 0, 0),
			Tools = {"Keycard", "Clipboard"},
			Morphs = {}
		},
	}
}

return module