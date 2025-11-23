
SMODS.Joker{ --cano
    key = "cano",
    config = {
        extra = {
            ogj = 0,
            ogq = 0,
            ogk = 0,
            xmult = 1,
            jacksindeck = 0,
            queensindeck = 0,
            kingsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'cano',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}X0.75{} Mult when a {C:attention}face{} card',
            [2] = 'is added to the deck',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#4#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
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
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'sou' 
            or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.ogj, card.ability.extra.ogq, card.ability.extra.ogk, card.ability.extra.xmult, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)(), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)(), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.playing_card_added  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card:get_id() == 11 then
                        count = count + 1
                    end
                end
                return to_big(count) > to_big(card.ability.extra.ogj)
            end)() or (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card:get_id() == 12 then
                        count = count + 1
                    end
                end
                return to_big(count) > to_big(card.ability.extra.ogq)
            end)() or (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if playing_card:get_id() == 13 then
                        count = count + 1
                    end
                end
                return to_big(count) > to_big(card.ability.extra.ogk)
            end)()) then
                return {
                    func = function()
                        card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                        return true
                    end,
                    message = "Upgrade!",
                    extra = {
                        func = function()
                        card.ability.extra.ogj = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)()
                            return true
                        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                            card.ability.extra.ogq = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)()
                                return true
                            end,
                            colour = G.C.BLUE,
                            extra = {
                                func = function()
                                card.ability.extra.ogk = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()
                                    return true
                                end,
                                colour = G.C.BLUE
                            }
                        }
                    }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                card.ability.extra.ogj = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 11 then count = count + 1 end end; return count end)()
                    return true
                end,
                extra = {
                    func = function()
                    card.ability.extra.ogq = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 12 then count = count + 1 end end; return count end)()
                        return true
                    end,
                    colour = G.C.BLUE,
                    extra = {
                        func = function()
                        card.ability.extra.ogk = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}