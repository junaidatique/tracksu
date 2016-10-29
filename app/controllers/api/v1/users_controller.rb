class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!, only: [:show]
##
# Login user and create user session
#
# Returns current user if Login Successfully
#
# Returns Unauthorized if Login Unsuccessfully
#
# Post /api/v1/users/log_in
#
# params:
#   {user: { email: 'abc@zxc.com', password: 'zxcvbnma123'}
#
# = Examples
#
#   resp = conn.post("/api/v1/users/log_in",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {user: { email: 'abc@zxc.com', password: 'zxcvbnma123' }})
#
#   resp.status
#   => 401
#
#   resp.body
#   => {"message":"Error with your login or password"}
#
#   resp = conn.get("/api/v1/users/log_in",
#                   headers: { Access_Token: "Secret token"},
#                   params:  {user: { email: 'correct@email.com', password: 'withCorrectPassword' }})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"name":"John","email":"email@test.com","portfolios":[{"id":1,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:03 UTC","updated_at":"2016-04-06 07:41:03 UTC","holdings":[{"id":4,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding1234","created_at":"2016-04-06 07:54:48 UTC","updated_at":"2016-04-06 07:54:48 UTC","transactions":[{"id":3,"holding_id":4,"position":12.0,"amount":45.0,"rate":45.26,"kind":0,"local_id":"local_transaction_123","date":"2016-03-16 00:00:00 UTC","created_at":"2016-04-06 08:14:30 UTC","updated_at":"2016-04-06 08:14:30 UTC"}]},{"id":9,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding12344321","created_at":"2016-04-06 08:14:48 UTC","updated_at":"2016-04-06 08:14:48 UTC","transactions":[]}]},{"id":2,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:46 UTC","updated_at":"2016-04-06 07:41:46 UTC","holdings":[]}]}
#
  def log_in
    user = User.find_by_email(user_params[:email])
    return invalid_login_attempt unless user
    if user.valid_password?(user_params[:password])
      sign_in(:user, user)
      render 'user'
    else
      return invalid_login_attempt
    end
  end

##
# Email Reset password instructions to user
#
# POST /api/v1/users/reset_password
#
# params:
#   {user: {:email}}
#
# = Example
#
#   resp = conn.post("/api/v1/users/reset_password",
#                 headers: { Access_Token: "Secret token"},
#                 params: {user: {email: 'correct@email.com'}})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"message":"Password reset instructions has been sent."}
#
  def reset_password
    @user = User.find_by_email(user_params[:email])
    @message = 'Password reset instructions has been sent.'
    if @user.present?
      @user.send_reset_password_instructions
      render 'message'
    else
      @message = 'User not found'
      render 'message', :status => 401
    end
  end

##
# Returns a current user name and email
#
# GET /api/v1/users/show
#
# User must be authenticated
#
# params:
#   {}
#
# = Example
#
#   resp = conn.get("/api/v1/users/show", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"name":"John","email":"email@test.com","portfolios":[{"id":1,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:03 UTC","updated_at":"2016-04-06 07:41:03 UTC","holdings":[{"id":4,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding1234","created_at":"2016-04-06 07:54:48 UTC","updated_at":"2016-04-06 07:54:48 UTC","transactions":[{"id":3,"holding_id":4,"position":12.0,"amount":45.0,"rate":45.26,"kind":0,"local_id":"local_transaction_123","date":"2016-03-16 00:00:00 UTC","created_at":"2016-04-06 08:14:30 UTC","updated_at":"2016-04-06 08:14:30 UTC"}]},{"id":9,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding12344321","created_at":"2016-04-06 08:14:48 UTC","updated_at":"2016-04-06 08:14:48 UTC","transactions":[]}]},{"id":2,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:46 UTC","updated_at":"2016-04-06 07:41:46 UTC","holdings":[]}]}
#
  def show
    render 'user'
  end
##
# Update password
#
# POST /api/v1/users/update_password
#
# User must be authenticated
#
# params:
#   {user: {:name, :old_password, :password, :password_confirmation }}
#
# = Example
#
#   resp = conn.get("/api/v1/users/update_password", headers: { Access_Token: "Secret token"},
#                 params: {user: {old_password: 'abcdefgh', password: '123697845', password_confirmation: '1236654487'}})
#
#   resp.status
#   => 401
#
#   resp.body
#   => {"message":"Invalid value for old password."}
#
#   resp = conn.get("/api/v1/users/update_password", headers: { Access_Token: "Secret token"},
#                 params: {user: {old_password: 'abcdefgh', password: '123697845', password_confirmation: '1236654487'}})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"name":"John","email":"email@test.com","portfolios":[{"id":1,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:03 UTC","updated_at":"2016-04-06 07:41:03 UTC","holdings":[{"id":4,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding1234","created_at":"2016-04-06 07:54:48 UTC","updated_at":"2016-04-06 07:54:48 UTC","transactions":[{"id":3,"holding_id":4,"position":12.0,"amount":45.0,"rate":45.26,"kind":0,"local_id":"local_transaction_123","date":"2016-03-16 00:00:00 UTC","created_at":"2016-04-06 08:14:30 UTC","updated_at":"2016-04-06 08:14:30 UTC"}]},{"id":9,"stock_market_registration_id":1,"portfolio_id":1,"local_id":"holding12344321","created_at":"2016-04-06 08:14:48 UTC","updated_at":"2016-04-06 08:14:48 UTC","transactions":[]}]},{"id":2,"name":"portfolio1","local_id":"PORT20160401111833619","currency_id":1,"created_at":"2016-04-06 07:41:46 UTC","updated_at":"2016-04-06 07:41:46 UTC","holdings":[]}]}
#
  def update_password
    if current_user.valid_password?(user_update_password_params[:old_password])
      password_params = user_update_password_params
      password_params.delete(:old_password)
      user_email = current_user.email
      if current_user.update(password_params)
        user = User.find_by_email(user_email)
        sign_in(user, :bypass => true)
        render 'user'
      else
        @message = 'Please try again later.'
        render 'message', :status => 401
      end
    else
      return invalid_password
    end
  end
##
# Deletes user session
#
# Delete /api/v1/users/log_out
#
# User must be authenticated
#
# params:
#   {}
#
# = Example
#
#   resp = conn.delete("/api/v1/users/log_out", headers: { Access_Token: "Secret token"})
#
#   resp.status
#   => 200
#
#   resp.body
#   => {"message":"User has been logged out successfully."}
#
  def log_out
    sign_out(current_user)
    @message = 'User has been logged out successfully.'
    render 'message', :status => :ok
  end

  private

  def set_user
    @user = current_user.users.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :remember_me)
  end

  def user_update_params
    params.require(:user).permit( :password, :name)
  end

  def user_update_password_params
    params.require(:user).permit(:password, :password_confirmation, :old_password)
  end

  def invalid_login_attempt
    @message = 'Error with your login or password'
    render 'message', :status => 401
  end

  def invalid_password
    @message = 'Invalid value for old password.'
    render 'message', :status => 401
  end

end
