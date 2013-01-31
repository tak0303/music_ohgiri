require 'sprockets'

class MusicOhgiri < Padrino::Application
  register SassInitializer
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions

  register Padrino::Admin::AccessControl

  register Padrino::Sprockets
  sprockets  # :url => 'assets', :root => app.root

  use OmniAuth::Builder do
    provider :facebook, '368370446603454', 'd5333763b294efde84e60060815e506b'
  end

  get :root, :map => '/' do
    render 'index/index'
  end

  get :auth, :map => '/auth/:provider/callback' do
    auth = request.env['omniauth.auth']
    account = Account.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
      Account.create_with_omniauth(auth)
    set_current_account(account)
    redirect '/'
  end

  error 404 do
    render('errors/response')
  end
end
