class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    #candidate = Candidate.find(params[:id])
  end

  def show
    @comment = Comment.new
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.order(created_at: :desc)#:desc = 降順
  end

　def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
  end

  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Item.where(name: value).or(Item.where(genre_id: value))
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Item.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
    Item.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

  def shop_params
    eat_in = params[:status][:eat_in].present? ? params[:status][:eat_in] : "0"
    take_out = params[:status][:take_out].present? ? params[:status][:take_out] : "0"
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :comment_id, :atmosphere_id, :status, :product_id)
  end

