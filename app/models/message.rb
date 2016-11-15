class Message < ApplicationRecord

  belongs_to :user
  has_many :comments

  # before_save :convert_to_datetime

  # def published_on_field
  #   published_on.strftime("%d/%m/%Y") if published_on.present?
  # end 

  # def published_on_field=(date)
  #   # Change back to datetime friendly format
  #   @published_on_field = Date.parse(date).strftime("%Y-%m-%d")
  # end

  # def convert_to_datetime
  #   self.sched_time = DateTime.parse("#{@published_on_field} #{@sched_time_field}")
  # end
  # private
  # def convert_to_datetime
  #   # self.published_on = DateTime.strptime("#{published_on}", "%m/%d/%Y")
  #   self.published_on = "#{Message.published_on}".to_date
  # end

end
