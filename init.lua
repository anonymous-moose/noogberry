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
	groups = {cracky=3},
	on_use = minetest.item_eat(6)
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
	groups = {cracky=3},
	on_use = minetest.item_eat(6)
})
minetest.register_node("noogberry:noogberry_vine", {
	description = "Noogberry vine",
	tiles = {"noogberry_noogberry_vine.png"},
	walkable = false,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	visual_scale = 1.2,
	inventory_image = "noogberry_noogberry_vine.png",
	groups = {cracky=3},
})
minetest.register_node("noogberry:noogberry_vine_connector", {
	description = "Noogberry vine",
	tiles = {"noogberry_noogberry_vine_connector.png"},
	walkable = false,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	visual_scale = 1.2,
	inventory_image = "noogberry_noogberry_vine_connector.png",
	groups = {cracky=3},
})

minetest.register_node("noogberry:noogberry_seeds", {
	description = "Noogberry seeds",
	tiles = {"noogberry_noogberry_seeds.png"},
	walkable = false,
	drawtype = "signlike",
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "noogberry_noogberry_seeds.png",
	groups = {cracky=3},
	paramtype2 = "wallmounted",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})
minetest.register_node("noogberry:noogberry_vine_sprout", {
	description = "Noogberry vine sprout",
	tiles = {"noogberry_noogberry_vine_sprout.png"},
	walkable = false,
	drawtype = "plantlike",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "noogberry_noogberry_vine_sprout.png",
	groups = {cracky=3},
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
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.015,
		scale = 0.02,
		spread = {x=100, y=100, z=100},
		seed = 436,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"grassland"},
	y_min = 0,
	y_max = 10,
	decoration = "noogberry:noogberry_vine_sprout",
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 300,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.z = pos.z + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 301,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.z = pos.z + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_orange"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 302,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.z = pos.z - 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 303,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.z = pos.z - 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_orange"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 304,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.x = pos.x - 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 305,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.x = pos.x - 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_orange"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 306,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.x = pos.x + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry"})
	end,
})
minetest.register_abm(
	{nodenames = {"noogberry:noogberry_vine_sprout"},
	interval = 307,
	chance = 10,
	action = function(pos)
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine"})
		pos.y = pos.y + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.x = pos.x + 1
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_vine_connector"})
		pos.y = pos.y - 2
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z},{name="noogberry:noogberry_orange"})
	end,
})