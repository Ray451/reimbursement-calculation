class Date
	def to_i
		self.to_date.to_i / (60*60*24)
	end
end
	
class project
	LOW_TRAVEL = 35
	LOW_FULL = 75
	HIGH_TRAVEL = 45
	HIGH_FULL = 85	
	attr_accessor :travel
	attr_accessor :full
	attr_accessor :first
	attr_accessor :last
	
	def initialize(city_type, first_day, last_day)
		if city_type == "low"
			travel = LOW_TRAVEL
			full = LOW_FULL
		else
			travel = HIGH_TRAVEL
			full = HIGH_FULL
		end

		first = first_day.to_i
		last = last_day.to_i
	end
end
	
def calculate(set)
	calendar = {}
	set.each do |project|	
		(project.first..project.last).each do |i|	
			if calendar.key? i	
				if calendar[i] != LOW_FULL	
					calendar[i] = project.full	
				end	
			else	
				if i == project.first || project.last	
					calendar[i] = project.travel	
				else	
					calendar[i] = project.full	
				end	
			end
		end	
	end

	calendar.values.sum	
	byebug
end
