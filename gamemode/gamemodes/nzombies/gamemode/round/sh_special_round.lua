if SERVER then
	function nzRound:SetNextSpecialRound( num )
		self.NextSpecialRound = num
	end

	function nzRound:GetNextSpecialRound()
		return self.NextSpecialRound
	end

	function nzRound:MarkedForSpecial( num )
		return ((self.NextSpecialRound == num and self.SpecialRoundType and self.SpecialData[self.SpecialRoundType] and true) or (nzConfig.RoundData[ num ] and nzConfig.RoundData[ num ].special)) or false
	end
	
	function nzRound:SetSpecialRoundType(id)
		if id == "None" then
			self.SpecialRoundType = nil -- "None" makes a nil key
		else
			self.SpecialRoundType = id or "Hellhounds" -- A nil id defaults to "Hellhounds", otherwise id
		end
	end
	
	function nzRound:GetSpecialRoundType(id)
		return self.SpecialRoundType
	end
	
	function nzRound:GetSpecialRoundData()
		if !self.SpecialRoundType then return nil end
		return self.SpecialData[self.SpecialRoundType]
	end

	util.AddNetworkString("nz_hellhoundround")
	function nzRound:CallHellhoundRound()
		net.Start("nz_hellhoundround")
			net.WriteBool(true)
		net.Broadcast()
	end
end

nzRound.HudSelectData = nzRound.HudSelectData or {}
function nzRound:AddHUDType(id, class)
	if SERVER then
		if class then
			local data = {}
			-- Which entity to spawn
			data.class = class
			nzRound.HudSelectData[id] = data
		else
			nzRound.HudSelectData[id] = nil -- Remove it if no valid class was added
		end
	else
		-- Clients only need it for the dropdown, no need to actually know the data and such
		nzRound.HudSelectData[id] = class
	end
end

nzRound:AddHUDType("Black Ops 3", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Buried", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Origins (Black Ops 2)", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Tranzit (Black Ops 2)", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("nZombies Classic(HD)", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Covenant", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("UNSC", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Dead Space", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Devil May Cry - Dante", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Devil May Cry - Nero", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Devil May Cry - V", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Devil May Cry - Vergil", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Gears of War", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Killing Floor 2", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Resident Evil", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Simple (Black)", "nz_zombie_walker", {
}) 
nzRound:AddHUDType("Simple (Outline)", "nz_zombie_walker", {
}) 

function nzRound:GetHUDType(id)
	if id == "Black Ops 3" then
	return "b03_hud.png"
	end
		if id == "Buried" then
	return "buried_hud.png"
	end
		if id == "Origins (Black Ops 2)" then
	return "origins_hud.png"
	end
		if id == "Tranzit (Black Ops 2)" then
	return "tranzit_hud.png" 
	end
		if id == "nZombies Classic(HD)" then
	return "HD_hud.png"
	end
	if id == "Covenant" then
	return "covenant_hud.png"
	end
	if id == "UNSC" then
	return "Halo_hud.png"
	end
	if id == "Dead Space" then
	return "deadspace_hud.png"
	end
	if id == "Devil May Cry - Dante" then
	return "DMC_Dante__hud.png"
	end
	if id == "Devil May Cry - Nero" then
	return "DMC_Nero__hud.png"
	end
	if id == "Devil May Cry - V" then
	return "DMC_V__hud.png"
	end
	if id == "Devil May Cry - Vergil" then
	print("DMC_Vergil__hud.png")
	return "DMC_Vergil__hud.png"
	end
	if id == "Gears of War" then
	return "gears_hud.png"
	end
	if id == "Killing Floor 2" then
	return "KF2__hud.png"
	end
	if id == "Resident Evil" then
	return "RE_hud.png"
	end
	if id == "Simple (Black)" then
	return "simple_hud.png"
	end
	if id == "Simple (Outline)" then
	return "simple_hud2.png"
	end
	if id == nil then
	return "origins_hud.png"
	end
end


nzRound.ZombieSkinData = nzRound.ZombieSkinData or {}
function nzRound:AddZombieType(id, class)
	if SERVER then
		if class then
			local data = {}
			-- Which entity to spawn
			data.class = class
			nzRound.ZombieSkinData[id] = data
		else
			nzRound.ZombieSkinData[id] = nil -- Remove it if no valid class was added
		end
	else
		-- Clients only need it for the dropdown, no need to actually know the data and such
		nzRound.ZombieSkinData[id] = class
	end
end

nzRound:AddZombieType("Kino der Toten", "nz_zombie_walker", {
}) 

nzRound:AddZombieType("Ascension", "nz_zombie_walker_ascension", {
}) 

nzRound:AddZombieType("Call of the Dead", "nz_zombie_walker_cotd", {
}) 

nzRound:AddZombieType("FIVE", "nz_zombie_walker_five", {
}) 

nzRound:AddZombieType("Gorod Krovi", "nz_zombie_walker_gorodkrovi", {
}) 
nzRound:AddZombieType("Shadows of Evil", "nz_zombie_walker_soemale", {
}) 
nzRound:AddZombieType("Zetsubou no Shima", "nz_zombie_walker_zetsubou", {
}) 
nzRound:AddZombieType("Origins", "nz_zombie_walker_origins", {
}) 
nzRound:AddZombieType("Moon", "nz_zombie_walker_moon", {
}) 
nzRound:AddZombieType("Der Eisendrache", "nz_zombie_walker_eisendrache", {
}) 
nzRound:AddZombieType("Buried", "nz_zombie_walker_buried", {
}) 
nzRound:AddZombieType("Shangri-La", "nz_zombie_walker_shangrila", {
}) 
nzRound:AddZombieType("Shi no Numa", "nz_zombie_walker_sumpf", {
}) 
nzRound:AddZombieType("Tranzit", "nz_zombie_walker_greenrun", {
}) 
nzRound:AddZombieType("Nuketown", "nz_zombie_walker_nuketown", {
}) 
nzRound:AddZombieType("Zombies in Spaceland", "nz_zombie_walker_clown", {
}) 
nzRound:AddZombieType("Deathtrooper", "nz_zombie_walker_deathtrooper", {
}) 
nzRound:AddZombieType("Skeleton", "nz_zombie_walker_skeleton", {
}) 
nzRound:AddZombieType("Xenomorph", "nz_zombie_walker_xeno", {
}) 
nzRound:AddZombieType("Necromorph", "nz_zombie_walker_necromorph", {
}) 

function nzRound:GetZombieType(id)
	if id == "Skeleton" then
	return "nz_zombie_walker_skeleton"
	end
		if id == "Deathtrooper" then
	return "nz_zombie_walker_deathtrooper"
	end
		if id == "Zombies in Spaceland" then
	return "nz_zombie_walker_clown"
	end
		if id == "Tranzit" then
	return "nz_zombie_walker_greenrun" 
	end
		if id == "Nuketown" then
	return "nz_zombie_walker_nuketown"
	end
	if id == "Ascension" then
	return "nz_zombie_walker_ascension"
	end
	if id == "Call of the Dead" then
	return "nz_zombie_walker_cotd"
	end
	if id == "FIVE" then
	return "nz_zombie_walker_five"
	end
	if id == "Gorod Krovi" then
	return "nz_zombie_walker_gorodkrovi"
	end
	if id == "Shadows of Evil" then
	return "nz_zombie_walker_soemale"
	end
	if id == "Zetsubou no Shima" then
	return "nz_zombie_walker_zetsubou"
	end
	if id == "Xenomorph" then
	return "nz_zombie_walker_xeno"
	end
	if id == "Necromorph" then
	return "nz_zombie_walker_necromorph"
	end
	if id == "Kino der Toten" then
	return "nz_zombie_walker"
	end
	if id == "Origins" then
	return "nz_zombie_walker_origins"
	end
	if id == "Moon" then
	return "nz_zombie_walker_moon"
	end
	if id == "Buried" then
	return "nz_zombie_walker_buried"
	end
	if id == "Der Eisendrache" then
	return "nz_zombie_walker_eisendrache"
	end
	if id == "Shangri-La" then
	return "nz_zombie_walker_shangrila"
	end
	if id == "Shi no Numa" then
	return "nz_zombie_walker_sumpf"
	end
	if id == nil then
	return "nz_zombie_walker"
	end
end

nzRound.SpecialData = nzRound.SpecialData or {}
function nzRound:AddSpecialRoundType(id, data, spawnfunc, roundfunc, endfunc)
	if SERVER then
		nzRound.SpecialData[id] = {}
		-- Zombie data, like those in the configuration files
		nzRound.SpecialData[id].data = data
		-- Optional spawn function, runs when a zombie spawns (can be used to set health, speed, etc)
		if spawnfunc then nzRound.SpecialData[id].spawnfunc = spawnfunc end
		-- Optional round function, runs when the round starts (can be used to set amount, sounds, fog, etc)
		if roundfunc then nzRound.SpecialData[id].roundfunc = roundfunc end
		-- Optional end function, runs when the special round ends (can be used to clean up changes)
		if endfunc then nzRound.SpecialData[id].endfunc = endfunc end
	else
		-- Clients only need it for the dropdown, no need to actually know the data and such
		nzRound.SpecialData[id] = (data and true or nil)
	end
end

nzRound:AddSpecialRoundType("Hellhounds", {
	specialTypes = {
		["nz_zombie_special_dog"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(math.Clamp(round * 20, 120, 1200))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Keepers", {
	specialTypes = {
		["nz_zombie_special_keeper"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(math.Clamp(round * 20, 120, 1200))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Nova Crawlers", {
	specialTypes = {
		["nz_zombie_special_nova"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(50 + (100*nzRound:GetNumber()))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Lickers", {
	specialTypes = {
		["nz_zombie_special_licker"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(math.Clamp(round * 32, 200, 2000))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Raptors", {
	specialTypes = {
		["nz_zombie_special_raptor"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(math.Clamp(round * 60, 200, 2000))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Facehuggers", {
	specialTypes = {
		["nz_zombie_special_facehugger"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(50)
	else
		dog:SetHealth(50 + (100*nzRound:GetNumber()))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("The Pack (Dead Space)", {
	specialTypes = {
		["nz_zombie_special_pack"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(math.Clamp(round * 25, 150, 1500))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Spiders", {
	specialTypes = {
		["nz_zombie_special_spooder"] = {chance = 100}
	},
	specialDelayMod = function() return math.Clamp(2 - #player.GetAllPlaying()*0.5, 0.5, 2) end, -- Dynamically change spawn speed depending on player count
	specialCountMod = function() return nzRound:GetNumber() * #player.GetAllPlaying() end, -- Modify the count
}, function(dog) -- We want to modify health
	local round = nzRound:GetNumber()
	if round == -1 then
		dog:SetHealth(math.random(120, 1200))
	else
		dog:SetHealth(50 + (100*nzRound:GetNumber()))
	end
end) -- No round func or end func

nzRound:AddSpecialRoundType("Burning Zombies", {
	normalTypes = {
		["nz_zombie_special_burning"] = {chance = 100}
	},
	normalDelay = 0.75,
	normalCountMod = function(original) return original * 0.5 end, -- Half the normal count here
}) -- No special functions or anything really