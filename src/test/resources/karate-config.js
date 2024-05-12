function fn() {

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('ssl', true);
  return {
    api:{
        uri: 'https://reqres.in/api'
    }
  };
}