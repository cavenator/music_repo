class MusicsController < ApplicationController
  # GET /musics
  # GET /musics.xml
  
  def index
    @musics = Music.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout => false }
      format.json { render :json=>@musics.to_json,:layout => false }
    end
  end

  # GET /musics/1
  # GET /musics/1.xml
  def show
    @music = Music.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.xml
  def new
    @music = Music.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @music }
    end
  end

  # GET /musics/1/edit
  def edit
    @music = Music.find(params[:id])
  end

  # POST /musics
  # POST /musics.xml
  def create
    @music = Music.new(params[:music])

    respond_to do |format|
      if @music.save
        format.html { redirect_to(@music, :notice => 'Music was successfully created.') }
        format.xml  { render :xml => @music, :status => :created, :location => @music }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @music.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def get_playlists_for_song
    	@music = Music.find(params[:id])
    	@playlists = @music.play_lists
    	respond_to do |format|
    		format.html
    		format.xml {render :layout=>false }
    	end
  end

  # PUT /musics/1
  # PUT /musics/1.xml
  def update
    @music = Music.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to(@music, :notice => 'Music was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @music.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.xml
  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to(musics_url) }
      format.xml  { head :ok }
    end
  end
end
