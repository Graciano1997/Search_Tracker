class AnalyticTrendsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  def index; end

  def trends
    @analiticTrends = AnalyticTrend.all
    render json: { success: true, data: @analiticTrends }
  end

  def create
    if params[:query] == ''
      render json: { error: 'Invalid search term' }, status: :bad_request
    else
      term = params[:query]
      ip_address = request.remote_ip
      @search = Search.new
      @search.query = term
      @search.ip_address = ip_address
      @search.save
      if AnalyticTrend.exists?(AnalyticTrend.where(query: params[:query]))
        @analytic_trend = AnalyticTrend.where(query: params[:query]).first
        @analytic_trend.search_total += 1
      else
        @analytic_trend = AnalyticTrend.new(analytic_trend_params)
        @analytic_trend.search_total = 1
      end
      @analytic_trend.save
      render json: { result: perform_search(term) }
    end
  end

  private

  def perform_search(term)
    Article.where('title LIKE ?', "%#{term}%").pluck(:title)
  end

  protected

  def analytic_trend_params
    params.require(:analytic_trend).permit(:query)
  end
end
