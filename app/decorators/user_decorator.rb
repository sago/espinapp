class UserDecorator < SimpleDelegator

  def fullname
    "#{first_name} #{last_name}"
  end

end
