MadLib.EffectData  = {}
MadLib.SpriteData  = {}
MadLib.game_data = {}

function MadLib.register_effect(id, data)
    MadLib.EffectData[id] = data
    data.frame      = 1
    data.max_frame  = data.max_frame or 20
    data.duration   = data.duration or 60
    data.fps        = data.fps or 20
    data.tfps       = data.tfps or 20
    data.xspd       = data.xspd or 0
    data.yspd       = data.yspd or 0
    --data.func
end

function MadLib.register_sprite(id, data)
    MadLib.SpriteData[id] = data
    data.key              = id
end

function MadLib.spawn_effect(id, xx, yy)
    if not (type(MadLib.EffectData[id]) == 'table') then return end
    local effect = MadLib.deep_copy(MadLib.EffectData[id])
    if effect.sound then play_sound(effect.sound) end
    effect.key  = id
    effect.xpos = xx
    effect.ypos = yy
    G.effect_manager[#G.effect_manager+1] = { effect }
end

function MadLib.dt_event(type, tick)
	if type == 'effect_manager' then
		for i = 1, #G.effect_manager do
			local gem = G.effect_manager[i]
            if gem and gem[1] then
                if gem[1] ~= nil and gem[1].duration >= -1 then
                    _eff 			= gem[1]
                    _eff.tfps 		= _eff.tfps + 1
                    _eff.duration 	= _eff.duration - 1

                    if 
                        _eff.tfps > (100 / _eff.fps) 
                        and _eff.fps ~= 0 
                    then
                        _eff.frame = _eff.frame + 1
                        _eff.tfps = 0
                    end

                    if _eff.frame > _eff.max_frame then
                        _eff.frame = 1
                    end
                elseif gem[1].duration ~= nil and gem[1].duration <= 0 then
                    G.effect_manager[i] = nil
                end
			end
		end
	end
end

--- LOADS IMAGE DATA
function MadLib.load_image(path)
    local file          = assert(NFS.newFileData(path),("Epic fail"))
    local temp_data     = assert(love.image.newImageData(file),("Epic fail 2"))
    return (assert(love.graphics.newImage(temp_data),("Epic fail 3")))
end

-- Load a spritesheet.
function MadLib.load_spritesheet(path, px, py, subimg, orientation)
    local file          = assert(NFS.newFileData(path),("Epic fail"))
    local temp_data     = assert(love.image.newImageData(file),("Epic fail 2"))
    local temp_image    = assert(love.graphics.newImage(temp_data),("Epic fail 3"))

    local spritesheet = {}
    for i = 1, subimg do
        if orientation == 0 then -- 0 = downwards spritesheet
            table.insert(spritesheet,love.graphics.newQuad(0, (i-1)*py, px, py, temp_image))
        end
        if orientation == 1 then -- 1 = rightwards spritesheet
            table.insert(spritesheet,love.graphics.newQuad((i-1)*px, 0, px, py, temp_image))
        end
    end
    return (spritesheet)
end

-- Update the delta timer.
function MadLib.update_delta()
    if #G.effect_manager > 0 then MadLib.dt_event('effect_manager', 0) end
    --if #G.effect_manager > 0 then MadLib.dt_event('effect_manager', 0) end
end
-- Update the delta timer.
function MadLib.update_ticks()
end

local upd = Game.update
-- Updates the game
function Game:update(dt)
	upd(self, dt)

    if not (G.SETTINGS.paused) then
        if not MadLib.ticks         then MadLib.ticks = 0 end
        if not MadLib.delta_timer   then MadLib.delta_timer = 0 end

        MadLib.delta_timer = MadLib.delta_timer + dt
        MadLib.delta = dt

        while MadLib.delta_timer >= 0.010 do
            MadLib.ticks        = MadLib.ticks + 1
            MadLib.delta_timer  = MadLib.delta_timer - 0.010
            MadLib.update_delta()
        end
    end

    -- Tick based events
    if math.fmod(MadLib.ticks, 8) == 0 then
    end
end

--- DRAW THE IMAGES

-- Get animation data for the object
function MadLib.get_anim_data(obj)
    local sprite    = MadLib.SpriteData[obj.key]

    local key       = obj.key
    local spr       = key .. '_sprite'
    if MadLib.game_data[key] == nil then MadLib.game_data[key] = MadLib.load_image(sprite.path) end
    if MadLib.game_data[spr] == nil then MadLib.game_data[spr] = MadLib.load_spritesheet(sprite.path, sprite.px, sprite.py, sprite.subimages, sprite.orientation or 0) end
    
    return MadLib.game_data[key], MadLib.game_data[spr], obj.frame, obj.xpos - (sprite.xoff or 0), obj.ypos - (sprite.yoff or 0)
end

-- Animates the images using LOVE stuff
function MadLib.animate_images()
    for i = 1, #G.effect_manager do
        local xscale = love.graphics.getWidth()/1920
        local yscale = love.graphics.getHeight()/1080
        if 
            G.effect_manager[i]
            and G.effect_manager[i][1]
        then
            local image, quad, index, xpos, ypos = MadLib.get_anim_data(G.effect_manager[i][1])
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(image, quad[index], xpos, ypos, 0 , xscale, yscale)
        end
    end
end

local draw_ref = Game.draw
function Game:draw()
    draw_ref(self)
    
    --[[
    love.graphics.setColor(1, 1, 1, 1) 
    love.graphics.print("ticks:" .. MadLib.ticks, 300, 16)
    love.graphics.print("dtcounter:" .. MadLib.delta_timer, 300, 16+32)
    love.graphics.print("dt:" .. MadLib.delta, 300, 16+64)
    ]]
end