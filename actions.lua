-- SETUP --
aura_env.player_class = UnitClass("player")
aura_env.absorb_amount = 0


-- INIT STAGGER --
aura_env.stagger = 0
if aura_env.player_class == "Monk" then
    aura_env.stagger = 0.2 + GetMasteryEffect()/100
end

function aura_env.checkStagger()
    local staggerRed = 1
    if UnitClass("player") == "Monk" then
        local staggerRed = 1 - aura_env.stagger
        local staggerDmg = UnitStagger("player") or 0
        local staggerCap = (UnitHealth("player")  + aura_env.absorb_amount) / (UnitHealth("player") + aura_env.absorb_amount + 100 * UnitMaxHealth("player") - staggerDmg * 10)
        
        if staggerRed < 0.01 then staggerCap = 0.01 end
        if staggerRed < staggerCap then staggerRed = staggerCap end
    end
    return staggerRed
    
end

aura_env.reductions = {
    -- DEATH KNIGHT --
	[49222] = {0.2, 0.2, 0}, -- Bone Shield
	[48263] = {0.1, 0.1, 0}, -- Blood Presence?
	[48792] = {0.2, 0.2, 0}, -- Icebound Fortitude DPS
	[58130] = {0.5, 0.5, 0}, -- Icebound Fortitude Tank
	[51052] = {0, 0.4, 0}, -- Anti-Magic Zone
	
	-- DRUID --
	[22812] = {0.2, 0.2, 0}, -- Barkskin
	[61336] = {0.5, 0.5, 0}, -- Survival Instincts
	[102342] = {0.2, 0.2, 0}, -- Ironbark
	
	-- HUNTER --
	[19263] = {0.3, 0.3, 0}, -- Deterrence(non-glyphed)
	
	-- MAGE --
	[115610] = {0.15, 0.15, 0}, -- Temporal Shield
	[110959] = {0.9, 0.9, 0}, -- Greater Invisibility
	
	-- MONK --
	[122783] = {0, 0.9, 0}, -- Diffuse Magic
	[115203] = {0.2, 0.2, 0}, -- Fortifying Brew
	
	-- PALADIN --
	[31850] = {0.2, 0.2, 0}, -- Ardent Defender
	[86659] = {0.5, 0.5, 0}, -- Guardian of Ancient Kings
	[53600] = {0.3, 0, 0}, -- Shield of the Righteous
	[498] = {0.2, 0.2, 0}, -- Divine Protection(glyphed)
	[31821] = {0, 0.2, 0}, -- Devotion Aura
	[6940] = {0.3, 0.3, 0}, -- Hand of Sacrifice
	
	-- PRIEST --
    	[47585]  =  {0.9, 0.9, 0}, -- DISPERSION
    	[45243]  =  {0.15, 0.15, 0}, -- FOCUSED WILL
   	[62618]  =  {0.25, 0.25, 0}, -- BARRIER
   	[33206]  =  {0.4, 0.4, 0}, -- Pain Suppression
	
   	 -- ROGUE --
	[1966] = {0.3, 0.3, 0}, -- Feint(Elusiveness talent)
	
	-- SHAMAN --
	[30823] = {0.3, 0.3, 0}, -- Shamanistic Rage
	[108271] = {0.4, 0.4, 0}, -- Astral Shift
	
	-- WARLOCK --
    	[108446] =  {0.2, 0.2, 0}, -- SOUL LINK
   	[104773] =  {0.4, 0.4, 0}, -- UNENDING RESOLVE
	
	-- WARRIOR --
	[118038] = {0.2, 0.2, 0}, -- Die by the Sword
	[145044] = {0.25, 0.25, 0}, -- Defensive Stance?
	[71] = {0.25, 0.25, 0}, -- Defensive Stance?
	[871] = {0.4, 0.4, 0}, -- Shield Wall(non-glyphed)

    -- WARLOCK --
    [108446] =  {0.2, 0.2, 0}, -- SOUL LINK
    [104773] =  {0.4, 0.4, 0}, -- UNENDING RESOLVE
    
    -- PRIEST --
    [47585]  =  {0.9, 0.9, 0}, -- DISPERSION
    [45243]  =  {0.15, 0.15, 0}, -- FOCUSED WILL
    [62618]  =  {0.25, 0.25, 0}, -- BARRIER
    [33206]  =  {0.4, 0.4, 0},

}

aura_env.absorbs = {
    -- PRIEST --
    [108945]  = true,   -- ANGELIC BULWARK
    [47753]   = true,   -- DIVINE AEGIS
    [114908]  = true,   -- SPIRIT SHELL
    [17]      = true,   -- Power Word: Shield
    [48707]   = true,	-- Anti-Magic Shell(Death Knight)
    [115295]  = true,	-- Guard(Monk)
    [112048]  = true,	-- Shield Barrier(Warrior)
    [77513]   = true,	-- Blood Shield(Death Knight) Only for physical damage, pls fix.
    [17]      = true,   -- Power WOrd Shield

}










