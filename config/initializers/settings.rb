begin
  Settings.defaults[:site_title] = 'Site Title'
  Settings.defaults[:site_sub_title] = 'Site Subtitle'
  Settings.defaults[:footer] = "Copyright (c) 2010 Sitename.com. All rights reserved."
  Settings.defaults[:site_meta_title] = "Meta Title"
  Settings.defaults[:site_meta_keywords] = "Site Keywords"
  Settings.defaults[:site_meta_description] = "Meta Description"
  Settings.defaults[:site_email] = "email@email.com"
  Settings.defaults[:site_email_alert] = "email@email.com"
  Settings.defaults[:site_email_alert_subject] = "from mellterm"
  Settings.defaults[:ga_key] = "UA-xxxxxx-xx"
rescue => e
  puts "Please run pending migrations first. Settings table was not found"
end
  
