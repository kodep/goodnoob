class VisitorsController < ApplicationController
  def select_locale
    if params[:locale].in? %w[en fr es]
      session[:locale] = params[:locale]
      current_user.update(language: params[:locale]) if current_user
    end
    redirect_to :back
  end
end
