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
        
        local i = 1
        local name, _, _, stacks, _, _, _, _, _, _, spellId, _, _, _, tooltip = UnitAura("player", i)
        aura_env.absorb_amount = 0
        aura_env.stagger = 0.2 + GetMasteryEffect()/100
        while spellId do
            name, _, _, stacks, _, _, _, _, _, _, spellId,  _, _, _, tooltip  = UnitAura("player", i)
            
            if aura_env.reductions[spellId] then
                if final_pdr == 0 and aura_env.reductions[spellId][1] > 0 then
                    final_pdr = aura_env.reductions[spellId][1] * stacks
                else                    
                    final_pdr = final_pdr * (1 - aura_env.reductions[spellId][1]) -- Unsure if stacks multi like this is smart :shrug:
                end
                
                if final_mdr == 0 and aura_env.reductions[spellId][2] > 0 then
                    final_mdr = aura_env.reductions[spellId][2] * stacks
                else                    
                    final_mdr = final_mdr * (1 - aura_env.reductions[spellId][2])
                end
                
                aura_env.stagger = aura_env.stagger + aura_env.reductions[spellId][3]
            end
            
            if aura_env.absorbs[spellId] then
                aura_env.absorb_amount =  aura_env.absorb_amount + tooltip
            end
            
            i = i +1
        end
        
        -- % correction, so it's scaling the multiplicative defence right
        final_pdr = 1-final_pdr
        final_mdr = 1-final_mdr
        
        
        local physical_damage_reduction = (health + aura_env.absorb_amount) / ((effective_armor_reduction) * final_pdr * aura_env.check_stagger() )
        local magical_damage_reduction = (health + aura_env.absorb_amount) / (final_mdr) 
        -- return 
        return "Physical: " .. math.floor(physical_damage_reduction/1000) .. "K \n" .. "Magical: " .. math.floor(magical_damage_reduction/1000) .. "K"
    end
end




