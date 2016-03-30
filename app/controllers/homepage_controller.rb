class HomepageController < ApplicationController

  def index
    respond_to do |format|
      format.html { render layout: 'homepage' }
    end
  end

end
