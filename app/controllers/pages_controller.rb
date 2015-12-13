class PagesController < ApplicationController

	def home
		redirect_to :controller => 'groups', :action => 'index' if current_user
	end
end
