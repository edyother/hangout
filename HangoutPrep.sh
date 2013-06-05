#!/bin/bash

EpisodeNumber=7

YouTubeLink="http://youtu.be/AqkCt_mcotM"

EventPageLink="https://plus.google.com/u/0/events/c1d9n9al07s9jgh5naeeecipj0k"

IFrameCode="<iframe width="420" height="315" src="http://www.youtube.com/embed/AqkCt_mcotM" frameborder="0" allowfullscreen></iframe>"


echo "################################" > HPrep.txt
echo "## For Website during the Day ##">> HPrep.txt
echo "################################">> HPrep.txt
echo "">> HPrep.txt
echo "<h3>Tonight at 9pm EDT (1am UTC) this text will be replaced by live video of Episode $EpisodeNumber of my <a href="'"'$EventPageLink'"'">Traditional Music Hangouts on Air</a></h3><p><a href="'"http://www.youtube.com/watch?v=cfv2ue13vj4&feature=share&list=PLCymceESnYFO2kFZXxrwEkdSKX2X0sxff"'">You can take a look at previous episodes here</a></p>">> HPrep.txt
echo "">> HPrep.txt
echo "###########################">> HPrep.txt
echo "## For website when live ##">> HPrep.txt
echo "###########################">> HPrep.txt
echo "">> HPrep.txt
echo "<h3><a href="'"'$EventPageLink'"'">Traditional Music Hangout on Air Episode $EpisodeNumber</a><br>Live Now!</h3><br><br>">> HPrep.txt
echo "$IFrameCode">> HPrep.txt
echo "">> HPrep.txt
echo "##########################################">> HPrep.txt
echo "## Change youtube link in G+ event page ##">> HPrep.txt
echo "##########################################">> HPrep.txt
echo "">> HPrep.txt
echo "$YouTubeLink">> HPrep.txt
echo "">> HPrep.txt
echo "############################">> HPrep.txt
echo "## Post this to G+ Status ##">> HPrep.txt
echo "############################">> HPrep.txt
echo "">> HPrep.txt
echo "Episode $EpisodeNumber of my *Traditional Music Hangouts on Air* will be going live shortly (9pm EDT)">> HPrep.txt
echo "">> HPrep.txt
echo "$YouTubeLink">> HPrep.txt
echo "">> HPrep.txt
echo "You can chat live by using the comments on the event page here">> HPrep.txt
echo "">> HPrep.txt
echo "$EventPageLink">> HPrep.txt
echo "">> HPrep.txt
echo "##############################################################">> HPrep.txt
echo "## Post this to Facebook Staus, and all the relevant groups ##">> HPrep.txt
echo "##############################################################">> HPrep.txt
echo "">> HPrep.txt
echo "Episode $EpisodeNumber of my Traditional Music Hangouts on Air will be going live shortly (9pm EDT)">> HPrep.txt
echo "">> HPrep.txt
echo "$YouTubeLink">> HPrep.txt
echo "##########################">> HPrep.txt
echo "## Post this to Twitter ##">> HPrep.txt
echo "##########################">> HPrep.txt
echo "">> HPrep.txt
echo "Traditional Music Hangouts on Air #$EpisodeNumber is going live shortly. (9pmEDT 1amUTC) $YouTubeLink #IrishMusic #Folk #Trad">> HPrep.txt
geany HPrep.txt
