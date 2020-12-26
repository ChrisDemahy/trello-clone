import React from "react";
import swimLaneInterface from "../../../interfaces/SwimLane";
import Card from "./Card/Card";

const SwimLane = ({ swim_lane }: { swim_lane: swimLaneInterface }) => {
    // When user is undefined, show a loading indicator
    if (!swim_lane) {
        return <div>Loading...</div>;
    }
    return (
        <div className="column">
            <h1 className="title">{swim_lane.name}</h1>
            {swim_lane.cards.map((card) => {
                return <Card {...card} />;
            })}
        </div>
    );
};

export default SwimLane;
