import Card from "./Card";

export default interface SwimLane {
    id: number;
    name: string;
    board_id: number;
    user_id: number;
    created_at: string;
    updated_at: string;
    cards: Card[];
}
