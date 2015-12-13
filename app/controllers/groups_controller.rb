class GroupsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :group_id, only: [:show, :edit, :destroy]

	def index
		@groups = current_user.groups.all
	end

	def new
		@group = current_user.groups.build
	end

	def create
		@group = current_user.groups.build(group_params)
		if @group.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def show
	end

	def destroy
	end

	def group_params
		params.require(:group).permit(:name, :description)
	end

	def group_id
		@group = Group.find(params[:id])
	end

end
