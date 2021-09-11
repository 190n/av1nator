class SubmissionsController < ApplicationController
    def index
        @challenge = Challenge.find(params[:challenge_id])
        @submissions = Submission.where(challenge_id: params[:challenge_id])
    end

    def new
        @submission = Submission.new
    end

    def create
        @submission = Submission.new(submission_params)
        @submission.user = current_user
        @submission.challenge_id = params[:challenge_id]

        if @submission.save
            redirect_to challenge_submission_path(@submission)
        else
            render :new
        end
    end

    def show
        @submission = Submission.find(params[:submission_id])
    end

    private
        def submission_params
            params.require(:submission).permit(:title, :user, :file)
        end
end
