class Contact < MailForm::Base
    attribute :name, validate: true
    attribute :email, validate: true
    attribute :message
    attribute :nickname, captcha: true
    def headers
      { 
        #this is the subject for the email generated, it can be anything you want
        subject: "My Contact Form",
        to: 'ritz2286@gmail.com',
        from: %("#{name}" <#{email}>)
        #the from will display the name entered by the user followed by the email
      }
    end
  end