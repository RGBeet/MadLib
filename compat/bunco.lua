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
    },
    init = function(c)
        -- Prefix
        local p = c.prefix..'_'

        local Fleurons  = p..'Fleurons'
        local Halberds  = p..'Halberds'

        --
        table.insert(MadLib.SuitTypes.Light, Fleurons)
        table.insert(MadLib.SuitTypes.Dark, Halberds)
		return true
    end,
}
