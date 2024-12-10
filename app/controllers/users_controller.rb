class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :created_at => :desc })
    render({ :template => "user_templates/index" })
  end

  def show
    user_name = params.fetch("username")
    @user = User.where({:username => user_name }).at(0)
    render({ :template => "user_templates/show" })
  end

  def insert
    @new_user = User.new
    @new_user.username = params.fetch("username")

    if @new_user.valid?
      @new_user.save
      redirect_to("/users/#{@new_user.username}")
    else
      same_name = User.where({:username => @new_user.username }).at(0)
      redirect_to("/users/#{same_name.username}")
    end
  end

  def update
    the_id = params.fetch("userid")
    new_name = params.fetch("new_username")
    user_to_be_updated = User.find(the_id)
    user_to_be_updated.username = new_name

    if user_to_be_updated.valid?
      user_to_be_updated.save
      redirect_to("/users/#{user_to_be_updated.username}")
    else
      same_name = User.where({:username => new_name}).at(0)
      redirect_to("/users/#{same_name.username}")
    end
  end
end
