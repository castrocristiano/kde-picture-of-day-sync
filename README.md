# kde-picture-of-day-sync
Script to sync The Picture of day content from KDE Wallpaper Plugin

* *1* - Create a crontab for your user 
    * `crontab -u <username> -e`
* *2* - Set the script in your user crontab 
    * `0 * * * * sh $HOME/dev/shell/kde-picture-of-day-sync/bkp_pod.sh` 
    * in this case, I set to ran every minute.
* *3* - logoff and login