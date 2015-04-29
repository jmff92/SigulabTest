class RelationLoansController < ApplicationController
  before_action :set_relation_loan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @relation_loans = RelationLoan.all
    respond_with(@relation_loans)
  end

  def show
    respond_with(@relation_loan)
  end

  def new
    @relation_loan = RelationLoan.new
    respond_with(@relation_loan)
  end

  def edit
  end

  def create
    @relation_loan = RelationLoan.new(relation_loan_params)
    flash[:notice] = 'RelationLoan was successfully created.' if @relation_loan.save
    respond_with(@relation_loan)
  end

  def update
    flash[:notice] = 'RelationLoan was successfully updated.' if @relation_loan.update(relation_loan_params)
    respond_with(@relation_loan)
  end

  def destroy
    @relation_loan.destroy
    respond_with(@relation_loan)
  end

  private
    def set_relation_loan
      @relation_loan = RelationLoan.find(params[:id])
    end

    def relation_loan_params
      params.require(:relation_loan).permit(:prestamo, :item)
    end
end
