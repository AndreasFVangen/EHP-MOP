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
    [108945]  = true, -- ANGELIC BULWARK
    [47753]   = true,   -- DIVINE AEGIS
    [101904]  = true,  -- SPIRIT SHELL
    [17]      = true,  -- Power WOrd Shield
    
}










