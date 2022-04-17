-- SETUP --
aura_env.player_class = UnitClass("player")

-- INIT STAGGER --
aura_env.stagger = 0
if aura_env.player_class == "Monk" then
    aura_env.stagger = 0.2 + GetMasteryEffect()/100
end


aura_env.class_reductions = {
    ["Warrior"] = {
        
    },
    ["Paladin"] = {
        
    },
    ["Hunter"] = {
        
    },
    ["Rogue"] = {
        
    },
    ["Priest"] = {
        Buff:new{"Dispersion", 0.9, 0.9, 0}
        
        
    },
    ["Shaman"] = {
        
    },
    ["Mage"] = {
        
    },
    ["Monk"] =  {
        Buff:new{"Shuffle", 0, 0 , 0.2},
        Buff:new{"Fortifying Brew", 0.25, 0.25, 0.2},
        Buff:new{"Diffuse Magic", 0, 0.9, 0},
        Buff:new{"Zen Meditation", 0.9, 0.9, 0}
    },
    ["Warlock"] = {
        Buff:new{"Unending Resolve", 0.4, 0.4, 0},
        Buff:new{"Soul Link", 0.2, 0.2, 0}
        
    },
    ["Druid"] = {
        
    },
    ["Death Knight"] = {
        
    }
    
}

aura_env.global_reductions = {
    Buff:new{"Avert Harm", 0.2, 0.2, 0},
    Buff:new{"Ironbark", 0.2, 0.2, 0},
    Buff:new{"Power Word: Barrier", 0.25, 0.25, 0},
    Buff:new{"Pain Suppression", 0.4, 0.4, 0},
    Buff:new{"Aura Mastery", 0.2, 0.2, 0}
}

