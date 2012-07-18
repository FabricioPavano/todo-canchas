class DepartmentsController < ApplicationController
  #returns all departments as json
  def fetch
      @departments = Department.all
      render :json => @departments
  end
end
