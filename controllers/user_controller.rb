  class UserController < ApplicationController
  get('/') do
    render(:erb, :"users/index")
  end

  get('/new') do
    render(:erb, :"users/new")
  end

  get('/edit') do
    render(:erb, :"users/edit")
  end

  get('/:id') do
    render(:erb, :"users/show")
  end

  delete('/') do
  end

  post('/') do
  end
  end
