class PlayListsController < ApplicationController
  # GET /play_lists
  # GET /play_lists.xml
  def index
    @play_lists = PlayList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @play_lists }
    end
  end

  # GET /play_lists/1
  # GET /play_lists/1.xml
  def show
    @play_list = PlayList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @play_list }
    end
  end

  # GET /play_lists/new
  # GET /play_lists/new.xml
  def new
    @play_list = PlayList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @play_list }
    end
  end

  # GET /play_lists/1/edit
  def edit
    @play_list = PlayList.find(params[:id])
  end

  # POST /play_lists
  # POST /play_lists.xml
  def create
    @play_list = PlayList.new(params[:play_list])

    respond_to do |format|
      if @play_list.save
        format.html { redirect_to(@play_list, :notice => 'PlayList was successfully created.') }
        format.xml  { render :xml => @play_list, :status => :created, :location => @play_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /play_lists/1
  # PUT /play_lists/1.xml
  def update
    @play_list = PlayList.find(params[:id])

    respond_to do |format|
      if @play_list.update_attributes(params[:play_list])
        format.html { redirect_to(@play_list, :notice => 'PlayList was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /play_lists/1
  # DELETE /play_lists/1.xml
  def destroy
    @play_list = PlayList.find(params[:id])
    @play_list.destroy

    respond_to do |format|
      format.html { redirect_to(play_lists_url) }
      format.xml  { head :ok }
    end
  end
end
