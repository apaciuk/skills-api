class GoalsController < ApplicationController
    def new 
    user = User.find_by(id: session[:user_id])
    goal = goal = Goal.new(goal_params)
    goal.user = user 
    goal.exp = 10
    goal.ended = false 
        if goal.save
            render json: UserSerializer.new(user)
        else
            render json: {error: "Goal not created"}
        end
    end 

    private 

    def goal_params
        params.require(:goals).permit(:name, :timeframe, :exp, :user_id, :goal_id)
    end 

end
