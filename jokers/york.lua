
SMODS.Joker{ --york
    key = "york",
    config = {
        extra = {
            hleft = 15,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'york',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}X1{} Mult every 15 {C:inactive}(#1#){}',
            [2] = 'cards scored {C:inactive}(Currently{} {X:mult,C:white}X#2#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["epicjokers_epicjokers_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.hleft, card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.hleft or 0)) ~= to_big(1) then
                card.ability.extra.hleft = math.max(0, (card.ability.extra.hleft) - 1)
            elseif to_big((card.ability.extra.hleft or 0)) == to_big(1) then
                card.ability.extra.hleft = 15
                card.ability.extra.xmult = (card.ability.extra.xmult) + 1
                return {
                    message = "Upgrade!"
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