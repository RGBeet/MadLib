-- Returns if there are ANY matches.
function MadLib.list_matches_one(list, func, bypass_check)
    if not bypass_check and (not_proper_table(list) or not_proper_func(func)) then return false end -- prevent crash!
    for k,v in pairs(list) do
        if func(v,k) then return true end -- value/key
    end
    return false
end

-- Returns whether at least X of the values in the list
-- satisfy the function
function MadLib.list_matches_some(list, func, points, bypass_check)
    if not bypass_check and (not_proper_table(list) or not_proper_func(func)) then return false end -- prevent crash!
    points = math.min((points or 2),#list) -- can only be as large as the list size
    local total = 0
    for _,v in pairs(list) do
        total = total + (func(v) and 1 or 0)
        if total == points then return true end
    end
    return false
end

-- Returns whether ALL the values in the list satisfy the function.
function MadLib.list_matches_all(list, func, bypass_check)
    if not bypass_check and (not_proper_table(list) or not_proper_func(func)) then return false end -- prevent crash!
    for k,v in pairs(list) do
        if not func(v,k) then return false end
    end
    return true
end

-- Returns a list of matches.
function MadLib.get_list_matches(list,func)
    if not_proper_table(list) or (func ~= nil and not_proper_func(func)) then return nil end
    local matches = {}
    for k,v in pairs(list) do
        if func(v,k) then table.insert(matches,v) end
    end
    return matches
end

function MadLib.get_list_matches_limited(list,func,max)
    if not_proper_table(list) or (func ~= nil and not_proper_func(func)) then return nil end
    local matches, i = {}, 0
    for k,v in pairs(list) do
        if func(v,k) then
            table.insert(matches,v)
            i = i+1
        end
        if not (i < max) then return matches end
    end
    return matches
end

-- Returns the first list match (or nothing, if there are no matches).
function MadLib.get_first_list_match(list,func)
    if not_proper_table(list) or not_proper_func(func) then return nil end
    for k,v in pairs(list) do
        if func(v,k) then return v, k end
    end
    return nil
end

-- Returns the first list match (or nothing, if there are no matches).
function MadLib.get_first_match_info(list,check,func)
    if not_proper_table(list) or not_proper_func(check) or not_proper_func(func) then return nil end
    for k,v in pairs(list) do
        if check(v,k) then return func(v,k) end
    end
    return nil
end
MadLib.first_match = MadLib.get_first_match_info

-- Sorts the list based on a sorting function (a, b) and return the first (highest) value.
function MadLib.get_highest_match(list, check_func, sort_func)
    local list = MadLib.get_list_matches(list, check_func)
    -- Sort by values in key-value table
    table.sort(list, sort_func)
    return list[1]
end

-- Gets a portion of the list (from [n1] to [n2])
-- Skips over [skip] cards.
function MadLib.list_pick_range(list,n1,n2,skip)
    local new_list = {}
    local min, max = math.max(1, n1), math.min(n2, #list)
    for i=min, max, (skip and math.min(skip,1) or 1) do new_list[#new_list+1] = list[i]; end;
    return new_list
end

-- Loops through the list until it finds the item, then returns its index
function MadLib.get_item_index(entry, list, bypass_check)
    if not bypass_check and (not entry or not_proper_table(list)) then return nil end
    for index = 1, #list do if list[index] == entry then return index end; end
    return -1 -- The table passed, but the entry has no index.
end

-- DEPRECATED! Do not use!
function MadLib.get_values_from_key(list,check,func)
    if not_proper_table(list) or not_proper_func(check) then return false end
    for k, v in pairs(list) do
        if check(k) then
            return func and func(v) or v
        end
    end
    return nil
end

function MadLib.check_add_list_entry(_list,_entry)
    if not_proper_table(_list) then return false end
    local _exists = MadLib.list_matches_one(_list, function(v) return v == _entry end)
    if not _exists then
        _list[#_list+1] = _entry
        return true
    end
    return false
end

function MadLib.get_xor_matches(main_list, compare_list)
    return MadLib.list_matches_all(main_list, function(v1)
		return not MadLib.list_matches_one(compare_list, function(v2)
			return v2 ~= v1
		end)
	end)
end
