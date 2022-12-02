// Usage :
// From root mono repo dir run
// $ git --no-pager log --pretty=format:user:%aN%n%at --reverse --raw --encoding=UTF-8 --no-renames --no-show-signature | node ./.github/bin/format-git-log-for-gource.cjs > custom.log
// $ gource custom.log --auto-skip-seconds 1 --file-idle-time 0 --seconds-per-day 2
// $ gource custom.log --auto-skip-seconds 1 --file-idle-time 0 --seconds-per-day 0.2 --hide mouse,progress --output-framerate 25 -1280x720 -o - | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10000K gource.webm

const readline = require('readline');
const path = require('path');

const rl = readline.createInterface({
	input: process.stdin,
});

const commits = [];
let lastCommit = {
	// timestamp - A unix timestamp of when the update occurred.
	timestamp: 0,
	// username - The name of the user who made the update.
	usernames: [],

	files: []
}

// // type - initial for the update type - (A)dded, (M)odified or (D)eleted.
type: 'A',
	// // file - Path of the file updated.
	// file: '',
	// 	// color - A color for the file in hex (FFFFFF) format. Optional.
	// 	color: '',

	rl.on('line', (line) => {
		line = line.trim();
		if (!line) {
			lastCommit = {
				usernames: [],
				files: []
			};
			commits.push(lastCommit);
			return;
		}

		if (line.startsWith('user:')) {
			lastCommit.usernames.push(line.slice(5));

			if (lastCommit.username === 'romainmenke') {
				lastCommit.username = 'Romain Menke';
			}
			return;
		}

		if (!lastCommit.timestamp && parseInt(line, 10).toString() === line) {
			lastCommit.timestamp = parseInt(line, 10);
			return;
		}

		if (line.startsWith(':')) {
			const parts = line.split('\t');
			const type = parts[0].slice(-1).trim();
			const file = parts[1].trim();

			if (file && type) {
				lastCommit.files.push({
					color: pathColor(file.toLowerCase()),
					file: file,
					type: type,
				})
			}
		}

	}).on('close', () => {
		process.stdout.write(commits.filter((x) => {
			return !!x.files.length;
		}).sort((a, b) => {
			if (a.timestamp < b.timestamp) {
				return -1;
			}

			if (a.timestamp > b.timestamp) {
				return 1;
			}

			return 0;
		}).flatMap((commit) => {
			let result = [];

			commit.usernames.forEach((username) => {
				commit.files.forEach((file) => {
					result.push(`${commit.timestamp.toString()}|${username}|${file.type}|${file.file}|${file.color}`)
				})
			});

			return result;
		}).join('\n') + '\n');
	});

function pathColor(p) {
	let dir = path.parse(p).dir;

	let pkgDirs = [
		'cli',
		'experimental',
		'packages',
		'plugin-packs',
		'plugins',
	];

	let toolDirs = [
		'.github',
		'rollup',
	];


	if (pkgDirs.includes(dir.split('/')[0])) {
		dir = dir.split('/').slice(0, 2).join('/');
	} else if (toolDirs.includes(dir.split('/')[0])) {
		dir = dir.split('/')[0];
	} else {
		return '3C790A';
	}

	let hash = 0;
	for (let i = 0; i < dir.length; i++) {
		const chr = dir.charCodeAt(i);
		hash = ((hash << 5) - hash) + chr;
		hash |= 0;
	}

	return hslToRgbHex(
		(Math.abs(hash) % 360) / 60,
		1,
		Math.max(0.3 + (p.split('/').length * 0.1), 0.8),
	)
}

function hslToRgbHex(hue, sat, light) {
	// 	For simplicity, this algorithm assumes that the hue has been normalized
	//  to a number in the half-open range [0, 6), and the saturation and lightness
	//  have been normalized to the range [0, 1]. It returns an array of three numbers
	//  representing the red, green, and blue channels of the colors,
	//  normalized to the range [0, 1]

	let t2;
	if (light <= .5) {
		t2 = light * (sat + 1);
	} else {
		t2 = light + sat - (light * sat);
	}
	const t1 = light * 2 - t2;
	const r = hueToRgb(t1, t2, hue + 2);
	const g = hueToRgb(t1, t2, hue);
	const b = hueToRgb(t1, t2, hue - 2);

	return `${componentToHex(Math.round(r * 255))}${componentToHex(Math.round(g * 255))}${componentToHex(Math.round(b * 255))}`.toUpperCase();
}

function componentToHex(c) {
	var hex = c.toString(16);
	return hex.length == 1 ? "0" + hex : hex;
}

function hueToRgb(t1, t2, hue) {
	if (hue < 0) {
		hue += 6;
	}
	if (hue >= 6) {
		hue -= 6;
	}

	if (hue < 1) {
		return (t2 - t1) * hue + t1;
	} else if (hue < 3) {
		return t2;
	} else if (hue < 4) {
		return (t2 - t1) * (4 - hue) + t1;
	} else {
		return t1;
	}
}
