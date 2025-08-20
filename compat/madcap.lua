return {
    modid   = 'rgmadcap',
    prefix  = 'rgmc',
    content = {
        BanLists = {
            SuperBlinds = {
                'bl_rgmc_chaos_boss1',
                'bl_rgmc_chaos_boss2',
                'bl_rgmc_chaos_boss3',
            },
            Overpowered = {

            },
        },
        JokerRanks = {
            ['j_rgmc_thorium_joker']       = { '2', '3', '4', '5', '6', '7', '8', '9' },
        }, -- might need for later idk
        JokerSuits = {
            ['j_rgmc_rhodochrosite'] = { 'Diamonds', 'Clubs', 'Spades' },
        },
        JokerCategories = {
            ['j_rgmc_vari_seala']          = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Retrigger.Card },
            ['j_rgmc_bball_pasta']         = { MadLib.JokerLists.Probability, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Scaling.Mult },
            ['j_rgmc_squeezy_cheeze']      = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Food },
            ['j_rgmc_joker_squared']       = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_spectator']           = { MadLib.JokerLists.Mult.Add },

            ['j_rgmc_lady_liberty']        = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_neighborhood_watch']  = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Random, MadLib.JokerLists.SuitType.Random },
            ['j_rgmc_penrose_stairs']      = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card },
            ['j_rgmc_quick_brown_fox']     = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips },
            ['j_rgmc_house_of_cards']      = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Probability },

            ['j_rgmc_glass_michel']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Retrigger.Card },
            ['j_rgmc_chinese_takeout']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Food },
            ['j_rgmc_easter_egg']          = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Scaling.Other },
            ['j_rgmc_null_and_void']       = { MadLib.JokerLists.Effect.Joker },
            ['j_rgmc_pretentious_joker']   = { MadLib.JokerLists.Mult.Add },

            ['j_rgmc_deceitful_joker']     = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_pentagon']            = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_cup_of_joeker']       = { MadLib.JokerLists.Generative.Consumable },
            ['j_rgmc_barbershop_joker']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random, MadLib.JokerLists.Rank.Random },
            ['j_rgmc_supreme_with_cheese'] = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Food },

            ['j_rgmc_red_dacca']           = { MadLib.JokerLists.Mult.Exponent, MadLib.JokerLists.Probability, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['j_rgmc_bluenana']            = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['j_rgmc_changing_had']        = { MadLib.JokerLists.Retrigger.Card },
            ['j_rgmc_ball_breaker']        = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips },
            ['j_rgmc_thorium_joker']       = { MadLib.JokerLists.Effect.Card },

            ['j_rgmc_twinkle_of_contagion']    = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_iron_joker']          = { MadLib.JokerLists.Chips.Add },
            ['j_rgmc_tungsten_joker']      = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_jeweler_joker']       = { MadLib.JokerLists.Mult.Multiply },
            ['j_rgmc_plentiful_ametrine'] = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Mult },

            ['j_rgmc_toughened_shungite']  = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Chips },
            ['j_rgmc_six_shooter']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Rank['j_rgmc_6'], MadLib.JokerLists.Destructive.Joker},
            ['j_rgmc_conspiracy_wizard']   = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.SuitType.Random, MadLib.JokerLists.RankType.Random},
            ['j_rgmc_cavalier']            = { MadLib.JokerLists.Chips.Multiply },
            ['j_rgmc_blindfold_joker']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Descaling },

            ['j_rgmc_crystal_cola']        = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Misc },
            ['j_rgmc_sigma_joker']         = { MadLib.JokerLists.Mult.Multiply },
            ['j_rgmc_venn_diagram']        = { MadLib.JokerLists.Retrigger.Card },
            ['j_rgmc_continuum']           = { MadLib.JokerLists.Retrigger.Card, MadLib.JokerLists.Rank['j_rgmc_8'] },
            ['j_rgmc_three_trees']         = { MadLib.JokerLists.Mult.Multiply },

            ['j_rgmc_jimbos_funeral']      = { MadLib.JokerLists.Effect.Game },
            ['j_rgmc_shovel_joker']        = { MadLib.JokerLists.Mult.Multiply },
            ['j_rgmc_rhodochrosite']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add },
            ['j_rgmc_waveworx']            = { MadLib.JokerLists.Effect.PokerHand, MadLib.JokerLists.HandType['j_rgmc_Straight'] },
            ['j_rgmc_la_jokeonde']         = { MadLib.JokerLists.Effect.Card },

            ['j_rgmc_miracle_pop']         = { MadLib.JokerLists.Chips.Add,  MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Sell, MadLib.JokerLists.Effect.Card },
            ['j_rgmc_doom_bunny']          = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_rocket_keychain']     = { MadLib.JokerLists.Effect.PokerHand },
            ['j_rgmc_legend_rio']          = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_legend_picky']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_rgmc_primordial_joker']    = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_liberty_bell']        = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_joker_in_binary']     = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_sticker_shock']       = { MadLib.JokerLists.Chips.Add },
            ['j_rgmc_bolstered_joker']     = { MadLib.JokerLists.Mult.Add },

            ['j_rgmc_fortified_joker']     = { MadLib.JokerLists.Chips.Add },
            ['j_rgmc_nope_joker']          = { MadLib.JokerLists.Effect.Probability, MadLib.JokerLists.Effect.Card },
            ['j_rgmc_solar_eclipse']       = { MadLib.JokerLists.SuitType.Light},
            ['j_rgmc_lunar_eclipse']       = { MadLib.JokerLists.SuitType.Dark },

            ['j_rgmc_radioactive_chinese'] = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Score.Multiply, MadLib.JokerLists.Score.Exponent, MadLib.JokerLists.Food },

            ['j_rgmc_outrageous_joker']    = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_flamboyant_joker']    = { MadLib.JokerLists.Chips.Add },
            ['j_rgmc_voracious_joker']     = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_arrogant_joker']      = { MadLib.JokerLists.Mult.Add },
            ['j_rgmc_captain_viridian']    = { MadLib.JokerLists.Mult.Add },

            ['j_rgmc_balutro']             = { MadLib.JokerLists.Retrigger.Cards },
            ['j_rgmc_vibrant_tourmaline']  = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Money },
            ['j_rgmc_obsidian_blade']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Scaling.Mult },
            ['j_rgmc_made_of_honor']       = { MadLib.JokerLists.Generative.Card },
            ['j_rgmc_jestrogen']           = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Card },

            ['j_rgmc_pogladontasaurus']    = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Rank['4'] },
            ['j_rgmc_sanguine']            = { MadLib.JokerLists.Mult.Multiply },
            ['j_rgmc_stonebound']          = { MadLib.JokerLists.Chips.Add },
            ['j_rgmc_metallurgist']        = { MadLib.JokerLists.Retrigger.Cards },
            ['j_rgmc_cosmamancer']         = { MadLib.JokerLists.Generative.Consumable },

            ['j_rgmc_arkose_michel']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Food },
            ['j_rgmc_catch_the_clown']     = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips },
            ['j_rgmc_all_star_joker']      = { MadLib.JokerLists.Money.Add },
            ['j_rgmc_microfiche']          = { MadLib.JokerLists.Chips.Multiply, MadLib.JokerLists.Scaling.Chips },
            ['j_rgmc_squash_keychain']     = { MadLib.JokerLists.Generative.Consumable },

            ['j_rgmc_penumbral']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.SuitType.Dark },
            ['j_rgmc_photovoltaic']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.SuitType.Light },
            ['j_rgmc_palette']             = { MadLib.JokerLists.Mult.Multiply },
            ['j_rgmc_streemerz']           = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_formation']           = { MadLib.JokerLists.Mult.Multiply },

            ['j_rgmc_jonster_cola']        = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Card },
            ['j_rgmc_xray_goggles']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Game },
            ['j_rgmc_weighted_die']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Effect.Game },
            ['j_rgmc_roshambo']            = { MadLib.JokerLists.Effect.Card },
            ['j_rgmc_lucky_troll_doll']    = { MadLib.JokerLists.Effect.Card },

            ['j_rgmc_cat_planet']          = { MadLib.JokerLists.Effect.Game },
            ['j_rgmc_golden_house']        = { MadLib.JokerLists.Destructive.Consumable, MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add },
            ['j_rgmc_spam']                = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Probability, MadLib.JokerLists.Food  },
            ['j_rgmc_lobster_thermidor']   = { MadLib.JokerLists.Score.Exponent, MadLib.JokerLists.Scaling.Score, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['j_rgmc_chicken_jokey']       = { MadLib.JokerLists.Generative.Joker, MadLib.JokerLists.Probability },

            ['j_rgmc_jegg_jarton']             = { MadLib.JokerLists.Generative.Joker, MadLib.JokerLists.Probability },
            ['j_rgmc_taking_bacteria_john']    = { MadLib.JokerLists.Generative.Card, MadLib.JokerLists.Probability },
            ['j_rgmc_legend_foreman']          = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_rgmc_legend_bobby']            = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.Destructive.Card },
            ['j_rgmc_legend_lollipop']         = { -- see if you can just have this scan through all food jokers?
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
                ['e_rgmc_iridescent']  = 9,
                ['e_rgmc_infernal']    = 10,
                ['e_rgmc_chrome']      = 7,
                ['e_rgmc_disco']       = 13,
            },
            Enhancements = {
                ['e_rgmc_ferrous']     = 5,
                ['e_rgmc_wolfram']     = 7,
                ['e_rgmc_lustrous']    = 9,
                ['e_rgmc_bismuth']     = 9,
            },
        },
        RankCompat = { },
        RankTypes = { -- do string (id will be appended later)
            Irregular   = { 'rgmc_Sum', 'rgmc_Infinity', 'rgmc_X' },
            Face        = { 'rgmc_Knight' },
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
                ['e_rgmc_iridescent']  = 1,
                ['e_rgmc_infernal']    = 1,
                ['e_rgmc_chrome']      = 1,
                ['e_rgmc_disco']       = 1,
            },
            Enhancements = {
                ['m_rgmc_ferrous']     = 2,
                ['m_rgmc_wolfram']     = 2,
                ['m_rgmc_lustrous']    = 1,
                ['m_rgmc_bismuth']     = 1,
            }
        },
        SuitConversions = {
            LightAndDark = {
                ['rgmc_goblets']    = 'rgmc_towers',
                ['rgmc_blooms']     = 'rgmc_daggers',
                ['rgmc_daggers']    = 'rgmc_blooms',
                ['rgmc_towers']     = 'rgmc_goblets',
                ['rgmc_voids']      = 'rgmc_lanterns',
                ['rgmc_lanterns']   = 'rgmc_voids'
            },
            BaseAndModded = {
                ['rgmc_goblets']    = 'Hearts',
                ['rgmc_blooms']     = 'Diamonds',
                ['rgmc_daggers']    = 'Clubs',
                ['rgmc_towers']     = 'Spades',
                ['Hearts']          = 'rgmc_goblets',
                ['Diamonds']        = 'rgmc_blooms',
                ['Clubs']           = 'rgmc_daggers',
                ['Spades']          = 'rgmc_towers',
            },
        },
        SuitTypes = {
            ['Light']       = { 'rgmc_goblets', 'rgmc_blooms' },
            ['Dark']        = { 'rgmc_towers', 'rgmc_daggers' },
            ['Special']     = { 'rgmc_voids', 'rgmc_lanterns' }
        },
    },
    init = function(c)
        -- simple prefixes
        local pr = c.prefix..'_'
        local UnStable = SMODS.find_mod("Unstable")

        -- transfers custom hand types - spectrum depends on mods added (goes by madlib's spectrum priority)
        local Pyramid       = pr..'pyramid'
        local Spectrum      = MadLib.SpectrumId..'Spectrum'
        local joker_poker_hands = {
            ['j_rgmc_bolstered_joker']     = { Pyramid }, -- also includes flush pyramid, spectrum pyramid
            ['j_rgmc_fortified_joker']     = { Pyramid },
            ['j_rgmc_solar_eclipse']       = { Spectrum },
            ['j_rgmc_lunar_eclipse']       = { Spectrum },
            ['j_rgmc_formation']           = { Pyramid },
        }

        -- transfer custom suits without having to use the mod id prefix 100 times
        local Goblets   = pr..'goblets'
        local Towers    = pr..'towers'
        local Blooms    = pr..'blooms'
        local Daggers   = pr..'daggers'
        local Voids     = pr..'voids'
        local Lanterns  = pr..'lanterns'
        local joker_suits = {
            ['j_smeared']                   = { Goblets, Towers, Blooms, Daggers },
            ['j_rgmc_pretentious_joker']    = { Goblets },
            ['j_rgmc_deceitful_joker']      = { Towers },
            ['j_rgmc_voracious_joker']      = { Blooms },
            ['j_rgmc_arrogant_joker']       = { Daggers },
            ['j_rgmc_plentiful_ametrine']   = { Goblets },
            ['j_rgmc_toughened_shungite']   = { Towers },
            ['j_rgmc_vibrant_tourmaline']   = { Blooms },
            ['j_rgmc_obsidian_blade']       = { Daggers },
            ['j_rgmc_legend_foreman']       = { Goblets },
            ['j_rgmc_legend_bobby']         = { Towers },
        }

        -- ditto, but with joker ranks (uses unstable id for conflicting ranks if unstable is added)
        local pu =  (UnStable and 'unstb' or c.prefix) ..'_'
        local n0        = pu..'0'
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
        local Knight    = pr..'Knight'
        local Sum       = pr..'Sum'



        local joker_ranks = {
            ['j_rgmc_joker_squared']       = { '4', '9', n16, n25 },
            ['j_rgmc_pentagon']            = { 'Ace', '1', '5', n12 },
            ['j_rgmc_ball_breaker']        = { 'Ace', '2', '3', '5', '8', n13, n21},
            ['j_rgmc_cavalier']            = { Knight },
            ['j_rgmc_sigma_joker']         = { Sum },
            ['j_rgmc_shovel_joker']        = { Knight },
            ['j_rgmc_legend_rio']          = { 'Ace', 'King', 'Queen' },
            ['j_rgmc_joker_in_binary']     = { n0, n1 },
            ['j_rgmc_balutro']             = { n1, '2', '5', n11, n12, n15, n21, n25 },
            ['j_rgmc_microfiche']          = { nHalf },
        }

        -- Add the new ranks to the Jokers
        local vanilla_rank_mods = {
            ['j_odd_todd']        = { n15 },
            ['j_even_steven']     = { n14, n16 },
        }

        local vanilla_suit_mods = {
            ['j_smeared']         = { Goblets, Towers, Blooms, Daggers },
        }

        -- In case UnStable is NOT installed.
        if not UnStable then
            MadLib.loop_func({ '0', '0.5', '1', '11', '12', '13', '21', '25' }, function(v)
                c.content.RankCompat[v] = c.prefix .. '_' .. v
            end)

            MadLib.merge_into_list(vanilla_rank_mods, {
                ['j_fibonacci']       = { n1, n13, n21 },
                ['j_odd_todd']        = { n1, n11, n13, n21, n25},
                ['j_even_steven']     = { n12 },
            })
        end

        MadLib.loop_func({ '14', '15', '16', '32', 'Knight', 'Sum', 'x', 'Infinity' }, function(v)
            c.content.RankCompat[v] = c.prefix .. '_' .. v
        end) 

        --[[
            CRYPTID CROSSMOD
        ]]
        if SMODS.find_mod("Cryptid") then
            local cryptid_crossmod = { -- add cry_
                ['j_rgmc_cry_thad']        = { MadLib.JokerLists.Effect.Joker }, -- force trigger =/= retrigger
                ['j_rgmc_cry_danvas']      = { MadLib.JokerLists.Effect.Joker },
            }

            local cryptid_crossmod_ranks = {
                ['j_cry_weefib']      = vanilla_rank_mods['fibonacci'],   -- just copy the fibonacci numbers!
                ['j_cry_primus']      = { n13, n21 }  -- add more prime numbers
            }
        end

        MadLib.loop_table(joker_poker_hands, function(k,v) table.insert(c.content.JokerCategories[k], MadLib.JokerLists.HandType[v]) end)
        MadLib.transfer_to_new_table(joker_suits,c.content.JokerSuits)
        MadLib.transfer_to_new_table(joker_ranks,c.content.JokerRanks)

		return c
    end,
}
