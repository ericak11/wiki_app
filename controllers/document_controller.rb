  class DocumentController < ApplicationController
  get('/') do
    render(:erb, :"documents/index")
  end

  get('/new') do
    render(:erb, :"documents/new")
  end

  get('/edit') do
    render(:erb, :"documents/edit")
  end

  get('/:id') do
    render(:erb, :"documents/show")
  end

  delete('/') do
  end

  post('/') do
  end
  end
