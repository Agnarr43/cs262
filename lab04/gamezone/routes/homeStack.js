import React from 'react';
import {createStackNavigator} from '@react-navigation/stack';
import { createAppContainer } from 'react-navigation'; 
import Home from '../screens/home';
import ReviewDetails from '../screens/reviewDetails';

const Stack = createStackNavigator();
export default function HomeStack() {
    return (
        <Stack.Navigator screenOptions={{
                headerStyle:{
                    backgroundColor:'#ddd', 
                    height: 60
                },
                headerTintColor: '#444',
            }}>
            <Stack.Screen
                name="Home"
                component={Home}
                options={{title: 'Gamezone'}}
            />
            <Stack.Screen
                name="ReviewDetails"
                component={ReviewDetails}
                options={
                    {title: 'Review Details'}
                }
            />
        </Stack.Navigator>
    );
};