#!/bin/bash
# set random wallpaper from a given source

# hard-coded sources
_bg_sources=(
    "http://www.reddit.com/r/wallpaper"
    "http://www.reddit.com/r/minimalwallpaper"
    "http://www.reddit.com/r/earthporn"
    "http://www.reddit.com/r/spaceporn"
    "http://www.reddit.com/r/quotesporn"
    "http://www.reddit.com/r/quotepaper"
)

# add any folders in the wallpapers directory, and the base directory
for entry in $(find $(echo $HOME)/Pictures/wallpapers -maxdepth 1 -type d); do
    _bg_sources=(${_bg_sources[@]} $entry)
done

show_help () {
    echo ========================================================
    echo Change your wallpaper!
    echo ========================================================
    echo "${0} list             choose a source"
    echo "${0} q                quote"
    echo "${0} r                random"
    echo "${0} blank            black wallpaper"
    echo "${0} archive          random from last 10 wallpapers"
    echo "${0} search earth     anything with earth"
    echo ========================================================
}

# help
if [[ $1 == *"help"* || ! $1 ]]; then
    show_help
    exit
fi

# list sources
if [[ $1 == *"list"* ]]; then
    show_help
    for index in ${!_bg_sources[*]}
    do
        printf "%4d:  %s\n" $index ${_bg_sources[$index]}
    done
    read -p "What is your selection?  " _list_selection
fi

# for a black background
if [[ $1 == *"blank"* ]]; then
    feh --bg-fill $(echo $HOME)/Pictures/wallpapers/black.png
    exit
fi

if [ ! $_list_selection ]; then
    _list_selection=$1
fi

# nail down the right source
if [[ $_list_selection == *"search"* ]]; then
    _search_string=$2
    _string_bg_sources=()
    for s in "${_bg_sources[@]}"; do
        [[ $s == *"${_search_string}"* ]] && _string_bg_sources+=($s)
    done
    _source=${_string_bg_sources["$[RANDOM % ${#_string_bg_sources[@]}]"]}
elif [[ $_list_selection == *"archive"* ]]; then
    _history=$(tail $(echo $HOME)/.wallpaper_history | while read str; do
            echo $(echo $str | sed 's/ /\%/g')
        done)
    _hist=()
    for entry in $_history; do
        _hist=(${_hist[@]} $entry)
    done
    _source=${_hist["$[RANDOM % ${#_hist[@]}]"]}
    _source=$(echo $_source | sed 's/\%/ /g')
    _source=$(echo $_source | sed "s/'//g")
elif [[ $_list_selection == *"q"* ]]; then
    _q_bg_sources=()
    for s in "${_bg_sources[@]}"; do
        [[ $s == *"quote"* ]] && _q_bg_sources+=($s)
    done
    _source=${_q_bg_sources["$[RANDOM % ${#_q_bg_sources[@]}]"]}
elif [[ $_list_selection == *"r"* ]]; then
    _source=${_bg_sources["$[RANDOM % ${#_bg_sources[@]}]"]}
else
    _source=${_bg_sources[$_list_selection]}
fi

# handle local sources and exit
if [[ $_source != *"http"* ]]; then
    _image=$(find "$_source" -iname "*.png" -o -iname "*.jpg" | shuf -n 1)
    _image=$(echo $_image |sed s/\"//g)
    if [[ ! $_image == '' ]]; then
        feh --bg-max "$_image"
        if [[ ! $(tail ~/.wallpaper_history) == *"$_image"* ]]; then
            echo \'$_image\' >> $(echo $HOME)/.wallpaper_history
        fi
    else
        echo 'image is empty.'
    fi
    exit
fi

# handle web sources
_image=$(wget -O - $_source | grep -Eo 'http://i.imgur.com[^&]+jpg' | shuf -n 1)
wget "$_image"
_image=$(echo $_image | sed 's#.*/##')
cp $_image $(echo $HOME)/.wallpaper/
mv $_image background.jpg
feh --bg-max background.jpg
echo \'$(echo $HOME)/.wallpaper/$_image\' >> $(echo $HOME)/.wallpaper_history
exit
