function MadLib.is_animation_enabled()
    return true -- add config check here
end

-- Talisman compatability
if Talisman then
    function MadLib.compare_numbers(a,b,and_equals)
        local v1 = type(a) == 'number' and to_big(a)
        local v2 = type(b) == 'number' and to_big(b)
        return (v1 and v2) and ((and_equals and v1 >= v2) or (v1 > v2)) or false
    end

    local animation_enabled_ref = MadLib.is_animation_enabled
    function MadLib.is_animation_enabled()
        return Talisman.config_file.disable_anims
            and animation_enabled_ref()
    end
else

	function to_number(a)
		return a
	end

	function to_big(a)
		return a
	end

	function lenient_bignum(a)
		return a
	end

	function is_number(x)
		return type(x) == "number"
	end

	SMODS.Sound({
		key = "xchip",
		path = "xchip.ogg",
	})
	SMODS.Sound({
		key = "xscore",
		path = "xscore.ogg",
	})
	SMODS.Sound({
		key = "emult",
		path = "emult.ogg",
	})
	SMODS.Sound({
		key = "echip",
		path = "echip.ogg",
	})
	SMODS.Sound({
		key = "escore",
		path = "escore.ogg",
	})

    local smods_xchips = false
	for _, v in pairs(SMODS.calculation_keys) do
		if v == "x_chips" then
			smods_xchips = true
			break
		end
	end
end
