class SessionController < ApplicationController
  get('/new') do
    render(:erb, :"session/new")
  end

  delete('/') do
    session[:current_user] = nil
    redirect ('/')
  end

  post('/') do
    user = User.find(email: params[:email])
    if user.nil?
      # flash[:error] = "No user found with that name!"
      redirect ('/session/new')
    elsif user.authenticate(params[:password])
       # add a user to the session hash
      current_user_id = user.id
      session[:current_user]  = {id: current_user_id}
      redirect("/users/#{current_user_id}")
    else
      # flash[:error] = "Username and Password do not match"
      redirect ('/session/new')
    end
  end
end
