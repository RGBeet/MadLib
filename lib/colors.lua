-- converts hex code (e.g. #446688) to rgb value
local function hex_to_rgb(hex)
    hex = hex:gsub("#","")
    return tonumber(hex:sub(1,2),16),
           tonumber(hex:sub(3,4),16),
           tonumber(hex:sub(5,6),16)
end

-- converts rgb values to a hex cod
local function rgb_to_hex(r, g, b)
    return string.format("#%02X%02X%02X", r, g, b)
end

-- uses previous two functions to mix two colours
function MadLib.mix_hex_colors(hex1, hex2, t)
    local r1, g1, b1 = hex_to_rgb(hex1)
    local r2, g2, b2 = hex_to_rgb(hex2)
    local mix = function(a, b) return math.floor(a + (b - a) * t + 0.5) end
    return rgb_to_hex(mix(r1, r2), mix(g1, g2), mix(b1, b2))
end

-- Gets a color based on whether the
function MadLib.get_warning_colour(p)
    local percent = MadLib.clamp(p,0,1)
    return percent < 0.5
        and G.C.RED -- MadLib.mix_hex_colors(G.C.RED, G.C.GOLD, percent / 0.5)
    or percent < 1.0
        and G.C.GOLD -- MadLib.mix_hex_colors(G.C.GOLD, G.C.GREEN, (percent - 0.5) / 0.5)
    or G.C.GREEN
end
