class PaymentsController < ApplicationController
  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @payments = @category.payments.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @user = current_user
    @category = Category.find(params[:category_id])
    @payment = Payment.new
  end

  def create
    @user = current_user
    @category = Category.find(params[:category_id])
    @payment = @user.payments.new(payment_params)
    @payment.author = current_user

    if @payment.save
      @categorypayment = CategoryPayment.create(category: @category, payment: @payment)
      redirect_to user_category_payments_path(@category), notice: 'Transaction created successfully!'
    else
      puts @payment.errors.full_messages
      render :new
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
