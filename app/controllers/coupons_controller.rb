class CouponsController < ApplicationController
	
	def index 
    @coupons = Coupon.all
  end

  def new
    @new_coupon = Coupon.new
    
  end

  def create
    @new_coupon = Coupon.new(coupon_params)
    if @new_coupon.save
      redirect_to coupons_path
    else
      redirect_to new_coupon_path
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    @coupon = Coupon.find(params[:id])
    if @coupon.update_attributes(coupon_params)
      redirect_to coupons_path
    else
      redirect_to coupon_path
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])

    if @coupon.delete
      redirect_to coupons_path
    end
  end

  def search
    
    @search_results = Coupon.search(params[:search])
    render results_coupons_path
  end



  def download_coupon_pic
    @coupon = Coupon.find(params[:id])
    file = @coupon.coupon_pic
    send_file file.path
  end


  private

  def coupon_params
    params.require(:coupon).permit!
  end 
end