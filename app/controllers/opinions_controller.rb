class OpinionsController < ApplicationController
  def new
    @release = Release.find(params[:release_id])
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.release = Release.find(params[:release_id])
    if
      @opinion.save
      redirect_to releases_path
    else
      render :new
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:heart, :mic, :note, :release_id)
  end
end
