Admin.controllers :todays_topics do

  get :index do
    @todays_topics = TodaysTopic.all
    render 'todays_topics/index'
  end

  get :new do
    @todays_topic = TodaysTopic.new
    render 'todays_topics/new'
  end

  post :create do
    @todays_topic = TodaysTopic.new(params[:todays_topic])
    if (@todays_topic.save rescue false)
      flash[:notice] = 'TodaysTopic was successfully created.'
      redirect url(:todays_topics, :edit, :id => @todays_topic.id)
    else
      render 'todays_topics/new'
    end
  end

  get :edit, :with => :id do
    @todays_topic = TodaysTopic[params[:id]]
    render 'todays_topics/edit'
  end

  put :update, :with => :id do
    @todays_topic = TodaysTopic[params[:id]]
    if @todays_topic.modified! && @todays_topic.update(params[:todays_topic])
      flash[:notice] = 'TodaysTopic was successfully updated.'
      redirect url(:todays_topics, :edit, :id => @todays_topic.id)
    else
      render 'todays_topics/edit'
    end
  end

  delete :destroy, :with => :id do
    todays_topic = TodaysTopic[params[:id]]
    if todays_topic.destroy
      flash[:notice] = 'TodaysTopic was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy TodaysTopic!'
    end
    redirect url(:todays_topics, :index)
  end
end
