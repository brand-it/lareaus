import React from "react"
import PropTypes from "prop-types"
class Post extends React.Component {
  render () {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Published: {this.props.published}</div>
        <div>Published By: {this.props.publishedBy}</div>
      </div>
    );
  }
}

Post.propTypes = {
  title: PropTypes.string,
  published: PropTypes.bool,
  publishedBy: PropTypes.node
};
export default Post
