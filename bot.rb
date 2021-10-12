# Loop limit based on configured screen settings.
number      = File.read("data/config/line_num.txt").strip.to_i
do_size     = ["tiny", "small", "medium"]
size_chosen = do_size[number]
size_limit  = size_chosen.size.to_i

# Character name chosen from number
name_number = File.read("data/identity/number.txt").strip.to_i

character_count = 2 # name_list[name_number].size.to_s
# name_limit = 0

# Base dialogue sequence on size limit.
size_limit.times do

  # Username logistics
  name_list   = File.read("data/identity/name_list.txt").split(", ")
  name        = name_list[name_number].to_s
  name_limit  = name_list[name_number].size

  if name_limit > character_count
    name_limit = name_limit % 2
  else
    name_limit = name_limit + 1
  end

  old_dialogue = File.read("archive/dialogue.txt").strip.to_s

  # Write date to file.
  system("date > data/date/date.txt")

  date = File.read("data/date/date.txt").strip

  # Print character dialogue to screen.
  print "[#{date} #{name.strip}] "; new_dialogue = gets.chomp

  # If writer specifies exit then aborts
  if new_dialogue == "exit"
    abort
  end

  # Autosaves dialogue archive. Auto appends old dialogue above new dialogue.
  open("archive/dialogue.txt", "w") { |f|
    f.puts old_dialogue
    f.print "[#{date} #{name.strip}] "
    f.puts new_dialogue
  }

  # Changes name as if in a chatroom.
  if name_number == name_limit
    name_number = 0
  else
    name_number = name_number + 1
  end
end
