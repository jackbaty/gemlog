LOCAL_DIR=~/Sync/pub/gemlog.baty.net/content
SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/gemini.baty.net
TARGET=DigitalOcean




deploy: commit push
	@echo "\033[0;32mDeploying gemlog to $(TARGET)...\033[0m"
	rsync -v -rz --checksum --delete --no-perms $(LOCAL_DIR) $(SERVER_HOST):$(SERVER_DIR)



commit:
	@echo "\033[0;32mAdding changes\033[0m"
	git add -A
	git diff-index --quiet HEAD || git commit -m "Build site `date`"

push:
	@echo "\033[0;32mPushing repo\033[0m"
	git push origin main


.FORCE:
