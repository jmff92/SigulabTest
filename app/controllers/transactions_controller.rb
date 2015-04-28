class TransactionsController < ApplicationController
  def index
    if params[:type] == 'income'
      @transactions = Transaction.income
      render 'income'
    end
    if params[:type] == 'outcome'
      @transactions = Transaction.outcome
      render 'outcome'
    end
    
    # Normal Case (TOTAL)
    @total_income = 0
    @total_outcome = 0
    
    # PROCESS
    transactions = Transaction.all
    
    transactions.each do |t|
      if !t.income.blank?
        @total_income += t.income
      end
      if !t.outcome.blank?
        @total_outcome += t.outcome
      end
    end
    
    @balance = @total_income - @total_outcome
  end
end
