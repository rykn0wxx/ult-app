class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  include Knock::Authenticable

  protect_from_forgery with: :null_session
end
