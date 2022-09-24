class StatsController < ApplicationController
  before_action :set_stats
  def index
  end

  private

  def stats_params
    params.permit(:post_id)
  end

  def set_stats
    @post = Post.friendly.find(stats_params[:post_id])
    @stats = Stats.tokenize(stats_params[:post_id], exclude: ["some", "words"])
  end

end
