# Loop limit based on configured screen settings.
number      = File.read("data/config/line_num.txt").strip.to_i
do_size     = ["tiny", "small", "medium"]
size_chosen = do_size[number]
size_limit  = size_chosen.size.to_i

puts "Transmission"

# Character name chosen from number
name_number = File.read("data/identity/number.txt").strip.to_i

size_limit.times do
  name_list   = File.read("data/identity/name_list.txt").split(", ")
  name        = name_list[name_number]

  system("date > data/date/date.txt)

  date = File.read("data/date/date.txt).strip.to_i

  print "[#{date} #{name}] "; dialogue = gets.chomp

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
