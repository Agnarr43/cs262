import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { StyleSheet, Text, View, Button, TextInput, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState("John Smith");
  const [age, setAge] = useState(0);
  const [birthdays, setBirthdays] = useState([]);

  const buttonHandler = () => {
    setAge(age+1);
    setBirthdays(birthdays.concat({key: (age+1).toString()}));
  };

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Enter Name:</Text>
      
      <TextInput 
        style={styles.input}
        placeholder="John Smith"
        onChangeText={(val) => setName(val)}
      />

      <Text>{name} is {age} years old</Text>
      
      <View style={styles.buttonContainer}>
        <Button title='Birthday' onPress={buttonHandler}/>
      </View>
      
      <FlatList
        data={birthdays}
        renderItem={({item}) => <Text>{item.key}</Text>} //function w/ {item} object as a param
      />

      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#c2c2c2',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    margin: 10,
  },
  buttonContainer: {
    margin: 5,
  },
  input: {
    borderWidth: 1,
    borderColor: '#777',
    padding: 5,
    margin: 5,
    width: 200,
    backgroundColor: '#fff',
  },
});
