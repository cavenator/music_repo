class SongListsController < ApplicationController
  # GET /song_lists
  # GET /song_lists.xml
  def index
    @song_lists = SongList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @song_lists }
    end
  end

  # GET /song_lists/1
  # GET /song_lists/1.xml
  def show
    @song_list = SongList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song_list }
    end
  end

  # GET /song_lists/new
  # GET /song_lists/new.xml
  def new
    @song_list = SongList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song_list }
    end
  end

  # GET /song_lists/1/edit
  def edit
    @song_list = SongList.find(params[:id])
  end

  # POST /song_lists
  # POST /song_lists.xml
  def create
    @song_list = SongList.new(params[:song_list])

    respond_to do |format|
      if @song_list.save
        format.html { redirect_to(@song_list, :notice => 'SongList was successfully created.') }
        format.xml  { render :xml => @song_list, :status => :created, :location => @song_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /song_lists/1
  # PUT /song_lists/1.xml
  def update
    @song_list = SongList.find(params[:id])

    respond_to do |format|
      if @song_list.update_attributes(params[:song_list])
        format.html { redirect_to(@song_list, :notice => 'SongList was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /song_lists/1
  # DELETE /song_lists/1.xml
  def destroy
    @song_list = SongList.find(params[:id])
    @song_list.destroy

    respond_to do |format|
      format.html { redirect_to(song_lists_url) }
      format.xml  { head :ok }
    end
  end
end
