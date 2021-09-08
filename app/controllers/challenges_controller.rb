class ChallengesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @challenges = Challenge.all
    end

    def show
        @challenge = Challenge.find(params[:id])
    end

    def new
        @challenge = Challenge.new
    end

    def create
        @challenge = Challenge.new(challenge_params)
        @challenge.user = current_user

        if @challenge.save
            redirect_to challenge_path(@challenge)
        else
            render :new
        end
    end

    private
        def challenge_params
            params.require(:challenge)
                .permit(:title, :max_size, :rules, :start, :deadline, :voting_deadline)
        end
end
