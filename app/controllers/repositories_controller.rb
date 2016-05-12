class RepositoriesController < ApplicationController
  before_action :set_service

  def index
    @repos_array = @gh_service.get_repos
  end

  def create
    @gh_service.create_repo(params[:name])
    redirect_to root_path
  end

  private

  def set_service
    @gh_service = GithubService.new({"access_token" => session[:token]})
  end
end
