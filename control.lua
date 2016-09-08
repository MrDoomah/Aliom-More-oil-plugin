-- aliom ignores infinte resources by default, so we need to tell it that we do want it to process oil

function add_oil()
	for name,version in pairs(game.active_mods) do
		if name == "aliom" and remote.interfaces.aliom.add_resource then 
			local ore_name = "crude-oil"
			local richness = {["none"] = 1, ["very-low"] = 1, ["low"] = 1, ["normal"] = 1, ["high"] = 1, ["very-high"] = 1}
			local spawn_chance = 1/5
			local new_name = "rich-crude-oil"
			remote.call("aliom","add_resource",ore_name,richness,spawn_chance,new_name)
			break
		end
	end
end

script.on_init(add_oil)
script.on_configuration_changed(add_oil)