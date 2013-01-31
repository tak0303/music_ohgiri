class Account < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create!(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['name'],
      role: 'users'
    )
  end
end
