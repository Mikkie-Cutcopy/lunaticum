/**
 * React Static Boilerplate
 * https://github.com/kriasoft/react-static-boilerplate
 *
 * Copyright © 2015-present Kriasoft, LLC. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.txt file in the root directory of this source tree.
 */

import React, { PropTypes } from 'react';
import cx from 'classnames';
import Card from '../Card';
import Footer from '../Footer';
import ControlButton from '../ControlButton';
import s from './Layout.css';

class Layout extends React.Component {

  constructor() {
    super();
    this.state = {
      level: 0,
      owner_cards: [1, 3, 8, 15, 17],
      match_cards: [],
      selected_card: null,
      opened: true,
      picked_card: null,
      ctrl_btn_active: true,
    };
  }

  static propTypes = {
    className: PropTypes.string,
  };

  componentDidMount() {
    window.componentHandler.upgradeElement(this.root);
  }

  componentWillUnmount() {
    window.componentHandler.downgradeElements(this.root);
  }

  renderCard(n, opened) {
    console.log(this.state)
    return <Card card_id={n} opened={opened} selected={this.state.selected_card === n} picked={this.state.picked_card === n} onClick={() => this.handleCardClick(n)}/>
  }

  renderControlButton() {
    return <ControlButton active={this.state.ctrl_btn_active} onClick={() => this.handleButtonClick()}/>
  }

  putCard(n) {
    var updated_match_cards = this.state.match_cards
    updated_match_cards.push(n)

    var updated_owner_cards = this.state.owner_cards
    var index = updated_owner_cards.indexOf(n);
    updated_owner_cards.splice(index, 1);

    console.log(updated_owner_cards)
    this.setState({owner_cards: updated_owner_cards, match_cards: updated_match_cards, level: 1});
  }

  handleButtonClick(n) {
    if (this.state.level === 0 )
      this.putCard(this.state.selected_card)
    if (this.state.level === 1  )
      this.setState({picked_card: this.state.selected_card});
  }

  handleCardClick(n) {
    this.setState({selected_card: n});
  }

  hundleDeselect(e) {
    if (e.target.className !== "")
      this.setState({selected_card: null});
  }

  render() {
    return (
      <div ref={node => (this.root = node)}>
        <div className={s.root_c} onClick={(e) => this.hundleDeselect(e)}>
          <div className={s.head_c}>
            {this.renderControlButton()}
          </div>
          <div className={s.main_c}>
            <div className={s.gamers_c}>
            </div>
            <div className={s.gamers_c}>
            </div>

            <div className={s.game_field_c}>
              <div className={s.cards_field}>
                <div className={s.cards_container}>
                  {this.state.match_cards.map((n) => this.renderCard(n, false))}
                </div>
              </div>
            </div>

            <div className={s.gamers_field_c}>
              <div className={s.cards_field}>
                <div className={s.cards_container}>
                  {this.state.owner_cards.map((n) => this.renderCard(n, true))}
                </div>
              </div>
            </div>
          </div>
          <div className={s.footer_c}>

          </div>
        </div>

        </div>

    );
  }
}

export default Layout;
