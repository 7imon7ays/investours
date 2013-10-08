class UpdatesController < ApplicationController

  def create
    @update = Update.new(params[:update])
    @update.author = current_user

    respond_to do |format|
      if @update.save
        format.html { redirect_to :back, notice: 'Project updated.' }
        format.json { render json: @update, status: :created, location: @update }
      else
        format.html { redirect_to :back, notice: 'Project updated.' }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
    authorize! :create, @update
  end

  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:Update])
        format.html { redirect_to @update, notice: 'Update was successfully edited.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
