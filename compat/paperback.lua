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
                ['paperback_Stars']     = 'paperback_Crowns',
                ['paperback_Crowns']    = 'paperback_Stars',
            },
            BaseAndModded = {
                ['paperback_Stars']     = 'Hearts',
                ['paperback_Crowns']    = 'Spades',
                ['Hearts']              = 'paperback_Stars',
                ['Spades']              = 'paperback_Crowns',
            },
        },
    },
    init = function(c)
        -- Prefix
        local p = c.prefix..'_'

        local Stars  = p..'Stars'
        local Crowns = p..'Crowns'

        --
        table.insert(MadLib.SuitTypes.Light, Stars)
        table.insert(MadLib.SuitTypes.Dark, Crowns)
		return c
    end,
}
