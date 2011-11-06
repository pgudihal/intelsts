class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  before_filter :authenticate_user!


  def index
    @assignments = get_all_my_assignments(current_user.id)

     @evaluators = Evaluator.all

     @search = Assignment.search(params[:search])
    #@assignments = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(parmas[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
     @assignment = Assignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to :back }
        #format.html { redirect_to :back, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        #format.html { render action: "new" }
        format.html { redirect_to :back, notice: "The evaluator and project are already assigned to each other!" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        #format.html { redirect_to Application.find(@assignment.application_id), notice: 'Assignment was successfully updated.' }
        #format.html { redirect_to Application.find(@assignment.application_id) }
        format.html { redirect_to :back }

        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])

    
  
    @assignment.destroy
    @assignments = get_all_assignments_for_project(@assignment.application_id)


    respond_to do |format|
      #TODO fix bug where it doesn't refresh
      format.html { redirect_to(assignments_url) }
      #format.html { redirect_to Application.find(@assignment.application_id), notice: 'Assignment was successfully updated. (Refresh page to view changes!)' }
      #format.html { redirect_to assignments_url }
      #format.js { render :layout=>false }
      #format.json { head :ok }
    end
  end


def get_all_my_assignments(id)

  if current_user.admin? or current_user.staff?
    all_assignments = Assignment.order('assignments.id DESC')   
  else
    all_assignments = Assignment.where(:evaluator_id => current_user.id).order('assignments.id DESC')
  end
end


end
