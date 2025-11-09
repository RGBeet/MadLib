-- Enables +Score and XScore
local score_enabled = true
if score_enabled then
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "ascore"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "a_score"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "ascore_mod"

    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "xscore"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "x_score"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "xscore_mod"

    local calculate_individual_effect_hook = SMODS.calculate_individual_effect

    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        local ret = calculate_individual_effect_hook(effect, scored_card, key, amount, from_edition)
        if (key == 'a_score' or key == 'ascore' or key == 'score_mod') and amount ~= 0 then
            tell('Add score moment')
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            total_score = total_score and mod_total_score(total_score + amount) or amount
            local ts = total_score
            MadLib.event({
                func = function()
                    G.GAME.chips = ts
				    if G.HUD:get_UIE_by_ID('chip_UI_count') then G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.2, 0.2) end
                    return true
                end
            })
            if not effect.remove_default_message then
                if from_edition then
                    card_eval_status_text(scored_card, 'jokers', nil, percent, nil,
                    {
                        message = ('+%s Score'):format(number_format(amount)),
                        sound = "madlib_xscore",
                        colour = G.C.PURPLE, edition = true
                    })
                else
                    if effect.score_message then
                            card_eval_status_text(
                                effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra',
                                nil,
                                percent, nil, effect.score_message)
                        else
                            card_eval_status_text(
                                effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra',
                                nil,
                                percent, nil,
                        {
                            message = ('+%s Score'):format(number_format(amount)),
                            sound = "madlib_xscore",
                            colour = G.C.PURPLE
                        })
                    end
                end
            end
            return true
        elseif (key == 'xscore' or key == 'x_score' or key == 'xscore_mod') and amount ~= 1 and (total_score and total_score > 0) then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            total_score = mod_total_score(total_score * amount)
            local ts = total_score
            MadLib.event({
                func = function()
                    G.GAME.chips = ts
                    if G.HUD:get_UIE_by_ID('chip_UI_count') then G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.4, 0.4) end
                    return true
                end
            })
            if not effect.remove_default_message then
                if from_edition then
                    card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {
                        message = ('X%s Score'):format(number_format(amount)),
                        sound = "madlib_xscore",
                        colour = G.C.PURPLE
                    })
                else
                    if effect.xscore_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.score_message)
                    else
                        card_eval_status_text( effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {
                            message = ('X%s Score'):format(number_format(amount)),
                            sound = "madlib_xscore",
                            colour = G.C.PURPLE
                        })
                    end
                end
            end
            return true
        end
        return ret
    end
end

-- Enables ^Chips and ^Mults
local require_exponentials = true
if require_exponentials then
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "emult"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "e_mult"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "emult_mod"

    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "echips"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "e_chips"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "echips_mod"

    local calculate_individual_effect_hook_exp = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)

    if (key == 'xchips' or key == 'x_chips' or key == 'xchip_mod') and amount ~= 1 then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        hand_chips = mod_chips(hand_chips * amount)
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil,
                { message = ('X%s Chips'):format(number_format(amount)), colour = G.C.BLUE, edition = true })
            else
                if effect.xscore_message then
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.score_message)
                else
                    card_eval_status_text( effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {
                        message = ('X%s Chips'):format(number_format(amount)),
                        sound = "madlib_xchip",
                        colour = G.C.BLUE
                    })
                end
            end
        end
        return true
    elseif (key == 'e_mult' or key == 'emult' or key == 'emult_mod') and amount ~= 1 then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        mult = mod_mult(mult ^ amount)
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {
                    message = ('^%s Mult'):format(number_format(amount)),
                    sound = "madlib_emult",
                    colour = G.C.DARK_EDITION, edition = true
                })
            else
                if effect.emult_message then
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.emult_message)
                else
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {
                        message = ('^%s Mult'):format(number_format(amount)),
                        sound = "madlib_emult",
                        colour = G.C.DARK_EDITION
                    })
                end
            end
        end
        return true
    end
    -- Exponential Chips
    if (key == 'e_chips' or key == 'echips' or key == 'echip_mod') and amount ~= 1 then
        if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
        hand_chips = mod_chips(hand_chips ^ amount)
        update_hand_text({ delay = 0 }, { chips = hand_chips, mult = mult })
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {
                    message = ('^%s Chips'):format(number_format(amount)),
                    sound = "madlib_echips",
                    colour = G.C.DARK_EDITION,
                    edition = true
                })
            else
                if effect.echip_message then
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.echip_message)
                else
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra',
                            nil, percent, nil, {
                                message = ('^%s Chips'):format(number_format(amount)),
                                sound = "madlib_echips",
                                colour = G.C.DARK_EDITION
                            })
                    end
                end
            end
            return true
        end
	    local ret = calculate_individual_effect_hook_exp(effect, scored_card, key, amount, from_edition)
        return ret
    end
end

-- Enables ^Score
if score_enabled and require_exponentials then
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "escore"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "e_score"
    SMODS.other_calculation_keys[#SMODS.other_calculation_keys + 1] = "escore_mod"

    local calculate_individual_effect_hook_escore = SMODS.calculate_individual_effect
    function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
        if (key == 'escore' or key == 'e_score' or key == 'escore_mod') and amount ~= 1 and total_score > 0 then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            total_score = mod_total_score(total_score ^ amount)
            local ts = total_score
            MadLib.event({
                func = function()
                    G.GAME.chips = ts
                    if G.HUD:get_UIE_by_ID('chip_UI_count') then G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.6, 0.6) end
                    return true
                end
            })
            if not effect.remove_default_message then
                if from_edition then
                    card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {
                        message = ('^%s Score'):format(number_format(amount)),
                        sound = "madlib_escore",
                        colour = G.C.DARK_EDITION
                    })
                else
                    if effect.escore_message then
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra',
                                nil, percent, nil, effect.score_message)
                    else
                        card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {
                            message = ('^%s Score'):format(number_format(amount)),
                            sound = "madlib_escore",
                            colour = G.C.DARK_EDITION
                        })
                    end
                end
            end
            return true
        end
	    local ret = calculate_individual_effect_hook_escore(effect, scored_card, key, amount, from_edition)
        return ret
    end
end
