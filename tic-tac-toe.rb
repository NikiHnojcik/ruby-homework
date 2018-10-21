fields = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

def print_game_field(fields)
	i = 0
	3.times do
		puts "\[ #{fields[i]} \] \[ #{fields[i+1]} \] \[ #{fields[i+2]} \]"
		i = i + 3
	end
end
player = 0
choice = 0
while true do
	print_game_field(fields)	
	puts "Player \'#{player}\' move."
	if player == 0
		loop do
				puts "Where do you want to put a circle [0-8]?"
				choice = gets.to_i
			break if (fields[choice] != 'O' && fields[choice] != 'X')
		end		
		fields[choice] = 'O'
		player = 1
	else 
		loop do
				puts "Where do you want to put a cross [0-8]?"	
				choice = gets.to_i
			break if (fields[choice] != 'O' && fields[choice] != 'X')
		end
		fields[choice] = 'X'
		player = 0
	end
	
	
end

