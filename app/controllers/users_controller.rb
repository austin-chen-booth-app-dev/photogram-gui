class UsersController < ApplicationController
  def index
    @list_of_users = User.all
    
    # Simple GET for all user entries
    if !params.key?("input_new_username") 
      render({ :template => "users_templates/index.html.erb" })
    
    # Add a new user
    else
      # Gather query string parameter form data
      new_username = params.fetch("input_new_username")

      # Create a new user
      new_user = User.new
      new_user.username = new_username 
      new_user.save
      redirect_to("/users/#{new_username}")
    end
  end

  def get_specific_user
    @username = params.fetch("username")
    @user = User.where({ :username => @username }).at(0)

    # Simple GET to specific user
    if !params.key?("input_username") 
      render({ :template => "users_templates/user.html.erb" })

    # Update the new name if we find query string parameters
    else
      new_username = params.fetch("input_username")
      @user.username = new_username
      @user.save
      redirect_to("/users/#{new_username}")
    end
  end

end
