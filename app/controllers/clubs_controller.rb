
require 'util.rb'
class ClubsController < ApplicationController
  
  

  # GET /
  def search
  end

  
  

  # GET /clubs
  # GET /clubs.json
  def index

    # we look for synonyms or misspelled words in search string
    search_value = look_up_synonyms params['search-value'] 

    @criteria = Club.search search_value

    # @criteria = criteria[:view]

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


  def pruebas
  end  

  

  def look_up_synonyms search_value
    
    search_value.downcase!  

    synonyms_hash =
    {
      'futbol' => 'futbol 5',
      'paddle' => 'padel',
      'tenis'  => 'tennis',
      'guaymallen' => 'guaimallen'
    }

    # Search Values Array
    sva = search_value.split.compact #converts search value to array

    
    # looks for 'futbol 5' kind of strings in array an joins values
    if sva.include?('futbol')
      if sva[sva.index('futbol') + 1].present?

        following_word = sva[sva.index('futbol') + 1]

        # If following word to futbol is a number we join both array indexes
        if following_word.numeric?

          joinedString = 'futbol ' + following_word  
          sva[sva.index('futbol')..sva.index('futbol')+1 ] = joinedString  

        end  
      end
    end  




    # looks for synonyms in each word and replaces it  
    sva.map! do |word|
      if synonyms_hash.value? word    
        word = synonyms_hash.key word  
      end   
      word
    end

    

    sva.join(' ')

  end


  





  



end
