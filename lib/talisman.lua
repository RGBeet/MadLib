function MadLib.is_animation_enabled()
    return true -- add config check here
end

-- Talisman compatability
if Talisman then
    local animation_enabled_ref = MadLib.is_animation_enabled
    function MadLib.is_animation_enabled()
        return (not Talisman.config_file.disable_anims) and animation_enabled_ref()
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
		key = "emult",
		path = "emult.ogg",
	})
	SMODS.Sound({
		key = "echip",
		path = "echip.ogg",
	})

    local smods_xchips = false
	for _, v in pairs(SMODS.calculation_keys) do
		if v == "x_chips" then
			smods_xchips = true
			break
		end
	end
end

SMODS.Sound({
	key = "xscore",
	path = "xscore.ogg",
})
SMODS.Sound({
	key = "escore",
	path = "escore.ogg",
})