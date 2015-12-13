class MembershipsController < ApplicationController
	before_action :authenticate_user!
  before_action :getGroup, only: [:index, :create, :new]
  before_action :getMembership, only: [:show, :edit, :destroy]

	def index
    @memberships = @group.memberships.all
	end

	def new
		@group = @group.memberships.build
	end

	def create
    params.require(:email)
    @membership = findOrCreateUserAndMembership(params[:email])
    if @membership.save
      redirect_to :controller => 'memberships', :action => 'index'
		else
      render 'index'
		end
	end

	def edit
	end

	def show
	end

	def destroy
    @membership.destroy
    redirect_to :controller => 'memberships', :action => 'index'
	end

  private
    def findOrCreateUserAndMembership(email)
      user = User.exists?(email: email) ? User.find_by_email(email) : User.create(email: email)
      membership = @group.memberships.build
      if !user.persisted?
        user.password = SecureRandom.uuid
        user.save
      end
      membership.status = MembershipStatus::PENDING
      membership.user = user
      membership.group = @group
      return membership
    end

    def membershipParams
      params.require(:user, :status).permit(:user, :status, :email)
    end

    def getGroup
      @group = Group.find(params[:group_id])
    end

    def getMembership
      @membership = Membership.find(params[:id])
    end

end
