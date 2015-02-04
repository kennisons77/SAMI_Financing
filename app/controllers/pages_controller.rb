class PagesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def opportunities
  add_breadcrumb "Investment Opportunities", 'pages/opportunities'
    @borrowers = Borrower.all
    @deals = Deal.active
  end

  def agreement_confirmation
    add_breadcrumb "Investment Opportunities", 'pages/opportunities'
    add_breadcrumb "Investment Opportunities", 'pages/agreement_confirmation'
    @sel_agreements = Agreements.where(:status=> nil)
  end

  # def allocation_report
  # add_breadcrumb "Allocation Report", 'pages/opportunities'
  # end
end
