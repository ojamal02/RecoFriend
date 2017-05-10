import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import ListIndex from '../components/ListIndex';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render() {
    return (
      <div>
      <Router history={browserHistory}>
        <Route path='/'>
          <Route path='/lists' component={ListIndex} />
        </Route>
      </Router>

      </div>
    )
  }
}

export default App;
