# def someting(*words)
#   sorted = false
#
#   while sorted == false
#     in_order = true
#     words.each_with_index do |current_word, index|
#       next_word = words[index + 1]
#       if !next_word.nil?
#         unless current_word[0].ord <= next_word[0].ord
#           words.insert(index + 1, words.delete_at(index))
#           in_order = false
#         end
#       end
#     end
#
#     if in_order
#       sorted = true
#     end
#   end
#   words
# end
def blow_stuff_up
  begin
    puts "Nil is an object"
  rescue Exception => ex
    puts ex.message
  end
end
