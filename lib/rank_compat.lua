local CompatRanks = {
    ['UnStable'] = {
        prefix = 'unstb',
        ranks = { '0', '0.5', '1', 'r2', 'e', 'Pi', '???', '21', '11', '12', '13', '25', '161' }
    },
    ['Showdown'] = {
        prefix = 'showdown',
        ranks = { '2.5', '5.5', '8.5', 'Butler', 'Princess', 'Lord', 'Zero' }
    },
    ['Madcap'] = {
        prefix = 'rgmc',
        ranks = { 'Knight', 'Sum', '10.5', 'X', 'infinity' }
    }
}

for i=1,#CompatRanks do
    local to_merge = {}
    for j=1, #CompatRanks.ranks do
        rank = CompatRanks.ranks[j]
        to_merge[rank] = CompatRanks[i].prefix..'_'..rank
    end
    MadLib.merge_tables(MadLib.RankIds,to_merge,true)
    return true
end
