class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users, except: [:password_hash, :password_salt]
  end

  # GET /users/1
  def show
    render json: @user, except: [:password_hash, :password_salt]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, except: [:password_hash, :password_salt], status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, except: [:password_hash, :password_salt]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: user.as_json(except: [:password_hash, :password_salt]).merge(auth_token: auth_token), status: :ok
    else
      render json: {error: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def unique_email?
    email = params[:email]
    if email.nil? or email.length == 0
      render json: { valid: false }
    elsif User.find_by(email: email)
      render json: { valid: false }
    else
      render json: { valid: true }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:name)
      params.require(:email)
      params.require(:password)
      params.require(:password_confirmation)
      params.require(:active)
      params.require(:admin)
      params.permit(:name,:email,:active,:admin,:password,:password_confirmation)
     # params.require(:user, :).permit(:name, :email, :active, :password, :password_confirmation, :admin)
    end
end
