class PagesController < ApplicationController
before_action :authenticate_user!

  def opportunities
    @borrowers = Borrower.all
    @deals = Deal.active
  end

  def allocation_report
  end
end
