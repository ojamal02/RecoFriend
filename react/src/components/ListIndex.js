import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class ListIndex extends Component {
  constructor(props) {
    super(props);
    this.state = { list: '' };

    this.getListData = this.getListData.bind(this);
  }

  componentDidMount() {
    this.getListData();
  }

  getListData() {
    fetch(`/api/v1/lists`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({
          lists: body
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
      let lists;
      if (this.state.lists) {
        lists = this.state.lists.map(list => {
          return(
            <h4>
              <div className="mainbox"><a href={`/lists/` + list.id}>{list.title}</a></div>
            </h4>
          )
        })
      }
      return (

        <div class="container">


              {lists}
        </div>

      )
    }
  }

  export default ListIndex;
