class Api::V1::ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  include Knock::Authenticable

  protect_from_forgery with: :null_session

  private

  def record_not_found error
    respond_to do |format|
      format.json { render :json => {:error => error.message}, :status => 404 }
    end
  end

  def generic_exception error
    respond_to do |format|
      format.json { render :json => {:error => error.message}, :status => 500 }
    end
  end
end
