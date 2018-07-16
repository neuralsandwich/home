UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	PKG_INSTALL = sudo apt-get install -y
	PKG_CHECK := "| xargs dpkg -s '{}' > /dev/null"
	SLACK = /usr/bin/slack
	SLACK_DEB := slack.deb
	SLACK_DOWNLOAD_URL = https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.0-beta25a7a50e-amd64.deb
	SLACK_PKG = slack-desktop
endif
ifeq ($(UNAME_S),Darwin)
	PKG_INSTALL = brew cask install
	PKG_CHECK := "| xargs brew cask ls --versions"
	SLACK = /Applications/Slack.app/Contents/MacOS/Slack
	SLACK_PKG = slack
endif

all: $(SLACK)

$(SLACK_DOWNLOAD):
	curl $(SLACK_DOWNLOAD_URL) -o $(SLACK_DEB) 

$(SLACK): $(SLACK_DOWNLOAD)
	@echo $(SLACK_PKG) $(PKG_CHECK) ||
		$(SLACK_PKG) $(PKG_INSTALL)
