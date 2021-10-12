# Loop limit based on configured screen settings.
number      = File.read("data/config/line_num.txt").strip.to_i
do_size     = ["tiny", "small", "medium"]
size_chosen = do_size[number]
size_limit  = size_chosen.size.to_i

puts "#{title}"

# Character name chosen from number
name_number = File.read("data/identity/number.txt").strip.to_i

# Base dialogue sequence on size limit.
size_limit.times do
  old_dialogue = File.read("archive/dialogue.txt").strip.to_s

  # Username logistics
  name_list   = File.read("data/identity/name_list.txt").split(", ")
  name        = name_list[name_number]
  name_limit  = name_list[name_number].size.to_i

  # Write date to file.
  system("date > data/date/date.txt)

  date = File.read("data/date/date.txt).strip.to_i

  # Print character dialogue to screen.
  print "[#{date} #{name}] "; new_dialogue = gets.chomp

  # Autosaves dialogue archive. Auto appends old dialogue above new dialogue.
  open("archive/dialogue.txt", "w") { |f|
    f.puts old_dialogue
    f.puts new_dialogue
  }

  # If writer specifies exit then aborts
  if dialogue == "exit"
    abort
  end

  # Changes name as if in a chatroom.
  if name_number == name_limit
    name_number = 0
  else
    name_number = name_number + 1
  end
end
