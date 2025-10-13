-- Takes a rarity id. If it's in MadLib's rarity index, return that value.
-- Otherwise, return -1.
function MadLib.get_rarity_value(val)
	return MadLib.RarityValues[val] and MadLib.RarityValues[val].value or -1
end

-- returns a table from a string
function MadLib.get_higher_rarity(val)
    local rarity = MadLib.RarityValues[val] or MadLib.RarityValues[MadLib.RarityConversions[val]]
    if not rarity then return -1 end

    local value = rarity.value
    local rarities = {}
    for k,v in pairs(MadLib.RarityValues) do rarities[#rarities+1] = k end

    table.sort(sorted_table, function(a,b)
        return MadLib.RarityValues[a].value < MadLib.RarityValues[b].value
    end)

    for i=1,#rarities do
        if rarities[i].value > rarity.value then
            for k,v in MadLib.RarityValues do
                if v == rarities[i] then return k end
            end
        end
    end
    return nil
end

-- Checks whether the Joker falls within a certain rarity
function MadLib.matches_min_rarity(joker,val,greater)
    if not (joker and val) then return false end -- joker/rarity value does not exist!

	local r = joker.config.center.rarity
	local rarity  = SMODS.Rarities[r] or SMODS.Rarities[MadLib.RarityConversions[r]] or nil

	if not rarity then return false end -- invalid rarity

	local v1, v2 = MadLib.get_rarity_value(rarity), MadLib.get_rarity_value(val)
	return (not greater)
        and (v1 and v1 >= v2 or false) -- greater than or equal!
        or (v1 and v1 > v2 or false)   -- just greater than
end

-- Returns a list of Jokers in the specified cardarea (G.jokers)
-- which exceed (or equal) the specified requirement
function MadLib.get_jokers_matching_min_rarity(group, rarity, greater_than)
	return MadLib.get_list_matches(group or G.jokers.cards, function(v)
        return MadLib.matches_min_rarity(v, rarity, greater_than or false)
	end)
end

function MadLib.get_jokers_matching_rarity(rarity, group)
    group = group or G.jokers.cards
    if not (group and rarities) then return {} end
    local jokers = {}

    MadLib.loop_func(group, function(j)
        if j.config.center.rarity == v then table.insert(jokers,j) end
    end)
    return jokers
end

function MadLib.get_jokers_matching_rarities(rarities, group)
    group = group or G.jokers.cards
    if not (group and rarities) then return {} end
    local jokers = {}
    MadLib.loop_func(group, function(j)
        if MadLib.list_matches_one(rarities, function(v)
            return j.config.center.rarity == v
        end) then
            table.insert(jokers,j)
        end
    end)
    --print(#jokers)
    return jokers
end
