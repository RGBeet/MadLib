if not JokerDisplay then return end
tell('LOADING JOKERDISPLAY STUFF YAY!')
MadLib.JokerDisplay = {}

function MadLib.JokerDisplay.get_cards_matching(cards, func)
    local count = 0
    MadLib.loop_func(cards, function(v)
        if not func(v) then return end
        count = count + JokerDisplay.calculate_card_triggers(v, cards)
    end)
    return count
end

function MadLib.JokerDisplay.get_stacked_probabilities(card, key, count)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, key)
    local percentage = 1 - ((denominator - numerator) / denominator)^count
    return MadLib.round(denominator * percentage,2), MadLib.round(denominator, 2)
end