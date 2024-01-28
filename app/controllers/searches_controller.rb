class SearchesController < ApplicationController
    # before_action :initialize_search_history
    def index; end  
#     def search
#       term = params[:query]
#       ip_address = request.remote_ip

#       if term.present? && term.ends_with?(' ')
#         term = term.strip
#         record_unique_search(term, ip_address)
#         render json: { result: perform_search(term) }
#       else
#         render json: { error: 'Invalid search term' }, status: :bad_request
#       end
#     end
  
#     private
  
#     def initialize_search_history
#       # Use a Set to store unique search queries
#       @search_history ||= Set.new
#     end
  
#     def record_unique_search(term, ip_address)
#       @search_history.add("#{term}-#{ip_address}")
#       Search.create(query: term, ip_address: ip_address)
#     end
  
#     def perform_search(term)
#       results = Article.where('title LIKE ?', "%#{term}%").pluck(:title)
#       results
#     end
  end