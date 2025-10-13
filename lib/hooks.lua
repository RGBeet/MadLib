local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        SMODS.calculate_context({ new_ante = true })
    end

    local ref = ease_anteref(mod)
    return ref
end
