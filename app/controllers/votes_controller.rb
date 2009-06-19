class VotesController < ApplicationController  
               
  before_filter :authenticated?
  
   def create
    @topic = Topic.find(params[:topic_id])
    # @vote = @topic.votes.create!
    @vote = @topic.votes.build(params[:vote]) 
    @vote.user = current_user
    
    respond_to do |wants|
      if @vote.save
        flash[:notice] = "Vote was successfully created for #{@vote.topic.title}."
        wants.html { redirect_to(topics_path) }
        wants.xml { render :xml => @vote, :status => :created, :location => @vote }
      else
        wants.html { render :action => "topics/index" }
        wants.xml { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
   end
           
   # DELETE /topics/1
   def destroy
     @vote = Topic.find(params[:topic_id]).votes.last
     @vote.destroy
     redirect_to(topics_url)
   end
           
   def authenticated?
      if !logged_in?
        flash[:notice] = "You must login to do that"
        #redirect_to root_path
        redirect_to topics_path   #mt add: show user all topics after login
        false
      end 
    end
    
end
