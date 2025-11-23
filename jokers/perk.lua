
SMODS.Joker{ --perk
    key = "perk",
    config = {
        extra = {
            odds = 2,
            odds2 = 2,
            odds3 = 2
        }
    },
    loc_txt = {
        ['name'] = 'perk',
        ['text'] = {
            [1] = 'When a {C:attention}consumable{} is used,',
            [2] = '{C:green}1 in 2{} chance to create a',
            [3] = '{C:dark_edition}Negative{} copy of a {C:attention}consumable{}',
            [4] = 'in your possession of the same type'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_epicjokers_perk') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' then
                if SMODS.pseudorandom_probability(card, 'group_0_e4c2ed0c', 1, card.ability.extra.odds, 'j_epicjokers_perk', false) then
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            if consumable.ability.set == "Tarot" then
                                table.insert(target_cards, consumable)
                            end
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_card = copy_card(card_to_copy)
                                    copied_card:set_edition("e_negative", true)
                                    copied_card:add_to_deck()
                                    G.consumeables:emplace(copied_card)
                                    
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' then
                if SMODS.pseudorandom_probability(card, 'group_0_c262d16d', 1, card.ability.extra.odds, 'j_epicjokers_perk', false) then
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            if consumable.ability.set == "Planet" then
                                table.insert(target_cards, consumable)
                            end
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_card = copy_card(card_to_copy)
                                    copied_card:set_edition("e_negative", true)
                                    copied_card:add_to_deck()
                                    G.consumeables:emplace(copied_card)
                                    
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            elseif context.consumeable and context.consumeable.ability.set == 'Spectral' then
                if SMODS.pseudorandom_probability(card, 'group_0_398821dd', 1, card.ability.extra.odds, 'j_epicjokers_perk', false) then
                    SMODS.calculate_effect({func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            if consumable.ability.set == "Spectral" then
                                table.insert(target_cards, consumable)
                            end
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_card = copy_card(card_to_copy)
                                    copied_card:set_edition("e_negative", true)
                                    copied_card:add_to_deck()
                                    G.consumeables:emplace(copied_card)
                                    
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}