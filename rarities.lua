SMODS.Rarity {
    key = "epic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('f0a63a'),
    loc_txt = {
        name = "Epic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}