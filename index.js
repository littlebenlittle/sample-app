const express = require('express');
const ejs = require('ejs');
const { Client } = require('pg');

const client = new Client();

async function fetchProjects(username) {
	console.log(username)
	await client.connect();
	const res = await client.query('SELECT username, projects FROM data WHERE username = $1::text LIMIT 1');
	const projects = res.rows[0].projects;
	console.log(projects);
	// TODO check if username in db
	// TODO if not, hit gh api and store it into db
	// TODO return list of projects
}

const app = express();
app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'ejs');

app.get('/', (req, res) => {
	res.render('index');
});

app.post('/submit', async (req, res) => {
	const username = req.body.username;
	try {
		const projects = await fetchProjects(username);
		res.render('result', {
			username,
			projects,
		});
	}
	catch (e) {
		console.log(e);
		res.send('<p>request failed</p>');
	}
});

app.listen(8080, () => { console.log('listening on 8080') });
