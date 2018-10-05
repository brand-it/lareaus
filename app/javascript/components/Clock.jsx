import React from "react"
import PropTypes from "prop-types"
class Clock extends React.Component {
  render () {
    return (
      <div>It is {new Date().toLocaleTimeString()}</div>
    );
  }
}
export default Clock
