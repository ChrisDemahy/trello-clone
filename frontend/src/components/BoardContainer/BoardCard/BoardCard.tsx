import React from "react";
import "./BoardCard.css";
import board from "../../../interfaces/Board";

import {
    // BrowserRouter as Router,
    // Switch,
    // Route,
    Link,
    // useParams,
    // useRouteMatch,
} from "react-router-dom";

const formatDate = (timestamp: string) => {
    const dateObject = new Date(Date.parse(timestamp));
    let date: any = Intl.DateTimeFormat("en-US", {
        hour: "numeric",
        minute: "numeric",
        weekday: "short",
        year: "numeric",
        day: "numeric",
    }).format(
        dateObject // new Date()
    );
    return `At ${date.split(",")[0]} On ${date.split(",")[0]}`;
};

const BoardCard = (props: board) => {
    return (
        <Link to={`/boards/${props.id}`}>
            <div className="card boardCard">
                <div className="card-content">
                    <div className="content">
                        <span className="title is-4">{props.name} </span> <br />{" "}
                        <br />
                        <span className="subtitle is-6">Owner </span>
                        {props.owner.name} <br />
                        <span className="subtitle is-6">
                            Description <br />
                        </span>
                        {props.description} <br />
                        <span className="subtitle is-6">
                            Last Modified <br />
                        </span>
                        <time>{formatDate(props.created_at)}</time>
                    </div>
                </div>
            </div>
        </Link>
    );
};

export default BoardCard;
