class EmployeesController < ApplicationController

  # Method to List all Employees
  def index
  	@employee = Employee.all
  end
  
  # Method to render new Page
  def new 
    @employee = Employee.new
  end
  
  # Method to create Employee.
  def create
      @employee = Employee.new(add_employee_request)
      # returns boolean
      if @employee.save
          redirect_to @employee
        else
          # Renders the new page with the errors
          render 'new'
       end
  end
  
  #Method to show the Employee details of the id passed.
  def show
  		@employee = Employee.find(params[:id]) 
  end
  
  # Method to populate the edit page with the values.
  def edit
    @employee = Employee.find(params[:id])
  end
  
  # Methos to update the Employee details
  def update
    @employee = Employee.find(params[:id])
    if @employee.update(add_employee_request)
      redirect_to @employee
    else
      render 'edit'
    end
  end
  
  #Method to delete the Employee document.
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end
  
  # Method to tell which params are allowed inside the controller action methods.
  private 
  def add_employee_request
  		params.require(:employee).permit(:name, :doj, :status, :dob)
  end
end
