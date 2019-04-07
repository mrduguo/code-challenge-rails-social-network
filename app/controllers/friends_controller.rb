class FriendsController < ApplicationController
  before_action :set_member
  before_action :set_friend, only: [:edit, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = @member.friends
  end


  # GET /friends/new
  def new
    @friend = Friend.new
    @friend.member=@member
  end

  # POST /friends
  # POST /friends.json
  def create
    respond_to do |format|
      if safe_create_friend
        format.html { redirect_to member_friends_path(@member), notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to member_friends_path(@member), notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def safe_create_friend
      new
      friend_name = friend_params[:friend_name]
      begin
        if friend_name.blank?
          @friend.errors.add(:friend_name, "can't be blank")
        else
          newFriend=Member.find_by(name: friend_name)
          if newFriend.nil?
            @friend.errors.add(:friend_name, "not exist: #{friend_name}")
          elsif @member.friends.where(friend_member_id: newFriend.id).exists?
            @friend.errors.add(:friend_name, "already exist: #{friend_name}")
          elsif @member.id==newFriend.id
            @friend.errors.add(:friend_name, "cannot be self")
          else
            return Friend.create(member: @member, friend_member: newFriend)
          end
        end
      rescue => e
        logger.error ([e.message]+e.backtrace).join($/)
      end
      @friend[:friend_name]=friend_name
      false
    end


    def set_member
      @member = Member.find(params[:member_id])
    end
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:friend_name)
    end
end
