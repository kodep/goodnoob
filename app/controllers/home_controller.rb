class HomeController < ApplicationController

    def index
        set_categories
        set_filters
    end

    private

    def set_categories
        @categories ||= Category.includes(:sub_categories).all
    end

    def set_filters
        @filters = SearchFilter.build params
    end
end


