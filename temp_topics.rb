topics = AssetClass.find_by_name("stocks_mid_cap").topics

topics.each do |topic|
  topic.update_attributes(trading: false)
end

topics = AssetClass.find_by_name("stocks_small_cap").topics

topics.each do |topic|
  topic.update_attributes(trading: false)
end