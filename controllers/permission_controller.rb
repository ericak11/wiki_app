class PermissionController < ApplicationController
  post('/:doc_id') do
    Permission.create(
      user_id: session[:current_user][:id],
      document_id: params[:doc_id],
      role: "pending"
      )
    redirect("/")
  end

  put('/:permission_id/approve') do
    permission = Permission.find(id: params[:permission_id])
    permission.role = "editor"
    permission.save
    redirect("/")
  end

  put('/:permission_id/deny') do
    Permission.where(id: params[:permission_id]).delete
    redirect("/")
  end

end
