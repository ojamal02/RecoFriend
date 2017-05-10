import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './containers/App';

$(function() {
  let appElement = document.getElementById('app')
  if (appElement) {
    ReactDOM.render(
    <App />,
    appElement
  )}
})
