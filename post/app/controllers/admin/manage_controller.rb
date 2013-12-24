require "spreadsheet"
class Admin::ManageController < ApplicationController
	#login
  before_filter :authorize,:except=>:login
  def login
    @manage=Admin.find_by_sql(["select * from admins where manage=? and password=? ",params[:username],params[:password]])
	respond_to do |format|
    if @manage==[] then
	  user_id=0;
	  else
	  user_id=@manage[0].id;
	  session[:user_id]=@manage[0].manage
	  end
	format.json {render json: user_id}
end
end

  def seek
# binding.pry
  if params[:id]=~/^\d$/ then
  session[:field]='id'
  end

  if !params[:field].nil?  
  session[:field]=params[:field] 
  end
 if !params[:seek_value].nil?
  session[:seek_value]=params[:seek_value]   
  end
@user=User.seach?(session[:field]=>session[:seek_value])

end

  def delete_id

     @user=User.delete(params[:id])
 respond_to do |format|
 	 format.json {render json: @user}
  end
  end
 
  def authorize
   unless session[:user_id]
   redirect_to "/users"
  end
end

def spread_xls
i=1
@users=User.where(["id in (?)",params[:spread_id]])
Spreadsheet.client_encoding="UTF-8"
book=Spreadsheet::Workbook.new
sheet1=book.create_worksheet
sheet1.row(0).replace @users[1].attributes.keys
@users.each do |user|
arr=user.attributes.values
sheet1.row(i).replace arr
i+=1
end
sheet1.name="spread"
book.write 'public/uploads/excel/1.xls'
send_file 'public/uploads/excel/1.xls'
end
end
