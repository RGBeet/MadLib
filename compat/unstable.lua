return {
    modid   = 'UnStable',
    prefix  = 'unstb',
    content = {
        },
        PointValues = {
            Editions = {
            },
            Enhancements = {
            },
        },
        RankCompat = { '0', '0.5', '1', 'r2', 'e', 'Pi', '???', '21', '11', '12', '13', '25', '161' },
        RankTypes = {
        },
        Weights = {
            Boosters = {
            },
            Editions = {
            },
            Enhancements = {
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

        MadLib.loop_table_func(joker_poker_hands, function(k,v) table.insert(c.JokerCategories[k], MadLib.JokerLists.HandType[v]) end)
        MadLib.transfer_to_new_table(joker_suits,c.content.JokerSuits)
        MadLib.transfer_to_new_table(joker_ranks,c.content.JokerRanks)

		return true
    end,
}
