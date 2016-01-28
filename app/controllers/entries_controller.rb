class EntriesController < ApplicationController

  def show
    @entry = Entry.find(params[:id])
    @mining_entry = MiningEntryPresenter.new(@entry)
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

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to cmdr_path(current_commander)
    else
      redirect_to cmdr_entry_path(current_commander, @entry)
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to cmdr_path(current_commander)
  end

  private

  def entry_params
    params.require(:entry).permit(:system_object_id, :activity, :is_closed)
  end

end
