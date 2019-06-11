class UsersController < ApplicationController
  before_action :verify_user
  def index
    @q = User.search params[:q]
    @users = @q.result(distinct: true).order("created_at DESC")
      .page(params[:page]).per Settings.users.per_page
  end
end
