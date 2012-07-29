class ClubsController < ApplicationController
  
  # GET /
  def search
  end

  
  

  # GET /clubs
  # GET /clubs.json
  def index
    
    criteria = detect_search_criteria(params['search-value'])

    @clubs = Club.by_department(params['department'])
    @criteria = criteria.keys
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clubs }
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @club = Club.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @club }
    end
  end

  # GET /clubs/new
  # GET /clubs/new.json
  def new
    @club = Club.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @club }
    end
  end

  # GET /clubs/1/edit
  def edit
    @club = Club.find(params[:id])
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(params[:club])

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render json: @club, status: :created, location: @club }
      else
        format.html { render action: "new" }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.json
  def update
    @club = Club.find(params[:id])

    respond_to do |format|
      if @club.update_attributes(params[:club])
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    respond_to do |format|
      format.html { redirect_to clubs_url }
      format.json { head :no_content }
    end
  end

  # there are three possible search criterias 
  # 1: Clubs in a certain department
  # 2: Clubs which has certain court types: i.e futbol, tenis
  # 3: Clubs with a certain name
  # this method checks for the former two
  # returns Hash with department and sport ids if any 
  def detect_search_criteria search_value

    search_values_array =search_value.split.compact #converts search value to array

    
    criteria = {} 

    department = Department.where(:name => search_values_array).first
    unless department.blank?
      criteria[:department] = department.id 
      search_values_array.delete(department.name.downcase)
    end

    sport = Sport.where(:name => search_values_array).first
    unless sport.blank?
      criteria[:sport] = sport.id 
      search_values_array.delete(sport.name.downcase)
    end

    criteria[:name] = search_values_array.join unless search_values_array.blank?

    criteria


  end

end
