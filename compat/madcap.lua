return {
    modid   = 'RGMadcap',
    prefix  = 'rgmc',
    content = {
        BanLists = {
            SuperBlinds = {
                'chaos_boss1',
                'chaos_boss2',
                'chaos_boss3',
            },
            Overpowered = {

            },
        },
        JokerRanks = {
            ['thorium_joker']       = { '2', '3', '4', '5', '6', '7', '8', '9' },
        }, -- might need for later idk
        JokerSuits = {
            ['rhodochrosite'] = { 'Diamonds', 'Clubs', 'Spades' },
        },
        JokerCategories = {
            ['vari_seala']          = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Retrigger.Card },
            ['bball_pasta']         = { MadLib.JokerLists.Probability, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Scaling.Mult },
            ['squeezy_cheeze']      = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Food },
            ['joker_squared']       = { MadLib.JokerLists.Mult.Add },
            ['spectator']           = { MadLib.JokerLists.Mult.Add },

            ['lady_liberty']        = { MadLib.JokerLists.Effect.Card },
            ['neighborhood_watch']  = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Random, MadLib.JokerLists.SuitType.Random },
            ['penrose_stairs']      = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card },
            ['quick_brown_fox']     = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips },
            ['house_of_cards']      = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Probability },

            ['glass_michel']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Retrigger.Card },
            ['chinese_takeout']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Food },
            ['easter_egg']          = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Scaling.Other },
            ['null_and_void']       = { MadLib.JokerLists.Effect.Joker },
            ['pretentious_joker']   = { MadLib.JokerLists.Mult.Add },

            ['deceitful_joker']     = { MadLib.JokerLists.Mult.Add },
            ['pentagon']            = { MadLib.JokerLists.Mult.Add },
            ['cup_of_joeker']       = { MadLib.JokerLists.Generative.Consumable },
            ['barbershop_joker']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random, MadLib.JokerLists.Rank.Random },
            ['supreme_with_cheese'] = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Food },

            ['red_dacca']           = { MadLib.JokerLists.Mult.Exponent, MadLib.JokerLists.Probability, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['bluenana']            = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['changing_had']        = { MadLib.JokerLists.Retrigger.Card },
            ['ball_breaker']        = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips },
            ['thorium_joker']       = { MadLib.JokerLists.Effect.Card },

            ['twinkle_of_contagion']    = { MadLib.JokerLists.Effect.Card },
            ['iron_joker']          = { MadLib.JokerLists.Chips.Add },
            ['tungsten_joker']      = { MadLib.JokerLists.Mult.Add },
            ['jeweler_joker']       = { MadLib.JokerLists.Mult.Multiply },
            ['plentiful_ametrine'] = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Mult },

            ['toughened_shungite']  = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Chips },
            ['six_shooter']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Rank['6'], MadLib.JokerLists.Destructive.Joker},
            ['conspiracy_wizard']   = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.SuitType.Random, MadLib.JokerLists.RankType.Random},
            ['cavalier']            = { MadLib.JokerLists.Chips.Multiply },
            ['blindfold_joker']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Descaling },

            ['crystal_cola']        = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Misc },
            ['sigma_joker']         = { MadLib.JokerLists.Mult.Multiply },
            ['venn_diagram']        = { MadLib.JokerLists.Retrigger.Card },
            ['continuum']           = { MadLib.JokerLists.Retrigger.Card, MadLib.JokerLists.Rank['8'] },
            ['three_trees']         = { MadLib.JokerLists.Mult.Multiply },

            ['jimbos_funeral']      = { MadLib.JokerLists.Effect.Game },
            ['shovel_joker']        = { MadLib.JokerLists.Mult.Multiply },
            ['rhodochrosite']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add },
            ['waveworx']            = { MadLib.JokerLists.Effect.PokerHand, MadLib.JokerLists.HandType['Straight'] },
            ['la_jokeonde']         = { MadLib.JokerLists.Effect.Card },

            ['miracle_pop']         = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Sell, MadLib.JokerLists.Effect.Card },
            ['doom_bunny']          = { MadLib.JokerLists.Effect.Card },
            ['rocket_keychain']     = { MadLib.JokerLists.Effect.PokerHand },
            ['legend_rio']          = { MadLib.JokerLists.Effect.Card },
            ['legend_picky']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['primordial_joker']    = { MadLib.JokerLists.Mult.Add },
            ['liberty_bell']        = { MadLib.JokerLists.Effect.Card },
            ['joker_in_binary']     = { MadLib.JokerLists.Effect.Card },
            ['sticker_shock']       = { MadLib.JokerLists.Chips.Add },
            ['bolstered_joker']     = { MadLib.JokerLists.Mult.Add },

            ['fortified_joker']     = { MadLib.JokerLists.Chips.Add },
            ['nope_joker']          = { MadLib.JokerLists.Effect.Probability, MadLib.JokerLists.Effect.Card },
            ['solar_eclipse']       = { MadLib.JokerLists.SuitType.Light},
            ['lunar_eclipse']       = { MadLib.JokerLists.SuitType.Dark },

            ['radioactive_chinese'] = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Score.Multiply, MadLib.JokerLists.Score.Exponent, MadLib.JokerLists.Food },

            ['outrageous_joker']    = { MadLib.JokerLists.Mult.Add },
            ['flamboyant_joker']    = { MadLib.JokerLists.Chips.Add },
            ['voracious_joker']     = { MadLib.JokerLists.Mult.Add },
            ['arrogant_joker']      = { MadLib.JokerLists.Mult.Add },
            ['captain_viridian']    = { MadLib.JokerLists.Mult.Add },

            ['balutro']             = { MadLib.JokerLists.Retrigger.Cards },
            ['vibrant_tourmaline']  = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Money },
            ['obsidian_blade']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Mult },
            ['made_of_honor']       = { MadLib.JokerLists.Generative.Card },
            ['jestrogen']           = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card },

            ['pogladontasaurus']    = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Rank['4'] },
            ['sanguine']            = { MadLib.JokerLists.Mult.Multiply },
            ['stonebound']          = { MadLib.JokerLists.Chips.Add },
            ['metallurgist']        = { MadLib.JokerLists.Retrigger.Cards },
            ['cosmamancer']         = { MadLib.JokerLists.Generative.Consumable },

            ['arkose_michel']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Food },
            ['catch_the_clown']     = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips },
            ['all_star_joker']      = { MadLib.JokerLists.Money.Add },
            ['microfiche']          = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Scaling.Chips },
            ['squash_keychain']     = { MadLib.JokerLists.Generative.Consumable },

            ['penumbral']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.SuitType.Dark },
            ['photovoltaic']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.SuitType.Light },
            ['palette']             = { MadLib.JokerLists.Mult.Multiply },
            ['streemerz']           = { MadLib.JokerLists.Effect.Card },
            ['formation']           = { MadLib.JokerLists.Mult.Multiply },

            ['jonster_cola']        = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Card },
            ['xray_goggles']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Game },
            ['weighted_die']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Game },
            ['roshambo']            = { MadLib.JokerLists.Effect.Card },
            ['lucky_troll_doll']    = { MadLib.JokerLists.Effect.Card },

            ['cat_planet']          = { MadLib.JokerLists.Effect.Game },
            ['golden_house']        = { MadLib.JokerLists.Destructive.Consumable, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add },
            ['spam']                = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Food  },
            ['lobster_thermidor']   = { MadLib.JokerLists.Score.Exponent, MadLib.JokerLists.Scaling.Score, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['chicken_jokey']       = { MadLib.JokerLists.Generative.Joker, MadLib.JokerLists.Probability },

            ['jegg_jarton']             = { MadLib.JokerLists.Generative.Joker, MadLib.JokerLists.Probability },
            ['taking_bacteria_john']    = { MadLib.JokerLists.Generative.Card, MadLib.JokerLists.Probability },
            ['legend_foreman']          = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['legend_bobby']            = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Destructive.Card },
            ['legend_lollipop']         = { -- see if you can just have this scan through all food jokers?
                MadLib.JokerLists.Chips.Add,
                MadLib.JokerLists.Chips.Multiply,
                MadLib.JokerLists.Chips.Exponent,
                MadLib.JokerLists.Scaling.Chips,
                MadLib.JokerLists.Mult.Add,
                MadLib.JokerLists.Mult.Multiply,
                MadLib.JokerLists.Mult.Exponent,
                MadLib.JokerLists.Scaling.Mult,
                MadLib.JokerLists.Score.Multiply,
                MadLib.JokerLists.Score.Exponent,
                MadLib.JokerLists.Scaling.Score,
            },
        },
        PointValues = {
            Editions = {
                ['iridescent']  = 9,
                ['infernal']    = 10,
                ['chrome']      = 7,
                ['disco']       = 13,
            },
            Enhancements = {
                ['ferrous']     = 5,
                ['wolfram']     = 7,
                ['lustrous']    = 9,
                ['bismuth']     = 9,
            },
        },
        RankCompat = { },
        RankTypes = { -- do string (id will be appended later)
            Irregular   = { 'sum', 'infinity', 'x' },
            Face        = { 'knight' },
        },
        RarityValues = {
            ['rgmc_gimmick'] = {
                name = 'Gimmick',
                value = 2.5,
                special = true,
            },
            ['rgmc_unusual'] = {
                name = 'Unusual',
                value = 3.5,
                special = true,
            },
		},
        StickerLists = {
            ['eternal']     = { MadLib.StickerLists.Good, MadLib.StickerLists.Bad }, -- can be good, but sometimes bad? idk
            ['perishable']  = { MadLib.StickerLists.Bad },
            ['rental']      = { MadLib.StickerLists.Bad }
        },
        Weights = {
            Boosters = {
            },
            Editions = {
                ['iridescent']  = 1,
                ['infernal']    = 1,
                ['chrome']      = 1,
                ['disco']       = 1,
            },
            Enhancements = {
                ['ferrous']     = 2,
                ['wolfram']     = 2,
                ['lustrous']    = 1,
                ['bismuth']     = 1,
            }
        },
    },
    init = function(c)
        -- simple prefixes
        local pr = c.prefix..'_'
        local UnStable = SMODS.find_mod("Unstable")

        -- transfers custom hand types - spectrum depends on mods added (goes by madlib's spectrum priority)
        local Pyramid       = p..'pyramid'
        local Spectrum      = MadLib.SpectrumId..'Spectrum'
        local joker_poker_hands = {
            ['bolstered_joker']     = { Pyramid }, -- also includes flush pyramid, spectrum pyramid
            ['fortified_joker']     = { Pyramid },
            ['solar_eclipse']       = { Spectrum },
            ['lunar_eclipse']       = { Spectrum },
            ['formation']           = { Pyramid },
        }

        -- transfer custom suits without having to use the mod id prefix 100 times
        local Goblets   = pr..'goblets'
        local Towers    = pr..'towers'
        local Blooms    = pr..'blooms'
        local Daggers   = pr..'daggers'
        local Voids     = pr..'voids'
        local Lanterns  = pr..'lanterns'
        local joker_suits = {
            ['smeared']             = { Goblets, Towers, Blooms, Daggers },
            ['pretentious_joker']   = { Goblets },
            ['deceitful_joker']     = { Towers },
            ['voracious_joker']     = { Blooms },
            ['arrogant_joker']      = { Daggers },
            ['plentiful_ametrine']  = { Goblets },
            ['toughened_shungite']  = { Towers },
            ['vibrant_tourmaline']  = { Blooms },
            ['obsidian_blade']      = { Daggers },
            ['legend_foreman']      = { Goblets },
            ['legend_bobby']        = { Towers },
        }

        -- ditto, but with joker ranks (uses unstable id for conflicting ranks if unstable is added)
        local pu =  (UnStable and 'unstb' or c.prefix) ..'_'
        local n0        = pu..'0'Jokers
        local nHalf     = pu..'0.5'
        local n1        = pu..'1'
        local n11       = pu..'11'
        local n12       = pu..'12'
        local n13       = pu..'13'
        local n21       = pu..'21'
        local n25       = pu..'25'

        local n14       = pr..'14'
        local n15       = pr..'15'
        local n16       = pr..'16'
        local n32       = pr..'32'
        local Knight    = pr..'knight'
        local Sum       = pr..'sum'

        local joker_ranks = {
            ['joker_squared']       = { '4', '9', n16, n25 },
            ['pentagon']            = { 'Ace', '1', '5', n12 },
            ['ball_breaker']        = { 'Ace', '2', '3', '5', '8', n13, n21},
            ['cavalier']            = { Knight },
            ['sigma_joker']         = { Sum },
            ['shovel_joker']        = { Knight },
            ['legend_rio']          = { 'Ace', 'King', 'Queen' },
            ['joker_in_binary']     = { n0, n1 },
            ['balutro']             = { n1, '2', '5', n11, n12, n15, n21, n25 },
            ['microfiche']          = { nHalf },
        }

        -- Add the new ranks to the Jokers
        local vanilla_rank_mods = {
            ['odd_todd']        = { n15 },
            ['even_steven']     = { n14, n16 },
        }

        local vanilla_suit_mods = {
            ['smeared']         = { Goblets, Towers, Blooms, Daggers },
        }

        -- In case UnStable is NOT installed.
        if not UnStable then
            MadLib.merge_into_list(c.RankCompat, {
                '0', '0.5', '1', '11', '12', '13', '21', '25'
            })

            MadLib.merge_into_list(vanilla_rank_mods, {
                ['fibonacci']       = { n1, n13, n21 },
                ['odd_todd']        = { n1, n11, n13, n21, n25},
                ['even_steven']     = { n12 },
            })
        end

        --[[
            CRYPTID CROSSMOD
        ]]
        if SMODS.find_mod("Cryptid") then
            local cryptid_crossmod = { -- add cry_
                ['thad']        = { MadLib.JokerLists.Effect.Joker }, -- force trigger =/= retrigger
                ['danvas']      = { MadLib.JokerLists.Effect.Joker },
            }

            local cryptid_crossmod_ranks = {
                ['weefib']      = vanilla_rank_mods['fibonacci'],   -- just copy the fibonacci numbers!
                ['primus']      = { n13, n21 }  -- add more prime numbers
            }
        end

        table.insert(MadLib.SuitTypes.Light, Goblets)
        table.insert(MadLib.SuitTypes.Dark, Towers)
        table.insert(MadLib.SuitTypes.Light, Blooms)
        table.insert(MadLib.SuitTypes.Dark, Daggers)

        MadLib.loop_table_func(joker_poker_hands, function(k,v) table.insert(c.JokerCategories[k], MadLib.JokerLists.HandType[v]) end)
        MadLib.transfer_to_new_table(joker_suits,c.content.JokerSuits)
        MadLib.transfer_to_new_table(joker_ranks,c.content.JokerRanks)

		return true
    end,
}
