class UserSerializer  < ActiveModel::Serializer
  include Rails.application.routes.url_helpers


  attributes :id, :first_name, :last_name, :email

end