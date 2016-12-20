class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404efore_Action
  before_action :set_locale
 
  private
  def render_404
  	render plain: "Data Not Found", status: 404
  end

  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end


end
