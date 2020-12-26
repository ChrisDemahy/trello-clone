import React from "react";
import board from "../../interfaces/Board";
import BoardContainerLevel from "../BoardContainerLevel/BoardContainerLevel";
import BoardCard from "./BoardCard/BoardCard";

// import Board from "./Board";

class BoardContainer extends React.Component {
    state = {
        boards: [],
        currentBoard: {},
    };

    async componentDidMount() {
        const response = await fetch("http://localhost:3000/boards");
        const data = await response.json();
        this.setState((prev) => {
            return { boards: data };
        });
    }

    renderCards() {
        const boards = [...this.state.boards];
        const cards = boards.map((item: board) => {
            return (
                <div key={item.id} className="column is-one-third">
                    <BoardCard {...item} />
                </div>
            );
        });
        return cards;
    }

    render() {
        const boards = { boards: [...this.state.boards] };
        return (
            <div className="container">
                <BoardContainerLevel />
                {/* / {...boards} /> */}
                <div className="columns is-multiline">{this.renderCards()}</div>
            </div>
        );
    }
}

export default BoardContainer;
