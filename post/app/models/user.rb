class User < ActiveRecord::Base
  attr_accessible :bj_id, :content, :fname, :name
  validates :fname,:name,:presence=>true
  belongs_to  :bj,:class_name=>'Bj', :foreign_key=>"bj_id"
  has_many :attachments,:dependent=>:destroy,:as=>:attachmentable 

  def self.seach?(params)
	User.where(params).paginate(:page=>params[:page],:per_page=>30).order("created_at DESC")
 end 
  end
