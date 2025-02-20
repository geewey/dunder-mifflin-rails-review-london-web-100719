class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.create(employee_params)
        @dogs = Dog.all
        if @employee.save
            # @employee.save
            redirect_to @employee
        else
            # byebug
            flash[:errors] = @employee.errors.full_messages.to_sentence
            render :new
        end
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
        if @employee.update(employee_params)
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages.to_sentence
            render :edit
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
