class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end

    def show

    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)

        respond_to do |format|
            if @portfolio_item.save
              format.html { redirect_to portfolios_path, notice: 'Your Portfolio item is now live' }
            else
              format.html { render :new }
            end
          end
    end

    private

    def portfolio_item_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
end
