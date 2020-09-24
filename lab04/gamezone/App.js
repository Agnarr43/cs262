import React, { useState } from 'react';
import { AppLoading } from 'expo';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import Navigator from './routes/homeStack'

export default function App() {
  return (
      <NavigationContainer>
          <Navigator />
      </NavigationContainer>
  );
};
