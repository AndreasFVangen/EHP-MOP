-- SETUP --
aura_env.player_class = UnitClass("player")

-- INIT STAGGER --
aura_env.stagger = 0
if aura_env.player_class == "Monk" then
    aura_env.stagger = 0.2 + GetMasteryEffect()/100
end

aura_env.reductions = {
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
    [17]      = true,   -- Power WOrd Shield
    
}







