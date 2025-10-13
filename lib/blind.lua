function Blind:add_chips(chadd,wiggle)
	G.GAME.blind.chips = G.GAME.blind.chips + chadd
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	if wiggle then G.GAME.blind:wiggle() end
	return true
end

function Blind:multiply_chips(chult,wiggle)
	G.GAME.blind.chips = math.floor(G.GAME.blind.chips * chult)
	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	if wiggle then G.GAME.blind:wiggle() end
	return true
end
