
default: debug

debug:
	hugo server --theme=hugo-creative-portfolio-theme -D

debug-bg:
	hugo server --theme=hugo-creative-portfolio-theme -D &

production:
	hugo server --theme=hugo-creative-portfolio-theme

firefox: debug-bg
	firefox localhost:1313

vivaldi: debug-bg
	vivaldi-stable http://localhost:1313

chromium: debug-bg
	chromium http://localhost:1313

kill:
	pkill hugo
