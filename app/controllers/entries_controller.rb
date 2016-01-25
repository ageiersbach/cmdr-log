class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = current_commander.entries.build
  end

  def create
    @entry = current_commander.entries.build(entry_params)
    if @entry.save
      redirect_to cmdr_entry_path(current_commander, @entry)
    else
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to cmdr_path(current_commander)
  end

  private

  def entry_params
    params.require(:entry).permit(:system_object_id, :activity)
  end

end