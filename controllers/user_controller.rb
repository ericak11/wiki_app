class UserController < ApplicationController
  get('/') do
    @user = User.find(id: session[:current_user][:id])
    @users = User.all
    render(:erb, :"users/index")
  end

  get('/new') do
    render(:erb, :"users/new")
  end

  get('/edit') do
    @user = User.find(id: params[:id])
    render(:erb, :"users/edit")
  end

  get('/:id') do
    @user = User.find(id: params[:id]) #if session[:current_user][:id] == params[:id]

    render(:erb, :"users/show")
  end

  delete('/') do

  end

  post('/') do
    User.create(params[:user])
    redirect ("/")
  end
end
