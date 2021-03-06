# encoding: UTF-8

class MealsController < ApplicationController
  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.order("meal_date DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @meals }
    end
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = Meal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
  end

  # POST /meals
  # POST /meals.json
  def create
    @guest_name = params[:meal][:guest_name]
    params[:meal].delete :guest_name
    @guest = Guest.where(:name => @guest_name).first
    if (@guest.nil?)
      @guest = Guest.new
      @guest.name = @guest_name
    end

    @meal = Meal.new(params[:meal])
    @meal.guest = @guest

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, :notice => 'Le repas a été créé avec succès.' }
        format.json { render :json => @meal, :status => :created, :location => @meal }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = Meal.find(params[:id])

    respond_to do |format|
      @guest_name = params[:meal][:guest_name]
      params[:meal].delete :guest_name
      @guest = Guest.where(:name => @guest_name).first
      if (@guest.nil?)
        @guest = Guest.new
        @guest.name = @guest_name
      end
      @meal.guest = @guest      
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to @meal, :notice => 'Le repas a été mis à jour avec succès.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end
end
