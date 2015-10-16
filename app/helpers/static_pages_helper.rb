module StaticPagesHelper
	def full_title(page_title="")
		site_title = "PairBnB"
		if page_title.empty?
			site_title
		else
			"#{site_title} | #{page_title}".html_safe #use html_safe to escape apostrophe
		end
	end
end
