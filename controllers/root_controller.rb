class RootController < ApplicationController
  get('/') do
    @document = Document.all.sample
    @version = Version.filter(document_id: @document.id).last
    @last_edit = User.find(id: @version.user_id)
    render(:erb, :index)
  end
end
