class Notification
  attr_reader :message, :homework

  def initialize(homework:)
    @homework = homework
    @message = message
  end

  def send_message
    message = { new: "#{homework.mentor.fullname} has assigned a new homework for you. See #{homework.title}",
    to_work: "A student #{homework.student.fullname} takes #{homework.title} to work",
    to_check: "The homework #{homework.title} is ready to be checked",
    reject: "#{homework.mentor.fullname} has rejected your homework #{homework.title}",
    accept: "#{homework.mentor.fullname} has accepted your homework #{homework.title}" }
  end
end
