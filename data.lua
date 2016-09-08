require "util" 

local oil = util.table.deepcopy(data.raw.resource["crude-oil"])
local target = 0.25
local drill = {mining_speed = 1, mining_power = 2}

oil.name = "rich-crude-oil"
oil.localised_name = "Rich crude oil"
oil.infinite = true
oil.autoplace = nil
oil.map_color = {r=0.95, g=0.25, b=0.95}
oil.minimum = math.ceil(oil.normal * target * oil.minable.mining_time / ((drill.mining_power - oil.minable.hardness) * drill.mining_speed)) --> results in mining rate = target

log(oil.localised_name .. ": minimum / normal = " .. oil.minimum .. " / " .. oil.normal)

oil.localised_description = "Yield reduces to " .. math.floor((100 * oil.minimum / oil.normal) + 0.5) .. "% (" .. target .. "/s)"

-- Oil only has 1 stage so no conversion is needed, plus the stage has value 0 and results in some errors
-- for i = 1,#oil.stage_counts do
	-- local relative_scale = oil.stage_counts[i]/oil.stage_counts[1]
	-- oil.stage_counts[i] = math.ceil(relative_scale * oil.normal + (1-relative_scale)*oil.minimum)
-- end
data:extend({oil})