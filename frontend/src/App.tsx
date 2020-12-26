import React from "react";

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
// import {
//     BrowserRouter as Router,
//     Switch,
//     Route,
//     Link,
//     useParams,
//     useRouteMatch,
// } from "react-router-dom";

import BoardContainer from "./components/BoardContainer/BoardContainer";
import User from "./components/User/User";
import UserContainer from "./components/User/UserContainer";
import Board from "./components/Board/Board";
import Home from "./components/Home/Home";
import Level from "./components/Level/Level";

function App() {
    return (
        <div className="App">
            <header className="App-header"></header>
            <main>
                <Router>
                    <Route path="/" children={<Level />} />
                    <Switch>
                        <Route path="/users/:id" children={<User />} />
                        <Route
                            exact
                            path="/users"
                            children={<UserContainer />}
                        />

                        <Route path="/boards/:id" children={<Board />} />
                        <Route
                            exact
                            path="/boards"
                            children={<BoardContainer />}
                        />
                        <Route exact path="/" children={<Home />} />
                    </Switch>
                </Router>
            </main>
        </div>
    );
}

export default App;
