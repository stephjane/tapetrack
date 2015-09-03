class UserMailer < ApplicationMailer
 
  def tape_email(friend)
    @friend = friend
    @tape = Tape.find(@friend.tape_id)
    @url  = "http://localhost:3000/share?id=#{@tape.id}"
    mail(to: @friend.email, subject: 'You have a tape!')
  end
end
