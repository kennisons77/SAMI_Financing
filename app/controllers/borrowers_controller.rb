class BorrowersController < InheritedResources::Base

  private

    def borrower_params
      params.require(:borrower).permit(:title)
    end
end

