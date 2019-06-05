json.array! @boards do |board|
  json.id board.id
  json.board_name board.board_name
  json.board_description board.board_description
  json.position board.position
  json.lists board.lists do |list|
    json.id list.id
    json.list_name list.list_name
    json.list_description list.list_description
    json.position list.position
    # json.cards list.cards do |card|
    #   json.id card.id
    #   json.card_content card.card_content
    #   json.card_position card.position
    # end
  end
end
