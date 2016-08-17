class Notify < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify.Announcement.subject
  #
  def Announcement(announcement)
    @announcement = announcement
    @recepients= Client.where('user_id = ?', @announcement.user_id).pluck(:email)
    mail to: @recepients.join(","), subject: "#{announcement.title}"
    
  end
end
