module PagesHelper

	def rights_code(number)
		if number == 0
			return "God"
		elsif number == 1
			return "Admin"
		elsif number == 2
			return "User"
		elsif number == 3
			return "Visiteur"
		end
	end

	def paying_code(paid)
		if paid == nil || paid > 0
			return paid
		else
			return "A payé"
		end
	end


	def color_belt(color)
		if color == "Blanche"
        	return "white"
        elsif color == "Bleue"
        	return "#243dcc"
        elsif color == "Violette" 
        	return  "#663096"
        elsif color == "Marron"
        	return  "#4d0000" 
        elsif color == "Noire"
        	return  "#292929"
		end
	end
	
	def current_user_contract_name
		contract = Contract.where(user_id: current_user.id).ids[0]
		if contract != nil
			formula = Contract.find(contract).formula_id
			formula_name = Formula.find(formula).name
		end
		

		return formula_name
	end
	

	def current_user_contract_duration
		contract = Contract.where(user_id: current_user.id).ids[0]
		if contract != nil
			formula = Contract.find(contract).created_at
		end
		return formula
	end

	def contract_real_name(id)
		if id == "GB1-1" || id == "GB1-2" || id == "GB1-3"
			return "Jiu-Jitsu Débutant"
		elsif id == "GB2-1" || id == "GB2-2" || id == "GB2-3"
			return "Jiu-Jitsu Intermédiaire"
		elsif id == "GB3-1" || id == "GB3-2" || id == "GB3-3"
			return "Jiu-Jitsu Confirmé"
		elsif id == "BBC-1" || id == "BBC-2" || id == "BBC-3"
			return "Jiu-Jitsu Compétiteur"
		elsif id == "MT-1" || id == "MT-2" || id == "MT-3"
			return "Muay-Thaï"
		elsif id == "MMA-1" || id == "MMA-2" || id == "MMA-3"
			return "MMA"
		elsif id == "BF-1" || id == "BF-2" || id == "BF-3"
			return "BarraFit"
		elsif id == "YG-1" || id == "YG-2"
			return "Yoga"
		elsif id == "PP-1" || id == "PP-2"
			return "Prépation Physique"
		end
	end

	def contract_real_time(data)
		if data == "GB1-1" || data == "GB2-1" || data == "GB3-1" || data == "BBC-1" || data == "MT-1" || data == "MMA-1" || data == "BF-1"
			return "1 mois"	
		elsif data == "GB1-2" || data == "GB2-2" || data == "GB3-2" || data == "BBC-2" || data == "MT-2" || data == "MMA-2" || data == "BF-2"
			return "3 mois"	
		elsif data == "GB1-3" || data == "GB2-3" || data == "GB3-3" || data == "BBC-3" || data == "MT-3" || data == "MMA-3" || data == "BF-3"
			return "12 mois"
		end
	end

	def first_name_nil(name)

		if name == ""
			return "Jeune"
		elsif name != nil
			return name.titleize
		end	
	end

	def last_name_nil(name)
		if name == ""	
			return " Padawan"
		elsif name != nil
			return name.upcase
		end
	end
end







