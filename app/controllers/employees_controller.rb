class EmployeesController < ApplicationController
  
  before_filter :validate_request, :only => [:create, :update]

  def validate_request
    if params[:commit] == "Cancel"
      redirect_to employees_path
    end
  end
  
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
