const express = require('express');
const ejs = require('ejs');
const axios = require('axios');
const { Client } = require('pg');


async function fetchProjects(username) {
	const client = new Client();
	await client.connect();
	const res = await client.query('SELECT projects FROM data WHERE username = $1::text LIMIT 1', [username]);
	let projects;
	if (res.rows.length > 0) {
		projects = res.rows[0].projects;
	} else {
		const gh_res = await axios.get(`https://api.github.com/users/${username}/repos`)
		projects = gh_res.data.map(project => {
			return project.html_url
		});
		const pg_res = await client.query('INSERT INTO data (username, projects) VALUES ($1::text, $2::text[])', [username, projects])
		console.log(pg_res);
	}
	return projects;
}

const app = express();
app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'ejs');

app.get('/example-app', (req, res) => {
	res.render('index');
});

app.use('/example-app/content', express.static('content'));

app.post('/example-app/submit', async (req, res) => {
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

app.listen(process.env.PORT || 8080, () => { console.log('listening on 8080') });
