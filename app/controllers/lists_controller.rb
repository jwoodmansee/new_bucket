class ListsController < ApplicationController
  before_action :find_bucket

  def index
    @lists = List.where(bucket_id:@bucket)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = @bucket.lists.new(list_params)
    if @list.save
      redirect_to bucket_list_path(@bucket, @list)
    else
      render :new
    end
  end

  def edit
    @list = @bucket.lists.find(params[:id])
  end

  def update
    @list = @bucket.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to bucket_list_path(@bucket, @list)
    else
      render :edit
    end
  end

  def destroy
    @list = @bucket.lists.find(params[:id])
    @list.destroy
    redirect_to bucket_path(@bucket)
  end

private

  def find_bucket
    @bucket = Bucket.find(params[:bucket_id])
  end

  def list_params
    params.require(:list).permit(:goal, :description, :completed, :bucket_id)
  end

end