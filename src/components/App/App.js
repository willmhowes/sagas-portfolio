import React, { Component } from 'react';
import { connect } from 'react-redux';
import './App.css';

class App extends Component {

  componentDidMount = () => {
    this.props.dispatch({ type: 'GET_PROJECTS' });
  }
  // Renders the entire app on the DOM
  render() {
    return (
      <div className="App">
        {JSON.stringify(this.props.reduxState.projects)}
        {JSON.stringify(this.props.reduxState.tags)}
        <p>Empty Page</p>
      </div>
    );
  }
}

const mapReduxStateToProps = (reduxState) => ({
  reduxState
});

export default connect(mapReduxStateToProps)(App);
