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
end
