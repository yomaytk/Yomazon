module ApplicationHelper

	def full_title (pagetitle = "")
		if(pagetitle.empty?)
			"Yomazon"
		else
			"Yomazon | " + pagetitle
		end
	end

end
