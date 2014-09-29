class UserController < ApplicationController
  get('/') do
    @user = User.find(id: session[:current_user][:id])
    @users = User.all
    render(:erb, :"users/index")
  end

  get('/new') do
    render(:erb, :"users/new")
  end

  get('/:id/edit') do
    @user = User.find(id: params[:id])
    if @user.nil?
      redirect ("/")
    elsif session[:current_user][:id] == params[:id].to_i
      render(:erb, :"users/edit")
    else
      redirect ("/")
    end

  end

  get('/:id') do
    @user = User.find(id: params[:id])
    my_docs = Permission.where(user_id: params[:id]).where(role: "creator")
    doc_nums =  my_docs.map {|x| x.document_id}
    @created_docs = my_docs.map {|doc| Document.find(id: doc.document_id)}
    pending = Permission.where(document_id: doc_nums).where(role: "pending")
    @pending_requests = pending.map {|request| request}
    edit_docs = Permission.select(:document_id).where(user_id: params[:id]).where(role:
      "editor")
    @editable_docs = edit_docs.map {|doc| Document.find(id: doc.document_id)}
    if @user.nil?
      redirect ("/")
    elsif session[:current_user][:id] == params[:id].to_i
      render(:erb, :"users/show")
    else
      redirect ("/")
    end
  end

  delete('/') do

  end

  post('/') do
    User.create(params[:user])
    redirect ("/")
  end
end
