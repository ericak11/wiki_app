  class VersionController < ApplicationController
  get('/') do
    render(:erb, :"versions/index")
  end

  get('/new') do
    render(:erb, :"versions/new")
  end

  get('/edit') do
    render(:erb, :"versions/edit")
  end

  get('/:id') do
    render(:erb, :"versions/show")
  end

  delete('/') do
  end

  post('/') do
  end
  end
