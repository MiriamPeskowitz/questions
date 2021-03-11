module Api::V1
  class ResponsesController < ApplicationController
    def index
      # @recent_responses = Response.all.shuffle.take(2)
      @recent_responses = all_askers_questions_and_responses(params[:name])
      render json: @recent_responses
    end

# list every response for every question for a specific asker 
    def all_askers_questions_and_responses(name)
    # 	all_questions = Question.where({:asker => name})
    	Response.joins(:question).where("questions.asker = ?", name)
    	# responses = all_questions.flat_map {|q| q.responses}
    end
  end
end

#     @response = question.responses.new(params.require(:response).permit(:responder, :response))
