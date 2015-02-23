class PagesController < ApplicationController
  respond_to :html
  skip_before_filter :set_parent
  before_action :authenticate_user!
  before_action :get_lender
  def opportunities
    add_breadcrumb "Investment Opportunities", 'pages/opportunities'
    @borrowers_array = Borrower.all.map(&:id)
    @agreements = []
    @borrowers = Borrower.all
    @deals = Deal.active
    @target_data = []
    unless current_user.admin?
    @deals.each do |deal|
      @borrowers.each do |borrower|
        if borrower.targets.find_by_deal_id(deal.id)
          target = borrower.targets.find_by_deal_id(deal.id)
            @agreements[target.id] = Agreement.find_or_create_by(lender_id: @lender.id, target_id: target.id)
        end
      end
    end
    end
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
