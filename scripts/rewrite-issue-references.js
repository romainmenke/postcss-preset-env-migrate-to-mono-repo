const fs = require('fs');
const patchPath = fs.readFileSync(0, 'utf-8').trim();
const patch = fs.readFileSync(patchPath).toString();
const githubLocation = process.env.GITHUB_LOCATION;

const subjectStartIndex = patch.indexOf('Subject: ')+9;
const diffStartIndex = patch.indexOf(`---
 `);

const originalMessage = patch.slice(subjectStartIndex, diffStartIndex);
if (originalMessage.indexOf('#') === -1) {
	return;
}

const rewrittenMessage = patch.slice(subjectStartIndex, diffStartIndex).replaceAll(
	/(?:[^\w])(#\d+)/g,
	function (match, p1) {
		return match.replace(p1, `${githubLocation}${p1}`);
	}
);

const newPatch = patch.replace(originalMessage, rewrittenMessage);

fs.writeFileSync(patchPath, newPatch);
