local files = {
    'pre',                  -- ???
    'loop',                 -- ???
    'lists',                -- ???
    'major_functions',      -- ???
    'numbers',              -- ???
    'hooks',                -- ???
    'card',                 -- ???
    'exponentials',         -- ???
    'blind',                -- ???
    'colors',               -- ???
    'rank_compat',          -- ???
    'misc_functions',       -- ???
    'rarity',               -- ???
    'score',                -- ???
    'spectrum',             -- ???
    'talisman',             -- ???
    'joker_display',        -- ???
    'weighted_selection',   -- ???
    'load_content',         -- ???
}

for i=1,#files do
    assert(SMODS.load_file("lib/" .. files[i] .. ".lua"))()
end











