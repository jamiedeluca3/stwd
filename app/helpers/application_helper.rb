module ApplicationHelper
	# Convert an external URL
	def fix_url(str)
		str.starts_with?("http://") ? str : "http://#{str}"
	end

	# Date and time stamp format
	def display_datetime(dt)
		dt.strftime("%m/%d/%Y %I:%M%P %Z")  # MM/DD/YY H:MM AM/PM
	end
end
