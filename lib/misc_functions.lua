-- Adapted from Entropy(?) code - flips a list of cards and modifies them
-- based on a provided func
function MadLib.flip_cards(card_list, func, before, after)
    local enable_animations = MadLib.is_animation_enabled()
    if not (card_list and type(card_list) == 'table') then return false end

    -- Before
    if not enable_animations then
        for _, c in ipairs(card_list) do
            if c then
                MadLib.simple_event(function()
                    if before then before(c) end
                    if c.flip then c:flip() end
                    -- do sound if there
                    return true
                end, 2.0, "after")
            end
        end
    elseif before then
        for _, c in ipairs(card_list) do before(c) end
    end
    -- Do the func
    if not enable_animations then
        for _, c in ipairs(card_list) do
            if c then
                MadLib.simple_event(function()
                    if func then func(c) end
                    return true
                end, 2.0, "after")
            end
        end
    else
        for _, c in ipairs(card_list) do func(c) end
    end
    -- After
    if not enable_animations then
        for _, c in ipairs(card_list) do
            if c then
                MadLib.simple_event(function()
                    if c.flip then c:flip() end
                    -- do sound if there
                    if after then after(c) end
                    return true
                end, 2.0, "after")
            end
        end
    elseif after then
        for _, c in ipairs(card_list) do after(c) end
    end
    return true
end

function MadLib.flip_card(c, func, before, after)
    local enable_animations = MadLib.is_animation_enabled()
    -- Before
    if not enable_animations then
        MadLib.simple_event(function()
            if before then before(c) end
            if c.flip then c:flip() end
            return true
        end, 2.0, "after")
    elseif before then
        before(c)
    end
    -- Do the func
    if not enable_animations then
        MadLib.simple_event(function()
            if func then func(c) end
            return true
        end, 2.0, "after")
    else
        func(c)
    end
    -- After
    if not enable_animations then
        MadLib.simple_event(function()
            if c.flip then c:flip() end
            if after then after(c) end
            return true
        end, 2.0, "after")
    elseif after then
        after(c)
    end
    return true
end

function MadLib.normalize_spaces(str)
    -- collapse multiple spaces into one
    str = str:gsub(" +", " ")
    -- trim leading spaces
    str = str:gsub("^%s+", "")
    -- trim trailing spaces
    str = str:gsub("%s+$", "")
    return str
end

-- Returns a number between the value and its specified minimums and maximums
function MadLib.clamp(val,min,max)
    return math.min(math.max(min, val), max)
end

-- Exclusive OR - one, but NOT both.
function MadLib.xor(a,b)
    return (a and not b) or (not a and b)
end

-- Round number to X decimals.
function MadLib.round(value, decimals)
    local factor = 10 ^ (math.floor(decimals or 2))
    return math.floor(value * factor + 0.5) / factor
end

-- Random number rounded to X decimals.
function MadLib.random(v, d)
    return MadLib.round(math.random() * v, d or 2)
end

function MadLib.random_int(v)
    return MadLib.round(math.random() * v, 0)
end

function MadLib.random_between(v1, v2, d)
    local min, max = math.min(v1, v2), math.max(v1, v2)
    return MadLib.round(min + math.random() * (max - min), d or 0)
end

function MadLib.calculate_chips(value, args)
    return value
end

function MadLib.calculate_mult(value, args)
    return value
end

if Cryptid and Cryptid.ascend then
    local calculate_chips_ref = MadLib.calculate_chips
    function MadLib.calculate_chips(value, args)
        return Cryptid.ascend(calculate_chips_ref(value,args))
    end

    local calculate_mult_ref = MadLib.calculate_mult
    function MadLib.calculate_mult(value, args)
        return Cryptid.ascend(calculate_mult_ref(value,args))
    end
end

-- Takes a value and repeatedly builds upon it until check fails
-- If you don't provide a way to break the loop, this can
-- go on endlessly - BE CAREFUL!
function MadLib.build_onto_val(val, check, func, bypass_check)
    if not bypass_check
        and (type(val) ~= 'number'
        or not_proper_func(check)
        or not_proper_func(func)) then return nil end -- prevent crash!

    local i=0
    repeat val = func(val,i) until not check(i)
    return val
end

function MadLib.get_value_from_id(_id)
    local rank_key = MadLib.RankIds[_id]
    return SMODS.Ranks[rank_key] or nil
end

function MadLib.get_card_value(_card)
    local value = MadLib.get_value_from_id(_card:get_id())
    return value and value.key or nil
end

function MadLib.get_random_id(_num)
	local res = ""
	for i = 1, _num do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function MadLib.pair_cards(v1,v2,id,length,remove)
    local _string = MadLib.get_random_id(length or 5)
    v1.ids, v2.ids = v1.ids or {}, v2.ids or {}
    v1.ids[id or 'default'] = (not remove) and _string or nil
    v2.ids[id or 'default'] = (not remove) and _string or nil
    return _string
end

function MadLib.compare_ids(v1,v2,id)
    local id1 = v1.ids and v1.ids[id or 'default']
    local id2 = v2.ids and v2.ids[id or 'default']
    return id1 ~= nil and id1 == id2
end

function MadLib.get_id(v1,id)
    return v1.ids and v1.ids[id or 'default']
end

function MadLib.edit_uibox_contents(contents)
    return contents
end

-- Get the light/dark counterpart of the suit.
function MadLib.suit_get_counterpart_lightdark(suit)
    if not MadLib.SuitConversions.LightAndDark[suit] then return suit end
    local conv = pseudorandom_element(MadLib.SuitConversions.LightAndDark[suit], pseudoseed('madlib_lightdark'))
    return conv
end

-- Get the modded/base counterpart of the suit.
function MadLib.suit_get_counterpart_basemodded(suit)
    if not MadLib.SuitConversions.BaseAndModded[suit] then return suit end
    local conv = pseudorandom_element(MadLib.SuitConversions.BaseAndModded[suit], pseudoseed('madlib_basemodded'))
    return conv
end

-- Turns a number into an ordinal (e.g. 4 -> 4th).
function MadLib.get_num_position(n)
    local suffix = "th"
    if n % 100 < 11 or n % 100 > 13 then
        local lastDigit = n % 10
        suffix = (lastDigit == 1 and 'st')
            or (lastDigit == 2 and 'nd')
            or 'rd'
    end
    return tostring(n) .. suffix
end

function MadLib.get_card_total_value(v)
    local suit          = v.base.suit
    local rank          = v.base.value
    local enhance       = v.config.center.key
    local edition       = v.edition and v.edition.key
    local seal          = v.seal -- add later
    local points        = 0

    if edition then
        points = points + (MadLib.PointValues.Editions[edition] or 0)
    end
    if enhance then
        points = points + (MadLib.PointValues.Enhancements[enhance] or 0)
    end

    return points
end

-- Event for setting a seal.
function MadLib.seal_event(card, seal)
    MadLib.event({
        func = function()
            card:set_seal(seal or "red", true, true)
            card:juice_up(0.5, 0.7)
            play_sound(('tarot2'), 0.76, 0.4)
            return true
        end
    })
end

function MadLib.get_suit_colour(suit)
    return G.C.SUITS[suit] or G.C.RED
end

function MadLib.get_voucher_reqs(...)
    return MadLib.get_loop_func({...}, function(v)
		return 'v_'..v
	end)
end

function MadLib.list_append(list,prefix,suffix)
	MadLib.loop_func(list, function(v,i)
		v = (prefix or '') .. v .. (suffix or '')
	end)
end

function MadLib.has_contexts(...)
    local args = {...}
    local _context = args[1]
    for i=2, #args do
        if not _context[args[i]] then return false end
    end
    return true
end

-- Finds an entry within a table - returns -1 if it doesn't exist in the table.
function MadLib.find_in_table(entry, table)
	for k, v in pairs(table) do if v == entry then return k end; end
	return -1 -- cannot find :(
end

-- Reverses the table order. Credit to ThatOneGuyAli for code!
function MadLib.reverse_table(table)
	local reversed = {}
    for i = 1, #table do reversed[#reversed+1] = table[#table-i+1]; end;
	return reversed
end

function MadLib.reverse_in_place(t)
    local len = #t
    for i = 1, math.floor(len / 2) do t[i], t[len - i + 1] = t[len - i + 1], t[i]; end
end

-- Reverses an entire card area's content
function CardArea:reverse()
    MadLib.reverse_in_place(self.cards)
    self:set_ranks()
end

function MadLib.get_moved_index(index,cells,list_length)
    return (index - 1 + cells) % list_length + 1
end

-- Returns target destination
function MadLib.edit_card_destination(card,from,to)
    return to
end

-- Easy way of tetrating. Credit to More Fluff.
function MadLib.fake_tetrate(score,amt)
    return score ^ (score ^ amt - 1)
end

-- Picks a rank from the group either by picking a card and returning its rank
-- OR (if [same_weight] is enabled) picking and returning a random rank in the group.
function MadLib.pick_rank_from_group(group, same_weight, true_values)
    if not_proper_table(group) then return nil end

    if not same_weight then
        -- regular: pick card from deck, return its rank
        local card = pseudorandom_element(group, pseudoseed('rgmc'))
        return (not true_values) and card:get_id() or card.base.value -- return the card
    else
        -- same weight: all cards have equal probability
        local rank_list = MadLib.get_ranks_from_cards(G.playing_cards)
        return (not rank_list or #rank_list < 1) and nil or pseudorandom_element(rank_list, pseudoseed('rgmc'))
    end
end

-- Picks a suit from the group either by picking a card and returning its suit
-- OR (if [same_weight] is enabled) picking and returning a random suit in the group.
function MadLib.pick_suit_from_group(group, same_weight)
    if not_proper_table(group) then return nil end

    if not same_weight then
        -- regular: pick card from deck, return its rank
        local card = pseudorandom_element(group, pseudoseed('rgmc'))
        return card.base.suit -- return the suit
    else
        -- same weight: all cards have equal probability
        local suit_list = MadLib.get_suits_from_cards(group)
        return (not suit_list or #suit_list < 1) and nil or pseudorandom_element(suit_list, pseudoseed('rgmc'))
    end
end

function MadLib.get_num_suits(cards)
    return MadLib.loop_table(MadLib.get_suits_from_cards(cards), function(v) return true end)
end

function MadLib.get_num_ranks(cards)
    return MadLib.loop_table(MadLib.get_ranks_from_cards(cards), function(v) return true end)
end

function MadLib.get_flipped_table(original_table)
    local new_table = {}
    for key, value in pairs(original_table) do
        -- Check if the value is already a key in the new table
        -- This handles cases where multiple original keys map to the same value
        if new_table[value] then
            -- If the value is already a key, store the original key(s) in a sub-table
            if type(new_table[value]) == "table" then
                table.insert(new_table[value], key)
            else
                new_table[value] = {new_table[value], key}
            end
        else
            new_table[value] = key
        end
    end
    return new_table
end

-- Shuffles the cards, then gets returns a list of cards.
-- Function must return TRUE or FALSE.
function MadLib.shuffle_sort_list(group, max_cards, func_filter, func_sort)
    if not_proper_table(group) then return nil end
    local _max = MadLib.clamp((max_cards or #group),1,#group)
    -- shuffle the list
    local shuffle_list = MadLib.deep_copy_list(group)
    pseudoshuffle(shuffle_list, pseudoseed('rgmc'))

    if func_sort then table.sort(shuffle_list, func_sort) end -- (a,b)
    return MadLib.get_list_matches_limited(shuffle_list,(func_filter or true),_max)
end

MadLib.get_cards_from_shuffled_deck = MadLib.shuffle_sort_list -- TODO: fix

-- Handles consumable destroying (includes Incantation and Overflow)
function MadLib.handle_consumable_destroy(target)
    if Incantation then quota = target:getEvalQty() end
    if Overflow then quota = target.ability.immutable and target.ability.immutable.overflow_amount end
    target.getting_sliced = true

    MadLib.event({
        func = function()
            target:start_dissolve({ G.C.RED }, nil, 1.6)
            return true
        end,
    })
    target.dissolve = 0 --timing issues related to crossmod stuff
end

-- Is the current ante (or specified) a finisher blind ante?
function MadLib.is_finisher_ante(ante)
    return (ante or G.GAME.round_resets.ante) % G.GAME.win_ante == 0
end

-- [Return Object] Gets the most played poker hand
function MadLib.get_most_played_hand(count_all)
	-- defaults to high card
	if not G.GAME or not G.GAME.current_round then return 'High Card' end
	local chosen_hand 	= 'High Card'
	local hand_name 	= chosen_hand
	local most_played, cur_order = -1, -1
	for k, v in pairs(G.GAME.hands) do
		if
            (count_all or v.enabled)
			or v.played > most_played
			or (v.played == most_played and cur_order > v.order)
		then
			most_played = v.played
			hand_name = k
		end
	end
	chosen_hand = hand_name
	return chosen_hand
end

-- Used to check position in list, returns as integer?
function MadLib.get_position_in_list(obj,list)
    if not (obj and list) then return -1 end -- uh oh!
    for i=1,#list do if list[i] == obj then return i end; end
    return -1 -- cannot find it.
end

function Card:fake_kill(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local dissolve_time = 0.7*(dissolve_time_fac or 1)
    self.dissolve = 0
    self.dissolve_colours = dissolve_colours
        or {G.C.BLACK, G.C.ORANGE, G.C.RED, G.C.GOLD, G.C.JOKER_GREY}
    if not no_juice then self:juice_up() end
    local childParts = Particles(0, 0, 0,0, {
        timer_type = 'TOTAL',
        timer = 0.01*dissolve_time,
        scale = 0.1,
        speed = 2,
        lifespan = 0.7*dissolve_time,
        attach = self,
        colours = self.dissolve_colours,
        fill = true
    })
    MadLib.simple_event(function()
        childParts:fade(0.3*dissolve_time)
        return true
    end, 0.7 * dissolve_time, 'after')

    if not silent then
        MadLib.event({
            blockable = false,
            func = (function()
                    play_sound('whoosh2', math.random()*0.2 + 0.9,0.5)
                    play_sound('crumple'..math.random(1, 5), math.random()*0.2 + 0.9,0.5)
                return true end)
        })
    end
    MadLib.event({
        trigger = 'ease',
        blockable = false,
        ref_table = self,
        ref_value = 'dissolve',
        ease_to = 1,
        delay =  1*dissolve_time,
        func = (function(t) return t end)
    })
    MadLib.event({
        trigger = 'after',
        blockable = false,
        delay =  1.05*dissolve_time,
    })
end

function MadLib.get_generic_end_of_round(context)
    return context.end_of_round
        and not context.repetition
        and not context.game_over
        and not context.blueprint
end

function MadLib.get_consumeable_usage(_set)
	if not G.GAME or type(G.GAME.consumeable_usage) ~= 'table' then return 0  end

    return MadLib.loop_func(G.GAME.consumeable_usage, function(v)
        return v.set and v.set == _set
    end)
end

-- Gets a random Poker Hand (usually visible) - used in Rocket Keychain
function MadLib.get_random_poker_hand(bypass_visible,min_hand,max_hand,func)
	local chosen_hand = nil

    -- make a temporary list, shuffle it.
	local shuffle_deck = MadLib.deep_copy(G.handlist)
    pseudoshuffle(shuffle_deck,seed)

    for i=1,#shuffle_deck do
        local passes = true
        chosen_hand = shuffle_deck[i]

        if
            (min_hand and MadLib.get_position_in_list(G.handlist,min_hand) > MadLib.get_position_in_list(G.handlist,chosen_hand))
            or (max_hand and MadLib.get_position_in_list(G.handlist,max_hand) < MadLib.get_position_in_list(G.handlist,chosen_hand))
            or (func and not func(v))
        then
            passes = false
        end

        if -- if it is visible, or visible is not needed, and it passes
            (bypass_visible or G.GAME.hands[chosen_hand].visible)
            and passes
        then
            return chosen_hand
        end
    end

    return nil -- you get NOTHING!
end

-- Gets a list of cards that the player can possibly encounter
-- only using their "full discards" (e.g. 5 cards per discard, 3 discards = 15)
-- Specifically applies to G.deck
function MadLib.get_possible_deck(_cards)
    local max_discard_size  = G.GAME.starting_params.discard_limit  or 5
    local num_discards      = G.GAME.current_round.discards_left    or 3
    local deck_selection    = {}
    local i = 0
    while (#_cards - i) > (max_discard_size * num_discards) and i < #_cards do
        table.insert(deck_selection,_cards[#_cards - i])
        i = i+1
    end
    return deck_selection
end

-- [Return List] Imitates the Gros Michel death animation.
-- Can be used for other Jokers.
--
function MadLib.banana_remove(card, msg)
    if not (card and card.T)then
        return nil
    end
    MadLib.simple_event(function()
        G.jokers:remove_card(card)
        card:remove()
        card = nil
        return true
    end, 0.3, 'after', false)
    return { message = localize(msg or "k_extinct_ex") }
end

function MadLib.food_joker_logic(card,func)
    card.ability.extra.rounds = card.ability.extra.rounds
        and MadLib.subtract(card.ability.extra.rounds, 1)
        or 0

    return MadLib.is_positive_number(card.ability.extra.rounds) and
        { message = { localize("rgmc_minus_round") }, colour = G.C.FILTER, }
    or MadLib.banana_remove(card,"k_eaten_ex")
end

-- [Return Bool] Used for Planet cards with multiple poker hands.
function MadLib.get_observatory_activate(hand_list, context)
    return context and MadLib.list_matches_one(hand_list, function(v)
        return context.scoring_name == v
    end)
end

-- Simple way to mimic Observatory
-- Obsevatory: Planet cards in your consumable area give [X1.5] Mult for their specified poker hand.
function MadLib.calculate_observatory_xmult(self, card, context)

    if not
        (G.GAME
        and G.GAME.used_vouchers.v_observatory
        and context.joker_main
        and MadLib.get_observatory_activate(card.config.center.config.hand_types,context))
    then
        return {}
    else
        local value = G.P_CENTERS.v_observatory.config.extra
        return {
            message = localize({ type = "variable", key = "a_xmult", vars = { value } }),
            Xmult_mod = value,
        }
    end
end

function MadLib.force_poker_hand(results, poker_hand)
	if not (results[poker_hand] and results[poker_hand][1]) then
        for _, v in ipairs(G.handlist) do
            if results[v][1] then
                results[poker_hand] = results[v]
                break
            end
        end
    end
end

function MadLib.add_to_hand_sum(v, count_irregulars)
    if not SMODS.has_no_rank(v) and not ((not count_irregulars) and v:rank_in_list(MadLib.RankTypes.Irregular)) then
        local rank = SMODS.Ranks[v.base.value]
        return rank.nominal
    end
end

function MadLib.get_hand_sum(hand, count_irregulars)
	local total = 0
	MadLib.loop_func(hand, function(v)
        total = total + (MadLib.add_to_hand_sum(v, count_irregulars) or 0)
    end)
	return total
end

-- Easy way to return a localized name
function MadLib.localize_name_text(s,k)
    return localize { type = 'name_text', set = s, key = k }
end

function MadLib.get_random_card(set, area, seed)
	return create_card(set, area, nil, nil, nil, nil, nil, seed or 'rgmc_rng')
end

function MadLib.create_card(set, area, seed)
    if (not area) or not_proper_table(area.cards) then return nil end
    local c, is_consumable = nil, area == G.consumeables
    if is_consumable then G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1 end
    MadLib.simple_event(function()
        c = MadLib.get_random_card(set, area, seed)
        c:add_to_deck()
        area:emplace(c)
        if is_consumable then G.GAME.consumeable_buffer = 0 end
        play_sound('timpani')
        return true
    end, 1.0, 'immediate')
    return c
end

-- Creates a Joker of [joker_id] in [area] (or G.jokers)
function MadLib.create_joker(joker_id, area, sound)
    local to        = area or 'jokers'
    local target    = G.P_CENTERS['j_'..joker_id]
    if not (#G[to].cards < G[to].config.card_limit) then return nil end
    local new_card
        -- function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    MadLib.simple_event(function()
        new_card = SMODS.add_card({
            set     = 'Joker',
            key     = joker_id,
            area    = area or G.jokers
        })

        if sound then play_sound(sound) end
        return true
    end, 1.0, 'immediate')
    return new_card
end

function MadLib.randomize_playing_cards(targets, do_animation, args)
	if
        not_proper_table(targets)
        or not_proper_table(args)
        or #targets <= 0
    then
        return false
    end
    Madcap.loop_func(targets, function(v,i)
        local enhanced  = v:has_enhancement() and args.do_enhancements
        local editioned = v.edition and args.do_editions
        local sealed    = v.seal and args.do_seals

        -- new rank
        -- new suit
        if enhanced then
            local new_enhancement = not args.force_enhancement
                and MadLib.get_weighted_enhancement(args.enhancement_whitelist,args.enhancement_blacklist)
                or args.force_enhancement
            v:set_ability(G.P_CENTERS[new_enhancement])
        end

        if editioned then
            local new_edition = not args.force_edition
                and MadLib.get_weighted_edition(args.edition_whitelist,args.edition_blacklist)
                or args.force_edition
            v:set_edition(new_edition)
        end

        if sealed then
            local new_seal = not args.force_seal
                and MadLib.get_weighted_seal(args.seal_whitelist,args.seal_blacklist)
                or args.force_seal
            --v:set_seal(MadLib.get_weighted_seal(args.seal_whitelist, args.seal_blacklist)), true)
        end

        -- do new stickers
        if args.do_stickers then

        end
    end)

    return true
end

-- DEPRECATED?
local invalid_values = {
	'naneinf',
	'nane0',
	'-nane0',
	'nan',
	'nane',
	'inf',
	'-naneinf',
	'-nan',
	'-inf',
	'infinity',
	'nil'
}

--Checks if a number is not an actual number (e.g. nan, inf)
function MadLib.invalid_number(num)
	local str = string.lower(number_format(num))
	return MadLib.list_matches_one(invalid_values, function(v,i) return str == v end)
end

-- Returns a list of all unscoring cards in G.play
function MadLib.get_unscored_cards(context)
    if not context or type(context) ~= 'table' or (context.full_hand and context.scoring_hand) then return {} end
    return MadLib.get_list_matches(context.full_hand, function(v)
        return list_matches_all(context.scoring_hand, function(v2) return v ~= v2 end)
    end)
end

function MadLib.apply_seals(cards,seal)
    MadLib.loop_func(cards, function(v)
        MadLib.event({
            func = function()
                play_sound('tarot1')
                v:juice_up(0.3, 0.5)
                return true
            end
        })
        MadLib.event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                v:set_seal(seal, nil, true)
                return true
            end
        })
        delay(0.5)
        MadLib.simple_event(function()
            G.hand:unhighlight_all()
            return true
        end,0.2,'after')
    end)
end

function MadLib.read_list(list,prefix)
    tell('TABLE READING' .. (prefix and (' - ' .. prefix) or '') .. ':')
    MadLib.loop_func(list, function(v)
    end)
    tell('END READING')
    return list
end

function MadLib.define_get_currency_sell_ui (card)
    return {n=G.UIT.T, config={text = localize('$'),colour = G.C.WHITE, scale = 0.4, shadow = true}}
end

if PTSaka then -- ptsaka
    MadLib.get_full_score = function(hand_chips, mult)
        return PTASaka.arrow(G.GAME.payasaka_exponential_count,hand_chips,mult)
    end
else -- no ptsaka
    MadLib.get_full_score = function(hand_chips, mult)
        return hand_chips * mult
    end
end

function MadLib.hand_passes_check(cards, hands, text)
    if not cards then 
        return true
    elseif G.GAME.modifiers.min_hand_size ~= nil and G.GAME.modifiers.min_hand_size > #cards then
        --tell('Too small')
        return false
    elseif G.GAME.modifiers.max_hand_size ~= nil and G.GAME.modifiers.max_hand_size < #cards then
        --tell('Too big')
        return false
    end
    return true
end

-- manipulates chip and mult values
function MadLib.manipulate_chips_mult(ch,mu)
    if G.HUD:get_UIE_by_ID('chip_UI_count') then G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.5, 0.5) end
    hand_chips  = ch or hand_chips
    mult        = mu or mult
end

-- Allows you to dupe cards and shit
function MadLib.dupe_cards(cards,func)
    local dupes = {}
    MadLib.loop_func(cards, function(v)
        local suit = SMODS.Ranks[v.base.value].card_key
        local rank = SMODS.Ranks[v.base.suit].card_key
        local n = create_playing_card({ front = G.P_CARDS[suit .. '_' .. rank] })
        n = v.config.center
        n:set_edition(v.edition)
        n:set_seal(v.seal)
        if func then func(v, n) end -- in case you want to do some funky stuff
        table.insert(dupes, n)
    end)
    return dupes
end

function MadLib.loop_joker_effect(joker, func)
    if not joker then return end
    local list = SMODS.find_card(joker)
    if not (list and #list > 0) then return end
    MadLib.loop_func(list, func)
end

function MadLib.get_card_count(cards, func)
    local original, modified = 0, 0

    MadLib.loop_func(cards, function(v, i)
        if not func(v, i) then return end
        original = original + 1
        modified = modified + v:get_quantity_value()
    end)

    return modified, original ~= modified
end

function Card:get_quantity_value()
    return 1
end

function Card:quantity_exists()
	return MadLib.is_positive_number(self:get_quantity_value())
end

function Card:can_score_card()
    return self:get_quantity_value() >= 1
end

-- Checks if Pareidolia should proc for the card
function MadLib.get_pareidolia(card)
    return card and next(find_joker("Pareidolia"))
end

function Card:ml_is_free()
    -- Astronomer logic
    if (self.ability.set == 'Planet'  or (self.ability.set == 'Booster' and self.ability.name:find('Celestial'))) then
        if #find_joker('Astronomer') > 0 and self:get_quantity_value() > 0 then return true end
    end
    return false
end

function Card:is_sold()
    return self.ability.sold
end

function MadLib.get_shop_state()
    return G.STATE == G.STATES.SHOP
end

function MadLib.get_hide_hand_area()
    return G.STATE == G.STATES.SMODS_BOOSTER_OPENED
end

function MadLib.get_card_setting_ability()
    return G.STATES.SMODS_BOOSTER_OPENED and G.STATE ~= G.STATES.SHOP
end

function MadLib.update_check_state(g,dt)
end

function MadLib.edit_shop_data(g,dt)
end

local unpack = table.unpack or unpack
function MadLib.find_in_table(tbl, targetKey, targetValue, visited, path)
    visited = visited or {}
    path = path or {}

    if visited[tbl] then return nil end
    visited[tbl] = true

    for key, value in pairs(tbl) do
        -- Make a shallow copy of the path
        local newPath = {}
        for i = 1, #path do
            newPath[i] = path[i]
        end
        newPath[#newPath + 1] = key

        if key == targetKey and value == targetValue then
            return newPath
        end

        if type(value) == "table" then
            local result = MadLib.find_in_table(value, targetKey, targetValue, visited, newPath)
            if result then
                return result
            end
        end
    end
    return nil
end

function MadLib.find_key_in_table(tbl, targetKey, visited, path)
    visited = visited or {}
    path = path or {}

    if visited[tbl] then return nil end
    visited[tbl] = true

    for key, value in pairs(tbl) do
        -- Copy the current path
        local newPath = {}
        for i = 1, #path do
            newPath[i] = path[i]
        end
        newPath[#newPath + 1] = key

        -- Found the key
        if key == targetKey then
            return newPath
        end

        -- Recurse safely
        if type(value) == "table" then
            local result = MadLib.find_key_in_table(value, targetKey, visited, newPath)
            if result then
                return result
            end
        end
    end

    return nil
end

function MadLib.hide_hand_ui()
    return state == G.STATES.SMODS_BOOSTER_OPENED
end

function MadLib.get_suit_count(hand, bypass_debuff, flush_calc)
    local num_suits = 0
    MadLib.loop_table(MadLib.get_suits_from_cards(hand, bypass_debuff, flush_calc), function(k,v)
        if v < 1 then return end
        num_suits = num_suits+1
    end)
    return num_suits
end

function MadLib.list_has_string(list,string)
    if not (list and string) then return false end
    for _, value in ipairs(list) do
        if value == string then
            return true
        end
    end
    return false
end

function MadLib.get_unique_enhancements(cards)
    local enhancement_table = {}
    local num = 0
    MadLib.loop_func(cards, function(v) 
        if enhancement_table[v.config.center] then return end 
        enhancement_table[v.config.center] = true
        num = num + 1
    end)
    return num
end

function MadLib.is_broke(offset)
    return not MadLib.is_positive_number(MadLib.subtract(MadLib.add(G.GAME.dollars, offset or 0), G.GAME.bankrupt_at))
end

function MadLib.can_afford(offset)
    return MadLib.compare_numbers(MadLib.subtract(G.GAME.dollars, G.GAME.bankrupt_at), offset) >= 0
end

function MadLib.get_level_color(lvl)
    return MadLib.compare_numbers(lvl, 2) < 0 
        and G.C.BLACK
        or G.C.HAND_LEVELS[to_number(math.min(7, lvl))]
end

function MadLib.score_on_fire()
    return MadLib.compare_numbers(G.ARGS.score_intensity.earned_score, G.ARGS.score_intensity.required_score) > 0 and MadLib.is_positive_number(G.ARGS.score_intensity.required_score)
end

function MadLib.score_beats_blind(add_score)
    return MadLib.compare_numbers(MadLib.add(G.GAME.chips, add_score), (G.GAME.blind.chips)) >= 0
end

function MadLib.get_calc_bonus(a)
    return MadLib.is_positive_number(a) and lenient_bignum(a)
end

function MadLib.post_scoring_event(event)
    if not G.GAME then return end
    G.GAME.post_scoring_events = G.GAME.post_scoring_events or {}
    G.GAME.post_scoring_events[#G.GAME.post_scoring_events+1] = event
    return event
end

function MadLib.get_chips_text()
end

function MadLib.do_special_destroy_effect(card)
end

function MadLib.do_post_scoring_stuff()
    local text, disp_text, poker_hands, s, non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
    if G.GAME.post_scoring_events then
        delay(1.5)
        MadLib.loop_func(G.GAME.post_scoring_events, function(v,i)
            if 
                v.type == 'ease_score'
                and type(MadLib[v.operator]) == 'function'
            then
                local new_score = MadLib[v.operator](total_score, v.amount)
                if type(v.message) == 'table' then
                    card_eval_status_text(v.message.card, 'extra', nil, v.message.percent, nil, {
                        message = v.message.text,
                        sound   = v.message.sound,
                        colour  = v.message.colour,
                        trigger = 'after',
                        delay   = 0.0,
                    })
                end
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
                delay(1.0)
                total_score = mod_total_score(new_score)
            end
        end)
        G.GAME.post_scoring_events = nil
    end
    -- Idk man
    MadLib.loop_func(s, function(v)
        SMODS.calculate_context({ ml_post_scoring = true, scoring_hand = s, other_card = v }) 
    end)
    MadLib.loop_func(G.hand.cards, function(v)
        SMODS.calculate_context({ ml_post_scoring = true, cardarea = G.play, other_card = v }) 
    end)
    MadLib.loop_func(G.play.cards, function(v)
        SMODS.calculate_context({ ml_post_scoring = true, cardarea = G.hand, other_card = v }) 
    end)

    -- Some cards get destroyed after scoring truly ends.
    local cards_destroyed = {}
    for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'destroying_cards')) do
        SMODS.calculate_destroying_cards({ 
            ml_post_scoring = true,
            full_hand = G.play.cards, 
            scoring_hand = s,
            scoring_name = text,
            poker_hands = poker_hands, 
            cardarea = v 
        }, cards_destroyed, v == G.play and s or nil)
    end
    
    if cards_destroyed[1] then
        SMODS.calculate_context({scoring_hand = s, remove_playing_cards = true, removed = cards_destroyed})
    end

    for i=1, #cards_destroyed do
        --MadLib.do_special_destroy_effect(cards_destroyed[i])
        SMODS.destroy_cards(cards_destroyed[i], nil, nil, false)
        delay(0.8)
    end
end

function MadLib.get_final_score(val)
    local round_score = SMODS.calculate_round_score()
    return mod_total_score(MadLib.add(total_score, round_score))
end


local string_commas = function(values)
    local ret = ""
    for i=1,#values do
        ret = ret .. values[i]
        if i < #values then
            ret = ret .. ', '
        end
    end
    return ret
end

function MadLib.rank_id(key)
    return SMODS.Rank[key] and SMODS.Rank[key].id
end

function MadLib.is_rank_full(playing_card, id, values)
    values = values or { playing_card:get_id() }

    -- Check Jokers
    MadLib.loop_func(G.jokers and G.jokers.cards or {}, function(v)
        if not v.config.center.modify_playing_card_rank then return end
        local ret = v.config.center:modify_playing_card_rank(v, playing_card, values)
        if not ret then return end

        -- Add ranks to list
        if ret.add_rank then
            if SMODS.Ranks[ret.add_rank] then 
                values[#values+1] = SMODS.Ranks[ret.add_rank].id
            end
        elseif ret.add_ranks then
            for _, v2 in pairs(ret.add_ranks) do
                if SMODS.Ranks[ret.v2] then
                    values[#values+1] = SMODS.Ranks[ret.v2].id 
                end
            end
        end

        -- Remove ranks from list
        if ret.remove_rank and SMODS.Ranks[ret.remove_rank] then
            for k,v2 in pairs(values) do
                if v2 == ret.remove_rank then values[k] = nil; break end
            end
        elseif ret.remove_ranks then
            for _,v2 in pairs(ret.remove_ranks) do
                for i=#values,1,-1 do
                    if values[i] == v2 then values[i] = nil end
                end
            end
        end

    end)
    
    --print(string_commas(values) .. ' - ' .. tostring(id))
    for i=1, #values do -- if one matches
        if values[i] == id then
            return true
        end
    end
    
    return false
end

function MadLib.is_rank(playing_card, key)
    if not SMODS.Ranks[key] then return false end
    --print(key)
    return MadLib.is_rank_full(playing_card, SMODS.Ranks[key].id)
end


function MadLib.has_rank(playing_card, keys)
    return MadLib.list_matches_one(keys, function(v) 
        return MadLib.is_rank(playing_card, v)
    end)
end

-- gets a list of IDs
function MadLib.get_rank_values(card)
    local values = { card.base.value }
    return values
end

function MadLib.get_value(card)
    return card.base.value
end

function MadLib.get_rank_nominal(rank,no_face)
    local info = SMODS[rank]
    return info and (info.nominal + (no_face and 0 or info.face_nominal)) or nil
end

function MadLib.rank_to_id(key)
    return SMODS.Ranks[key] and SMODS.Ranks[key].id or nil 
end

-- Includes all ranks considered Odd by MadLib.
function MadLib.has_odd_rank(card)
    return not SMODS.has_no_rank(card)
        and MadLib.list_matches_one(MadLib.RankTypes.Odd, function(v) 
            return MadLib.is_rank(card, v)
        end)
end

-- Ditto, but with Even ranks.
function MadLib.has_even_rank(card)
    return not SMODS.has_no_rank(card)
        and MadLib.list_matches_one(MadLib.RankTypes.Even, function(v) 
            return MadLib.is_rank(card, v)
        end)
end

-- Ditto, but with Fibonacci ranks.
function MadLib.has_fib_rank(card)
    return not SMODS.has_no_rank(card)
        and MadLib.list_matches_one(MadLib.RankTypes.Fibonacci, function(v) 
            return MadLib.is_rank(card, v)
        end)
end

-- Ditto, but with Base ranks.
function MadLib.is_base_rank(card)
    return not SMODS.has_no_rank(card)
        and MadLib.list_matches_one(MadLib.RankTypes.Base, function(v)
            return card.base.value == v
        end)
end

function MadLib.joker_check_rank(card, joker, default)
    return MadLib.is_rank(card, joker.ability.rank or (joker.ability.extra and joker.ability.extra.rank) or default)
end

MadLib.CardUIs = {
    Ranks   = {

    },
    Suits   = {

    },
    Jokers = {

    },
    Misc    = {
        
    }
}
-- Adds UI for special ranks!
function MadLib.set_playing_card_ui(card, specific_vars, desc_nodes)
    if not card then return end
    MadLib.loop_table(MadLib.PlayingCardUIs.Ranks, function(k,v)
        if SMODS.Ranks[k] and card:get_id() == SMODS.Ranks[k].id then
            localize{ type = 'other', key = 'rgmc_info_'..v, nodes = desc_nodes }
        end
    end)
    --[[
    MadLib.loop_table(MadLib.CardUIs.Misc, function(k,v)
        if v.func(card) then
            localize(v.get_localization(specific_vars, desc_nodes))
        end
    end)
    ]]
end

function MadLib.set_joker_ui(card, info_queue, specific_vars, desc_nodes)
    return info_queue, specific_vars, desc_nodes
end

function MadLib.get_rank_locvar(card, rank)
    return localize(Madcap.Funcs.get_joker_rank(card, rank), 'ranks')
end

function MadLib.check_X_same(num, hand, ret, or_more)
    return or_more and (#ret >= num) or (#ret == num)
end

function get_X_same(num, hand, or_more)
    local ret = {}
    local four_fingers = num
    local ranks = {}
    for i, v in pairs(SMODS.Rank.obj_buffer) do
        ranks[#ranks + 1] = v
    end
    if #hand < four_fingers then 
        return ret 
    else
        for j = 1, #ranks do
            local t = {}
            local rank = ranks[j]
            local x_count = 0
            for i=1, #hand do
                if MadLib.is_rank(hand[i], rank) then x_count = x_count + 1;  t[#t+1] = hand[i] end 
            end
            if MadLib.check_X_same(num, hand, t, or_more) then
                table.insert(ret, t)
            end
        end
        return ret
    end
    return {}
end

function MadLib.get_two_pair(parts, hand)
    local pass = (#parts._2 > 1)
    return pass and parts._all_pairs or {}
end

function MadLib.get_full_house(parts, hand)
    local pass = (#parts._3 > 0 and #parts._2 > 1)
    return pass and parts._all_pairs or {}
end

SMODS.PokerHand:take_ownership('Two Pair', {
    evaluate = function(parts, hand)
        return MadLib.get_two_pair(parts, hand)
    end
}, true)

SMODS.PokerHand:take_ownership('Full House', {
    evaluate = function(parts, hand)
        return MadLib.get_full_house(parts, hand)
    end
}, true)

function MadLib.get_random_rank_from_cards(cards, equal_chance)
    local rank_map = {}

    MadLib.loop_func(cards, function(v)
        local r = v.base.value
        if equal_chance then
            rank_map[r] = 1
        else
            rank_map[r] = (rank_map[r] or 0) + 1
        end
    end)

    local total_weight = 0
    for _, w in pairs(rank_map) do
        total_weight = total_weight + w
    end

    local rand = math.random(total_weight)

    for rank, weight in pairs(rank_map) do
        rand = rand - weight
        if rand <= 0 then
            return rank
        end
    end
end

function MadLib.get_random_suit_from_cards(cards, equal_chance)
    local rank_map = {}

    MadLib.loop_func(cards, function(v)
        local r = v.base.suit
        if equal_chance then
            rank_map[r] = 1
        else
            rank_map[r] = (rank_map[r] or 0) + 1
        end
    end)

    local total_weight = 0
    for _, w in pairs(rank_map) do
        total_weight = total_weight + w
    end

    local rand = math.random(total_weight)

    for rank, weight in pairs(rank_map) do
        rand = rand - weight
        if rand <= 0 then
            return rank
        end
    end
end

function MadLib.card_is_highlighted(card)
    return card.highlighted
end

function MadLib.get_highlighted_cards(area, ignore)
    if not area and area.cards then return {} end
    return MadLib.get_list_matches(area.cards, function(v)
        return v ~= ignore and MadLib.card_is_highlighted(v)
    end)
end

function MadLib.is_joker(card, key, exclude_debuffed)
    return type(card) == 'table' and card.config.center.key == key and not (exclude_debuffed and card.debuff)
end
