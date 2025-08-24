return {
    modid   = 'Bunco',
    prefix  = 'bunc',
    content = {
        JokerRanks = {
        },
        JokerSuits = {
        },
        JokerCategories = {
        },
        SuitConversions = {
            LightAndDark = {
                ['bunc_Fleurons']   = 'bunc_Halberds',
                ['bunc_Halberds']   = 'bunc_Fleurons',
            },
            BaseAndModded = {
                ['bunc_Fleurons']   = 'Diamonds',
                ['bunc_Halberds']   = 'Clubs',
                ['Diamonds']        = 'bunc_Fleurons',
                ['Clubs']           = 'bunc_Halberds',
            },
        },
    },
    init = function(c)
        -- Prefix
        local p = c.prefix..'_'

        local Fleurons  = p..'Fleurons'
        local Halberds  = p..'Halberds'

        --
        table.insert(MadLib.SuitTypes.Light, Fleurons)
        table.insert(MadLib.SuitTypes.Dark, Halberds)
		return c
    end,
}
