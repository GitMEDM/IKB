module ApplicationHelper

	def status_konta(boolean, options={})
		options[:true_text] ||= ''
		options[:false_text] ||= ''
		if boolean
			content_tag(:span, options[:true_text], :class => "glyphicon glyphicon-font")
		else
			content_tag(:span, options[:false_text], :class => "glyphicon glyphicon-user")
		end
	end

end
