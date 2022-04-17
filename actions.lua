-- SETUP --
aura_env.player_class = UnitClass("player")
-- aura_env.player_spec = GetSpecialization("player") --

-- INIT STAGGER --
aura_env.stagger = 0
if aura_env.player_class == "Monk" then
    aura_env.stagger = 0.2 + GetMasteryEffect()/100
end


aura_env.class_reductions = {
    ["Warrior"] = {
        Buff:new{"Shield Wall", 0.4, 0.4, 0},
		Buff:new{"Die by The Sword", 0.2, 0.2, 0},
    },
    ["Paladin"] = {
        Buff:new{"Divine Protection", 0.2, 0.2, 0},
		Buff:new{"Guardian of Ancient Kings", 0.5, 0.5, 0},
		Buff:new{"Ardent Defender", 0.2, 0.2, 0},
    },
    ["Hunter"] = {
        Buff:new{"Deterrence", 0.3, 0.3, 0},
    },
    ["Rogue"] = {
        Buff:new{"Feint", 0.3, 0.3, 0},
    },
    ["Priest"] = {
        Buff:new{"Dispersion", 0.9, 0.9, 0}
    },
    ["Shaman"] = {
        Buff:new{"Shamanistic Rage", 0.3, 0.3, 0},
		Buff:new{"Astral Shift", 0.4, 0.4, 0},
    },
    ["Mage"] = {
        Buff:new{"Greater Invisibility", 0.9, 0.9, 0},
		Buff:new{"Temporal Shield", 0.15, 0.15, 0},
    },
    ["Monk"] =  {
        Buff:new{"Shuffle", 0, 0, 0.2},
        Buff:new{"Fortifying Brew", 0.25, 0.25, 0.2},
        Buff:new{"Diffuse Magic", 0, 0.9, 0},
        Buff:new{"Zen Meditation", 0.9, 0.9, 0}
		Buff:new{"Dampen Harm", 0.5, 0.5, 0},
    },
    ["Warlock"] = {
        Buff:new{"Unending Resolve", 0.4, 0.4, 0},
        Buff:new{"Soul Link", 0.2, 0.2, 0}  
    },
    ["Druid"] = {
        Buff:new{"Barkskin", 0.2, 0.2, 0},
		Buff:new{"Survival Instincts", 0.5, 0.5, 0},
    },
    ["Death Knight"] = {
        Buff:new{"Icebound Fortitude", 0.2, 0.2, 0},
		Buff:new{"Bone Shield", 0.2, 0.2, 0},
    }
    
}

aura_env.global_reductions = {
    Buff:new{"Avert Harm", 0.2, 0.2, 0},
    Buff:new{"Ironbark", 0.2, 0.2, 0},
    Buff:new{"Power Word: Barrier", 0.25, 0.25, 0},
    Buff:new{"Pain Suppression", 0.4, 0.4, 0},
    Buff:new{"Aura Mastery", 0.2, 0.2, 0},
	Buff:new{"Vigilance", 0.4, 0.4, 0},
	Buff:new{"Hand of Sacrifice", 0.3, 0.3, 0},
}

