class PhonesController < ApplicationController
  def create

    unless params[:number].present?
      assign_number(1)  
    else 
      contact =  Phone.where(is_assign: false, ph_number: params[:number]).first    
      if contact !=   nil
        contact.update_attributes(is_assign: true)
        render json: {number: contact.ph_number, message: "Congratulation! Your Request Number is Assign To You" }, status: :ok
      else
        assign_number(2)
      end
    end 
  end

  def index
    all_num = Phone.where(is_assign: true).pluck(:ph_number)
    if all_num != nil     
      render json: { message: "All Assigned Numbers ",numbers: all_num}, status: :ok
    else
      render json: { message: "No Numbers Assigned",numbers: all_num}, status: :ok
    end
  end

  private

  def assign_number(type)
    contact = Phone.where(is_assign: false).first
    if contact != nil
      contact.update_attributes(is_assign: true)
      if type == 1
        render json: {number: contact.ph_number, message: "Assign succes" }, status: :ok
      else
        render json: {number: contact.ph_number, message: "Requested Number is Not Available, Assign Other Number" }, status: :ok

      end
    else
      render json: { message: "All Use" }, status: :ok      
    end
  end
end
