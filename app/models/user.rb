class User < ActiveRecord::Base
  class DestroyDenied
  end
  
  has_and_belongs_to_many :categories
  has_many :feed_sites
  has_many :own_categories, :class_name => "Category", :foreign_key => "owner_id"
  has_many :translations 
  
  acts_as_authentic
  
  # acts_as_authentic do |c|
  #   c.validates_length_of_login_field_options = {:within => 4..40}
  # end
  
  before_destroy :keep_admin
  
  # get users that have requests within the last 24 hours
  def self.last_logged
    time = Time.now - (3600*24)
    self.find(:all, :conditions => ["last_request_at > ?",time], :order => "last_request_at DESC")
  end
  
  def admin?
    self.admin
  end
  
  def self.admin_count
    count(:conditions => ["admin = ?",true])
  end
  
  private
  
  def keep_admin
    if self.admin? && User.admin_count < 2
      #raise ActiveRecord::ActiveRecordError
      raise Exceptions::DestroyDenied
    end
  end
    
end
