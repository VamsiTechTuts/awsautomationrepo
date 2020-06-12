exports.handler = (event, context, callback) => {
    let min = 0;
    let max = 100;
    let rand = Math.floor(Math.random()*max)+min;
    callback(null, {
	statusCode: '200',
    body: JSON.stringify({ rand }), 
	headers: {
      'Content-Type': 'application/json',
    },
  });
};

