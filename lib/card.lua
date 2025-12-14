function MadLib.get_suits_from_cards(cards, bypass_debuff, flush_calc)
    if not_proper_table(cards) then return nil end
  -- Set each suit's count to 0
  local suits = {}

  MadLib.loop_table(SMODS.Suits, function(k,_) suits[k] = 0 end)

  for k, _ in pairs(SMODS.Suits) do
    suits[k] = 0
  end

    MadLib.loop_func(cards, function(v)
        if not SMODS.has_any_suit(v) then
            for k, v2 in pairs(suits) do
                if v:is_suit(k, bypass_debuff, flush_calc) and v2 == 0 then
                    suits[k] = suits[k] + 1
                    return
                end
            end
        end
    end)

    MadLib.loop_func(cards, function(v)
        if SMODS.has_any_suit(v) then
            for k, v2 in pairs(suits) do
                if v:is_suit(k, bypass_debuff, flush_calc) and v2 == 0 then
                    suits[k] = suits[k] + 1
                    return
                end
            end
        end
    end)

    return suits
end

function MadLib.get_ranks_from_cards(cards, fake_values)
    if not_proper_table(cards) then return nil end
    local rank_map = {}
    MadLib.loop_func(cards, function(v)
        local r = fake_values and v:get_id() or v.base.value
        if not r then return end
        rank_map[r] = (rank_map[r] or 0) + 1
    end)
    return rank_map
end

-- [BOOL] Checks if a singular card has one of the ranks in the list
function MadLib.has_rank_in_list(card, list, true_values)
    return not true_values and MadLib.list_matches_one(list, function(v) return card:get_id() == v end)
        or MadLib.list_matches_one(list, function(v) return SMODS.Ranks[card.base.value].key == v end)
end
-- [BOOL] Ditto, but with suits
function MadLib.has_suit_in_list(card, list, true_values)
    return not (card and not not_proper_table(list)) and false
        or not true_values and MadLib.list_matches_one(list, function(v) return card:is_suit(v) end)
        or MadLib.list_matches_one(list, function(v) return SMODS.Suits[card.base.suit].key == v end)
end


function Card:has_rank_in_list(list)
end

function Card:has_suit_in_list(list)
    return not (card and not not_proper_table(list)) and false
        or MadLib.list_matches_one(list, function(v)
            return self:is_suit(v)
        end)
end

-- Returns whether the card has an enhancement that
-- appears in the provided list
function MadLib.has_enhancement_in_list(card, list)
    return MadLib.list_matches_one(list, function(v)
        return SMODS.has_enhancement(card, v)
    end)
end

function Card:has_enhancement_in_list(list)
    return MadLib.list_matches_one(list, function(v)
        return SMODS.has_enhancement(self, v)
    end)
end

function MadLib.get_enhanced_cards(group, key)
    return (not G.GAME or group == nil) and {}
        or MadLib.get_list_matches(group, function(card)
            return SMODS.has_enhancement(card, key and ('m_' .. key) or nil)
        end)
end

function MadLib.get_editioned_cards(group, key)
    return (not G.GAME or group == nil) and {}
        or MadLib.get_list_matches(group, function(card)
            return card.edition and card.edition[key]
        end)
end

-- [Return Bool] Returns whether the card's identified rank (DEPRECATED)
-- is found in the selected list (e.g. is the rank irrational, prime, etc.)
function Card:rank_in_list(list,true_values)
    local id = true_values and self.base.value or self:get_id()
	return MadLib.list_matches_one(list, function(v)
        return v == id -- card id matches irregular rank id
	end)
end

function Card:is_plain(no_sticker)
    return not (self.config.center
        or card.edition
        or card:get_seal())
end

function Card:is_invulnerable()
    return self.ability.eternal
        or self.ability.shielded
end

-- Determines whether the card is rankless
function Card:is_rankless()
    MadLib.list_matches_one(MadLib.EnhancementLists.Rankless, function(v)
        return SMODS.has_enhancement(self,v)
    end)
end

-- Determines whether the card is suitless
function Card:is_suitless()
    MadLib.list_matches_one(MadLib.EnhancementLists.Suitless, function(v)
        return SMODS.has_enhancement(self,v)
    end)
end

function Card:has_dark_suit()
    if SMODS.has_no_suit(self) then return false end
    return MadLib.list_matches_one(MadLib.SuitTypes.Dark, function(v,_)
        return self:is_suit(v)
    end)
end

function Card:has_light_suit()
    if SMODS.has_no_suit(self) then return false end
    return MadLib.list_matches_one(MadLib.SuitTypes.Light, function(v,_)
        return self:is_suit(v)
    end)
end

function Card:has_enhancement()
    return card.config.center.key ~= "c_base" -- usually means it has an enhancement
end

function Card:has_edition()
    return card.edition
end

function Card:has_seal()
    return card.seal
end

-- Gets the configuration no matter what.
function Card:get_config()
	return (self.config or {}).center or {}
end

function Card:ml_get_score()
    return SMODS.multiplicative_stacking((self.ability.score or 1), (not self.ability.extra_enhancement and self.ability.perma_score) or 0)
end

function Card:ml_get_xscore()
    return SMODS.multiplicative_stacking((self.ability.x_score or 1), (not self.ability.extra_enhancement and self.ability.perma_x_score) or 0)
end

function Card:ml_get_emult()
    return SMODS.multiplicative_stacking((self.ability.e_mult or 1), (not self.ability.extra_enhancement and self.ability.perma_e_mult) or 0)
end

function Card:ml_get_echips()
    return SMODS.multiplicative_stacking((self.ability.e_chips or 1), (not self.ability.extra_enhancement and self.ability.perma_e_chips) or 0)
end

function Card:ml_get_escore()
    return SMODS.multiplicative_stacking((self.ability.e_score or 1), (not self.ability.extra_enhancement and self.ability.perma_e_score) or 0)
end

-- Swaps settings with another card
function Card:swap_settings(target,params)
    if not_proper_table(table) then return false end
    local c1, c2 = self, target
	MadLib.simple_event(function()
		local fc, tc
		if params.ranks or params.suits then
			fc = { c1.base.value, c1.base.suit }
			tc = { c2.base.value, c2.base.suit }
			SMODS.change_base(c1, params.suits and tc[2] or fc[2], params.ranks and tc[1] or fc[1])
			SMODS.change_base(c2, params.suits and fc[2] or tc[2], params.ranks and fc[1] or tc[1])
		end

		if params.enhancements then
			fc = c1.config.center
			tc = c2.config.center
			c1:set_ability(tc)
			c2:set_ability(fc)
		end
		if params.editions then
			fc = c1.edition
			tc = c2.edition
			c1:set_edition(tc)
			c2:set_edition(fc)
		end
		if params.seals then
			fc = c1:get_seal()
			tc = c2:get_seal()
			c1:set_seal(tc)
			c2:set_seal(fc)
		end

		return true
    end)
end

-- Copies the settings of another card.
function Card:copy_settings(target,params)
    if not_proper_table(table) then return false end
    local c1, c2 = self, target
	MadLib.simple_event(function()
		local tc
		if params.ranks or params.suits then
			tc = { c2.base.value, c2.base.suit }
			SMODS.change_base(c1, params.suits and tc[2] or c2.base.suit, params.ranks and tc[1] or c2.base.value)
		end
		if params.enhancements then
			tc = c2.config.center
			c1:set_ability(fc)
		end
		if params.editions then
			tc = c2.edition
			c1:set_edition(tc)
		end
		if params.seals then
			tc = c2:get_seal()
			c1:set_seal(tc)
		end
		return true
	end)
end

function Card:has_negative_sticker()
    return MadLib.list_matches_one(MadLib.StickerLists.Bad, function(v)
        return self.ability[v]
    end)
end

-- Returns a list of all stickered cards.
function MadLib.get_stickered_cards(key)
    local jokers        = G.jokers and G.jokers.cards or {}
    local hand          = G.hand and G.hand.cards or {}
    local consumeables  = G.consumeables and G.consumeables.cards or {}
    local stickered = {}
    MadLib.loop_func({ jokers, hand, consumeables }, function(_list)
        MadLib.loop_func(_list, function(v)
            if Madcap.Funcs.get_num_stickers(v) < 1 then return end
            stickered[#stickered+1] = v
        end)
    end)
    return stickered
end

function MadLib.get_card_stickers()
    local jokers        = G.jokers and G.jokers.cards or {}
    local hand          = G.hand and G.hand.cards or {}
    local consumeables  = G.consumeables and G.consumeables.cards or {}
    local stickered     = 0
    MadLib.loop_func({ jokers, hand, consumeables }, function(_list)
        MadLib.loop_func(_list, function(v)
            stickered = stickered + Madcap.Funcs.get_num_stickers(v)
        end)
    end)
    return stickered
end

function MadLib.copy_card_settings(copier, target, params)
    if not params or not copier or not target then return false end
    tell('Copy card settings...')
    if params.ranks or params.suits then
        SMODS.change_base(copier, (params.suits and target.base.suit) or nil, (params.ranks and target.base.value) or nil)
    end
    if
        params.enhancements
        and not (params.preserve_enhancement == true and copier.config.center ~= G.P_centers.c_base)
    then
        copier:set_ability(target.config.center)
    end
    if
        params.editions
        and not (params.preserve_edition == true and copier.edition)
    then
        copier:set_edition(target.edition, true)
    end
    if
        params.seals
        and not (params.preserve_seal == true and copier.seal)
    then
        copier:set_seal(target.seal, true, true)
    end

    return true
end

-- Brings the selected card to the front
function CardArea:bring_card_to_front(card)
    if (not card) or not_proper_table(self.cards) then return false end
    local index = MadLib.get_item_index(card, list, true)
    if not index or index <= 1 then return false end
    local item = list[index]
    -- Shift all elements between 1 and index-1 one step right
    for i = index, 2, -1 do list[i] = list[i - 1] end
    -- Place the item at the front
    list[1] = item
    return true
end

-- card way to do it
function Card:get_points()
    return MadLib.get_card_points(self)
end

-- silly way to determine the value of the card
function MadLib.get_card_points(c)
    local info = MadLib.get_card_info(c)
    local enhance = MadLib.PointValues.Enhancements[info.enhancement] or 0
    local edition = MadLib.PointValues.Enhancements[info.edition] or 0
    --local nominal = SMODS.Ranks[info.rank].nominal + (SMODS.Ranks[info.rank].face_nominal or 0)
    local pts = (edition * 3) + (enhance * 2) + math.random()
    return pts
end


-- Used for tarots which turn X items into new cards?
function MadLib.can_use_transform_tarot(card)
	return G.hand and (#G.hand.highlighted >= 1 and #G.hand.highlighted <= card.ability.max_highlighted)
end

function MadLib.can_use_consumable(card)
	local play_exists = G.play and #G.play.cards > 0
    local stop_use_active = G.GAME.STOP_USE and G.GAME.STOP_USE > 0
    local state_disallows = G.STATE ~= G.STATES.HAND_PLAYED and
                        G.STATE ~= G.STATES.DRAW_TO_HAND and
                        G.STATE ~= G.STATES.PLAY_TAROT

    return not ((play_exists or G.CONTROLLER.locked or stop_use_active) and state_disallows)
end
-- Returns card info as a table - easier than
function MadLib.get_card_info(c)
    return {
        suit        = c.base.suit,
        rank        = c.base.value,
        enhancement = c.config.center.key,
        edition     = c.edition and c.edition.key or nil,
        seal        = c.seal and c.seal.key or nil
    }
end

function Card:get_info_table(true_values)
    true_values = true_values or true
    return {
        suit        = c.base.suit,
        rank        = c.base.value,
        enhancement = c.config.center.key,
        edition     = c.edition and c.edition.key or nil,
        seal        = c.seal and c.seal.key or nil
    }
end

-- Returns card info as a table - easier than
function MadLib.get_hand_info(deck)
    local info = {}
    for _, c in pairs(deck) do info[#info+1] = MadLib.get_card_info(c) end
    return info
end

-- Uses card info
function MadLib.dupe_from_card_info(cards,func)
    local dupes = {}
    for _, v in pairs(cards) do
        MadLib.simple_event(function()
            local suit = SMODS.Suits[v.suit].card_key
            local rank = SMODS.Ranks[v.rank].card_key
            local n = create_playing_card({ front = G.P_CARDS[suit .. '_' .. rank] })
            if v.enhancement then n:set_ability(v.enhancement) end
            if v.edition then n:set_edition(v.edition) end
            if v.seal then n:set_seal(v.seal) end
            if func then func(n,v) end -- in case you want to do some funky stuff
            n:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, n)
            table.insert(dupes, n)
            return true
        end, 0.25, 'after')
    end
    --return {}
    return dupes
end


