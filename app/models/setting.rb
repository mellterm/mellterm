class Setting < ActiveRecord::Base
  
  def self.update_or_create(var, value)
    # value.gsub!(/\'/,'') # Remove single quotes"
    # value.gsub!(/\"/,'') # Remove double quotes"
    # value.gsub!(/\#/,'') # Remove hash"
    # value.gsub!(/\&/,'') # Remove amp"
    # value.gsub!(/\*/,'') # Remove star"
    
    if setting = Setting.find(:first, :conditions => ["var = ?", var])
      setting.update_attribute(:value, value)
    else
      Setting.create(:var => var, :value => value)
    end
  end
  
	def self.set(k, v=nil)
		#x = find_by_name(k)
		x= find(:first, :conditions => ["var = ? ",k])

		# Create if it doesn't exist yet, return result #
		return Setting.create(:name=>k, :value=>v) if x.nil?

		# Update if already exists, return result #
		return x.update_attributes(:value=>v)
	end

	def self.get(k)
		#x = find_by_name(k)
		x = find(:first, :conditions => ["var = ? ",k])

		# Return nil gracefully if non-existent #
		return nil if x.nil?

		# Return value if exists #
		return x.value
	end

	def self.method_missing(meth, *args)
		# Weed out finds #
		if meth.to_s.match(/^find/)
			super
		elsif meth.to_s.match(/^(.*)=$/)
			return Setting.set($1, args.first)
		else
			return Setting.get(meth.to_s)
		end
	end
  
  
end
