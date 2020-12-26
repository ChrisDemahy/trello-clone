import React, { useEffect, useState } from "react";
import boardInterface from "../../interfaces/Board";

import { useParams } from "react-router-dom";
import SwimLane from "./SwimLane/SwimLane";
import BoardLevel from "../Level/Level";

const Board = () => {
    const [board, setBoard] = useState<boardInterface | undefined>(undefined);
    const params: { id: string } = useParams();
    useEffect(() => {
        fetch(`http://localhost:3000/boards/${params.id}`)
            .then((response) => response.json())
            .then((data: boardInterface) => {
                setBoard(data);
            });
    }, [params.id]);
    const renderSwimlanes = (currentBoard: boardInterface) => {
        return currentBoard.swim_lanes.map((swim_lane) => {
            return <SwimLane key={swim_lane.id} swim_lane={swim_lane} />;
        });
    };

    // When user is undefined, show a loading indicator
    if (!board) {
        return <div>Loading...</div>;
    }

    return (
        <>
            {/* Swimlanes */}
            <div className="section">
                <div className="container">
                    <div className="columns">{renderSwimlanes(board)}</div>
                </div>
            </div>
        </>
    );
};

export default Board;
