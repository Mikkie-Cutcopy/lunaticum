/**
 * React Static Boilerplate
 * https://github.com/kriasoft/react-static-boilerplate
 *
 * Copyright © 2015-present Kriasoft, LLC. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.txt file in the root directory of this source tree.
 */

import React from 'react';
import s from './Card.css';

class Card extends React.Component {

  constructor() {
    super();
    this.state = {
      num: null,
      front_img: "http://www.bioenciclopedia.com/wp-content/uploads/2013/11/tucan2.jpg",
      back_img: "http://media-hearth.cursecdn.com/attachments/4/578/icecrown.png",
    };
  }

  cardClass() {
    var picked
    if (this.props.picked)
      picked = s.picked
    else
      picked = ''
    if (this.props.selected)
      return s.card_picture_selected + ' ' + picked;
    else
      return s.card_picture + ' ' + picked;
  }

  cardImage() {
    if (this.props.opened)
      return this.state.front_img
    else
      return this.state.back_img
  }

  render() {
    return (
      <div className={this.cardClass()} onClick={() => this.props.onClick()}>
        <img src={this.cardImage()}/>
      </div>
    );
  }

}

export default Card;
