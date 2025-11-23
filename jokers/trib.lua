
SMODS.Joker{ --trib
    key = "trib",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'trib',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}X0.5{} Mult when a played',
            [2] = 'King or Queen is scored. Resets when any',
            [3] = 'other rank is scored',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "epicjokers_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["epicjokers_mycustom_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 13 or context.other_card:get_id() == 12) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                return {
                    message = "Upgrade!"
                }
            elseif (not (context.other_card:get_id() == 13) and not (context.other_card:get_id() == 12)) then
                card.ability.extra.xmult = 1
                return {
                    message = "Reset"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}