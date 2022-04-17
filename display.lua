function()
    if PaperDollFrame then
        local health = UnitHealth("player")
        
        -- GET AND SET ARMOR REDUCTION VALUES --
        local baselineArmor, effectiveArmor, armor, bonusArmor = UnitArmor("player");
        local effective_armor_reduction
        target_level = UnitLevel("player")
        effective_armor_reduction = PaperDollFrame_GetArmorReduction(effectiveArmor, target_level)
        
        if effective_armor_reduction > 75 then
            effective_armor_reduction = 75;
        end
        -- set to decimal value --
        effective_armor_reduction = 1 - (effective_armor_reduction / 100)
        
        -- ABILITY REDUCTIONS --
        Buff = {name = "", pdr = 0, mdr = 0, stagger = 0}
        function Buff:new(o, name, pdr, mdr, stagger, always_active)
            o.parent = self
            return o
        end
        
        
        -- damage reduction calculations
        local final_pdr = 0
        local final_mdr = 0
        local global_pdr = 0
        local global_mdr = 0
        for k,v in pairs(aura_env.class_reductions[aura_env.player_class]) do 
            if UnitAura("player", v[1]) then
                if final_pdr == 0 and v[2] > 0 then
                    final_pdr = v[2]
                else
                    
                    final_pdr = final_pdr * (1 - v[2])
                end
                
                if final_mdr == 0 and v[3] > 0 then
                    final_mdr = v[3]
                else
                    
                    final_mdr = final_mdr * (1 - v[3])
                end
                
                
                aura_env.stagger = aura_env.stagger + v[4]
            end
        end
        -- % correction, so it's scaling the multiplicative defence right
        final_pdr = 1-final_pdr
        final_mdr = 1-final_mdr
        
        
        for k,v in pairs(aura_env.global_reductions) do
            if UnitAura("player", v[1]) then
                if global_pdr == 0  and v[2] > 0 then
                    global_pdr = v[2]
                else            
                    global_pdr = global_pdr * (1-v[2]) 
                end
                
                if global_mdr == 0 and v[3] > 0 then
                    global_mdr = v[3]
                else
                    global_mdr = global_mdr * (1-v[3]) 
                end
                
            end
        end
        
        global_pdr = 1 - global_pdr
        global_mdr = 1 - global_mdr
        
        local physical_damage_reduction = health / ((effective_armor_reduction) * final_pdr * (1 - aura_env.stagger) * global_pdr)
        local magical_damage_reduction = health / (final_mdr * global_mdr) 
        -- return values
        return "Physical: " .. math.floor(physical_damage_reduction/1000) .. "K \n" .. "Magical: " .. math.floor(magical_damage_reduction/1000) .. "K "
    end
end





