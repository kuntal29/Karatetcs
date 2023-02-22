function fn() {

	var config = {
		name: "kuntal",
		baseUrl: 'https://dummyapi.io/data/v1',
		baseUrl2: 'https://gorest.co.in/public/v2',
		accessToken: 'c32ea72185d02a78f0002c095ae6f4dbd33fec70c0bb3b58d082e340986a76fa'



	};

	var env = karate.env
	karate.log('the value of env is : ', env);

	if (env == 'qa') {
		config.baseUrl = 'https://dummyapi.io/data/v1'
	}
	else {
		config.baseUrl = 'https://dummyapi.io/data/v1'
	}
	var result = karate.callSingle('classpath:src/test/java/features/Get_first_Call_Users.feature')
	config.authtoken = result;

	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000)


	return config;
}
