class PagesController < ApplicationController
before_action :authenticate_user!
  respond_to :html

  def opportunities
  add_breadcrumb "Investment Opportunities", 'pages/opportunities'
    @borrowers = Borrower.all
    @deals = Deal.active
  end

  def allocation_report
  add_breadcrumb "Allocation Report", 'pages/opportunities'
  end
end
