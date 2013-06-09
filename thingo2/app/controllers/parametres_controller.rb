class ParametresController < ApplicationController
    before_filter :get_user
  # GET /parametres
  # GET /parametres.xml
  def index
    @parametres = Parametre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parametres }
    end
  end

  # GET /parametres/1
  # GET /parametres/1.xml
  def show
    @parametre = Parametre.find(params[:id])

    respond_to do |format|
         format.js {}
      format.html # show.html.erb
      format.xml  { render :xml => @parametre }
    end
  end

  # GET /parametres/new
  # GET /parametres/new.xml
  def new
    @parametre = Parametre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parametre }
    end
  end

  # GET /parametres/1/edit
  def edit
    @parametre = Parametre.find(params[:id])
       respond_to do |format|
           format.js{}
           format.html
         end
  end

  # POST /parametres
  # POST /parametres.xml
  def create
    @parametre = Parametre.new(params[:parametre])

    respond_to do |format|
      if @parametre.save
        format.js{}
        format.html { redirect_to(@parametre, :notice => 'Parametre was successfully created.') }
        format.xml  { render :xml => @parametre, :status => :created, :location => @parametre }
      else
 
        format.html { render :action => "new" }
        format.xml  { render :xml => @parametre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parametres/1
  # PUT /parametres/1.xml
  def update
    @parametre = Parametre.find(params[:id])

    respond_to do |format|
      if @parametre.update_attributes(params[:parametre])
        format.html { redirect_to(@parametre, :notice => 'Parametre was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parametre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parametres/1
  # DELETE /parametres/1.xml
  def destroy
    @parametre = Parametre.find(params[:id])
    @parametre.destroy

    respond_to do |format|
      format.html { redirect_to(parametres_url) }
      format.xml  { head :ok }
    end
  end
  private
  def get_user
    @user = current_user
  end

  
end
