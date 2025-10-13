-- Loops through the list like a for loop, but applies one function.
-- Returns the number of times the function returns TRUE.
function MadLib.loop_func_list(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end -- prevent crash!
    local passes = 0
    for i=1, #loop do passes = passes + (func(loop[i],i) and 1 or 0) end
    return passes
end
MadLib.loop_func = MadLib.loop_func_list -- alias

-- Ditto, but designed for tables with key-value pairs.
function MadLib.loop_func_table(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end
    local passes = 0
    for k,v in pairs(loop) do passes = passes + (func(k,v) and 1 or 0) end
    return passes
end
MadLib.loop_table = MadLib.loop_func_table -- alias

function MadLib.loop_func_grid(loop_y, loop_x, func, bypass_check)
    if
        not bypass_check
        and (not_proper_table(loop_y)
        or not_proper_table(loop_x)
        or not_proper_func(func))
    then
        return -1
    end -- prevent crash!
    local passes = 0
    for i=1, #loop_y do
        for j=1, #loop_x do
            passes = passes + (func(loop_y[i],loop_x[j],i,j) and 1 or 0)
        end
    end
    return passes
end
MadLib.loop_grid = MadLib.loop_func_grid -- alias

-- Returns the item (if not nil)
function MadLib.get_loop_func(loop, func, bypass_check)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return {} end -- prevent crash!
    local nl = {}
    for i=1, #loop do
        local item = func(loop[i],i)
        if item ~= nil then nl[#nl+1] = loop[i] end
    end
    return nl
end

-- Ditto, but doesn't require a list - just a number.
function MadLib.number_func(n, func, bypass_check)
    if not bypass_check and (type(n) ~= 'number' or not_proper_func(func)) then return {} end -- prevent crash!
    local passes = 0
    for i=1, n do
        local item = func(i)
        passes = passes + (item and 1 or 0)
    end
    return passes
end

--MadLib.get_loop_func_number

-- Takes a list, loops through multiple functions.
function MadLib.loop_func_list_multi(loop, funcs, bypass_check, simultaneous)
    if not bypass_check and (not_proper_table(loop) or not_proper_func(func)) then return -1 end
    local passes = 0
    if simultaneous then -- pick an entry, loop through funcs
        for i=1, #loop do
            for j=1, #funcs do passes = passes + (funcs[j](loop[i]) and 1 or 0) end
        end
    else -- pick a func, loop through list
        for i=1, #func_list do
            for j=1, #loop do passes = passes + (funcs[i](loop[j]) and 1 or 0) end
        end
    end
    return true
end

function MadLib.loop_func_limited(loop_list,func,pts)
    if type(loop_list) ~= 'table' or type(func) ~= 'function' then return false end
    while i < #loop_list and n < pts do
        i = i+1
        if func(loop_list[i]) then n = n + 1 end
    end
    return n >= pts
end
MadLib.loop_func_lists = MadLib.loop_func_list_multi -- alias

-- loop func time
function MadLib.loop_check_func_limited(loop_list, check, func, pts)
    if type(loop_list) ~= 'table' or type(check) ~= 'function' or type(func) ~= 'function' then return false end
    local i,n = 0,0
    while i < #loop_list and n < pts do
        i = i+1
        if check(loop_list[i]) then
            n = n + 1
            func(loop_list[i])
        end
    end
    return n >= pts
end
