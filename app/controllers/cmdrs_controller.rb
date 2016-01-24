class CmdrsController < ApplicationController
  def index
    @cmdrs = Cmdr.all
  end
end
