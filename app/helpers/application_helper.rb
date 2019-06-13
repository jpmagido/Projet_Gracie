module ApplicationHelper


	def bootstrap_class_for_flash(type)
	  case type
	    when 'notice' then "alert-info"
	    when 'success' then "alert-success"
	    when 'error' then "alert-danger"
	    when 'alert' then "alert-warning"
	  end
	end


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
