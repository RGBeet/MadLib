-- Returns a selection from a weighted table (MadLib.Weights[X]).
function MadLib.pick_from_weighted_table(wtable, whitelist, blacklist)
    if type(wtable) ~= "table" then return nil end
    tell('Picking weight from table...')
    local weighted = {}

    for k, v in pairs(wtable) do
        local valid = ((not whitelist) or MadLib.get_item_index(v,whitelist) ~= -1)
            and ((not blacklist) or MadLib.get_item_index(v,whitelist) == -1)
            and type(v) == "number" and v > 0
        -- Handle whitelist vs blacklist logic
        if valid then table.insert(weighted, {key = k, value = math.random() * v}) end
    end

    -- Sort by values in key-value table
    table.sort(weighted, function(a, b)
        return a.value > b.value
    end)

    if #weighted == 0 then return nil end
    tell('returning key '..tostring(weighted[1].key))
    return weighted[1].key
end

-- Simple function for picking weighted edition
function MadLib.get_weighted_edition(whitelist,blacklist)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Editions,whitelist,blacklist) or 'e_foil'
end

-- Ditto, but for enhancements
function MadLib.get_weighted_enhancement(selection,whitelist,override)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Enhancements,selection,whitelist) or 'm_bonus'
end

-- Ditto, but for seals
function MadLib.get_weighted_seal(selection,whitelist,override)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Seals,selection,whitelist) or 'red'
end

-- Ditto, but for boosters
function MadLib.get_weighted_booster(selection,whitelist)
	return MadLib.pick_from_weighted_table(MadLib.Weights.Boosters,selection,whitelist)
end
