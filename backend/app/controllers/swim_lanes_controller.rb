class SwimLanesController < ApplicationController
    before_action :set_swim_lane, only: %i[show update destroy]

    # GET /swim_lanes
    def index
        if params[:board]
            @board = Board.find_by(id: params[:board])
            @swim_lanes = @board.swim_lanes
        else
            @swim_lanes = SwimLane.all
        end
        render json: @swim_lanes, include: %i[cards]
    end

    # GET /swim_lanes/1
    def show
        render json: @swim_lane, include: %i[cards]
    end

    # POST /swim_lanes
    def create
        @swim_lane = SwimLane.new(swim_lane_params)

        if @swim_lane.save
            render json: @swim_lane,
                   include: %i[cards],
                   status: :created,
                   location: @swim_lane
        else
            render json: @swim_lane.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /swim_lanes/1
    def update
        if @swim_lane.update(swim_lane_params)
            render json: @swim_lane, include: %i[cards]
        else
            render json: @swim_lane.errors, status: :unprocessable_entity
        end
    end

    # DELETE /swim_lanes/1
    def destroy
        @swim_lane.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_swim_lane
        @swim_lane = SwimLane.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def swim_lane_params
        params.require(:swim_lane).permit(:name, :board_id, :user_id)
    end
end
