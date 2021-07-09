const express = require('express');
const ejs = require('ejs');

const app = express();
app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
	res.render('index');
});

app.post('/submit', (req, res) => {
	res.render('result', {
		username: req.body.username,
		projects: [
			'test',
		]
	});
});

app.listen(8080, () => { console.log('listening on 8080') });
