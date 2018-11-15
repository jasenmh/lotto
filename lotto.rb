#!/usr/bin/env ruby

def get_number
	printf 'Enter the ticket number: '
	number = gets.chomp
	number.split
end

def format_number(ticket_number)
	tn = ticket_number
	# "#{tn[0]} #{tn[1]} #{tn[2]} #{tn[3]} #{tn[4]} x#{tn[5]}"
	
	num = ""
	tn[0..-2].each do |digit|
		num += digit.length > 1 ? " "+digit : " 0"+digit
	end
	num += tn[-1].length > 1 ? " M"+tn[-1] : " M0"+tn[-1]

	num
end

def compare_numbers(ticket_number, winning_number)
	matching = 0
	multiplier = false

	winning_number[0..-2].each do |win_digit|
		ticket_number[0..-2].each do |test_digit|
			if win_digit == test_digit
				matching += 1 
			end
		end
	end

	multiplier = true if winning_number[-1] == ticket_number[-1]

	[ matching, multiplier ]
end

def result_is_winner(result)
	return true if ( result[0] >= 3 or result[1] )

	false
end

puts "Winning number first:"
winning_number = get_number

tickets = []
puts "Enter ticket numbers (enter to stop):"
while (ticket_number = get_number).length > 0
	tickets += [ ticket_number ]
end

printf("Winning Number: %s\n", format_number(winning_number))
puts " Win |   Ticket Number    | Matches | Multiplier "
	
tickets.each do |ticket_number|
	result = compare_numbers(ticket_number, winning_number)
	winner = result_is_winner(result) ? 'Y' : 'N'
	multiplier = result[1] ? 'Y' : 'N'
	puts "  #{winner}  |#{format_number(ticket_number)} |    #{result[0]}    |      #{multiplier}"
end
