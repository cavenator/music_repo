class MusicPageController < ApplicationController
  before_filter :clearMusicFilter, :only=>[:index]
  def index
        session[:music] = nil
  end
  
  def filter_music_by_category
  	name = params[:filter_column] 
        value = "%"+params[:filter_value]+"%"
#	puts "name = #{name}, value = "#{value}"
	if value.empty?
 		@filtered_list = Music.find_music_for_store
 	else
# 		@filtered_list = Music.find_by_sql("select * from musics where #{value} like '%#{name}%'")
		@filtered_list = Music.find(:all,:conditions=>["#{name} like ?",value]) 
	end
 	session[:music] = @filtered_list
 	@selected_list = find_selectedlist
 	respond_to do |format|
 		format.js
 	end
 	  	
  	if @filtered_list.size == 0
	    logger.error("Attempted to search for an invalid song: #{params[:id]}")
	    flash[:notice] = "Invalid search criteria"
	else
		flash[:notice] = nil
  	end
  	
  	rescue ActiveRecord::RecordNotFound
	redirect_to_display
  end
  
  def display 
  	session[:music] ||= Music.find_music_for_store
  	@music = session[:music]
  	@filtered_list = session[:music]
  	@selected_list = find_selectedlist
  	respond_to do |format|
  		format.html
  		format.xml {render :xml => @music}
  	end
  end
  
  def add_previewed_music_to_list
  	selected = Music.find(params[:id])
  	@selected_list = find_selectedlist
  	@selected_list.add_songs_to_list(selected)
  	redirect_to :action => 'display'
  	
  	rescue ActiveRecord::RecordNotFound
  	logger.error("Attempted to validate an inappropriate song, id = #{params[:id]}")
  	redirect_to_display "Invalid Song!"
  end
  
  def view_songs
  	@selected_list = find_selectedlist
        respond_to do |format|
	   format.html 
	   format.json { render :json=>@selected_list.to_json, :layout => false}
	end
  end
  
  def create_playlist
  	@selected_list = find_selectedlist
  	if @selected_list.songs.size == 0
  		redirect_to_display "Cannot create empty playlist"
  	else
  		@playlist = PlayList.new
#  		puts "Playlist object = #{@playlist}; is playlist nil? #{@playlist.nil?}"
  	end
  end
  
  def empty_music_selection
  	session[:selectedlist] = nil
  	redirect_to_display "Music selection has been cleared"
  end
  
  def save_playlist
  	@selected_list = find_selectedlist
  	@playlist = PlayList.new(params[:playlist])
  	@playlist.add_songs_from_selected_list(@selected_list)
  	if @playlist.save
  		session[:selectedlist] = nil
  		redirect_to_display("Playlist #{params[:playlist_title]} has been saved")
  	else
  		render  :action => 'create_playlist'
  	end
  end
  
  private
  
  def find_selectedlist
  	session[:selectedlist] ||= SelectedList.new
  end
  
  
  def redirect_to_display(flash_notice)
	flash[:notice] = flash_notice
  	redirect_to :action => 'display'
  end
  
  def clearMusicFilter
      session[:music] = nil
  end 
end
