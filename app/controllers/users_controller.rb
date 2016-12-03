class UsersController < ApplicationController
  force_ssl only: [:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # respond_to do |format|
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #     format.pdf { render :pdf,send_file("/home/shrikanth/projects/demo/public/test.pdf",
    #           filename: "name.pdf",
    #           type: "application/pdf")}
    #   # => end
    # end
    @users = User.all
    logger.info request.headers["test"]
    logger.info request.method
    logger.info request.get?
    logger.info request.format
    logger.info request.query_string
    response.content_type="text/html"
    response.headers["location"] = "/"
    response.status="404"
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.pdf { render :pdf,send_file("home/shrikanth/projects/demo/public/test.pdf",
              filename: "name.pdf",
              type: "application/pdf")}
      else
        flash[:error] = "Something Went Wrong"
        flash.keep
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
     logger.info flash.inspect
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
