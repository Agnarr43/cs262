import 'react-native-gesture-handler';
import React, { useState } from 'react';
import {StyleSheet, View, Text} from 'react-native';
import { AppLoading } from 'expo';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { home } from './screens/home.js';
import * as Font from 'expo-font';
import Navigator from './routes/homeStack'
import { globalStyles } from './styles/global';

const getFonts = () => Font.loadAsync({
  'nunito-regular': require('./assets/fonts/Nunito-Regular.ttf'),
  'nunito-bold': require('./assets/fonts/Nunito-Bold.ttf')
});


export default function App() {
  const [fontsLoaded, setFontsLoaded] = useState(false);
  if(fontsLoaded) {
    return(
      <NavigationContainer>
        <Navigator />
      </NavigationContainer>); 
  } else {
    return(
      <AppLoading 
        startAsync={getFonts}
        onFinish={() => setFontsLoaded(true)}
      />
    );
  }
};
