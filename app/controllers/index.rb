MusicOhgiri.controllers :index do
  before do
    redirect '/' if current_account.blank?
  end

  get :new, :map => '/new' do
    render 'index/new'
  end

  get :destroy, :map => '/logout' do
    set_current_account(nil)
    redirect url(:root)
  end
end