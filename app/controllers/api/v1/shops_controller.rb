class Api::V1::ShopsController < ApplicationController
  before_action :set_api_v1_shop, only: [:show, :update, :destroy]

  # GET /api/v1/shops
  def index
    shops = Shop.all

    render json: ShopBlueprint.render_as_json(shops, view: :normal, root: :shop)
  end

  # GET /api/v1/shops/1
  def show
    render json: [ShopBlueprint.render_as_json(@api_v1_shop, view: :extended, root: :@api_v1_shop), total_price: @api_v1_shop.authors.map(&:books).flatten.map(&:price).sum]
  end

  # POST /api/v1/shops
  def create
    @api_v1_shop = Shop.new(api_v1_shop_params)

    if @api_v1_shop.save
      render json: @api_v1_shop, status: :created, location: @api_v1_shop
    else
      render json: @api_v1_shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/shops/1
  def update
    if @api_v1_shop.update(api_v1_shop_params)
      render json: @api_v1_shop
    else
      render json: @api_v1_shop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/shops/1
  def destroy
    @api_v1_shop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_shop
      @api_v1_shop = Shop.includes(:authors).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_shop_params
      params.fetch(:api_v1_shop, {})
    end
end
