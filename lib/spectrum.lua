local Bunco     = next(SMODS.find_mod('Bunco'))
local Paperback = next(SMODS.find_mod('paperback'))
local Framework = next(SMODS.find_mod('SpectrumFramework'))

MadLib.SpectrumId = (Bunco and 'bunc_')
    or (Paperback and 'paperback_')
    or (Framework and 'spectrum_') -- would really reccomend at least installing this
    or 'na'

function MadLib.spectrum_played(context)
    if type(context) ~= 'table' or not context.poker_hands then return false end
    local spectrum = MadLib.SpectrumId .. 'Spectrum'
    return context.poker_hands[spectrum]
end
