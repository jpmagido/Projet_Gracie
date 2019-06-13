module ApplicationHelper

	def name_nil(value)
		if value == nil || value == ""
			return "Non renseigné"
		else
			return value
		end	
	end

	def name_nil_1(value)
		if value == nil || value == ""
			return "Non renseigné"
		else
			return "#{value} ans"
		end	
	end

	def name_nil_2(value)
		if value == nil || value == ""
			return "Non renseigné"
		else
			return "#{value} Kg."
		end	
	end
end
