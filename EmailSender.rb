require './User.rb'

require 'pony'

module Email
    class EmailSender
        def initialize
            @from = "shchur.oleksandr@chnu.edu.ua"
        end

        def send(to, subject, message, attachment_filepath)
            # Pony.mail(:to => 'you@example.com', :from => 'me@example.com', :subject => 'hi', :body => 'Hello there.')

            Pony.mail({
                :to => to,
                :from => @from,
                :subject => subject,
                :body => message,
                #:attachments => { 'archive.zip' => File.read(attachment_filepath) }
              })
        end
    end
end
