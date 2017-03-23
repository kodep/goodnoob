class VisitorsController < ApplicationController
  def select_locale
    if params[:locale].in? %w[en fr es]
      session[:locale] = params[:locale]
    end
    redirect_to :back
  end
end
