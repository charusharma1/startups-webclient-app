class StartupsController < ApplicationController

  def index
  @startups = Startup.all 
  end

  def show
    @startup = Startup.find(params[:id])
    # @startup = Unirest.get("http://localhost:3000/startups/#{params[:id]}.json").body
  end

  def new

  end

  def create
    @startup = Startup.create(name: params[:name], location: params[:location], job_openings: params[:job_openings])
    redirect_to "/startups/#{@startup.id}"
  end

  def edit
    @startup = Startup.find(params[:id])
    
  end

  def update
    @startup = Startup.find(params[:id])
    @startup.update(name: params[:name], location: params[:location], job_openings: params[:job_openings])
    
    redirect_to "/startups/#{@startup["id"]}"
    flash[:success] = "Updated!"
  end

  def destroy
    @startup = Startup.find(params[:id])
    @startup.delete
    redirect_to "/startups"
    flash[:danger] = "Destroyed!"
  end
end
