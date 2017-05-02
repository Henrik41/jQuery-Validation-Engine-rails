class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json
  before_filter :get_current_user
  
  def index
    @albums = @user.albums.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = @user.albums.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new

    @album = @user.albums.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = @user.albums.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create

    @album = @user.albums.create(params[:album])
   
    
    respond_to do |format|
      if @album.save
        format.html { redirect_to '/profile/edit', notice: '@user.albums was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = @user.albums.find(params[:id])
   
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: '@user.albums was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = @user.albums.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to '/profile/edit' }
      format.json { head :no_content }
    end
  end

  
  private
  
     def get_current_user
       @user = current_user
       
    end
end
