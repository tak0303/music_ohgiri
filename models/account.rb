class Account < ActiveRecord::Base
  has_many :playlists
  def self.create_with_omniauth(auth)
    create!(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name'],
      role: 'users'
    )
  end
end
