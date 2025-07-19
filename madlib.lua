-- The beautiful mod icon.
SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = 34,
    py = 34
})

MadLib = {
    ActiveAreas 	= { -- References CardAreas that appear on screen. Do not remove these values!
        G['jokers'], G['hand'], G['play'],
    },
    BanLists = {
        SuperBlinds         = {},   -- blinds stronger than finisher blinds
        OverpoweredBlinds   = {},   -- blinds with crazy powers (e.g. orb, joke)
    },
    CustomSuits = {},   -- Handles custom suits shenanigans
    EnhancementLists = {
        Rankless    = {},   -- has no rank (e.g. stone)
        Suitless    = {},   -- has no suit
        Chips       = {},   -- gives chips
        Mult        = {},   -- gives mult
        Money       = {},   -- gives money
        Scoring     = {},   -- active when scoring
        Held        = {},   -- active when held in hand (e.g. steel)
    },
    --[[
        Joker Lists are used to accurately categorize Jokers based on their
        mechanics (chips/mult), retriggers, and so forth.

        Why use this instead of checking configs values? Values might have
        non-standard names or not accurately depict how the card functions.
        For example, a modder might use "chip_mod" for scaling, or for
        multiplying the final given chips.

        One example of this list's usage is with the booster "Red Pill, Blue Pill"
        which specifically provides Chip and Mult Jokers.
    ]]
    JokerLists = {
        Chips = { -- does chips, NOT mult
            Add         = {},       -- +Mult
            Multiply    = {},  -- XMult
            Exponent    = {},  -- ^Mult
            Tetrate     = {},  -- ^^Mult (mental illness)
            Pentate     = {},  -- ^^^Mult
            Set         = {},  -- =Mult
        },
        Mult = { -- does mult, NOT chips
            Add = {},
            Multiply    = {},
            Exponent    = {},
            Tetrate     = {},  -- ^^Mult (mental illness)
            Pentate     = {},  -- ^^^Mult
            Set         = {},  -- =Mult
        },
        Money = {
            Add         = {},
            Multiply    = {}, -- rarely appears, but who cares
        },
        Retrigger = { -- retriggers cards
            Joker       = {},
            Card        = {},
        },
        Generative = { -- creates cards
            Joker       = {},
            Card        = {},
            Consumable  = {},
        },
        Destructive = { -- destroys cards
            Joker       = {},
            Card        = {},
            Consumable  = {},
        },
        Scaling = { -- has at least one value that scales
            Chips       = {},
            Mult        = {},
            Money       = {},
            Score       = {},
            Misc        = {},
        },
        Probability     = {}, -- has at least one probability (1 in ?)
        Stats = {
            PlayHands       = {}, -- e.g. burglar
            PlayDiscards    = {}, -- e.g. merry andy
            HandSize        = {}, -- e.g. turtle bean
            Probability     = {}, -- e.g. oops all 6s
            JokerSlots      = {},
        },
        Effect = { -- misc effect that doesn't involve generation/destruction
            Joker       = {},
            Card        = {},
            Consumable  = {},
            Game        = {} -- for everything else!
        },
        Score = { -- Used mainly for Madcap/Astronomica
            Add         = {},
            Multiply    = {},
            Exponent    = {},
        },
        HandType = { -- involves a specific hand type. check compat/madcap.lua to see how to add custom hand types
            ['High Card']       = {},
            ['Pair']            = {},
            ['Two Pair']        = {},
            ['Three of a Kind'] = {},
            ['Straight']        = {},
            ['Flush']           = {},
            ['Full House']      = {},
            ['Four of a Kind']  = {},
            ['Straight Flush']  = {},
            ['Five of a Kind']  = {},
            ['Flush House']     = {},
            ['Flush Five']      = {},

        },
        Sell        = {},      -- activates primary effect on sale
        Food        = {},      -- jokers classified as "food" (list)
        Vanilla     = {},   -- part of the original ~150 jokers
        Rank        = {},   -- involves specific rank(s)
        Suit        = {},   -- involves specific suit(s)
        RankType = {
            Face    = {},   -- explicitly involves face cards (jack, queen, etc.)
            Number  = {},   -- ditto, but with numbered ranks
            Random  = {},   -- randomly takes ranks
        },
        SuitType = {
            Light   = {},   -- explicitly involves light suits as a group
            Dark    = {},   -- ditto, but with dark suits
            Random  = {},   -- randomly takes suits
        },
        Cavendish   = {}, -- works like cavendish (doesn't appear normally)
    },
    JokerTables = {
        Descaling = { -- Contains Jokers with descaling values
            ['ice_cream']   = { 'chips '},
            ['turtle_bean'] = { 'h_size' }, -- hand size
            ['popcorn']     = { 'mult ' },
            ['ramen']       = { 'Xmult' },
            ['seltzer']     = { 'extra' }, -- retriggers
        },
    },
    PointValues = { -- Used to determine which characteristics (besides suit and rank!) are best
        Enhancements    = {},
        Editions        = {},
    },
    QuantumRanks = {},
    -- rank ids
    RankIds = {},
    -- Contains info about minor characteristics of ranks.
    RankTypes = {
        Base        = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', "Ace" }, -- the base cards
        Irregular   = {}, -- do not have a regular number (e.g. infinity, sum, X)
        Face        = {} -- usually marked as "face cards"
    },
    -- Contains detailed information about rarities - used for cross-modding stuff
    RarityValues = {},
    RarityConversions = { -- Vanilla rarity values, cause sometimes they use numbers?
        ['Common']      = '1',
        ['Uncommon']    = '2',
        ['Rare']        = '3',
        ['Legendary']   = '4'
    },
    ScoreKeys = {
        AddMult = {
            key = 'a_mult',
            add = 'mult_mod',
            set = 'mult',
            colour = G.C.MULT,
            sign = "+",
        },
        AddChips = {
            key = 'a_chips',
            add = 'chip_mod',
            set = 'chips',
            colour = G.C.CHIPS,
            sign = "+",
        },
        MultiMult = {
            key = 'a_xmult',
            add = 'Xmult_mod',
            set = 'x_mult',
            colour = G.C.MULT,
            sign = "X",
        },
        MultiChips = {
            key = 'a_xchips',
            add = 'Xchip_mod',
            set = 'x_chips',
            colour = G.C.CHIPS,
            sign = "X",
        },
        ExpMult = {
            key = 'a_powmult',
            add = 'emult_mod',
            set = 'e_mult',
            colour = G.C.MULT,
            sign = "^",
        },
        ExpChips = {
            key = 'e_powchips',
            add = 'echips_mod',
            set = 'e_chips',
            colour = G.C.CHIPS,
            sign = "^",
        },
        AddMoney = {
            key = 'a_money',
            add = 'money_mod',
            set = 'money',
            colour = G.C.MONEY,
            sign = "+$",
        },
        AddScore = {
            key = 'a_score',
            add = 'score_mod',
            set = 'score',
            colour = G.C.PURPLE,
            sign = "+",
        },
        MultiScore = {
            key = 'a_xscore',
            add = 'Xscore_mod',
            set = 'x_score',
            colour = G.C.PURPLE,
            sign = "X",
        },
        ExpScore = {
            key = 'a_powscore',
            add = 'escore_mod',
            set = 'e_score',
            colour = G.C.PURPLE,
            sign = "^",
        },
        AddPow = {
            key = 'a_power',
            add = 'pow_mod',
            set = 'pow',
            colour = G.C.GREEN,
            sign = "+^",
        },
    },
    ScoreKeySets = { -- Translates
        ['mult' ]       = 'AddMult',
        ['chips']       = 'AddChips',
        ['x_mult']      = 'MultiMult',
        ['x_chips']     = 'MultiChips',
        ['e_mult']      = 'ExpMult',
        ['e_chips']     = 'ExpChips',
    },
    -- Madcap includes cards that convert suits into their "counterparts". If there
    -- are more than two counterparts, randomize!
    SuitConversions = {
        LightAndDark    = {},   -- light/dark suits usually have counterparts
        BaseAndModded   = {}    -- some modded suits have base equivalents?
    },
    StickerLists = {
        Vanilla     = {},
        Bad         = {}, -- bad effects
        Good        = {}, -- good effects
        Destructive = {}, -- sticker destroys host card or other cards
    },
    -- Contains info about minor characteristics of suits
    SuitTypes = {
        Base    = { 'Hearts', 'Diamonds', 'Spades', 'Clubs' }, -- do NOT change this!
        Light   = {},
        Dark    = {},
        Custom  = {},
        Special = {},
    },
    SpectrumId = nil,   -- Which Spectrum id does
    Weights = {},
}
MLIB = MadLib -- shorter ref

--[[Add Score-based stats to SMODS (WIP!)
for _, v in ipairs({'x_score', 'e_score', 'ee_score', 'eee_score', 'hyper_score', 'Xscore_mod', 'Escore_mod', 'EEscore_mod', 'EEEscore_mod', 'hyperscore_mod'}) do
    table.insert(SMODS.calculation_keys, v)
end]]

local scie = SMODS.calculate_individual_effect

-- Initalized for further editing by other mods.
function mod_total_score(_score)
    print("mod score timee!!")
    return _score
end

function MadLib.ease_score(new_score)
    MadLib.event({
        trigger = 'ease',
        blocking = false,
        ref_table = G.GAME,
        ref_value = 'chips',
        ease_to = new_score,
        delay =  0.5,
        func = (function(t) return math.floor(t) end)
    })
end

function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local ret = scie(effect, scored_card, key, amount, from_edition)

    if (key == 'x_score' or key == 'xscore' or key == 'Xscore_mod') and amount ~= 1 then
        if effect.card then juice_card(effect.card) end
        total_chip_score = mod_total_score(total_chip_score * amount)
        MadLib.ease_score(total_chip_score)
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "X"..amount, colour =  G.C.EDITION, edition = true})
            elseif key ~= 'Xscore_mod' then
                if effect.xscore_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.xscore_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'x_score', amount, percent)
                end
            end
        end
        return true
    end

    if (key == 'e_score' or key == 'escore' or key == 'Escore_mod') and amount ~= 1 then
        if effect.card then juice_card(effect.card) end
        total_chip_score = mod_total_score(total_chip_score ^ amount)
        MadLib.ease_score(total_chip_score)
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^"..amount, colour =  G.C.EDITION, edition = true})
            elseif key ~= 'Escore_mod' then
                if effect.escore_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.escore_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'e_score', amount, percent)
                end
            end
        end
        return true
    end

    if (key == 'ee_score' or key == 'eescore' or key == 'EEscore_mod') and amount ~= 1 then
        if effect.card then juice_card(effect.card) end
        total_chip_score = mod_total_score(total_chip_score:arrow(2, amount))
        MadLib.ease_score(total_chip_score)
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^"..amount, colour =  G.C.EDITION, edition = true})
            elseif key ~= 'EEscore_mod' then
                if effect.eechip_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eescore_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'ee_score', amount, percent)
                end
            end
        end
        return true
    end

    if (key == 'eee_score' or key == 'eeescore' or key == 'EEEscore_mod') and amount ~= 1 then
        if effect.card then juice_card(effect.card) end
        total_chip_score = mod_total_score(total_chip_score:arrow(3, amount))
        MadLib.ease_score(total_chip_score)
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = "^^^"..amount, colour =  G.C.EDITION, edition = true})
            elseif key ~= 'EEEscore_mod' then
                if effect.eeescore_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.eeescore_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'eee_chips', amount, percent)
                end
            end
        end
        return true
    end

    if (key == 'hyper_score' or key == 'hyperscore' or key == 'hyperscore_mod') and type(amount) == 'table' then
        if effect.card then juice_card(effect.card) end
        total_chip_score = mod_total_score(total_chip_score:arrow(amount[1], amount[2]))
        MadLib.ease_score(total_chip_score)
        if not effect.remove_default_message then
            if from_edition then
                card_eval_status_text(scored_card, 'jokers', nil, percent, nil, {message = (amount[1] > 5 and ('{' .. amount[1] .. '}') or string.rep('^', amount[1])) .. amount[2], colour =  G.C.EDITION, edition = true})
            elseif key ~= 'hyperscore_mod' then
                if effect.hyperscore_message then
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'extra', nil, percent, nil, effect.hyperscore_message)
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus, 'hyper_score', amount, percent)
                end
            end
        end
        return true
    end

    return ret
end

-- Returns a number between the value and its specified minimums and maximums
function MadLib.clamp(val,min,max)
    return math.min(math.max(min, val), max)
end

-- Exclusive OR - one, but NOT both.
function MadLib.xor(a,b)
    return (a and not b) or (not a and b)
end

-- Quick way to ensure the table will actually work as intended.
-- Otherwise, it could crash the game!
local function not_proper_table(table)
    return not table or type(table) ~= 'table'
end

-- Same as above, but for functions (or funcs for short).
local function not_proper_func(func)
    return not func or type(func) ~= 'function'
end

local function not_proper_number(n)
    return not n or type(n) ~= 'number'
end

-- Rounds to 

--[[function MadLib.round(number, digit_position)
    local precision = (10 ^ (digit_position or 0))
    number = number + (precision / 2)
    return math.floor(number / precision) * precision
end]]



function MadLib.round(value, decimals)
    local factor = 10 ^ (math.floor(decimals or 2))
    return math.floor(value * factor + 0.5) / factor
end

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

function MadLib.get_random_id(_num)
	local res = ""
	for i = 1, _num do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function MadLib.pair_cards(v1,v2,length,remove)
    local _string = MadLib.get_random_id(length or 5)
    v1.config.extra = v1.config.extra or {}
    v2.config.extra = v2.config.extra or {}
    v1.config.extra.rand_id = not remove and _string or nil
    v2.config.extra.rand_id = not remove and _string or nil
    return _string
end

function MadLib.compare_ids(v1,v2)
    local id1 = v1.config.extra and v1.config.extra.rand_id
    local id2 = v2.config.extra and v2.config.extra.rand_id
    print(id1)
    print(id2)
    return id1 ~= nil and id1 == id2
end

--[[
    FOR LOOP FUNCTIONS
    Just a fancy way of doing for-loops in one line!

    - [loop] is the list/table you want to check. Must be a table!!!
    - [func] is the function you wish to pass the key/value pair or the list entry through.
        Lists have one argument, whereas tables have two arguments (k for key, v for value).
        Must be a FUNCTION which returns a TRUE or FALSE value.
    - [bypass_check] is used when a previous function has ensured
        all required values are their proper types.
    - Returns -1 if the check fails, or the number of times "func"
        returned a TRUE value.
]]

-- Loops through the list.
-- Returns the number of times the function returns TRUE.
function MadLib.loop_func_list(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end -- prevent crash!
    local passes = 0
    for i=1, #loop do passes = passes + (func(loop[i],i) and 1 or 0) end
    return passes
end
MadLib.loop_func = MadLib.loop_func_list -- alias

-- Ditto, but designed for tables with key-value pairs.
function MadLib.loop_func_table(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end
    local passes = 0
    for k,v in pairs(loop) do passes = passes + (func(k,v) and 1 or 0) end
    return passes
end
MadLib.loop_table = MadLib.loop_func_table -- alias

function MadLib.loop_func_grid(loop_y, loop_x, func, bypass_check)
    if 
        not bypass_check
        and (not_proper_table(loop_y)
        or not_proper_table(loop_x)
        or not_proper_func(func)) 
    then 
        return -1 
    end -- prevent crash!
    local passes = 0
    for i=1, #loop_y do
        for j=1, #loop_x do
            passes = passes + (func(loop_y[i],loop_x[j],i,j) and 1 or 0) 
        end
    end
    return passes
end
MadLib.loop_grid = MadLib.loop_func_grid -- alias

-- Returns the item (if not nil)
function MadLib.get_loop_func(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return {} end -- prevent crash!
    local nl = {}
    for i=1, #loop do
        local item = func(loop[i],i)
        if item ~= nil then nl[#nl+1] = loop[i] end
    end
    return nl
end

-- Ditto, but doesn't require a list - just a number.
function MadLib.get_loop_func_number(n, func, bypass_check)
    if not bypass_check and (type(n) ~= 'number' or not_proper_func(func)) then return {} end -- prevent crash!
    local nl = {}
    for i=1, n do
        local item = func(loop[i],i)
        if item ~= nil then nl[#nl+1] = item end
    end
    return nl
end

-- Takes a list, loops through multiple functions.
function MadLib.loop_func_list_multi(loop, funcs, bypass_check, simultaneous)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end
    local passes = 0
    if simultaneous then -- pick an entry, loop through funcs
        for i=1, #loop do
            for j=1, #funcs do passes = passes + (funcs[j](loop[i]) and 1 or 0) end
        end
    else -- pick a func, loop through list
        for i=1, #func_list do
            for j=1, #loop do passes = passes + (funcs[i](loop[j]) and 1 or 0) end
        end
    end
    return true
end

function MadLib.loop_func_limited(loop_list,func,pts)
    if type(loop_list) ~= 'table' or type(func) ~= 'function' then return false end
    while i < #loop_list and n < pts do
        i = i+1
        if func(loop_list[i]) then n = n + 1 end
    end
    return n >= pts
end
MadLib.loop_func_lists = MadLib.loop_func_list_multi -- alias

-- loop func time
function MadLib.loop_check_func_limited(loop_list,check,func,pts)
    if type(loop_list) ~= 'table' or type(check) ~= 'function' or type(func) ~= 'function' then return false end
    local i,n = 0,0
    while i < #loop_list and n < pts do
        i = i+1
        if check(loop_list[i]) then
            n = n + 1
            func(loop_list[i])
        end
    end
    return n >= pts
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


--[[
    HEX COLOR STUFF
]]

-- converts hex code (e.g. #446688) to rgb value
local function hex_to_rgb(hex)
    hex = hex:gsub("#","")
    return tonumber(hex:sub(1,2),16),
           tonumber(hex:sub(3,4),16),
           tonumber(hex:sub(5,6),16)
end

-- converts rgb values to a hex cod
local function rgb_to_hex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

-- uses previous two functions to mix two colours
function MadLib.mix_hex_colors(hex1, hex2, t)
    local r1, g1, b1 = hex_to_rgb(hex1)
    local r2, g2, b2 = hex_to_rgb(hex2)
    local mix = function(a, b) return math.floor(a + (b - a) * t + 0.5) end
    return rgb_to_hex(mix(r1, r2), mix(g1, g2), mix(b1, b2))
end

-- Gets a color based on whether the
function MadLib.get_warning_colour(p)
    local percent = MadLib.clamp(p,0,1)
    return percent < 0.5
        and G.C.RED -- MadLib.mix_hex_colors(G.C.RED, G.C.GOLD, percent / 0.5)
    or percent < 1.0
        and G.C.GOLD -- MadLib.mix_hex_colors(G.C.GOLD, G.C.GREEN, (percent - 0.5) / 0.5)
    or G.C.GREEN
end


--[[
    DEEP COPY FUNCTIONS
]]

-- Returns a copy that does not reference the original - used in case you want to
-- change some values without affecting the original!
-- Credit to Cryptid.
function MadLib.deep_copy(obj, seen)
	if type(obj) ~= "table" then return obj end
	if seen and seen[obj] then return seen[obj] end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do res[MadLib.deep_copy(k, s)] = MadLib.deep_copy(v, s) end
	return res
end

-- Same as above, but copies a list (or a table without defined keys!)
function MadLib.deep_copy_list(list)
    local copy = {}
    for i = 1, #list do copy[i] = list[i] end
    return copy
end

-- From Cryptid - safely gets a variable in a nested list
function MadLib.safe_get(t, ...)
	local current = t
	for _, k in ipairs({ ... }) do
		if not current or current[k] == nil then return false end
		current = current[k]
	end
	return current
end

-- Returns a copy of the provided list sorted based on the provided function.
function MadLib.get_sorted_list(list,func)
    local sorted_table = MadLib.deep_copy_list(list)
    table.sort(sorted_table, func(a, b))
    return list
end

--[[
    MERGING FUNCTIONS
    - Merges the [secondary] table INTO the [primary] table.
    - If the key exists in the primary table, then replace
        the pre-existing content unless [no_replace] is TRUE,
    - [bypass_check] is used when a previous function has ensured
        all required values are their proper types.

    Returns whether the merge was a success.
]]

-- Merges the second table into the first

-- merge_into_table -> merge_tables

function MadLib.merge_tables(primary, secondary, no_replace, bypass_check)
    if not bypass_check and (not_proper_table(primary) or not_proper_table(secondary)) then return false end
    for k, v in pairs(secondary) do
        primary[k] = no_replace and (primary[k] or v) or v
    end
    return true
end

-- Ditto, but doesn't do keys - just values.
-- merge into_list
function MadLib.merge_lists(primary, secondary, allow_dupes, bypass_check)
    if not bypass_check and (not_proper_table(primary) or not_proper_table(secondary)) then return false end
    for i=1, #secondary do
        local pass = true
        -- if no dupes are allowed...
        if not allow_dupes then
            -- make sure it isn't already in the list
            for j=1, #primary do
                if secondary[i] == primary[j] then
                    pass = false
                    break
                end
            end
        end
        if pass then table.insert(primary, secondary[i]) end
    end
    return true
end

function MadLib.transfer_to_new_table(t1,t2)
    for k,v in pairs(t1) do
        if t2[k] == nil then -- new table
            t2[k] = v
        else
            for _, v2 in pairs(v) do -- add to pre-existing table
                table.insert(t2[k], v2)
            end
        end
    end
end

-- Makes a combined list made up of multiple lists.
function MadLib.get_combined_list(...)
    local args = {...}
    if not args or #args < 2 then return {} end -- can't combine

    for _, t in pairs(args) do
        if not_proper_table(t) then return {} end
    end

    local merged = {}
    for _, t in pairs(args) do table.insert(merged,t) end -- commence the merge

    return merged
end

--[[
    Handles Spectrum, Bunco, and Paperback stuff
]]
local Bunco     = next(SMODS.find_mod('Bunco'))
local Paperback = next(SMODS.find_mod('Paperback'))
local RGMadcap  = next(SMODS.find_mod('RGMadcap'))
local Framework = next(SMODS.find_mod('SpectrumFramework'))

MadLib.SpectrumId = (Bunco and 'bunc_')
    or (Paperback and 'paprback_')
    or (Framework and 'spectrum_') -- would really reccomend at least installing this
    or nil

--[[
    suit
]]

-- Get the light/dark counterpart of the suit.
function MadLib.suit_get_counterpart_lightdark(suit)
    local conv = MadLib.SuitConversions.LightAndDark[suit]
    return conv
        and (type(conv) ~= table and conv or pseudorandom_element(conv,pseudoseed('madlib_counterpart')))
        or nil
end

-- Get the modded/base counterpart of the suit.
function MadLib.suit_get_counterpart_basemodded(suit)
    local conv = MadLib.SuitConversions.BaseAndModded[suit]
    return conv
        and (type(conv) ~= table and conv or pseudorandom_element(conv,pseudoseed('madlib_counterpart')))
        or nil
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

function MadLib.explode(sep, str)
	sep = tostring(sep)
	if not sep or sep == '' then return nil end
	local ret, pos = {}, 1
	for i = 1, string.len(str) do
		local _p1, _p2 = string.find(str, sep, pos, false)
		if not _p1 then break end
		ret[i] = string.sub(str, pos, _p1 - 1)
		pos = _p2 + 1
	end
	table.insert(ret,string.sub(str, pos))
	return ret
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

--Increases the card's rank to the next value X times
function Card:get_increment(amt,override)
	local rank_data = SMODS.Ranks[override or self.base.value]
	local behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false }
	local _rank = (override or self.base.value)

	if behavior.ignore or not next(rank_data.next) then return nil end

    -- loop if needed
    for i = 1,(amt or 1) do
        if behavior.random then
            _rank = pseudorandom_element(rank_data.next, pseudoseed('jl_incrementrank'))
        else
            local ii = (behavior.fixed and rank_data.next[behavior.fixed]) and behavior.fixed or 1
            _rank = rank_data.next[ii]
        end

        rank_data = SMODS.Ranks[_rank]
        behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false }
	end
	return _rank
end

--Decreases the card's rank to the previous value X times
function Card:get_decrement(amt,override)
	local rank_data = SMODS.Ranks[override or self.base.value]
	local behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false }
	local _rank = (override or self.base.value)
	if behavior.ignore then return nil end

    for i = 1,(amt or 1) do
        if behavior.random then
            _rank = pseudorandom_element(rank_data.next, pseudoseed('jl_decrementrank'))
        else
            for k, v in pairs(SMODS.Ranks) do
                if next(v.next) then
                    _rank = k
                    break
                end
            end
            if tostring(_rank) == nil then return nil end

            rank_data = SMODS.Ranks[_rank]
            behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false }
        end
	end
	return _rank
end

--[[
    ATLAS FUNCTIONS
    Used for easily creating atlases.
]]

-- Creates an atlas object
function MadLib.create_atlas(_k, _p, _x, _y)
    return { object_type = 'Atlas', key = _k, path = _p, px = (_x or 71), py = (_y or 95) }
end

-- Creates an animated atlas object.
function MadLib.create_anim_atlas(key, path, frms, px, py)
    local atlas = MadLib.create_atlas(key, path, px, py)
    atlas['frames'] = frms or 21
    return atlas
end

-- Creates an atlas with identical height and width.
-- DEPRECATED!
function MadLib.create_square_atlas(key, path, size)
    return MadLib.create_atlas(key, path, size, size)
end

-- Creates an atlas for a Blind icon.
function MadLib.create_blind_atlas(_k, _p, _f)
    local atlas = MadLib.create_atlas(_k, _p, 34, 34)
    atlas['frames'] = _f or 21
    atlas['atlas_table'] = 'ANIMATION_ATLAS'
    return atlas
end

-- Gets the coords of an atlas using the atlas's width.
function MadLib.get_coords(index,width)
    if type(index) == 'table' or type(width) == 'table' then
        print("might wanna check")
        print(index)
        print(width)
        return { y = 0, x = 0 }
    end
    return { y = math.floor(index / (width or 1)), x = (index % (width or 1)) }
end
MadLib.coords = MadLib.get_coords -- alias

--[[
    KEY PATH
]]
-- Returns a table with a key and a path
function MadLib.key_path(_k, _p)
    return { key = _k, path = _p }
end

-- Key and path are same, e is extension (e.g. ogg)
function MadLib.keypath_simple(k,e)
    local path = k..'.'..e
    return MadLib.key_path(k, path)
end

-- Key and path are same, e is extension (e.g. ogg)
function MadLib.keypath_simple_loop(k,e,n)
    local path, list = k..'.'..e, {}
    return { list = MadLib.get_loop_func_number(n, function(v,i)
        return MadLib.key_path(k, path .. tostring(i))
    end)}
end

--[[
    EVENT FUNCTIONS
    Used for "decluttering" the general event managing stuff.
]]

-- Easier way of making a custom event.
-- Done to death, but eh.
function MadLib.event(contents)
    G.E_MANAGER:add_event(Event(contents))
end

-- Ditto, but only focuses on trigger, delay, and function.
-- Requires a function to operate.
function MadLib.simple_event(_f, _d, _t, _b)
    if not_proper_func(f) then return false end
    MadLib.event({
        trigger     = _t or "immediate",
        delay       = _d or 0.08,
        func        = _f,
        blockable   = _b or false
    })
    return true
end

-- Does a simple little sound
function MadLib.sound_event(_sound, _delay, _trigger, _percent, _volume)
    MadLib.event({
		func = function()
			play_sound(_sound, _percent or 1, _volume or 0.5)
			return true
		end,
        delay = _delay or 0.00,
        trigger = _trigger or 'after'
	})
end

-- Does a simple little juice - can do a silly sound too!
function MadLib.simple_juice(card, _sound, _scale, _rotate, _percent, _volume)
    MadLib.event({
        func = function()
            card:juice_up(_scale or 0.5, _rotate or 0.7)
            play_sound((_sound or 'tarot2'), _percent or 0.75, _volume or 0.5)
            return true
        end
    })
end

-- Event for setting a seal.
function MadLib.seal_event(card, seal, snd)
    MadLib.event({
        func = function()
            card:set_seal(seal, true, true)
            card:juice_up(0.5, 0.7)
            play_sound((snd or 'tarot2'), 0.76, 0.4)
            return true
        end
    })
end

--[[
    VAR COLLECTION functions.
]]

-- Easier way of doing the vars thing
function MadLib.collect_vars(...)
    local args = {...}
    return { vars = args }
end

function MadLib.add_to_queue(...)
    local args = {...}
    if not args or #args < 2 then return false end
    for i=2, #args do info_queue[#info_queue + 1] = args[i] end
    return true
end

function MadLib.collect_vars_colours(...)
    local args = {...}
    local v,c = MadLib.list_pick_range(args, 1, #args-1), args[#args]
    v.colours = c
    return { vars = v }
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

--[[
    NUMBER CODES
    Used primarily for quick detection of rank groupings (e.g. is 2 a fib number),
    but can be used for any number stuff.
]]
local function not_real_number(n)
    return type(n) ~= "number" or n < 0
end

-- Returns whether the number is a perfect square
function MadLib.is_perfect_square(n)
    if not_real_number(n) then return false end
    local root = math.floor(math.sqrt(n))
    return root * root == n
end

function MadLib.is_triangular(n)
    if not_real_number(n) then return false end
    local root = math.sqrt(8 * n + 1)
    return n > 0 and root == math.floor(root)
end

function MadLib.is_pentagonal(n)
    if not_real_number(n) then return false end
    return n * (3 * n - 1) / 2
end

-- Returns whether the number is a Fibonacci number
function MadLib.is_fibonacci(n)
    if not_real_number(n) then return false end
    local fnts = (5 * n^2)
    return (type(n) ~= "number" or n < 0) and false
        or (MadLib.is_perfect_square(fnts+4) or MadLib.is_perfect_square(fnts-4))
end

-- Returns whether the number is a prime number
function MadLib.is_prime(n)
    if not_real_number(n) then return false end
    for i=2,n do
        if n % i == 0 then return false end
    end
    return true
end

-- Can't just say NOT prime
function MadLib.is_composite(n)
    if not_real_number(n) then return false end
    for i=2,n do
        if n % i == 0 then return true end
    end
    return false
end

--[[
    TABLE FUNCTIONS
]]

-- Finds an entry within a table - returns -1 if it doesn't exist in the table.
function MadLib.find_in_table(entry, table)
	for k, v in pairs(table) do
		if v == entry then return k end
	end
	return -1 -- cannot find :(
end

-- Reverses the table order. Credit to ThatOneGuyAli for code!
function MadLib.reverse_table(table)
	local reversed = {}
	for i = #table, 1, -1 do reversed[#reversed+1] = table[i] end
	return reversed
end

--[[
    LIST CHECKING

    - Loops through a list/table using value-key function to check for matches.
]]

-- Returns if there are ANY matches.
function MadLib.list_matches_one(list, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return false end -- prevent crash!
    for k,v in pairs(list) do
        if func(v,k) then return true end -- value/key
    end
    return false
end

-- Returns whether at least X of the values in the list
-- satisfy the function
function MadLib.list_matches_some(list, func, points, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return false end -- prevent crash!
    points = math.min((points or 2),#list) -- can only be as large as the list size
    local total = 0
    for _,v in pairs(list) do
        total = total + (func(v) and 1 or 0)
        if total == points then return true end
    end
    return false
end

-- Returns whether ALL the values in the list satisfy the function.
function MadLib.list_matches_all(list, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return false end -- prevent crash!
    for k,v in pairs(list) do
        if not func(v,k) then return false end
    end
    return true
end

-- Returns a list of matches.
function MadLib.get_list_matches(list,func)
    if not_proper_table(list) or (func ~= nil and not_proper_func(func)) then return nil end
    local matches = {}
    for k,v in pairs(list) do
        if (func(v,k) or true) then table.insert(matches,v) end
    end
    return matches
end

function MadLib.get_list_matches_limited(list,func,max)
    if not_proper_table(list) or (func ~= nil and not_proper_func(func)) then return nil end
    local matches, i = {}, 0
    for k,v in pairs(list) do
        if (func(v,k) or true) then
            table.insert(matches,v)
            i = i+1
        end
        if not (i < max) then return matches end
    end
    return matches
end

-- Returns the first list match (or nothing, if there are no matches).
function MadLib.get_first_list_match(list,func)
    if not_proper_table(list) or not_proper_func(func) then return nil end
    for k,v in pairs(list) do
        if func(v,k) then return v, k end
    end
    return nil
end

-- Sorts the list based on a sorting function (a, b) and return the first (highest) value.
function MadLib.get_highest_match(list, check_func, sort_func)
    local list = MadLib.get_list_matches(list, check_func)
    -- Sort by values in key-value table
    table.sort(list, sort_func)
    return list[1]
end

-- Gets a portion of the list (from [n1] to [n2])
-- Skips over [skip] cards.
function MadLib.list_pick_range(list,n1,n2,skip)
    local new_list = {}
    local min, max = math.max(1, n1), math.min(n2, #list)

    for i=min, max, (skip and math.min(skip,1) or 1) do
        new_list[#new_list+1] = list[i]
    end

    return new_list
end

-- Loops through the list until it finds the item, then returns its index
function MadLib.get_item_index(entry, list, bypass_check)
    if not bypass_check and (not entry or not_proper_table(list)) then return nil end
    for index = 1, #list do
        if list[index] == entry then return index end
    end
    return -1 -- The table passed, but the entry has no index.
end



-- DEPRECATED! Do not use!
function MadLib.get_values_from_key(list,check,func)
    if not_proper_table(list) or not_proper_func(check) then return false end
    for k, v in pairs(list) do
        if check(k) then
            return func and func(v) or v
        end
    end
    return nil
end

-- [Return BOOL] Does a random using a set of parameters.
-- Requires a card or "denom", but also takes custom numerator.
function MadLib.calculate_roll(params)
    if not params then return false end

    local card = params.card or nil

    local denom = params.denom or card and (card.ability.odds or card.ability.extra.odds or card.ability.immutable.odds) or 2
    local numer = (params.card and MadLib.base_prob(card)) or params.numer or 1
    local exp   = params.exp or 1

    --tell('Denom is ' .. tostring(denom))
    --tell('Card Denom is ' .. tostring(card and (card.ability.odds or card.ability.extra.odds or card.ability.immutable.odds)))

    local roll, ceiling = pseudorandom(pseudoseed(params.seed or 'rgmc')), (numer ^ exp) / denom
    local final

    if params.card then -- Uses a card
        if Cryptid then
            numer = params.numer or params.card.ability.cry_prob

            -- If no denominator is dictated, looks for card odds or drops a 1 in 2.
            ceiling = (numer ^ exp) / denom

            final = params.card.ability.cry_rigged or roll < ceiling
        else
            final = roll < ceiling
        end
    else
        final = roll < ceiling
    end
    --tell('Numerator is ' .. tostring(numer) .. ", Denominator is " .. tostring(denom) .. '.')
    --tell('Roll was ' .. tostring(roll) .. '.')
    --tell('Ceiling was ' .. tostring(ceiling) .. '.')
    tell(tostring(numer) .. ' in ' .. tostring(denom) .. ', ' ..
        tostring(roll) .. ' < ' .. tostring(ceiling) .. ' = ' .. tostring(final) .. '.')

    return final
end

-- [Return BOOL] Does a random based on card and seed (if provided!)
function MadLib.calculate_card_odds(c, s)
    local params = { card = card }
    if s then params.seed = s end
    return MadLib.calculate_roll(params)
end


--[[
    SCORE MANIPULATION
    Usually done after scoring cards and jokers, but can hypothetically be done
    beforehand?

    [times] is used for multiplying/exponentiating/etc. the score multiple times
    while only requiring one UI event - this saves time.
    TODO: add setting to toggle between One UI Event or Multiple (per mult/exp/etc.)

    Inspired by Astronomica.
]]

-- Multiplies the score.
function MadLib.do_x_score(mult,times)
    local amt = mult

    if times and times > 1 then
        for i = 2, times do  amt = amt * mult end
    end

        MadLib.simple_event(function()
            G.GAME.chips = to_big(G.GAME.chips) * to_big(amt)
            G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)
            play_sound('holo1')
            return true
        end, 0.4, 'after')

    return {
        message = "X" .. tostring(amt),
        colour = G.C.PURPLE
    }
end

-- Loops a value through a function X times, returns the new value
function MadLib.value_loop_func(val,times,func)
    local new_val = deep_copy(val)
    for i=1,times do val = func(val) end
    return new_val
end

-- Exponentiates(?) the score X times, then returns a message.
function MadLib.do_e_score(exp, times)
    local amt = to_big(exp)

    if times and times > 1 then
        for i = 2, times do amt = to_big(exp) ^ amt end
    end
        MadLib.simple_event(function()
            G.GAME.chips = to_big(G.GAME.chips) ^ to_big(amt)
            G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.7, 0.7)
            play_sound('talisman_emult')
            return true
        end, 0.4, 'after')

    return {
        message = "^" .. tostring(amt),
        colour = G.C.PURPLE
    }
end

-- Adapted from Entropy(?) code - flips a list of cards and modifies them
-- based on a provided func
function MadLib.flip_cards(card_list, func, before, after)
    local enable_animations = Talisman.config_file.disable_anims
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
                end, 0.1, "after")
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
                end, 0.1, "after")
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
                end, 0.1, "after")
            end
        end
    elseif after then
        for _, c in ipairs(card_list) do after(c) end
    end

    return true
end

function MadLib.flip_card(card, func, before, after)
    local enable_animations = Talisman.config_file.disable_anims

    -- Before
    if not enable_animations then
        MadLib.simple_event(function()
            if before then before(c) end
            if c.flip then c:flip() end
            return true
        end, 0.06, "after")
    elseif before then
        before(c)
    end

    -- Do the func
    if not enable_animations then
        MadLib.simple_event(function()
            if func then func(c) end
            return true
        end, 0.06, "after")
    else
        func(c)
    end

    -- After
    if not enable_animations then
        MadLib.simple_event(function()
            if c.flip then c:flip() end
            if after then after(c) end
            return true
        end, 0.06, "after")
    elseif after then
        after(c)
    end
end

-- Easy way of tetrating. Credit to More Fluff.
function MadLib.fake_tetrate(score,amt)
    return score ^ (score ^ amt - 1)
end

-- Checks whether the player's total chips meets or exceeds the blind's.
function MadLib.meets_blind_requirements()
    return G.GAME and (to_big(G.GAME.chips) - to_big(G.GAME.blind.chips)) <= to_big(0)
end

-- Is the current ante (or specified) a finisher blind ante?
function MadLib.is_finisher_ante(ante)
    return (ante or G.GAME.round_resets.ante) % G.GAME.win_ante == 0
end


-- [BOOL] Checks if a singular card has one of the ranks in the list
function MadLib.has_rank_in_list(card, list, true_values)
    return not true_values and MadLib.list_matches_one(list, function(v) return card:get_id() == v end)
        or MadLib.list_matches_one(list, function(v) return SMODS.Ranks[card.base.value].key == v end)
end

-- [BOOL] Ditto, but with suits
function MadLib.has_suit_in_list(card, list, true_values)
    return (not card or not_proper_table(list)) and false
        or not true_values and MadLib.list_matches_one(list, function(v) return card:is_suit(v) end)
        or MadLib.list_matches_one(list, function(v) return SMODS.Ranks[card.base.suit].key == v end)
end

-- [Return List] Returns a list of ranks that the card group has - uses TRUE ranks (unless specified otherwise)
function MadLib.get_ranks_from_cards(cards, fake_values)
    if not_proper_table(cards) then return nil end
    local rank_map = {}
    for _,v in pairs(cards) do
        local r = fake_values and v:get_id() or v.base.value
        rank_map[r] = (rank_map[r] or 0) + 1 end
    return rank_map
end

-- [Return List] Returns a list of suits that the card group has - uses TRUE suits
function MadLib.get_suits_from_cards(cards)
    if not_proper_table(list) then return nil end
    local suit_map = {}
    for _,v in pairs(cards) do
        suit_map[v.base.suit] = (suit_map[v.base.suit] or 0) + 1
    end
    return suit_map
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
    if Overflow then quaota = target.ability.immutable and target.ability.immutable.overflow_amount end

    target.getting_sliced = true

    MadLib.event({
        func = function()
            target:start_dissolve({ G.C.RED }, nil, 1.6)
            return true
        end,
    })
    target.dissolve = 0 --timing issues related to crossmod stuff
end

-- [Return Object] Gets the most played poker hand
function MadLib.get_most_played_hand()
	-- defaults to high card
	if not G.GAME or not G.GAME.current_round then return 'High Card' end
	local chosen_hand 	= 'High Card'
	local hand_name 	= chosen_hand
	local most_played, cur_order = -1, -1
	for k, v in pairs(G.GAME.hands) do
		if
			v.played > most_played
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

    for i=1,#list do
        if list[i] == obj then
            return i -- found it!
        end
    end
    return -1 -- cannot find it.
end

function MadLib.get_position_in_list_prefix(obj,list,prefix)
    if not (obj and list and prefix) then return -1 end -- uh oh!

    for i=1,#list do
        if prefix..'_'..list[i] == obj then
            return i -- found it!
        end
    end
    return -1 -- cannot find it.
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

-- Returns whether the card has an enhancement that
-- appears in the provided list
function MadLib.has_enhancement_in_list(card, list)
    return MadLib.list_matches_one(list, function(v)
        return SMODS.has_enhancement(card, v)
    end)
end

-- Gets a list of enhanced cards within the group.
-- If key is specified, returns specific cards of specific enhancement
-- If table is given, returns specific cards of all enhancements in table
function MadLib.get_enhanced_cards(group, key)
    return not (G.GAME and group ~= nil) and {}
        or MadLib.get_list_matches(group, function(card)
            return SMODS.has_enhancement(card, 'm_'..key)
        end)
end

function MadLib.get_unique_enhancements(group)
    if not (G.GAME and group ~= nil) then return 0 end
    local enhancements = {}
    MadLib.loop_func(group, function(v,i)
        local full_key = MadLib.safe_get(v.config,'center','key')
        if full_key then enhancements[full_key] = true end
    end)
    return #enhancements
end

-- Gets a list of cards that the player can possibly encounter
-- only using their "full discards" (e.g. 5 cards per discard, 3 discards = 15)
-- Specifically applies to G.deck
function MadLib.get_possible_deck(_cards)

    local max_discard_size  = G.GAME.starting_params.discard_limit  or 5
    local num_discards      = G.GAME.current_round.discards_left    or 3
    local deck_selection    = {}

    --print('Max Discard Size: ' ..  tostring(G.GAME.starting_params.discard_limit))
    --print('Discards Left: ' ..  tostring(G.GAME.current_round.discards_left))

    local i = 0
    while (#_cards - i) > (max_discard_size * num_discards) and i < #_cards do
        table.insert(deck_selection,_cards[#_cards - i])
        i = i+1
    end
    return deck_selection
end

--[[
    CARD FUNCTIONS
    Made for easy detection
]]

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


-- [Return Bool] Returns whether the card's identified rank
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
    return self.config.center.no_rank
        or MadLib.list_matches_one(MadLib.EnhancementLists.Rankless, function(v)
            return SMODS.has_enhancement(self,v)
        end)
end

-- Determines whether the card is suitless
function Card:is_suitless()
    return self.config.center.no_suit
        or MadLib.list_matches_one(MadLib.EnhancementLists.Suitless, function(v)
            return SMODS.has_enhancement(self,v)
        end)
end

function Card:has_dark_suit()
    return MadLib.list_matches_one(MadLib.SuitTypes.Dark, function(v,_)
        return self:is_suit(v)
    end)
end

function Card:has_light_suit()
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


-- Easy way to dupe the card
function Card:dupe(area)
	if (area or G.hand) then
		local new_card = copy_card(_card, nil, nil, self.playing_card)
		new_card:add_to_deck()
		table.insert(G.playing_cards, new_card)
		local a = area or G.hand
		a:emplace(new_card)
        return new_card
    else
		return nil
	end
end

-- Gets the configuration no matter what.
function Card:get_config()
	return (self.config or {}).center or {}
end

-- Checks where the odds are stores.
function Card:get_odds()
    return (type(self.config.extra) == 'table' and self.config.extra.odds)
        or (type(self.config.extra) == 'number' and self.config.extra)
        or nil
end

function Card:get_score_x_bonus()
    if self.debuff then return 0 end
    if self.ability.set == 'Joker' then return 0 end
    if (SMODS.multiplicative_stacking(self.ability.x_score or 1, self.ability.perma_x_score or 0) or 0) <= 1 then return 0 end
    return SMODS.multiplicative_stacking(self.ability.x_score or 1, self.ability.perma_x_score or 0)
end

function Card:get_score_e_bonus()
    if self.debuff then return 0 end
    if self.ability.set == 'Joker' then return 0 end
    if (self.ability.e_score or 0) <= 1 then return 0 end
    return self.ability.e_score
end

function Card:get_chip_ee_bonus()
    if self.debuff then return 0 end
    if self.ability.set == 'Joker' then return 0 end
    if (self.ability.ee_chips or 0) <= 1 then return 0 end
    return self.ability.ee_chips
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

--[[
    BLIND functions
]]

-- Used for Perilous and Boomerang tags - adds (or removes) chips to blind.
function Blind:add_chips(chadd,wiggle)
	G.GAME.blind.chips = G.GAME.blind.chips + chadd
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	if wiggle then G.GAME.blind:wiggle() end
	return true
end

function Blind:multiply_chips(chult,wiggle)
	G.GAME.blind.chips = G.GAME.blind.chips * chult
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	if wiggle then G.GAME.blind:wiggle() end
	return true
end

--[[
    STICKERS: Negative sticker stuff
    Used for cards like Madcap's Sticker Shock
]]

-- Checks whether the card has any negative sticker
-- Uses the BadSticker list from MadLib
function Card:has_negative_sticker()
    return MadLib.list_matches_one(MadLib.StickerLists.Bad, function(v)
        return self.ability[v]
    end)
end

-- Returns a list of all stickered cards.
function MadLib.get_stickered_cards(key)
    local func = key
        and function(c) return c:has_negative_sticker() end
        or function (c) return c.ability[key] end

    local stickered = {}
    for _,v in pairs(MadLib.ActiveAreas) do
        MadLib.merge_tables(all_stickered, MadLib.get_list_matches(v.cards, func))
    end

    return stickered
end

-- Returns a selection from a weighted table (MadLib.Weights[X]).
function MadLib.pick_from_weighted_table(table, whitelist, blacklist)
    if type(table) ~= "table" then return nil end

    local weighted = {}

    for k, v in pairs(table) do
        local valid = ((not whitelist) or MadLib.get_item_index(v,whitelist) ~= -1)
            and ((not blacklist) or MadLib.get_item_index(v,whitelist) == -1)
            and type(v) == "number" and v > 0
        -- Handle whitelist vs blacklist logic
        if valid  then  table.insert(weighted, {key = k, value = math.random() * v}) end
    end

    -- Sort by values in key-value table
    table.sort(weighted, function(a, b)
        return a.value > b.value
    end)

    if #weighted == 0 then return nil end
    return weighted[1].key
end

-- Simple function for picking weighted edition
function MadLib.get_weighted_edition(whitelist,blacklist)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Editions,whitelist,blacklist)
end

-- Ditto, but for enhancements
function MadLib.get_weighted_enhancement(selection,whitelist,override)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Enhancements,selection,whitelist)
end

-- Ditto, but for boosters
function MadLib.get_weighted_booster(selection,whitelist)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Boosters,selection,whitelist)
end

--[[
    RARITY VALUES

]]

-- Takes a rarity id. If it's in MadLib's rarity index, return that value.
-- Otherwise, return -1.
function MadLib.get_rarity_value(val)
	return MadLib.RarityValues[val] and MadLib.RarityValues[val].value or -1
end

-- returns a table from a string
function MadLib.get_higher_rarity(val)
    local rarity = MadLib.RarityValues[val] or MadLib.RarityValues[RarityConversions[val]]
    if not rarity then return -1 end

    local value = rarity.value
    local rarities = {}
    for k,v in pairs(MadLib.RarityValues) do rarities[#rarities+1] = k end

    table.sort(sorted_table, function(a,b)
        return MadLib.RarityValues[a].value < MadLib.RarityValues[b].value
    end)
    for i=1,#rarities do
        if rarities[i].value > rarity.value then
            for k,v in MadLib.RarityValues do
                if v == rarities[i] then return k end
            end
        end
    end
    return nil
end

-- Checks whether the Joker falls within a certain rarity
function MadLib.matches_min_rarity(joker,val,greater)
    if not (joker and val) then return false end -- joker/rarity value does not exist!

	local r = joker.config.center.rarity
	local rarity  = SMODS.Rarities[r] or SMODS.Rarities[MadLib.RarityConversions[r]] or nil

	if not rarity then return false end -- invalid rarity

	local v1, v2 = MadLib.get_rarity_value(rarity), MadLib.get_rarity_value(val)
	return (not greater)
        and (v1 and v1 >= v2 or false) -- greater than or equal!
        or (v1 and v1 > v2 or false)   -- just greater than
end


-- Returns a list of Jokers in the specified cardarea (G.jokers)
-- which exceed (or equal) the specified requirement
function MadLib.get_jokers_matching_min_rarity(group, rarity, greater_than)
	return MadLib.get_list_matches(group or G.jokers.cards, function(v)
        return MadLib.matches_min_rarity(v, rarity, greater_than or false)
	end)
end

--[[
    Quick, easy Joker logic
]]

-- [Return List] Imitates the Gros Michel death animation.
-- Can be used for other Jokers.
--
function MadLib.banana_remove(card, msg)
    MadLib.simple_event(function()
		card.T.r = -0.2
        card:juice_up(0.3, 0.4)
        card.states.drag.is = true
        card.children.center.pinch.x = true
        MadLib.simple_event(function()
			G.jokers:remove_card(card)
            card:remove()
            card = nil
            return true
		end, 0.3, 'after', false)
	end)
    return { message = localize(msg or "k_extinct_ex") }
end

function MadLib.food_joker_logic(card,func)
    card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining
        and lenient_bignum(to_big(card.ability.extra.rounds_remaining) - 1)
        or 1

    return to_big(card.ability.extra.rounds_remaining) > to_big(0) and
        {
			message = { localize("rgmc_minus_round") },
            colour = G.C.FILTER,
        }
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

-- Used to help display planet variables for a list of planets
function MadLib.get_planet_list_vars(hand_list)
    local vars = {}

    MadLib.loop_functions(hand_list, { -- first puts poker hands, then the levels
        function(v)
            table.insert(vars, localize(v, "poker_hands"))
        end,
        function(v)
            number_format(G.GAME.hands[v].level)
        end,
    }, false)

    vars.colours = {}

    MadLib.loop_func_list(hand_list, {
        function(v)
            table.insert(vars.colours,
                to_big(G.GAME.hands[v].level) == to_big(1) and G.C.UI.TEXT_DARK
                or G.C.HAND_LEVELS[to_big(math.min(7, G.GAME.hands[v].level)):to_number()])
        end}, false)
    return vars
end

--[[
    RANK COMPATABILITY
    Mainly implemented because Madcap and UnStable implement overlapping ranks (e.g. 1, 11, etc.)
    thus we need to check which ID to use.
]]

local CompatRanks = {
    ['UnStable'] = {
        prefix = 'unstb',
        ranks = { '0', '0.5', '1', 'r2', 'e', 'Pi', '???', '21', '11', '12', '13', '25', '161' }
    },
    ['Showdown'] = {
        prefix = 'showdown',
        ranks = { '2.5', '5.5', '8.5', 'Butler', 'Princess', 'Lord', 'Zero' }
    },
    ['Madcap'] = {
        prefix = 'rgmc',
        ranks = { 'Knight', 'Sum', '10.5', 'X', 'infinity' }
    }
}

for i=1,#CompatRanks do
    local to_merge = {}
    for j=1, #CompatRanks.ranks do
        rank = CompatRanks.ranks[j]
        to_merge[rank] = CompatRanks[i].prefix..'_'..rank
    end
    MadLib.merge_tables(MadLib.RankIds,to_merge,true)
    return true
end

--[[
    RANK PATTERNS - used to help categorize ranks based
    on even/odd numbers, prime numbers, fibonacci sequence, etc.
]]

-- For number ranks, returns a table
-- showing if they are even/odd, prime, and/or Fibonacci
function MadLib.check_numbered_rank(k)
    if
        not k
        or type(k) ~= 'string'
        or tonumber(k) == nil
    then
        return nil
    end

    local tn = tonumber(k)
    local w,str = (tn%1 == 0), tostring(tn)

    return {
        rank    = k,
        whole   = w,
        even    = w and tn % 2 == 0,
        odd     = w and tn % 2 == 1,
        prime   = w and MadLib.is_prime(tn),
        fib     = w and MadLib.is_fibonacci(tn),
        square  = w and MadLib.is_perfect_square(tn),
    }
end

local rank_patterns = { -- temp list to merge into RankTypes
    ['Odd']         = {},
    ['Even']        = {},
    ['Prime']       = {},
    ['Fibonacci']   = {},
    ['Square']      = {},
}
local function process_ranks(n,val)
    if n.even      then table.insert(rank_patterns['Even'], val)         end
    if n.odd       then table.insert(rank_patterns['Odd'], val)          end
    if n.prime     then table.insert(rank_patterns['Prime'], val)        end
    if n.fib       then table.insert(rank_patterns['Fibonacci'], val)    end
    if n.square    then table.insert(rank_patterns['Square'], val)       end
end
for i=2,9 do process_ranks(MadLib.check_numbered_rank(tostring(i)),v) end
for k,_ in pairs(MadLib.RankIds) do process_ranks(MadLib.check_numbered_rank(k),v) end
MadLib.merge_tables(MadLib.RankTypes,rank_patterns)

-- End rank pattern setting up

-- manipulates chip and mult values
function MadLib.manipulate_chips_mult(ch,mu)
    G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.5, 0.5)
    hand_chips  = ch or hand_chips
    mult        = mu or mult
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

function MadLib.get_simple_score_data(t,card,val)
    local value = val or card.ability.extra[t.set]

    local ret = {
        message = localize({
            type    = "variable",
            key     = t.key,
            vars    = { number_format(lenient_bignum(to_big(value))) },
            card    = card
        }),
    }
    ret[t.add]      = lenient_bignum(val)
    ret['colour']   = t.colour
    return ret
end

function MadLib.get_fake_score_data(t,card,val)
    local value = val or card.ability.extra[t.set]
    local ret = {
        message = localize({
            type    = "variable",
            key     = t.key,
            vars    = { number_format(lenient_bignum(to_big(value))) },
            card    = card
        }),
    }
    ret['colour']   = t.colour
    return ret
end

function MadLib.get_simple_upgrade_data(t,card,val,bypass_safety,table)
    local table = table or 'extra'
    local get_table = card.ability[table]

    get_table[t.set] = not bypass_safety
        and math.max(get_table[t.set] + val, 0) -- no negative mult
        or get_table[t.set] + val

    return {
        message     = localize('k_upgrade_ex'),
        colour      = t.colour,
        card        = card
    }
end

function MadLib.get_simple_downgrade_data(t,card,val,var_to_decrease)
    local table = table or 'extra'
    if var_to_decrease then
       var_to_decrease = var_to_decrease - val
    end
    return {
         message = localize({
            type    = "variable",
            key     = t.key..'_minus',
            vars    = { val }
        }),
        colour      = t.colour,
        card        = card
    }
end

function MadLib.get_detailed_upgrade_data(t,card,val,bypass_safety)
    local var_key = (string.sub(t.key, 1, 2) == 'a_' and string.sub(t.key, 3))
        or t.key

    card.ability.extra[var_key] = not bypass_safety
        and math.max(card.ability.extra[var_key] + val, 0) -- no negative mult
        or card.ability.extra[var_key] + val

    return {
        message = localize({
            type    = "variable",
            key     = t.key,
            vars    = { "+" .. number_format(val) },
            card    = card
        }),
    }
end

function MadLib.get_simple_reset_data(t,card,val)
    if not val then
        local var_key = (string.sub(t.key, 1, 2) == 'a_' and string.sub(t.key, 3))
            or t.key
        card.ability.extra[var_key] = 0
    else
        val = 0
    end
    return {
        message     = localize('k_reset'),
        colour      = G.C.FILTER,
        card        = card
    }
end

-- Returns a simple "Debuffed" text.
function MadLib.get_debuff_data(card, msg)
    return { message = localize(msg or 'k_debuffed'), colour = G.C.RED, card = card }
end

-- Returns a simple "Again!" text and retriggers the selected card.
function MadLib.get_retrigger_data(card, reps, msg)
    return { message = localize(msg or 'k_again_ex'), repetitions = reps or 1, card = card }
end

-- Returns a simple "Safe!" text.
function MadLib.get_safe_data(card, msg)
    return { message = localize(msg or 'k_safe_ex'), card = card }
end

function MadLib.get_add_money_data(card, amt)
    if not card or (not amt or (card.ability.extra and card.ability.extra.money)) then return {} end
    return { card = card, dollars = amt or card.ability.extra.money }
end

function MadLib.simple_card_message(c, t)
    return {
        message = t,
        card = c
    }
end

-- Allows you to dupe cards and shit
function MadLib.dupe_cards(cards,func)
    local dupes = {}

    for _, v in pairs(cards) do
        local suit = SMODS.Ranks[v.base.value].card_key
        local rank = SMODS.Ranks[v.base.suit].card_key
        local n = create_playing_card({ front = G.P_CARDS[suit .. '_' .. rank] })
        n = v.config.center
        n:set_edition(v.edition)
        n:set_seal(v.seal)
        if func then func(v,n) end -- in case you want to do some funky stuff
        table.insert(dupes, n)
    end

    return dupes
end


-- Returns card info as a table - easier than
function MadLib.get_card_info(c)
    return {
        suit        = c.base.suit,
        rank        = c.base.value,
        enhancement = c.config.center,
        edition     = c.edition,
        seal        = c.seal
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
         local suit = SMODS.Ranks[v.suit].card_key
        local rank = SMODS.Ranks[v.rank].card_key
        local n = create_playing_card({ front = G.P_CARDS[suit .. '_' .. rank] })
        n = v.enhancement
        n:set_edition(v.edition)
        n:set_seal(v.seal)
        if func then func(v,n) end -- in case you want to do some funky stuff
        table.insert(dupes, n)
    end
    return dupes
end

-- silly way to determine the value of the card
function MadLib.get_card_points(c)
    local info = MadLib.get_card_info(c)
    local enhance = MadLib.PointValues.Enhancements[c.enhancement] or 0
    local edition = MadLib.PointValues.Enhancements[c.edition] or 0
    local nominal = SMODS.Ranks[c.rank]
    local pts = (edition * 3) + (enhance * 2)
    print('The card value is ' .. pts)
    return pts
end

-- card way to do it
function Card:get_points()
    return MadLib.get_card_points(self)
end

-- Easy way to return a localized name
function MadLib.localize_name_text(s,k)
    return localize { type = 'name_text', set = s, key = k }
end

-- Gets base probability - different for Cryptid.
function MadLib.base_prob(card)
    return card and (cry_prob
        and cry_prob(card.ability.cry_prob, card.ability.extra.odds, card.ability.cry_rigged)
        or (G.GAME.probabilities.normal or 1))
end

function MadLib.base_prob_tag(self)
    return (G.GAME.probabilities.normal or 1)
end

--[[
    CARD CREATION
]]

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    -- original
    local card = create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    -- if card has descaling, make sure to get the original values
    -- (this is used for jokers such as the retro lollipop joker)
    if -- this is a descaling joker
        _type == 'Joker'
        and area == G.jokers
    then
        local values = MadLib.get_values_from_key(MadLib.JokerTables.Descaling, function(k)
            return card.config.center.key == 'j_' .. k
        end)

        -- Add initial values
        if values then
            for k,v in pairs(values) do
            card.init_vals[k] = card.config.center.config[k]
            end
            print("INIT VALUES:")
            print(values)
        end
    end

    return card
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
    end, 0.1, 'before')
    return c
end

-- Creates a Joker of [joker_id] in [area] (or G.jokers)
function MadLib.create_joker(joker_id, area)
    local to        = area or 'jokers'
    local target    = G.P_CENTERS['j_'..joker_id]
    if not (#G[to].cards < G[to].config.card_limit or self.area == G[to]) then return nil end
    -- function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local new_card = create_card(target.name, G.jokers, nil, nil, nil, nil, target.key)
    new_card:add_to_deck()
    G[to]:emplace(new_card)
    return new_card
end

function MadLib.randomize_playing_card(target, do_animation, args)
	if not_proper_table(targets) or #targets <= 0 then return false end
    Madcap.loop_func(targets, function(v,i)
        local enhanced  = v:has_enhancement() or args.do_enhancements
        local editioned = v:has_enhancement() or args.do_editions
        local sealed    = v:has_enhancement() or args.do_seals

        -- new rank
        -- new suit
        if enhanced then
            -- new enhancement
        end

        if editioned then
            -- new edition
        end

        if sealed then
            -- new seal
        end

        -- do new stickers
        if args.do_stickers then

        end
    end)

    return true
end

-- Quick function used for detecting decrements in descalable Joker values
-- (e.g. Ice Cream when lose chip)
function MadLib.calculate_food_loss(c,t,val)
    SMODS.calculate_context({food_loss = { card = c, type = t, amount = val }})
end

G.FUNCS.get_money_and_leave = function(e)
    G.SETTINGS.paused = false
    if G.GAME and G.GAME.video_money and G.GAME.video_money ~= 0 then ease_dollars(G.GAME.video_money) end
    G.FUNCS.exit_overlay_menu()
end

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

-- Taken from YAHIMod, slightly altered so it can be used for any mod.
function MadLib.create_video_uibox(name, mod, button_name, args)
	local file_path = SMODS.Mods["rgmadcap"].path.."/resources/"..name..".ogv"
	local file = NFS.read(file_path)
	love.filesystem.write("temp.ogv", file)
	local video_file = love.graphics.newVideo('temp.ogv')
	local vid_sprite = Sprite(0,0,11*16/9,11,G.ASSET_ATLAS["ui_"..(G.SETTINGS.colourblind_option and 2 or 1)], {x=0, y=0})
	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume*G.SETTINGS.SOUND.game_sounds_volume/(100*10))
	vid_sprite.video = video_file
	video_file:play()
    G.GAME.video_money = args and args.money or 0
	local t = create_UIBox_generic_options({
		back_delay = 2 ,
		back_label = button_name,
		colour = G.C.BLACK,
		padding = 0,
		contents = {
			{ n=G.UIT.O, config = { object = vid_sprite } }
		}
	})
    -- neopoints
    if G.GAME.video_money and G.GAME.video_money ~= 0 then t['back_func'] = "get_money_and_leave" end
	return t
end

-- File loading based on Cryptid mod lmao
local errors = {}
function MadLib.load_folder(folder)
    local files = NFS.getDirectoryItems(SMODS.current_mod.path .. folder)
	for _, file in ipairs(files) do
		print("Loading file "..file)
		local f, err = SMODS.load_file(folder .. "/" .. file)
		if err then
			errors[file] = err
		else
			local curr_obj = f()
			local modid = curr_obj.modid
			local loaded = not curr_obj.modid
                or (curr_obj.modid and next(SMODS.find_mod(curr_obj.name)) or false)
                or false
			if loaded then curr_obj.init(curr_obj.content) end
            if curr_obj.content then
                local p = curr_obj.prefix or ''
                if curr_obj.content.JokerRanks then
                    for j, r in pairs(curr_obj.content.JokerRanks) do 
                        MadLib.JokerLists.Rank[r] = MadLib.JokerLists.Rank[r] or {}
                        table.insert(MadLib.JokerLists.Rank[r], curr_obj.content.JokerCategories[j])   
                    end
                end
                if curr_obj.content.JokerSuits then
                    for j, s in pairs(curr_obj.content.JokerSuits) do 
                        MadLib.JokerLists.Suit[s] = MadLib.JokerLists.Suit[s] or {}
                        table.insert(MadLib.JokerLists.Suit[s], curr_obj.content.JokerCategories[j]) 
                    end
                end
                -- Do the JokerList if it exist
                if curr_obj.content.JokerCategories then
                    for joker,cat in pairs(curr_obj.content.JokerCategories) do
                        local joker_id = 'j_'..p..joker  -- add joker_id to category
                        if G.P_CENTERS[joker_id] then table.insert(cat, 'j_'..joker_id) end
                    end
                end
            end
		end
	end
end

MadLib.load_folder('compat') -- load the items folder
-- File loading ended!
print(errors)
for f, e in ipairs(errors) do
    tell_stat("Error loading file",e)
end

-- MADLIB STOP
