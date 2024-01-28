class AnalyticTrendsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  def index; end

  def trends
    @analiticTrends = AnalyticTrend.all
    render json: { success: true, data: @analiticTrends }
  end

  def create
    if params[:query]!=''
      term = params[:query]
      ip_address = request.remote_ip
        @search = Search.new
        @search.query = term
        @search.ip_address = ip_address
        @search.save
        if AnalyticTrend.exists?(AnalyticTrend.where(query: params[:query]))
          @analytic_trend = AnalyticTrend.where(query: params[:query]).first
          @analytic_trend.search_total += 1
          @analytic_trend.save
            # render json: { success: true, message: 'Increased Successfully!😁' }, status: :created
          # else
            # render json: { error: true, message: @analytic_trend.errors.full_messages }, status: :unprocessable_entity
          # end
        else
          @analytic_trend = AnalyticTrend.new(analytic_trend_params)
          @analytic_trend.search_total = 1
          @analytic_trend.save
            # render json: { success: true, message: 'Created Successfully!😁' }, status: :created
          # else
            # render json: { error: true, message: @analytic_trend.errors.full_messages }, status: :unprocessable_entity
          # end
        end
        render json: { result: perform_search(term) }
      else
        render json: { error: 'Invalid search term' }, status: :bad_request
      end
  end

  private

  def perform_search(term)
    results = Article.where('title LIKE ?', "%#{term}%").pluck(:title)
    results
  end

  protected

  def analytic_trend_params
    params.require(:analytic_trend).permit(:query)
  end
end
