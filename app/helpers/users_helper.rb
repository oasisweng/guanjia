# -*- encoding : utf-8 -*-
module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def generate_number(length)
    o = [('0'..'9')].map { |i| i.to_a }.flatten
    (0...length).map { o[rand(o.length)] }.join
  end 

  def generate_complex_code(length)
    o = [('0'..'9'),('a'..'z'),('A'..'Z')].map { |i| i.to_a }.flatten
    (0...length).map { o[rand(o.length)] }.join
  end 

  def generate_random_number(max_num)
    rand(max_num) + 1
  end

  def generate_card_no(status)
    code_length = 12
    if status == "Client"
      "4" + generate_number(code_length)
    elsif status == "Staff"
      "3" + generate_number(code_length)
    elsif status == "Manager"
      "2" + generate_number(code_length)
    elsif status == "Admin"
      "1" + generate_number(code_length)
    end
  end
end
