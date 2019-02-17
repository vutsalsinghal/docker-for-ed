import React from 'react';
import { Menu, Icon } from 'semantic-ui-react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <Menu style={{ marginTop: '0px', }} size={'large'}>
      <Menu.Item><Link to='/DockerForEd'>Docker4Edu</Link></Menu.Item>
      <Menu.Menu position="right">
        <Menu.Item><Link to='/DockerForEd/resources'><Icon name='tasks' />Resources</Link></Menu.Item>
        <Menu.Item><Link to='/DockerForEd/team'>Team</Link></Menu.Item>
        <Menu.Item><Link to='/DockerForEd/about'>About</Link></Menu.Item>
      </Menu.Menu>
    </Menu>
  );
};