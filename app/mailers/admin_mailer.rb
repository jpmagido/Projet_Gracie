class AdminMailer < ApplicationMailer

	default from: 'no-reply@graciebarraparis75.com'
 
  def welcome_email(admin)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = admin 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://graciebarra75.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Création compte Administrateur !') 
  end
end
