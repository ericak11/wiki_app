class DocumentController < ApplicationController
  get('/') do
    @documents = Document.all
    @first = 1
    @docs  = @documents.take(10)
    if params[:first]
      @docs = @documents.drop(params[:first].to_i - 1).take(10)
      @first = params[:first].to_i
    end
    render(:erb, :"documents/index")
  end

  get('/new') do
    # @tags = Tag.all
    render(:erb, :"documents/new")
  end

  get('/:id/edit') do
    title = params[:id].gsub("_", " ")
    @document = Document.find(title: title)
    @version = Version.filter(document_id: @document.id).last
    render(:erb, :"versions/new")
  end

  get('/:id/versions') do
    redirect ("/versions/#{params[:id]}")
  end

  get('/:id') do
    title = params[:id].gsub("_", " ")
    @document = Document.find(title: title)
    @version = Version.filter(document_id: @document.id).last
    render(:erb, :"documents/show")
  end

  delete('/') do
  end

  post('/') do
    doc = Document.create(params[:document])
    content = render(:markdown, params[:content])
    Version.create(
      user_id: session[:current_user][:id],
      document_id: doc.id,
      content: content
    )
    Permission.create(
      user_id: session[:current_user][:id],
      document_id: doc.id,
      role: "creator"
      )
    redirect ("/")
  end
end
