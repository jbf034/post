#encoding:utf-8
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  @@contenttype='image'
  def index
	@users=User.paginate(:page=>params[:page],:per_page=>30).order("created_at DESC")  
	  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


	
  # GET /users/1.json
  def show
@user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
	if @user.save

 Attachment.create(:attachment=>params[:attachment],:attachmentable=>@user) if params[:attachment]
	format.html { redirect_to @user, :notice=>'文件上专成功' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
   
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: '信息成功更新.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def add_grade
@attach=Attachment.find(params[:attachment_id])
  @attach.grade+=params[:rate].to_i
    respond_to do |format|
	if @attach.save
      format.json {render :json=>@attach.grade}
	 end
   end
   end

def seach
para=params[:id].strip 
if para.match(/^bj\d{6}$/) then
@users=Bj.find(para.match(/\d{6}/).to_s).users.paginate(:page=>params[:page],:per_page=>30).order("created_at DESC")
elsif (para=='now_upload') then
  @users=User.paginate(:page=>params[:page],:per_page=>30,:conditions=>["created_at like ?",Time.now.strftime("%Y-%m-%d")+'%']).order("created_at DESC")
  elsif (para=='option') then
  @users=User.seach?('name'=>params[:seek_value])
  elsif (para=='boutique') then
  @users=User.seach?('')
  end
    respond_to do |format|
      format.html # seach.html.erb
      format.json { render json: @users }
	end
end
end
