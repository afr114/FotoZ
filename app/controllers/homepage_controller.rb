class HomepageController < ApplicationController
before_action :authenticate_user!, :except => :index
  def index
    respond_to do |format|
      format.html { render layout: 'homepage' }
    end
  end

end
