class ExpensesController < ApplicationController
	before_action :find_group
	before_action :find_expense, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def create
		@expense = @group.expenses.create(expense_params)
		@expense.user_id = current_user.id
		if @expense.save
			redirect_to group_path(@group)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @expense.update(expense_params)
      redirect_to group_path(@group)
    else
      render 'edit'
    end
	end

	def destroy
		@expense.destroy
    redirect_to group_path(@group)
	end

	private
		def expense_params
			params.require(:expense).permit(:description)
		end
		
		def find_group
			@group = Group.find(params[:group_id])
		end

		def find_expense
			@expense = @group.expenses.find(params[:id])
		end

end
