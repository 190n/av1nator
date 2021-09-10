class SubmissionsController < ApplicationController
    def index
        @submissions = Submission.where(challenge_id: params[:challenge_id])
    end
end
