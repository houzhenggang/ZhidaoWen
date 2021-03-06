class LogsController < ApplicationController
  #before_filter :login_required, :only=>[:new,:create]
  # GET /logs
  # GET /logs.xml
  def index
    @logs = Log.all(:order=>"created_at desc",:limit=>30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  # GET /logs/1
  # GET /logs/1.xml
  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /logs/new
  # GET /logs/new.xml
  def new
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end

  # GET /logs/1/edit
  def edit
    @log = Log.find(params[:id])
  end

  # POST /logs
  # POST /logs.xml
  def create
    @log = Log.new(params[:log])

    respond_to do |format|
      if @log.save
        flash[:notice] = 'Log was successfully created.'
        format.html { redirect_to(@log) }
        format.xml  { render :xml => @log, :status => :created, :location => @log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logs/1
  # PUT /logs/1.xml
  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        flash[:notice] = 'Log was successfully updated.'
        format.html { redirect_to(@log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.xml
  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to(logs_url) }
      format.xml  { head :ok }
    end
  end
end
