

function MadLib.get_coords(_y,_x)
    return { x = _x, y = _y }
end
MadLib.coords = MadLib.get_coords -- alias

function MadLib.get_legend_coords(num,front)
    local n     = num%3
    local a,b   = n*2, math.floor(num/3)
    if front then a = a+1 end
    return {x = a, y = b}
end
MadLib.legend = MadLib.get_legend_coords

function MadLib.deep_copy(obj, seen)
	if type(obj) ~= "table" then return obj end
	if seen and seen[obj] then return seen[obj] end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do res[MadLib.deep_copy(k, s)] = MadLib.deep_copy(v, s) end
	return res
end

-- Same as above, but copies a list (or a table without defined keys!)
function MadLib.deep_copy_list(list)
    local copy = {}
    for i = 1, #list do copy[i] = list[i] end
    return copy
end

-- From Cryptid - safely gets a variable in a nested list
function MadLib.safe_get(t, ...)
	local current = t
	for _, k in ipairs({ ... }) do
		if not current or current[k] == nil then return false end
		current = current[k]
	end
	return current
end

-- Returns a copy of the provided list sorted based on the provided function.
function MadLib.get_sorted_list(list,func)
    local sorted_table = MadLib.deep_copy_list(list)
    table.sort(sorted_table, func(a, b))
    return list
end

function MadLib.merge_tables(primary, secondary, no_replace, bypass_check)
    if not bypass_check and (not_proper_table(primary) or not_proper_table(secondary)) then return false end
    for k, v in pairs(secondary) do
        primary[k] = no_replace and (primary[k] or v) or v
    end
    return true
end

-- Ditto, but doesn't do keys - just values.
-- merge into_list
function MadLib.merge_lists(primary, secondary, allow_dupes, bypass_check)
    if not bypass_check and (not_proper_table(primary) or not_proper_table(secondary)) then return false end
    for i=1, #secondary do
        local pass = true
        -- if no dupes are allowed...
        if not allow_dupes then
            -- make sure it isn't already in the list
            for j=1, #primary do
                if secondary[i] == primary[j] then
                    pass = false
                    break
                end
            end
        end
        if pass then table.insert(primary, secondary[i]) end
    end
    return true
end

function MadLib.transfer_to_new_table(t1,t2)
    for k,v in pairs(t1) do
        if t2[k] == nil then -- new table
            t2[k] = v
        else
            for _, v2 in pairs(v) do -- add to pre-existing table
                table.insert(t2[k], v2)
            end
        end
    end
end

-- Makes a combined list made up of multiple lists.
function MadLib.get_combined_list(...)
    local args = {...}
    if not args or #args < 2 then return {} end -- can't combine
    for _, t in pairs(args) do
        if not_proper_table(t) then return {} end
    end
    local merged = {}
    MadLib.loop_func(args, function(_list)
        MadLib.loop_func(_list, function(_entry)
            table.insert(merged,_entry)
        end)
    end)
    return merged
end

function MadLib.explode(sep, str)
	sep = tostring(sep)
	if not sep or sep == '' then return nil end
	local ret, pos = {}, 1
	for i = 1, string.len(str) do
		local _p1, _p2 = string.find(str, sep, pos, false)
		if not _p1 then break end
		ret[i] = string.sub(str, pos, _p1 - 1)
		pos = _p2 + 1
	end
	table.insert(ret,string.sub(str, pos))
	return ret
end

-- Returns a table with a key and a path
function MadLib.key_path(_k, _p)
    return { key = _k, path = _p }
end

-- Key and path are same, e is extension (e.g. ogg)
function MadLib.keypath_simple(k,e)
    local path = k..'.'..e
    return MadLib.key_path(k, path)
end

-- Key and path are same, e is extension (e.g. ogg)
function MadLib.keypath_simple_loop(k,e,n)
    local _path, _list = k..'.'..e, {}
    return { list = MadLib.number_func(n, function(v,i)
        return MadLib.key_path(k, _path .. tostring(i))
    end)}
end
function MadLib.event(contents)
    G.E_MANAGER:add_event(Event(contents))
end

-- Ditto, but only focuses on trigger, delay, and function.
-- Requires a function to operate.
function MadLib.simple_event(_f, _d, _t, _b)
    if not_proper_func(_f) then
        print('ERROR! Not a proper func!')
        return false
    end
    MadLib.event({
        trigger     = _t, -- or "immediate",
        delay       = _d, -- or 0.08,
        func        = _f,
        blockable   = _b -- or false
    })
    return true
end

-- Easier way of doing the vars thing
function MadLib.collect_vars(...)
    local args = {...}
    return { vars = args }
end

function MadLib.add_to_queue(...)
    local args = {...}
    if not args or #args < 2 then return false end
    for i=2, #args do info_queue[#info_queue + 1] = args[i] end
    return true
end

function MadLib.collect_vars_colours(...)
    local args = {...}
    local v,c = MadLib.list_pick_range(args, 1, #args-1), args[#args]
    v.colours = c
    return { vars = v }
end

-- Creates an atlas object
function MadLib.create_atlas(_k, _p, _x, _y)
    return { object_type = 'Atlas', key = _k, path = _p, px = (_x or 71), py = (_y or 95) }
end

-- Creates an animated atlas object.
function MadLib.create_anim_atlas(key, path, frms, px, py)
    local atlas = MadLib.create_atlas(key, path, px, py)
    atlas['frames'] = frms or 21
    return atlas
end

-- Creates an atlas with identical height and width.
function MadLib.create_square_atlas(key, path, size)
    return MadLib.create_atlas(key, path, size, size)
end

-- Creates an atlas for a Blind icon.
function MadLib.create_blind_atlas(_k, _p, _f)
    local atlas = MadLib.create_atlas(_k, _p, 34, 34)
    atlas['frames'] = _f or 21
    atlas['atlas_table'] = 'ANIMATION_ATLAS'
    return atlas
end

function MadLib.swap(list, i, j)
    if not (list and list[i] and list[j]) then return end
    list[i], list[j] = list[j], list[i]
end

-- TODO: Move subhands to Madcap?
function MadLib.base_cm_mod(hand,poker_info,data)
    if not hand then return nil end
    -- For use with Madcap and Pacdam.
    return hand, poker_info, data
end
