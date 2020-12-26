import SwimLane from "./SwimLane";
import user from "./User";

export default interface Board {
    id: number;
    name: string;
    user_id: number;
    description: string;
    created_at: string;
    updated_at: string;
    // Included. Owner is child model of board.
    // (board belongs_to owner)
    owner: user;
    swim_lanes: SwimLane[];
}
