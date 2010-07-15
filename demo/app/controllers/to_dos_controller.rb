class ToDosController < ApplicationController
  # GET /to_dos
  # GET /to_dos.xml
  def index

    @data = {
      :to_do => ToDo.first.to_json
    }

    respond_to do |format|
      format.json { @data.to_json }
      format.html # index.html.erb
      format.xml  { render :xml => @to_dos }
    end
  end

  # GET /to_dos/1
  # GET /to_dos/1.xml
  def show
    @to_do = ToDo.find(params[:id])

    @data = {:to_do => @to_do}

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @to_do }
    end
  end

  # GET /to_dos/new
  # GET /to_dos/new.xml
  def new
    @to_do = ToDo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @to_do }
    end
  end

  # GET /to_dos/1/edit
  def edit
    @to_do = ToDo.find(params[:id])
  end

  # POST /to_dos
  # POST /to_dos.xml
  def create
    @to_do = ToDo.new(params[:to_do])

    respond_to do |format|
      if @to_do.save
        flash[:notice] = 'ToDo was successfully created.'
        format.html { redirect_to(@to_do) }
        format.xml  { render :xml => @to_do, :status => :created, :location => @to_do }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @to_do.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /to_dos/1
  # PUT /to_dos/1.xml
  def update
    @to_do = ToDo.find(params[:id])

    respond_to do |format|
      if @to_do.update_attributes(params[:to_do])
        flash[:notice] = 'ToDo was successfully updated.'
        format.html { redirect_to(@to_do) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @to_do.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.xml
  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy

    respond_to do |format|
      format.html { redirect_to(to_dos_url) }
      format.xml  { head :ok }
    end
  end
end
