MusicOhgiri.controllers :index do
  before do
    redirect '/' if current_account.blank?
  end

  get :show, :map => '/show/:playlist_id' do
    @list = Playlist.find params[:playlist_id]
    render 'index/show'
  end

  get :show_by_topic, :map => '/show/topic/:topic_id' do
    @topic_id = params[:topic_id]
    @list_by_topic = Playlist.find_all_by_topic_id @topic_id
    render 'index/show_by_topic'
  end

  get :new, :map => '/new' do
    render 'index/new'
  end

  get :destroy, :map => '/logout' do
    set_current_account(nil)
    redirect url(:root)
  end
end