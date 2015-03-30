class PagesController < ApplicationController
  respond_to :html
  skip_before_filter :objects_crumb
  skip_before_filter :set_parent
  before_action :authenticate_user!
  before_action :get_lender
  
  def home
    
  end
  
  def opportunities
    add_breadcrumb "Investment Opportunities", 'opportunities'
    @borrowers_array = Borrower.all.map(&:id)
    @agreements = []
    @borrowers = Borrower.active
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
    add_breadcrumb "Agreement Confirmation", 'pages/agreement_confirmation'
    params["agreement"].each do |borrower,agrees|
      agrees.each do |num, cash|
          agree = Agreement.find(num)
          if cash["amount"].to_f > 0.00
          agree.amount=cash["amount"]
         
          agree.status = "selected" if agree.status.nil?
          agree.save
          else
          #agree.destroy
          end
      end
    end

    @lender.agreements.where(:amount_cents=>0).each do |empty_agreement|
      #empty_agreement.destroy
    end
    @sel_agreements = @lender.agreements.selected.not_empty
    @conf_agreements = @lender.agreements.confirmed
  end

# def allocation_report
# add_breadcrumb "Allocation Report", 'pages/opportunities'
# end
end
