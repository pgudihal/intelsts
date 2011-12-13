class ApplicationsController < ApplicationController
  # GET /applications
  # GET /applications.json
before_filter :authenticate_user!
load_and_authorize_resource

def parse
    metadata = Spreadsheet.open('stsdata.xls')
    book1 = metadata.worksheet 0
    book1.each 1 do |row|
    #puts row
    @application = Application.new
    @application.applicant = row[0] + " " + row[1]
    @application.application_name = row[64]
    @application.app_client_id = row[73]
    @application.save!
    end

     respond_to do |format|
      format.html { redirect_to applications_url, notice: 'New Applications were successfully imported'  }
      format.json { head :ok }
    end
  end
  
helper_method :sort_column, :sort_direction

  def index
    @search = Application.search(params[:search])
    @applications =  Application.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    
    @application = Application.find(params[:id])
    @assignment = Assignment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @application = Application.new 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @assignment = Assignment.new
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
   
    @assignments = Assignment.where(:application_id => params[:id])

    @assignments.each do |a|
      a.destroy
    end

     @application.destroy
     
    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :ok }
    end
  end
  
  private
    def sort_column
      Application.column_names.include?(params[:sort]) ? params[:sort] : "application_name"
    end
    
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
