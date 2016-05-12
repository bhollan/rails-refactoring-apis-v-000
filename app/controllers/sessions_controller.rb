class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh_service = GithubService.new
    session[:token] = gh_service.authenticate!(params[:code])
    session[:username] = gh_service.get_username

    redirect_to root_path
  end
end
