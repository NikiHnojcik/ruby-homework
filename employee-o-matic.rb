class Employee
  attr_accessor :full_name
  attr_accessor :id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end
  def surname
    @full_name.split(' ', 2).last
  end
	 def name
    @full_name.split(' ', 2).first
  end
end

class Programmer < Employee
  attr_accessor :languages

  def initialize(full_name, id, languages)
    super(full_name, id)
    @languages = languages
  end
end

class OfficeManager < Employee
  attr_accessor :office

  def initialize(full_name, id, office)
    super(full_name, id)
    @office = office
  end
end


def add_employee(employees)
  puts '[Add an employee]'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp

	puts 'Is the person an [e]mployee, [p]rogrammer or an [o]ffice manager?'
	type_choice = gets.chomp
	case type_choice
	when 'e' then 
		employee = Employee.new(full_name, id)
	when 'p' then 
		puts "Which programming languages do they know?"
		langs = gets.chomp
		langs_list = langs.split(" ")
		employee = Programmer.new(full_name, id, langs_list)
	when 'o' then
		puts "Office address?"
		office = gets.chomp
		employee = OfficeManager.new(full_name,id, office)
	end  

  employees << employee
end

def view_employees(employees)
	puts "Sort by [f]irst name or [l]ast name?"
  sort = gets.chomp
	if sort == "l"
		choice = 1		
	elsif sort == "f"
		choice = 0
	end
	sorted_employees(employees, choice).each do |employee|
    	print "#{employee.full_name}, #{employee.id}"
			case employee
				when OfficeManager then puts " (#{employee.office})"
				when Programmer then puts " #{employee.languages}"
				else puts " "
			end
	end
end

def sorted_employees(employees, by)
	if by == 1
		employees.sort_by do |employee|
		  employee.surname
		end
	else 
		employees.sort_by do |employee|
		  employee.name
		end
	end
end

def edit_employees(employees)
   puts '[Edit an employee]'
	puts 'ID if the employee you want to edit:'
	req_ID = gets.to_i
	i = 0	
	employees.length.times do
		puts "#{i} #{employees[i].id} #{req_ID}"
		break if (employees[i].id.to_i == req_ID)
		i = i + 1
	end
	
	if i != employees.length

		puts "Current full name: #{employees[i].full_name}"
		print 'New full name: '
		full_name = gets.chomp
		print 'New ID: '
		id = gets.chomp
		employees[i].id = id
		employees[i].full_name = full_name
		case employees[i]
			when Programmer then puts "New programming languages:"
			employees[i].languages = gets.chomp.split(" ")
			when OfficeManager then puts "New office:"
			employees[i].office = gets.chomp
		end
	else puts 'nonexistant ID'	
	end

end

def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following:'
  puts 'a - to add a new employee'
  puts 'v - to view existing employees'
  puts 'q - to quit the program'
end

def get_action
   gets.downcase[0]
end

puts 'Employee-o-matic 4000'

employees = []

loop do
  print 'What do you want to do? '
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'v' then view_employees(employees)
  when 'e' then edit_employees(employees)
  when 'q' then quit
  else
    print_help
  end
end
