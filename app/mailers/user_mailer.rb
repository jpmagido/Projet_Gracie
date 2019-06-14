class UserMailer < ApplicationMailer

	default from: 'no-reply@graciebarraparis75.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://graciebarra75.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def contract_email(user_id)
  	@user = User.find(user_id)
  	@url  = 'http://graciebarra75.com'
    @contract = Contract.where(user_id: user_id).ids[0]
    @contract_formula = Contract.find(@contract).formula_id
    @formula_name = Formula.find(@contract_formula).name
    @formula_price = Formula.find(@contract_formula).price
  	mail(to: @user.email, subject: 'Confirmation Paiement inscription !')
  end
end

