class VersionController < ApplicationController
  get('/new') do
    render(:erb, :"versions/new")
  end

  get('/edit') do
    render(:erb, :"versions/edit")
  end

  get('/:id') do
    title = params[:id].gsub("_", " ")
    @document = Document.find(title: title)
    @versions = Version.filter(document_id: @document.id)
    render(:erb, :"versions/index")
  end

  get('/:doc_id/:version_id/show') do
    title = params[:doc_id].gsub("_", " ")
    @document = Document.find(title: title)
    @compare_version = ReverseMarkdown.convert Version.find(id: params[:version_id]).content
    @last_version = ReverseMarkdown.convert Version.filter(document_id: @document.id).last.content
    render(:erb, :"versions/show")
  end

  delete('/') do
  end

  post('/') do
    content = render(:markdown, params[:content])
    Version.create(
      user_id: session[:current_user][:id],
      document_id: params[:document_id],
      content: content
    )
    redirect ("/")
  end
end
