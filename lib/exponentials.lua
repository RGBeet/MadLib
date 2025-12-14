function MadLib.do_parameter_message(scored_card, effect, from_edition, percent, m, s, c)
    if not effect.remove_default_message then
        if from_edition then
            card_eval_status_text(scored_card, 'jokers', nil, percent, nil,
                {
                    message = m,
                    sound   = s,
                    colour  = c,
                    edition = true
                })
        else
            if effect.score_message then
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.score_message)
            else
                card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil,
                {
                    message = m, --('+%s Score'):format(number_format(amount)),
                    sound   = s, --"madlib_xscore",
                    colour  = c, --G.C.PURPLE
                })
            end
        end
    end
end

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
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            if not (effect.after_scoring and effect.after_scoring == true) then
                local new_score = mod_total_score(MadLib.add(total_score, amount))
                total_score = new_score
                MadLib.do_parameter_message(scored_card, effect, from_edition, percent, ('+%s Score'):format(number_format(amount)), 'madlib_xscore', G.C.PURPLE)
                MadLib.event({
                    func = function()
                        G.GAME.chips        = new_score
                        G.GAME.chip_text    = number_format(new_score)
                        local chip_UI       = G.HUD:get_UIE_by_ID('chip_UI_count')
                        if chip_UI then chip_UI:juice_up() end
                        play_sound('timpani', 1.0, 0.6)
                        return true 
                    end,
                    delay   = 0.0,
                    trigger = 'after'
                })
            else
                MadLib.post_scoring_event({
                    type        = 'ease_score',
                    operator    = 'add',
                    message     = {
                        card    = scored_card,
                        sound   = 'madlib_xscore',
                        colour  = G.C.PURPLE,
                        effect  = effect, 
                        edition = from_edition,
                        percent = percent, 
                        text    = ('+%s Score'):format(number_format(amount))
                    },
                    amount      = amount
                })
            end
            return true
        elseif 
            (key == 'xscore' or key == 'x_score' or key == 'xscore_mod')
            and amount ~= 1 
            and (effect.after_scoring or not MadLib.is_zero(total_score)) 
        then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            if not (effect.after_scoring and effect.after_scoring == true) then
                local new_score = mod_total_score(MadLib.multiply(total_score, amount))
                total_score = new_score
                MadLib.do_parameter_message(scored_card, effect, from_edition, percent, ('+%s Score'):format(number_format(amount)), 'madlib_xscore', G.C.PURPLE)
                MadLib.event({
                    func = function()
                        G.GAME.chips        = new_score
                        G.GAME.chip_text    = number_format(new_score)
                        local chip_UI       = G.HUD:get_UIE_by_ID('chip_UI_count')
                        if chip_UI then chip_UI:juice_up() end
                        play_sound('timpani', 1.0, 0.6)
                        return true 
                    end,
                    delay   = 0.0,
                    trigger = 'after'
                })
            else
                MadLib.post_scoring_event({
                    type        = 'ease_score',
                    operator    = 'multiply',
                    message     = {
                        card    = scored_card,
                        sound   = 'madlib_xscore',
                        colour  = G.C.PURPLE,
                        effect  = effect, 
                        edition = from_edition,
                        percent = percent, 
                        text    = ('X%s Score'):format(number_format(amount))
                    },
                    amount      = amount
                })
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
                        sound = Talisman and "talisman_xchip" or "madlib_xchip",
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
                    sound = Talisman and "talisman_emult" or "madlib_emult",
                    colour = G.C.DARK_EDITION, edition = true
                })
            else
                if effect.emult_message then
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.emult_message)
                else
                    card_eval_status_text(effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, {
                        message = ('^%s Mult'):format(number_format(amount)),
                        sound = Talisman and "talisman_emult" or "madlib_emult",
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
                    sound = Talisman and "talisman_echips" or "madlib_echips",
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
                                sound = Talisman and "talisman_echips" or "madlib_echips",
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
        if (key == 'escore' or key == 'e_score' or key == 'escore_mod') and amount ~= 1 and MadLib.is_positive_number(total_score) then
            if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
            if not (effect.after_scoring == true) then
                G.GAME.chips = mod_total_score(MadLib.exponent(G.GAME.chips, amount))
                MadLib.do_parameter_message(scored_card, amount, effect, from_edition, percent, ('^%s Score'):format(number_format(amount)), 'madlib_escore', G.C.PURPLE)
            else
                MadLib.post_scoring_event({
                    trigger     = 'immediate',
                    func        = function() 
                        G.E_MANAGER:add_event(Event({
                            trigger = 'ease',
                            blocking = false,
                            ref_table = G.GAME,
                            ref_value = 'chips',
                            ease_to = MadLib.exponent(G.GAME.chips, amount),
                            delay =  1.5,
                            func = (function(t) return math.floor(t) end)
                        }))
                        MadLib.do_parameter_message(scored_card, effect, from_edition, percent, ('^%s Score'):format(number_format(amount)), 'madlib_escore', G.C.PURPLE)
                        return true
                    end,
                    delay = 1.5
                })
            end
            return true
        end
	    local ret = calculate_individual_effect_hook_escore(effect, scored_card, key, amount, from_edition)
        return ret
    end
end
