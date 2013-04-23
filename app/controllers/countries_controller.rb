class CountriesController < ApplicationController
    def index
        @countries = Country.all
    end

    def show
        @country_names = Country.select("id, name, score").select{|c| !c.score.nil?}.sort_by{|c| c.name}
        @country = Country.find(params[:id])
    end
end
