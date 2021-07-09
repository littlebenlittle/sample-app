
window.onload = () => {
	const test = document.createElement('p');
	test.innerHTML = 'test';
	const root = document.createElement('div');
	root.appendChild(test);
	document.body.appendChild(root);
};
