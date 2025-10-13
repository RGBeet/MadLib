local function not_real_number(n)
    return type(n) ~= "number" or n < 0
end

-- Returns whether the number is a perfect square
function MadLib.is_perfect_square(n)
    if not_real_number(n) then return false end
    local root = math.floor(math.sqrt(n))
    return root * root == n
end

function MadLib.is_triangular(n)
    if not_real_number(n) then return false end
    local root = math.sqrt(8 * n + 1)
    return n > 0 and root == math.floor(root)
end

function MadLib.is_pentagonal(n)
    if not_real_number(n) then return false end
    return n * (3 * n - 1) / 2
end

-- Returns whether the number is a Fibonacci number
function MadLib.is_fibonacci(n)
    if not_real_number(n) then return false end
    local fnts = (5 * n^2)
    return (type(n) ~= "number" or n < 0) and false
        or (MadLib.is_perfect_square(fnts+4) or MadLib.is_perfect_square(fnts-4))
end

-- Returns whether the number is a prime number
function MadLib.is_prime(n)
    if not_real_number(n) then return false end
    for i=2,n do if n % i == 0 then return false end; end
    return true
end

-- Can't just say NOT prime
function MadLib.is_composite(n)
    if not_real_number(n) then return false end
    for i=2,n do if n % i == 0 then return true end; end
    return false
end

function MadLib.check_pattern_rank(_func, _card)
    return _card and _func and _func(math.floor(_card.base.nominal) or false) or false
end

-- For number ranks, returns a table
-- showing if they are even/odd, prime, and/or Fibonacci
function MadLib.check_numbered_rank(k)
    if
        not k
        or type(k) ~= 'string'
        or tonumber(k) == nil
    then
        return nil
    end

    local tn = tonumber(k)
    local w,str = (tn%1 == 0), tostring(tn)

    return {
        rank    = k,
        whole   = w,
        even    = w and tn % 2 == 0,
        odd     = w and tn % 2 == 1,
        prime   = w and MadLib.is_prime(tn),
        fib     = w and MadLib.is_fibonacci(tn),
        square  = w and MadLib.is_perfect_square(tn),
        triangular = w and MadLib.is_triangular(tn),
    }
end

local rank_patterns = { -- temp list to merge into RankTypes
    ['Odd']         = {'Ace'},
    ['Even']        = {},
    ['Prime']       = {'Ace'},
    ['Fibonacci']   = {'Ace'},
    ['Square']      = {'Ace'},
    ['Triangular']  = {'Ace'}
}
local function process_ranks(n,val)
    print('Loading the Number ' .. ' "' .. tostring(n.rank) .. '"...')
    if n.even       then table.insert(rank_patterns['Even'], val)         end
    if n.odd        then table.insert(rank_patterns['Odd'], val)          end
    if n.prime      then table.insert(rank_patterns['Prime'], val)        end
    if n.fib        then table.insert(rank_patterns['Fibonacci'], val)    end
    if n.square     then table.insert(rank_patterns['Square'], val)       end
    if n.triangular then table.insert(rank_patterns['Triangular'], val)   end
end
for i=2,10 do process_ranks(MadLib.check_numbered_rank(tostring(i)), tostring(i)) end
print(rank_patterns)
for k,_ in pairs(MadLib.RankIds) do process_ranks(MadLib.check_numbered_rank(k), tostring(i)) end
MadLib.merge_tables(MadLib.RankTypes,rank_patterns)
