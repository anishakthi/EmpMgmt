class EmployeesController < ApplicationController
  def new 
  end
  
  def index
  	@employee = Employee.all
  	end
    
  def create
    @employee = Employee.new(add_employee_request)
    # returns boolean 
    @employee.save
    render :action => 'show'
  end
  
  def show
  		@employee = Employee.find(params[:id]) 
  end
    
  private 
  def add_employee_request
  		params.require(:employee).permit(:name, :doj, :status, :dob)
  end
end
