local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        SMODS.calculate_context({ new_ante = true })
    end

    local ref = ease_anteref(mod)
    return ref
end

-- If TOGA is not installed, add the redeem_individual_voucher context
if not togabalatro then
    local applytorunref = Card.apply_to_run
    function Card:apply_to_run(center)
        applytorunref(self, center)
        SMODS.calculate_context({ redeem_individual_voucher = true, voucher = center or self })
    end
end

function MadLib.set_shop_stickers(card)
    local eternal_perishable_poll = pseudorandom((area == G.pack_cards and 'packetper' or 'etperpoll') .. G.GAME.round_resets.ante)
    -- Eternal/Perishable
    if 
        G.GAME.modifiers.enable_eternals_in_shop
        and eternal_perishable_poll > 0.7
        and not SMODS.Stickers["eternal"].should_apply
    then
        card:set_eternal(true)
    elseif 
        G.GAME.modifiers.enable_perishables_in_shop
        and ((eternal_perishable_poll > 0.4)
        and (eternal_perishable_poll <= 0.7))
        and not SMODS.Stickers["perishable"].should_apply
    then
        card:set_perishable(true)
    end
    
    -- Rental
    if 
        G.GAME.modifiers.enable_rentals_in_shop 
        and pseudorandom((area == G.pack_cards and 'packssjr' or 'ssjr') .. G.GAME.round_resets.ante) > 0.7 
        and not SMODS.Stickers["rental"].should_apply
    then
        card:set_rental(true)
    end
    return card
end

local old_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local card = old_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if 
        area == G.shop_jokers 
        or area == G.pack_cards
    then
        MadLib.set_shop_stickers(card)
    end

	return card
end


local card_shuffle_ref = CardArea.shuffle
function CardArea:shuffle(_seed)
	SMODS.calculate_context({ ml_pre_shuffle = true, ml_shuffling_area = self })

	card_shuffle_ref(self, _seed)

	SMODS.calculate_context({ ml_post_shuffle = true, ml_shuffling_area = self })
end

local card_sell_ref = Card.sell_card
function Card:sell_card()
    self.ability.sold = true
    return card_sell_ref(self)
end

local evaluate_play_main_ref = evaluate_play_main

function evaluate_play_main(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
    G.GAME.post_scoring_events = nil
    print("Clear post scoring events")
    return evaluate_play_main_ref(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
end

