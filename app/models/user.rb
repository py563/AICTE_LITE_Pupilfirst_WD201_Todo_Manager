class User < ApplicationRecord
  def to_pleasant_string
    "Welcome #{first_name}"
  end
end
