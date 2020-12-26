import React from "react";
import cardInterface from "../../../../interfaces/Card";

const Card = (card: cardInterface) => {
    // When user is undefined, show a loading indicator
    if (!card) {
        return <div>Loading...</div>;
    }
    return (
        <div className="block">
            <div className="card">
                <header className="card-header">
                    <p className="card-header-title">{card.name}</p>
                    <a
                        href="#"
                        className="card-header-icon"
                        aria-label="more options"
                    >
                        <span className="icon">
                            <i
                                className="fas fa-ellipsis-v"
                                aria-hidden="true"
                            ></i>
                        </span>
                    </a>
                </header>
                <div className="card-content">
                    <div className="content">{card.content}</div>
                </div>
                <footer className="card-footer">
                    <a href="#" className="card-footer-item">
                        Edit
                    </a>
                    <a href="#" className="card-footer-item">
                        Delete
                    </a>
                </footer>
            </div>
        </div>
    );
};

export default Card;
