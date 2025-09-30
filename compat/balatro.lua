return {
    content = {
        JokerRanks = {
            ['j_fibonacci']       = { 'Ace', '2', '3', '5', '8' },
            ['j_hack']            = { '2', '3', '4', '5'  },
            ['j_even_steven']     = { '2', '4', '6', '8', '10' },
            ['j_odd_todd']        = { 'Ace', '3', '5', '7', '9' },
            ['j_walkie_talkie']   = { '4', '10' },
            ['j_triboulet']       = { 'Queen', 'King' },
        },
        JokerSuits = {
            ['j_blackboard']      = { 'Clubs', 'Spades' },
            ['j_flower_pot']      = { 'Diamonds', 'Hearts', 'Spades', 'Clubs' },
            ['j_smeared']         = { 'Diamonds', 'Hearts', 'Spades', 'Clubs' },

        },
        JokerCategories = {
            ['j_joker']               = { MadLib.JokerLists.Mult.Add },
            ['j_greedy_joker']        = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['j_Diamonds'] },
            ['j_lusty_joker']         = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['j_Hearts'] },
            ['j_wrathful_joker']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['j_Spades'] },
            ['j_gluttenous_joker']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['j_Clubs'] },

            ['j_jolly']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['j_Pair'] },
            ['j_zany']        = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['j_Three of a Kind'] },
            ['j_mad']         = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['j_Two Pair'] },
            ['j_crazy']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['j_Straight'] },
            ['j_droll']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['j_Flush'] },

            ['j_sly']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['j_Pair'] },
            ['j_wily']        = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['j_Three of a Kind'] },
            ['j_clever']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['j_Two Pair'] },
            ['j_devious']     = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['j_Straight'] },
            ['j_crafty']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['j_Flush'] },

            ['j_half']            = { MadLib.JokerLists.Mult.Add },
            ['j_stencil']         = { MadLib.JokerLists.Mult.Multiply },
            ['j_four_fingers']    = { MadLib.JokerLists.Effect.Card },
            ['j_mime']            = { MadLib.JokerLists.Retrigger.Card },
            ['j_credit_card']     = { MadLib.JokerLists.Effect.Game },

            ['j_ceremonial']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.Destructive.Joker },
            ['j_banner']          = { MadLib.JokerLists.Chips.Add },
            ['j_nystic_summit']   = { MadLib.JokerLists.Mult.Add },
            ['j_marble']          = { MadLib.JokerLists.Generative.Card },
            ['j_loyalty_card']    = { MadLib.JokerLists.Mult.Multiply },

            ['j_8_ball']          = { MadLib.JokerLists.Probability, MadLib.JokerLists.Generative.Consumable },
            ['j_misprint']        = { MadLib.JokerLists.Mult.Add },
            ['j_dusk']            = { MadLib.JokerLists.Retrigger.Card },
            ['j_raised_fist']     = { MadLib.JokerLists.Mult.Add },
            ['j_chaos']           = { MadLib.JokerLists.Effect.Game },

            ['j_fibonacci']       = { MadLib.JokerLists.Mult.Add },
            ['j_steel_joker']     = { MadLib.JokerLists.Mult.Multiply },
            ['j_scary_face']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.RankType.Face },
            ['j_abstract_joker']  = { MadLib.JokerLists.Mult.Add },
            ['j_delayed_grat']    = { MadLib.JokerLists.Money.Add },

            ['j_pareidolia']      = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.RankType.Face },
            ['j_hack']            = { MadLib.JokerLists.Retrigger },
            ['j_gros_michel']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Food },
            ['j_even_steven']     = { MadLib.JokerLists.Mult.Add },
            ['j_odd_todd']        = { MadLib.JokerLists.Chips.Add },

            ['j_scholar']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add },
            ['j_business']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Money.Add },
            ['j_supernova']       = { MadLib.JokerLists.Mult.Add },
            ['j_ride_the_bus']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.RankType.Number },
            ['j_space']           = { MadLib.JokerLists.Probability },

            ['j_egg']             = { MadLib.JokerLists.Scaling.Money, MadLib.JokerLists.Sell },
            ['j_burglar']         = { MadLib.JokerLists.Effect.Game },
            ['j_blackboard']      = { MadLib.JokerLists.Mult.Multiply },
            ['j_runner']          = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.HandType['j_Straight'] },
            ['j_ice_cream']       = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['j_dna']             = { MadLib.JokerLists.Generative.Card },
            ['j_splash']          = { MadLib.JokerLists.Effect.Card },
            ['j_blue_joker']      = { MadLib.JokerLists.Chips.Add },
            ['j_sixth_sense']     = { MadLib.JokerLists.Generative.Consumable, MadLib.JokerLists.Destructive.Card, MadLib.JokerLists.Rank['j_6'] },
            ['j_constellation']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_hiker']           = { MadLib.JokerLists.Effect.Card },
            ['j_faceless']        = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Face },
            ['j_green_joker']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult },
            ['j_superposition']   = { MadLib.JokerLists.Generative.Card, MadLib.JokerLists.HandType['j_Straight'], MadLib.JokerLists.Rank['j_Ace'] },
            ['j_todo_list']       = { MadLib.JokerLists.Money.Add },

            ['j_cavendish']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['j_card_sharp']      = { MadLib.JokerLists.Mult.Multiply },
            ['j_red_card']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_madness']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.Destructive.Joker },
            ['j_square_joker']    = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips },

            ['j_seance']          = { MadLib.JokerLists.Generative.Consumable, MadLib.JokerLists.HandType['j_Straight Flush'] },
            ['j_riff_raff']       = { MadLib.JokerLists.Generative.Joker },
            ['j_vampire']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_shortcut']    = { MadLib.JokerLists.Effect },
            ['j_hologram']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_vagabond']    = { MadLib.JokerLists.Generative.Consumable },
            ['j_baron']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Rank['j_King'] },
            ['j_cloud_9']     = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Rank['j_9'] },
            ['j_rocket']      = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money },
            ['j_obelisk']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_midas_mask']  = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.RankType.Face },
            ['j_luchador']    = { MadLib.JokerLists.Effect, MadLib.JokerLists.Sell },
            ['j_photograph']  = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.RankType.Face },
            ['j_gift']        = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money},
            ['j_turtle_bean']     = { MadLib.JokerLists.Effect.Game, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['j_erosion']         = { MadLib.JokerLists.Mult.Multiply },
            ['j_reserved_parking']    = { MadLib.JokerLists.Probability, MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Face},
            ['j_mail']            = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Random },
            ['j_to_the_moon']     = { MadLib.JokerLists.Effect.Game, MadLib.JokerLists.RankType.Random },
            ['j_hallucination']   = { MadLib.JokerLists.Probability, MadLib.JokerLists.Generative.Consumable },

            ['j_fortune_teller']  = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult },
            ['j_juggler']     = { MadLib.JokerLists.Effect.Game },
            ['j_drunkard']    = { MadLib.JokerLists.Effect.Game },
            ['j_stone']       = { MadLib.JokerLists.Chips.Add },
            ['j_golden']      = { MadLib.JokerLists.Money.Add },

            ['j_lucky_cat']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_baseball']    = { MadLib.JokerLists.Mult.Multiply },
            ['j_bull']        = { MadLib.JokerLists.Chips.Add },
            ['j_diet_cola']   = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Misc },
            ['j_trading']     = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Destructive.Card },

            ['j_flash']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling },
            ['j_popcorn']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },
            ['j_trousers']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling, MadLib.JokerLists.HandType['j_Two Pair'] },
            ['j_ancient']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random },
            ['j_ramen']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['j_walkie_talkie']   = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add, },
            ['j_seltzer']           = { MadLib.JokerLists.Retrigger.Card, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },
            ['j_castle']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Suit.Random },
            ['j_smiley_face'] = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.RankType.Face },
            ['j_campfire']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_mr_bones']        = { MadLib.JokerLists.Effect.Game },
            ['j_acrobat']         = { MadLib.JokerLists.Mult.Multiply },
            ['j_sock_and_buskin'] = { MadLib.JokerLists.Retrigger.Card },
            ['j_ticket']          = { MadLib.JokerLists.Money.Add },
            ['j_swashbuckler']    = { MadLib.JokerLists.Mult.Add },

            ['j_troubadour']      = { MadLib.JokerLists.Effect.Game },
            ['j_certficiate']     = { MadLib.JokerLists.Effect.Game },
            ['j_smeared']         = { MadLib.JokerLists.Effect.Game },
            ['j_throwback']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_hanging_chad']    = { MadLib.JokerLists.Retrigger.Card },

            ['j_rough_gem']       = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Suit['j_Diamonds'] },
            ['j_bloodstone']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Suit['j_Hearts'] },
            ['j_arrowhead']       = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Suit['j_Spades'] },
            ['j_onyx_agate']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['j_Clubs'] },
            ['j_glass']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['j_ring_master']     = { MadLib.JokerLists.Effect.Game },
            ['j_flower_pot']      = { MadLib.JokerLists.Mult.Multiply },
            ['j_blueprint']       = { MadLib.JokerLists.Retrigger.Joker },
            ['j_wee']             = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Rank['j_2'] },
            ['j_merry_andy']      = { MadLib.JokerLists.Effect.Game },

            ['j_oops']            = { MadLib.JokerLists.Effect.Game },
            ['j_idol']            = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random, MadLib.JokerLists.Rank.Random },
            ['j_seeing_double']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit['j_Clubs'] },
            ['j_matador']         = { MadLib.JokerLists.Money.Add },
            ['j_hit_the_road']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Rank['j_Jack'] },

            ['j_duo']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['j_Pair'] },
            ['j_trio']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['j_Three of a Kind'] },
            ['j_family']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['j_Two Pair'] },
            ['j_order']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['j_Straight'] },
            ['j_tribe']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['j_Flush'] },

            ['j_stuntman']    = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Effect.Game },
            ['j_invisible_joker'] = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Joker},
            ['j_brainstorm']      = { MadLib.JokerLists.Retrigger.Joker },
            ['j_satellite']       = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money },
            ['j_shoot_the_moon']  = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Rank['j_Queen'] },

            ['j_drivers_license'] = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_cartomancer']     = { MadLib.JokerLists.Generative.Consumable },
            ['j_astronomer']      = { MadLib.JokerLists.Effect.Game },
            ['j_burnt']           = { MadLib.JokerLists.Effect.Game },
            ['j_bootstraps']      = { MadLib.JokerLists.Mult.Add },

            ['j_canio']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_triboulet']       = { MadLib.JokerLists.Mult.Multiply },
            ['j_yorick']          = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['j_chicot']          = { MadLib.JokerLists.Effect.Game },
            ['j_perkeo']          = { MadLib.JokerLists.Generative.Consumable },
        },
        PointValues = {
            Editions = {
                ['e_foil']        = 5,
                ['e_holo']        = 7,
                ['e_polychrome']  = 8,
                ['e_negative']    = 9,
            },
            Enhancements = {
                ['m_bonus']   = 2,
                ['m_mult']    = 2,
                ['m_gold']    = 1,
                ['m_lucky']   = 3,
                ['m_steel']   = 3,
                ['m_glass']   = 4,
            },
        },
        QuantumRanks = {
            ['Ace'] = {
                ['values'] = {'1', '11'},
                check = function()
                    -- MadLib adds the ability to set Aces as HIGH (11) or LOW (1).
                    -- Usually they count as HIGH.
                    return G.GAME.aces_high and {'11'}
                        or G.GAME.aces_low  and {'1'}
                        or MadLib.QuantumRanks['Ace'].values
                end
            },
        },
        RarityValues = {
            ['1'] = {
                name = 'Common',     -- proper name (check if deprecation needed)
                value = 1,           -- value
                special = false,     -- is it particularly noteworthy (e.g. super strong?)
            },
            ['2'] = {
                name = 'Uncommon',
                value = 2,
                special = false,
            },
            ['3'] = {
                name = 'Rare',
                value = 3,
                special = false,
            },
            ['4'] = {
                name = 'Legendary',
                value = 4,
                special = true,
            },
		},
        SuitConversions = {
            LightAndDark = {
                ['Hearts']      = 'Spades',
                ['Diamonds']    = 'Clubs',
                ['Clubs']       = 'Diamonds',
                ['Spades']      = 'Hearts'
            },
        },
        SuitTypes = {
            ['Light']   = { 'Hearts', 'Diamonds' },
            ['Dark']    = { 'Spades', 'Clubs' },
        },
        --[[
            WEIGHT SYSTEM - easily configurable method of handling weights
            between multiple bodies of mod content.
        ]]
        Weights = {
            Boosters = {
                ['p_arcana_normal'] 	    = 10,
                ['p_arcana_jumbo'] 		= 8,
                ['p_arcana_mega']         = 4,
                ['p_celestial_normal'] 	= 9,
                ['p_celestial_jumbo']     = 7,
                ['p_celestial_mega'] 	    = 4,
                ['p_spectral_normal']     = 6,
                ['p_spectral_jumbo'] 	    = 4,
                ['p_spectral_mega'] 	    = 2,
                ['p_standard_normal']     = 9,
                ['p_standard_jumbo'] 	    = 7,
                ['p_standard_mega'] 	    = 4,
                ['p_buffoon_normal'] 	    = 9,
                ['p_buffoon_jumbo'] 	    = 7,
                ['p_buffoon_mega']        = 4,
            },
            Editions = {
                ['e_foil']        = 4,
                ['e_holo']        = 3,
                ['e_polychrome']  = 2,
                ['e_negative']    = 0.5,
            },
            Enhancements = {
                ['m_bonus']   = 4,
                ['m_mult']    = 4,
                ['m_steel']   = 3,
                ['m_gold']    = 2,
                ['m_stone']   = 3,
                ['m_glass']   = 2,
                ['m_lucky']   = 2,
            }
        }
    },
    init = function(c)
		return c
    end,
}
