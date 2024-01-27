class AnalyticTrendsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: %i[create]
    def index
    end
    def show
    end
    def create    
      if AnalyticTrend.exists?(AnalyticTrend.where(query:params[:query]))
          @analytic_trend=AnalyticTrend.where(query:params[:query]).first
          @analytic_trend.search_total+=1
          if @analytic_trend.save
             render json: { success: true, message: 'Increased Successfully!😁' }, status: :created
           else
              render json: { error: true, message: @analytic_trend.errors.full_messages }, status: :unprocessable_entity
            end
       else
          @analytic_trend = AnalyticTrend.new(analytic_trend_params)
          @analytic_trend.search_total=1
          if @analytic_trend.save
             render json: { success: true, message: 'Created Successfully!😁' }, status: :created
            else
              render json: { error: true, message: @analytic_trend.errors.full_messages }, status: :unprocessable_entity
            end
        end
    end
    def destroy
    end
    def update
    end

    protected

    def analytic_trend_params
        params.require(:analytic_trend).permit(:query)
    end
end
