SLACK_DOWNLOAD_URL = https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.0-beta25a7a50e-amd64.deb
SLACK_DEB := slack.deb

all: /usr/bin/slack

$(SLACK_DEB):
	curl $(SLACK_DOWNLOAD_URL) -o $(SLACK_DEB) 

/usr/bin/slack: $(SLACK_DEB)
	@dpkg -s slack-desktop > /dev/null || sudo dpkg -i $(SLACK_DEB)
