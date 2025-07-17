return {
    content = {
        JokerRanks = {
            ['fibonacci']       = { 'Ace', '2', '3', '5', '8' },
            ['hack']            = { '2', '3', '4', '5'  },
            ['even_steven']     = { '2', '4', '6', '8', '10' },
            ['odd_todd']        = { 'Ace', '3', '5', '7', '9' },
            ['walkie_talkie']   = { '4', '10' },
            ['triboulet']       = { 'Queen', 'King' },
        },
        JokerSuits = {
            ['blackboard']      = { 'Clubs', 'Spades' },
            ['flower_pot']      = { 'Diamonds', 'Hearts', 'Spades', 'Clubs' },
            ['smeared']         = { 'Diamonds', 'Hearts', 'Spades', 'Clubs' },

        },
        JokerCategories = {
            ['joker']               = { MadLib.JokerLists.Mult.Add },
            ['greedy_joker']        = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['Diamonds'] },
            ['lusty_joker']         = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['Hearts'] },
            ['wrathful_joker']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['Spades'] },
            ['gluttenous_joker']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['Clubs'] },

            ['jolly']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['Pair'] },
            ['zany']        = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['Three of a Kind'] },
            ['mad']         = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['Two Pair'] },
            ['crazy']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['Straight'] },
            ['droll']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.HandType['Flush'] },

            ['sly']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['Pair'] },
            ['wily']        = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['Three of a Kind'] },
            ['clever']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['Two Pair'] },
            ['devious']     = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['Straight'] },
            ['crafty']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.HandType['Flush'] },

            ['half']            = { MadLib.JokerLists.Mult.Add },
            ['stencil']         = { MadLib.JokerLists.Mult.Multiply },
            ['four_fingers']    = { MadLib.JokerLists.Effect.Card },
            ['mime']            = { MadLib.JokerLists.Retrigger.Card },
            ['credit_card']     = { MadLib.JokerLists.Effect.Game },

            ['ceremonial']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.Destructive.Joker },
            ['banner']          = { MadLib.JokerLists.Chips.Add },
            ['nystic_summit']   = { MadLib.JokerLists.Mult.Add },
            ['marble']          = { MadLib.JokerLists.Generative.Card },
            ['loyalty_card']    = { MadLib.JokerLists.Mult.Multiply },

            ['8_ball']          = { MadLib.JokerLists.Probability, MadLib.JokerLists.Generative.Consumable },
            ['misprint']        = { MadLib.JokerLists.Mult.Add },
            ['dusk']            = { MadLib.JokerLists.Retrigger.Card },
            ['raised_fist']     = { MadLib.JokerLists.Mult.Add },
            ['chaos']           = { MadLib.JokerLists.Effect.Game },

            ['fibonacci']       = { MadLib.JokerLists.Mult.Add },
            ['steel_joker']     = { MadLib.JokerLists.Mult.Multiply },
            ['scary_face']      = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.RankType.Face },
            ['abstract_joker']  = { MadLib.JokerLists.Mult.Add },
            ['delayed_grat']    = { MadLib.JokerLists.Money.Add },

            ['pareidolia']      = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.RankType.Face },
            ['hack']            = { MadLib.JokerLists.Retrigger },
            ['gros_michel']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Food },
            ['even_steven']     = { MadLib.JokerLists.Mult.Add },
            ['odd_todd']        = { MadLib.JokerLists.Chips.Add },

            ['scholar']         = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Mult.Add },
            ['business']        = { MadLib.JokerLists.Probability, MadLib.JokerLists.Money.Add },
            ['supernova']       = { MadLib.JokerLists.Mult.Add },
            ['ride_the_bus']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.RankType.Number },
            ['space']           = { MadLib.JokerLists.Probability },

            ['egg']             = { MadLib.JokerLists.Scaling.Money, MadLib.JokerLists.Sell },
            ['burglar']         = { MadLib.JokerLists.Effect.Game },
            ['blackboard']      = { MadLib.JokerLists.Mult.Multiply },
            ['runner']          = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.HandType['Straight'] },
            ['ice_cream']       = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['dna']             = { MadLib.JokerLists.Generative.Card },
            ['splash']          = { MadLib.JokerLists.Effect.Card },
            ['blue_joker']      = { MadLib.JokerLists.Chips.Add },
            ['sixth_sense']     = { MadLib.JokerLists.Generative.Consumable, MadLib.JokerLists.Destructive.Card, MadLib.JokerLists.Rank['6'] },
            ['constellation']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['hiker']           = { MadLib.JokerLists.Effect.Card },
            ['faceless']        = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Face },
            ['green_joker']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult },
            ['superposition']   = { MadLib.JokerLists.Generative.Card, MadLib.JokerLists.HandType['Straight'], MadLib.JokerLists.Rank['Ace'] },
            ['todo_list']       = { MadLib.JokerLists.Money.Add },

            ['cavendish']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Food, MadLib.JokerLists.Cavendish },
            ['card_sharp']      = { MadLib.JokerLists.Mult.Multiply },
            ['red_card']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['madness']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult, MadLib.JokerLists.Destructive.Joker },
            ['square_joker']    = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips },

            ['seance']          = { MadLib.JokerLists.Generative.Consumable, MadLib.JokerLists.HandType['Straight Flush'] },
            ['riff_raff']       = { MadLib.JokerLists.Generative.Joker },
            ['vampire']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['shortcut']    = { MadLib.JokerLists.Effect },
            ['hologram']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['vagabond']    = { MadLib.JokerLists.Generative.Consumable },
            ['baron']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Rank['King'] },
            ['cloud_9']     = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Rank['9'] },
            ['rocket']      = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money },
            ['obelisk']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['midas_mask']  = { MadLib.JokerLists.Effect.Card, MadLib.JokerLists.RankTypes.Face },
            ['luchador']    = { MadLib.JokerLists.Effect, MadLib.JokerLists.Sell },
            ['photograph']  = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.RankTypes.Face },
            ['gift']        = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money},
            ['turtle_bean']     = { MadLib.JokerLists.Effects.Game, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['erosion']         = { MadLib.JokerLists.Mult.Multiply },
            ['reserved_parking']    = { MadLib.JokerLists.Probability, MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankTypes.Face},
            ['mail']            = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.RankType.Random },
            ['to_the_moon']     = { MadLib.JokerLists.Effects.Game, MadLib.JokerLists.RankType.Random },
            ['hallucination']   = { MadLib.JokerLists.Probability, MadLib.JokerLists.Generative.Consumable },

            ['fortune_teller']  = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling.Mult },
            ['juggler']     = { MadLib.JokerLists.Effects.Game },
            ['drunkard']    = { MadLib.JokerLists.Effects.Game },
            ['stone']       = { MadLib.JokerLists.Chips.Add },
            ['golden']      = { MadLib.JokerLists.Money.Add },

            ['lucky_cat']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['baseball']    = { MadLib.JokerLists.Mult.Multiply },
            ['bull']        = { MadLib.JokerLists.Chips.Add },
            ['diet_cola']   = { MadLib.JokerLists.Sell, MadLib.JokerLists.Generative.Misc },
            ['trading']     = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Destructive.Card },

            ['flash']       = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling },
            ['popcorn']     = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },
            ['trousers']    = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Scaling, MadLib.JokerLists.HandType['Two Pair'] },
            ['ancient']     = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random },
            ['ramen']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },

            ['walkie_talkie']   = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Chips.Add, },
            ['seltzer']           = { MadLib.JokerLists.Retrigger.Card, MadLib.JokerLists.Descaling, MadLib.JokerLists.Food },
            ['castle']      = { MadLib.JokerLists.Chips.Add, JokerList.Scaling.Chips, MadLib.JokerLists.Suit.Random },
            ['smiley_face'] = { MadLib.JokerLists.Mult.Add, JokerList.RankType.Face },
            ['campfire']    = { MadLib.JokerLists.Mult.Multiply, JokerList.Scaling.Mult },

            ['mr_bones']        = { MadLib.JokerLists.Effect.Game },
            ['acrobat']         = { MadLib.JokerLists.Mult.Multiply },
            ['sock_and_buskin'] = { MadLib.JokerLists.Retrigger.Card },
            ['ticket']          = { MadLib.JokerLists.Money.Add },
            ['swashbuckler']    = { MadLib.JokerLists.Mult.Add },

            ['troubadour']      = { MadLib.JokerLists.Effect.Game },
            ['certficiate']     = { MadLib.JokerLists.Effect.Game },
            ['smeared']         = { MadLib.JokerLists.Effect.Game },
            ['throwback']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['hanging_chad']    = { MadLib.JokerLists.Retrigger.Card },

            ['rough_gem']       = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Suit['Diamonds'] },
            ['bloodstone']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Probability, MadLib.JokerLists.Suit['Hearts'] },
            ['arrowhead']       = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Suit['Spades'] },
            ['onyx_agate']      = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Suit['Clubs'] },
            ['glass']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },

            ['ring_master']     = { MadLib.JokerLists.Effect.Game },
            ['flower_pot']      = { MadLib.JokerLists.Mult.Multiply },
            ['blueprint']       = { MadLib.JokerLists.Retrigger.Joker },
            ['wee']             = { MadLib.JokerLists.Chips.Add, MadLib.JokerLists.Scaling.Chips, MadLib.JokerLists.Rank['2'] },
            ['merry_andy']      = { MadLib.JokerLists.Effect.Game },

            ['oops']            = { MadLib.JokerLists.Effect.Game },
            ['idol']            = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit.Random, MadLib.JokerLists.Rank.Random },
            ['seeing_double']   = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Suit['Clubs'] },
            ['matador']         = { MadLib.JokerLists.Money.Add },
            ['hit_the_road']    = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Rank['Jack'] },

            ['duo']         = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['Pair'] },
            ['trio']        = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['Three of a Kind'] },
            ['family']      = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['Two Pair'] },
            ['order']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['Straight'] },
            ['tribe']       = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.HandType['Flush'] },

            ['stuntman']    = { MadLib.JokerLists.Chips.Add, JokerList.Effect.Game },
            ['invisible_joker'] = { MadLib.JokerLists.Sell, JokerList.Generative.Joker},
            ['brainstorm']      = { MadLib.JokerLists.Retrigger.Joker },
            ['satellite']       = { MadLib.JokerLists.Money.Add, MadLib.JokerLists.Scaling.Money },
            ['shoot_the_moon']  = { MadLib.JokerLists.Mult.Add, MadLib.JokerLists.Rank['Queen'] },

            ['drivers_license'] = { MadLib.JokerLists.Mult.Multiply, JokerList.Scaling.Mult },
            ['cartomancer']     = { MadLib.JokerLists.Generative.Consumable },
            ['astronomer']      = { MadLib.JokerLists.Effects.Game },
            ['burnt']           = { MadLib.JokerLists.Effects.Game },
            ['bootstraps']      = { MadLib.JokerLists.Mult.Add },

            ['canio']           = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['triboulet']       = { MadLib.JokerLists.Mult.Multiply },
            ['yorick']          = { MadLib.JokerLists.Mult.Multiply, MadLib.JokerLists.Scaling.Mult },
            ['chicot']          = { MadLib.JokerLists.Effect.Game },
            ['perkeo']          = { MadLib.JokerLists.Generative.Consumable },
        },
        PointValues = {
            Editions = {
                ['foil']        = 5,
                ['holo']        = 7,
                ['polychrome']  = 9,
                ['negative']    = 8,
            },
            Enhancements = {
                ['bonus']   = 2,
                ['mult']    = 2,
                ['gold']    = 1,
                ['lucky']   = 3,
                ['steel']   = 3,
                ['glass']   = 4,
            },
        }
        QuantumRanks = {
            ['Ace'] = {
                values = {'1', '11'},
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
            Light   = { 'Hearts', 'Diamonds' },
            Dark    = { 'Spades', 'Clubs' },
        },
        --[[
            WEIGHT SYSTEM - easily configurable method of handling weights
            between multiple bodies of mod content.
        ]]
        Weights = {
            Boosters = {
                ['arcana_normal'] 	    = 10,
                ['arcana_jumbo'] 		= 8,
                ['arcana_mega']         = 4,
                ['celestial_normal'] 	= 9,
                ['celestial_jumbo']     = 7,
                ['celestial_mega'] 	    = 4,
                ['spectral_normal']     = 6,
                ['spectral_jumbo'] 	    = 4,
                ['spectral_mega'] 	    = 2,
                ['standard_normal']     = 9,
                ['standard_jumbo'] 	    = 7,
                ['standard_mega'] 	    = 4,
                ['buffoon_normal'] 	    = 9,
                ['buffoon_jumbo'] 	    = 7,
                ['buffoon_mega']        = 4,
            }
            Editions = {
                ['foil']        = 4,
                ['holo']        = 3,
                ['polychrome']  = 2,
                ['negative']    = 0.5,
            },
            Enhancements = {
                ['bonus']   = 4,
                ['mult']    = 4,
                ['steel']   = 3,
                ['gold']    = 2,
                ['stone']   = 3,
                ['glass']   = 2,
                ['lucky']   = 2,
            }
        }
    },
    init = function(c)

        -- maybe add mod compat for unstable/madcap here?
        table.insert(MadLib.SuitTypes.Light, 'Hearts')
        table.insert(MadLib.SuitTypes.Dark, 'Spades')
        table.insert(MadLib.SuitTypes.Light, 'Diamonds')
        table.insert(MadLib.SuitTypes.Dark, 'Clubs')

		return true
    end,
}
