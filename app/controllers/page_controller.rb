class PageController < ApplicationController
  #before_action :authenticate_user, only: [:contact]

  def home
    if user_signed_in?
      @user = current_user
      
    else #user don't sign in, do nothing

    end
  end

  def addtag
    @user = current_user
    @input = params[:words]
    Rails.logger.debug("+++++++++++++++++  input: #{@input.inspect}")
    
    @tag = @user.word_list.add(@input)
    Rails.logger.debug("-----------------  tag: #{@tag.inspect}")
    @user.save
    @user.reload
    
    render :home
  end

  def removetag
    @user = current_user
    @input = params[:tag]
    Rails.logger.debug("+++++++++++++++++  input: #{@input.inspect}")
    
    @tag = @user.word_list.remove(@input)
    #Rails.logger.debug("-----------------  tag: #{@tag.inspect}")
    @user.save
    @user.reload
    
    render :home
  end

  def about
  end

  def contact
  end
end
