MusicOhgiri.controllers :index do
  get :new do
    render 'index/new'
  end

  get :destroy do
    set_current_account(nil)
    redirect url(:index)
  end

  get :auth, :map => '/auth/:provider/callback' do
    auth = request.env['omniauth.auth']
    account = Account.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
      Account.create_with_omniauth(auth)
    set_current_account(account)
    redirect 'http://' + request.env['HTTP_HOST'] + url(:profile)
  end
end
