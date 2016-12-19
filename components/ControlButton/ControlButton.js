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
import s from './ControlButton.css';

class ControlButton extends React.Component {

  buttonName() {
    //if (this.props.level === 0)
    return 'Select'
  }

  render() {
    return (
      <button className={s.control_button} onClick={() => this.props.onClick()} >
        <p>{this.buttonName()}</p>
      </button>
    );
  }

}

export default ControlButton;
