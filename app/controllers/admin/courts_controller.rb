class Admin::CourtsController < ApplicationController
  
  layout 'admin'

  def index
    @club = Club.find(params[:club_id])
    @courts = @club.courts
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courts }
    end
  end

  def show
    @club = Club.find(params[:club_id])
    @court = @club.courts.find(params[:id])	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @club }
    end
  end

  # GET /clubs/new
  # GET /clubs/new.json
  def new
    @club = Club.find(params[:club_id])
    @court = Court.new
    @court.club = @club

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @club }
    end
  end

  # GET /clubs/1/edit
  def edit
     @club =  Club.find(params[:club_id])
     @court = @club.courts.find(params[:id])	
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.find(params[:club_id])
    @court = @club.courts.new(params[:court])

    respond_to do |format|
      if @court.save
        format.html { redirect_to [:admin, @club, @court], notice: 'Club was successfully created.' }
        format.json { render json: [@club, @court], status: :created, location: [@club, @court] }
      else
        format.html { render action: "new" }
        format.json { render json: @court.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.json
  def update
    @club = Club.find(params[:club_id])
    @court = @club.courts.new(params[:court])

    respond_to do |format|
      if @club.update_attributes(params[:club])
        format.html { redirect_to [:admin, @club, @court], notice: 'Club was successfully updated.' }
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
    @club = Club.find(params[:club_id])
    @court = @club.courts.find(params[:id])
    @court.destroy

    respond_to do |format|
      format.html {redirect_to [:admin, @club, @court] }
      format.json { head :no_content }
    end
  end
end



