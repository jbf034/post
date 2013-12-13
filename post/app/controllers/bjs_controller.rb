class BjsController < ApplicationController
  # GET /bjs
  # GET /bjs.json
  def index
    @bjs = Bj.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bjs }
    end
  end

  # GET /bjs/1
  # GET /bjs/1.json
  def show
    @bj = Bj.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bj }
    end
  end

  # GET /bjs/new
  # GET /bjs/new.json
  def new
    @bj = Bj.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bj }
    end
  end

  # GET /bjs/1/edit
  def edit
    @bj = Bj.find(params[:id])
  end

  # POST /bjs
  # POST /bjs.json
  def create
    @bj = Bj.new(params[:bj])

    respond_to do |format|
      if @bj.save
        format.html { redirect_to @bj, notice: 'Bj was successfully created.' }
        format.json { render json: @bj, status: :created, location: @bj }
      else
        format.html { render action: "new" }
        format.json { render json: @bj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bjs/1
  # PUT /bjs/1.json
  def update
    @bj = Bj.find(params[:id])

    respond_to do |format|
      if @bj.update_attributes(params[:bj])
        format.html { redirect_to @bj, notice: 'Bj was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bjs/1
  # DELETE /bjs/1.json
  def destroy
    @bj = Bj.find(params[:id])
    @bj.destroy

    respond_to do |format|
      format.html { redirect_to bjs_url }
      format.json { head :no_content }
    end
  end
end
