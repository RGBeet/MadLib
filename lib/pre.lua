-- The beautiful mod icon.
SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = 34,
    py = 34
})

G.C.WENGE = HEX('645452')

MadLib = {
    AbstractSuits       = {},
    Prefixes = {
        Boosters        = 'p_',
        Vouchers        = 'v_',
        Enhancements    = 'm_',
        Editions        = 'e_',
        Jokers          = 'j_',
        Blind           = 'bl_',
    },
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
        Mods = {}, -- quicker way of getting mod-specific jokers?
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
        ['Enhancements']    = {},
        ['Editions']        = {},
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
        ['Common']      = 1,
        ['Uncommon']    = 2,
        ['Rare']        = 3,
        ['Legendary']   = 4,
    },
    SpecificRanks = {},
    SpecificSuits = {},
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
            add = 'xmult_mod',
            set = 'x_mult',
            colour = G.C.MULT,
            sign = "X",
        },
        MultiChips = {
            key = 'a_xchips',
            add = 'xchip_mod',
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
            add = 'echip_mod',
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
            add = 'xscore_mod',
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
            key = 'a_pow',
            add = 'pow',
            set = 'pow',
            colour = G.C.POW or G.C.GREEN,
            sign = "+",
        },
        HandSize = {
            key = 'h_size',
            add = 'h_size',
            set = 'h_size',
            colour = G.C.ORANGE,
            sign = "+",
        },
    },
    ScoreKeySets = { -- Translates
        ['mult' ]       = 'AddMult',
        ['chips']       = 'AddChips',
        ['x_mult']      = 'MultiMult',
        ['x_chips']     = 'MultiChips',
        ['e_mult']      = 'ExpMult',
        ['e_chips']     = 'ExpChips',
        ['score' ]      = 'AddScore',
        ['x_score']     = 'MultiScoe',
        ['pow' ]        = 'AddPow',
        ['h_size']      = 'HandSize',
    },
    -- Madcap includes cards that convert suits into their "counterparts". If there
    -- are more than two counterparts, randomize!
    SuitConversions = {
        ['LightAndDark']    = {},   -- light/dark suits usually have counterparts
        ['BaseAndModded']   = {}    -- some modded suits have base equivalents?
    },
    StickerLists = {
        Vanilla     = {},
        Bad         = {}, -- bad effects
        Good        = {}, -- good effects
        Destructive = {}, -- sticker destroys host card or other cards
    },
    StickerGroups = {
        ['1']       = {
            'eternal',
            'perishable'
        },
        ['2']       = {
            'rental'
        },
        ['3'] = {},
        ['4'] = {},
        ['5'] = {},
        ['6'] = {}
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
    Weights = {
        Boosters        = {},
        Editions        = {},
        Enhancements    = {},
        Stickers        = {},
        Seals           = {},
        Vouchers        = {},
    },
}
MLIB = MadLib -- shorter ref

MLIB.devmode = true

print_debug_text = function (text,prefix)
	if not MLIB.devmode then return false end
	local finished_text
	if type(text) == 'string' then
		finished_text = "[MADLIB] - "..(prefix and prefix..' ' or '')..(text or '???')
	else
		print(text)
		finished_text = "[MADLIB] - TEXT TYPE IS "..type(text)
	end
	print(finished_text)
end

-- Prints out a MADLIB message!
tell = function(text)
   print_debug_text(text)
end

-- Prints out a MADCAP error.
tell_error = function(text)
	print_debug_text(text..' - ERROR!')
	return false
end

-- Prints out a MADCAP stat. Foo: Bar
tell_stat = function(text,stat)
    print_debug_text(text..": "..tostring(stat))
end

-- Prints out a MADCAP list.
tell_list = function (text,list)
    print_debug_text(text..":")
    print(list)
end

-- Quick way to ensure the table will actually work as intended.
-- Otherwise, it could crash the game!
function not_proper_table(table)
    return table == nil or type(table) ~= 'table'
end

-- Same as above, but for functions (or funcs for short).
function not_proper_func(func)
    return func == nil or type(func) ~= 'function'
end

function not_proper_number(n)
    return n == nil or type(n) ~= 'number'
end

MadLib.mod_loaded = function(var)
    if not var then return false end
    return (SMODS.Mods[var] and SMODS.Mods[var].can_load) and true or false
end

G.effect_manager = {}