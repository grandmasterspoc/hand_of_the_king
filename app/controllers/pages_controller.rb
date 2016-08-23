class PagesController < ApplicationController
  
  def about
  end

  def price_page
    user = User.find_by(referral_code: current_user.parent_code)
    @friend = "#{user.first_name} #{user.last_name}"
  end 

  def profile
    if user_signed_in?
      @user = current_user
      @users_friends = User.where(parent_code: current_user.referral_code)
      @users_friends_count = @users_friends.count
      @job_links = @user.job_links.all
      @job_applications_count = @job_links.map { |j| j.job_applications.count }.inject(:+) 
    end  
  end

  def sharing
    if user_signed_in?
      @user = current_user
      @share_url = "#{root_url.split('//').last}ref?d=#{@user.referral_code}"
    end  
  end 

  def mission
  end 

  def import_success
    @user = current_user
  end  
end
