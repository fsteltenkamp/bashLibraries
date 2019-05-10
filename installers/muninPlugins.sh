#!/bin/bash
export muninPlugins
declare -A muninPlugins
#template
#muninPlugins[x,1]=""
#muninPlugins[x,2]=""
#muninPlugins[x,3]=""
#muninPlugins[x,4]=""
#Minecraft by Natenom
muninPlugins[0,1]="Minecraft"
muninPlugins[0,2]="minecraft_"
muninPlugins[0,3]="https://raw.githubusercontent.com/Natenom/munin-plugins/master/minecraft_"
muninPlugins[0,4]="Natenom"
#Teamspeak by Tim Wulkau
muninPlugins[1,1]="Teamspeak"
muninPlugins[1,2]="teamspeak_user"
muninPlugins[1,3]="https://gitlab.com/snippets/1718124/raw"
muninPlugins[1,4]="Tim Wulkau"
#Murmur (Mumble) by Natenom
muninPlugins[2,1]="Murmur"
muninPlugins[2,2]="murmur_"
muninPlugins[2,3]="https://raw.githubusercontent.com/Natenom/munin-plugins/master/murmur/murmur-munin.py"
muninPlugins[2,4]="Natenom"
#Ejabberd by Lasse Karstensen
muninPlugins[3,1]="Ejabberd"
muninPlugins[3,2]="ejabberd_"
muninPlugins[3,3]="https://raw.githubusercontent.com/munin-monitoring/munin/stable-2.0/plugins/node.d/ejabberd_.in"
muninPlugins[3,4]="Lasse Karstensen"
#Game by ?
muninPlugins[4,1]="Game (Works only with PHP)"
muninPlugins[4,2]="game_"
muninPlugins[4,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/games/game"
muninPlugins[4,4]="?"
# by 
muninPlugins[5,1]="SourceDS CPU"
muninPlugins[5,2]="srcds_cpu_"
muninPlugins[5,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/sourceds/srcds_cpu"
muninPlugins[5,4]="?"
# by 
muninPlugins[6,1]="SourceDS FPS"
muninPlugins[6,2]="srcds_fps_"
muninPlugins[6,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/sourceds/srcds_fps"
muninPlugins[6,4]="?"
# by 
muninPlugins[7,1]="SourceDS Inout"
muninPlugins[7,2]="srcds_inout_"
muninPlugins[7,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/sourceds/srcds_inout"
muninPlugins[7,4]="?"
# by 
muninPlugins[8,1]="SourceDS Players"
muninPlugins[8,2]="srcds_players_"
muninPlugins[8,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/sourceds/srcds_players"
muninPlugins[8,4]="?"
# by 
muninPlugins[9,1]="SourceDS Uptime"
muninPlugins[9,2]="srcds_uptime_"
muninPlugins[9,3]="https://raw.githubusercontent.com/munin-monitoring/contrib/master/plugins/sourceds/srcds_uptime"
muninPlugins[9,4]="?"