return {
    modid   = 'UnStable',
    prefix  = 'unstb',
    content = {
        PointValues = {
            Editions = {
            },
            Enhancements = {
            },
        },
        RankCompat = {},
        RankType = {
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
        MadLib.loop_func({'0', '0.5', '1', 'r2', 'e', 'Pi', '???', '21', '11', '12', '13', '25', '161'}, function(v)
            c.content.RankCompat[v] = c.prefix .. '_' .. v
        end)
		return c
    end,
}
