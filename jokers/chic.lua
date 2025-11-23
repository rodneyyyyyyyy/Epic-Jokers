
SMODS.Joker{ --chic
    key = "chic",
    config = {
        extra = {
            blind_size = 2
        }
    },
    loc_txt = {
        ['name'] = 'chic',
        ['text'] = {
            [1] = 'If {C:attention}poker hand{} is a',
            [2] = '{C:attention}Straight Flush{}, X0.5 blind',
            [3] = 'requirement'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "epicjokers_epic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["epicjokers_epicjokers_jokers"] = true },
    soul_pos = {
        x = 7,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "Straight Flush" then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Halved!", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips / card.ability.extra.blind_size
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                }
            end
        end
    end
}