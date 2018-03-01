class UserDecorator < SimpleDelegator

  def fullname
    "#{full_name}"
  end

end
