class Mentor
  attr_reader :homeworks, :fullname, :students, :notifications
  attr_accessor :student

  def initialize(fullname:)
    @fullname = fullname
    @homeworks = []
    @notifications = []
    @students = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    homeworks << homework
    notification = Notification.new(homework: homework).message[:new]
    student.notifications << notification
    homework
  end

  def mark_as_read!
    @notifications.clear
  end

  def subscribe_to!(student)
    @students << student
    student.mentor = self
  end

  def reject_to_work!(homework, student)
    notification = Notification.new(homework: homework).message[:reject]
    student.notifications << notification
  end

  def accept!(homework, student)
    notification = Notification.new(homework: homework).message[:accept]
    student.notifications << notification
  end
end
