local modname = "noogberry"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

local function grow_new_noogberry(pos)
	local grow_schematic

	if not default.can_grow(pos) then
		minetest.get_node_timer(pos):start(math.random(120, 300))
		return
	end
	minetest.remove_node(pos)
	if math.random(1, 2) == 1 then
		grow_schematic = "noogberry_orange_1"
	else
		grow_schematic = "noogberry_pink_1"
	end
	minetest.place_schematic({x = pos.x, y = pos.y, z = pos.z}, modpath.."/schematics/" .. grow_schematic .. ".mts", "random", nil, true)
end

if mg_name ~= "v6" and mg_name ~= "singlenode" then

	local name, place_on, biomes, offset, scale, schematic, place_offset_y, seed

	
	place_on = "default:dirt_with_grass"
	biomes = {"grassland", "deciduous_forest"}
	

	for i = 1, 2 do
		if i == 1 then
			name = "noogberry:orange_noogberry_plant"
			schematic = "noogberry_orange_1"
			offset = 0.008
			scale = 0.0004
			seed = 67
			place_offset_y = 1
		else
			name = "noogberry:pink_noogberry_plant"
			schematic = "noogberry_pink_1"
			offset = 0.005
			scale = 0.0003
			seed = 23
			place_offset_y = 1
		end
		minetest.register_decoration({
			name = name,
			deco_type = "schematic",
			place_on = place_on,
			sidelen = 16,
			noise_params = {
				offset = offset,
				scale = scale,
				spread = {x = 250, y = 250, z = 250},
				seed = seed,
				octaves = 3,
				persist = 0.66
			},
			biomes = {biomes},
			y_min = 1,
			y_max = 80,
			schematic = modpath .. "/schematics/" .. schematic .. ".mts",
			flags = "place_center_x, place_center_z, force_placement",
			rotation = "random",
			place_offset_y = place_offset_y,
		})
	end
end


minetest.register_node("noogberry:noogberry", {
	description = "Pink Noogberry",
	tiles = {"noogberry_noogberry.png"},
	walkable = false,
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	visual_scale = 1.5,
	light_source = 4,
	inventory_image = "noogberry_noogberry.png",
	groups = {snappy=3},
	on_use = minetest.item_eat(6),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("noogberry:noogberry_orange", {
	description = " Orange Noogberry",
	tiles = {"noogberry_noogberry_orange.png"},
	walkable = false,
	drawtype = "plantlike",
	sunlight_propagates = true,
	paramtype = "light",
	visual_scale = 1.5,
	light_source = 4,
	inventory_image = "noogberry_noogberry_orange.png",
	groups = {snappy=3},
	on_use = minetest.item_eat(6),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("noogberry:noogberry_vine", {
	description = "Noogberry vine",
	tiles = {"noogberry_noogberry_vine.png"},
	walkable = false,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	selection_box = {
        type = "fixed",
        fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
    },

	inventory_image = "noogberry_noogberry_vine.png",
	groups = {snappy=3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("noogberry:noogberry_vine_connector", {
	description = "Noogberry vine",
	tiles = {"noogberry_noogberry_vine_connector.png"},
	walkable = false,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	visual_scale = 1.2,
	inventory_image = "noogberry_noogberry_vine_connector.png",
	groups = {snappy=3},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("noogberry:noogberry_seeds", {
	description = "Noogberry seeds",
	tiles = {"noogberry_noogberry_seeds.png"},
	walkable = false,
	drawtype = "signlike",
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "noogberry_noogberry_seeds.png",
	groups = {snappy=3},
	paramtype2 = "wallmounted",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("noogberry:noogberry_vine_sprout", {
	description = "Noogberry vine sprout",
	tiles = {"noogberry_noogberry_vine_sprout.png"},
	walkable = false,
	on_timer = grow_new_noogberry,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	inventory_image = "noogberry_noogberry_vine_sprout.png",
	groups = {snappy=3},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(60, 120))
	end,
})

minetest.register_craft({
	output = "noogberry:noogberry_seeds 2",
	recipe = {
		{"noogberry:noogberry"}
	}
})
minetest.register_craft({
	output = "noogberry:noogberry_seeds 2",
	recipe = {
		{"noogberry:noogberry_orange"}
	}
})

minetest.register_abm(
	{nodenames = {"noogberry:noogberry_seeds"},
	interval = 30,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos,{name="noogberry:noogberry_vine_sprout"})
	end,
})
