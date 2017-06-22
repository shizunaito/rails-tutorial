Rails.application.routes.draw do
  root 'application#hello'

  get 'foo/bar'
  get 'foo/baz'
  get 'static_pages/home'
  get 'static_pages/help'
end
