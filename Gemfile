source :rubygems

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'sass'
gem 'haml'
gem 'libxml-ruby'
gem 'youtube_it'
gem 'pry-padrino'

gem 'padrino-sprockets', :git => "https://github.com/nightsailer/padrino-sprockets.git", :require => "padrino/sprockets"
gem 'coffee-script'
gem 'therubyracer', :require => 'v8'

gem 'omniauth'
gem 'omniauth-facebook'

# Padrino Stable Gem
gem 'padrino', '0.10.7'

gem 'activerecord', :require => "active_record"
group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end

gem 'bcrypt-ruby', :require => "bcrypt"
# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end