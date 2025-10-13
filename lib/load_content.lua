-- File loading based on Cryptid mod lmao
local errors = {}
local load_data = function(folder)
    local files = NFS.getDirectoryItems(SMODS.current_mod.path .. folder)
	for _, file in ipairs(files) do
		print("Loading file "..file)
		local f, err = SMODS.load_file(folder .. "/" .. file)
		if err then
			errors[file] = err
		else
			local curr_obj = f()

            local modid = curr_obj.modid
            print('MOD ID is ' .. (modid or '???'))

            local loaded = modid and next(SMODS.find_mod(modid)) or true
            if loaded and curr_obj then
                local curr_obj  = curr_obj.init(curr_obj)
                local content   = curr_obj.content
                local p = curr_obj.prefix or ''

                -- a table containing keyed lists
                if content.JokerCategories then
                    MadLib.loop_table(content.JokerCategories, function(joker,list)
                        MadLib.loop_func(list, function(ref)
                            if ref == nil then return end
                            table.insert(ref,joker)
                        end)
                    end)
                end
                 if content.JokerRanks then
                    MadLib.loop_table(content.JokerRanks, function(joker,list)
                        MadLib.loop_func(list, function(rank)
                            MadLib.JokerLists.Rank[rank] = MadLib.JokerLists.Rank[rank] or {}
                            table.insert(MadLib.JokerLists.Rank[rank],joker)
                        end)
                    end)
                end
                 if content.JokerSuits then
                    MadLib.loop_table(content.JokerSuits, function(joker,list)
                        MadLib.loop_func(list, function(suit)
                            MadLib.JokerLists.Suit[suit] = MadLib.JokerLists.Suit[suit] or {}
                            table.insert(MadLib.JokerLists.Suit[suit],joker)
                        end)
                    end)
                end
                if content.BanLists then
                    MadLib.loop_table(content.BanLists, function(key,list)
                        MadLib.BanLists[key] = MadLib.BanLists[key] or {}
                        MadLib.loop_func(list, function(v) table.insert(MadLib.BanLists[key], v) end)
                    end)
                end
                if content.SuitTypes then
                    MadLib.loop_table(content.SuitTypes, function(key,list)
                        MadLib.SuitTypes[key] = MadLib.SuitTypes[key] or {}
                        MadLib.loop_func(list, function(v) table.insert(MadLib.SuitTypes[key], v) end)
                    end)
                end

                if content.SuitConversions then
                    MadLib.loop_table(content.SuitConversions, function(key,list)
                        MadLib.SuitConversions[key] = MadLib.SuitConversions[key] or {}
                        MadLib.loop_table(list, function(k,v)
                            MadLib.SuitConversions[key][k] = MadLib.SuitConversions[key][k] or {}
                            table.insert(MadLib.SuitConversions[key][k],v)
                        end)
                    end)
                end
                if content.PointValues then
                    MadLib.loop_table(content.PointValues, function(key,list)
                        MadLib.PointValues[key] = MadLib.PointValues[key] or {}
                        MadLib.loop_table(list, function(k,v)
                            MadLib.PointValues[key][k] = v
                        end)
                    end)
                end
                if content.Weights then
                    MadLib.loop_table(content.Weights, function(key,list)
                        MadLib.Weights[key] = MadLib.Weights[key] or {}
                        MadLib.loop_table(list, function(k,v)
                            MadLib.Weights[key][k] = v
                        end)
                    end)
                end
                if content.QuantumRanks then
                    MadLib.loop_table(content.QuantumRanks, function(key,data)
                        MadLib.QuantumRanks[key] = data
                    end)
                end
                if content.RarityValues then
                    MadLib.loop_table(content.RarityValues, function(key,data)
                        content.RarityValues[key] = data
                    end)
                end
                if content.RankCompat then
                    MadLib.loop_table(content.RankCompat, function(k,v)
                        if not MadLib.RankIds[k] then
                            MadLib.RankIds[k] = v
                            print('The id for Rank ' .. tostring(k) .. ' is now ' .. tostring(v) .. '.' )
                        end
                    end)
                end
                -- a table containing keyed lists
                if content.AbstractSuits then
                    MadLib.loop_func(content.AbstractSuits, function(v) table.insert(MadLib.AbstractSuits, v) end)
                end
            end
		end
	end
end

load_data('compat') -- load the items folder

-- File loading ended!
print(errors)
for f, e in ipairs(errors) do
    tell_stat("Error loading file",e)
end
