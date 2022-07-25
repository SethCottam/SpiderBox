function open_tab() {
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    osascript -i <<EOF
        tell application "iTerm2"
            tell current window
                create tab with default profile
                tell the current session
                        write text "cd \"$cdto\" && $args"
                end tell
            end tell
        end tell
EOF
}

function start_spiderbox() {
    # local original_flask_app=${FLASK_APP}
    # export FLASK_APP="routes.py"



    # Start Ngrok in a new tab
    # TODO: Need to set this to run from it's current director
    open_tab ngrok start --all --config=./web_tunnel_settings.yml

    spiderbox_logo

    # Start Flask using dotenv (environment variable management)
    dotenv run -- flask run 

    # Reset the flask app afterwards in case they're using it elsewhere
    # export FLASK_APP=${original_flask_app}
}

function spiderbox_logo() {
    R="\033[0m\033[0;31m"  # Red
    G="\033[0m\033[0;32m"  # Green
    Y="\033[0m\033[0;33m"  # Yellow
    B="\033[0m\033[0;34m"  # Blue
    M="\033[0m\033[0;35m"  # Magento
    C="\033[0m\033[0;36m"  # Cyan
    W="\033[0m\033[0;37m"  # White
    D="\033[0m\033[02;37m" # Dim (Grey, but G was already taken)
    T="\033[0m\033[02;36m" # Teal
    X="\033[0m"     # Reset the color

    echo -e "\n
${R}                           ______                                         _____                                                                           
${R}            _____    _____|\     \   ____________  ____________      _____\    \ ___________             
${R}       _____\    \  /     / |     | /            \ \           \    /    / |    |\          \            
${R}      /    / \    ||      |/     /||\___/\  \____/| \           \  /    /  /___/| \    /\    \            
${R}     |    |  /___/||      |\____/ | \|____\  \___|/  |    /\     ||    |__ |___|/  |   \_\    |           
${R}  ____\    \ |   |||\     \    | /        |  |       |   |  |    ||       \        |      ___/            
${R} /    /\    \|___|/| \     \___|/    __  /   / __    |    \/     ||     __/ __     |      \  ____         
${R}|    |/ \    \     |  \     \       /  \/   /_/  |  /           /||\    \  /  \   /     /\ \/    \        
${R}|\____\ /____/|     \  \_____\     |____________/| /___________/ || \____\/    | /_____/ |\______|       
${R}| |   ||    | |      \ |     |     |           | /|           | / | |    |____/| |     | | |     |       
${R} \|___||____|/        \|_____|     |___________|/ |___________|/   \|____|   | | |_____|/ \|_____|       
${R}                          ______  ______         _____  _____       _____|___|/                            
${R}                          \     \|\     \    ____\_   \ \    \     /    / 
${R}                           |     |\|     |  /     /    \ \    \   /    /  
${R}                           |     |/____ /  /     /\     | \    \ /    /   
${R}                           |     |\     \ |     |  |    |  \    |    /    
${R}                           |     | |     ||     |  |    |  /    |    \    
${R}                           |     | |     ||     | /    /| /    /|\    \   
${R}                          /_____/|/_____/||\     \____/ ||____|/ \|____|  
${R}                          |    |||      ||| \_____\   | /|    |   |    |  
${R}                          |____|/|______|/ \ |    |___|/ |____|   |____|  
${R}                                            \|____|                         
${X}"

}

  ##############################################################################################
 ########  SpiderBox functions - START                                                 ########
##############################################################################################
# Description - Example description of the thing and purpose
# Author - Seth Cottam
#

spiderbox() {
    # The Example parent function

    if [ -d "$1" ]; then
        # cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    # This only needs to be set if the autodetect doesn't work for your system
    # family="example"

    # Autodetect family
    if [[ -n ${FUNCNAME[0]} ]]; then
        family=$(FUNCNAME[0])
    elif [[ -n ${funcstack[1]} ]]; then
        family=${funcstack[1]}
    else
        echo -e "${ERROR}ERROR:${RESET} ${CASUAL}Can't detect the function name, please set family= manually ${RESET}"
    fi

    # If the string is not empty
    if [[ -n ${1} ]]; then
        full_function="${family}_${1}"
        if [[ "$(whence ${full_function})" = "${full_function}" ]]; then
            # Call the family_arg1 then pass all args >= arg position 2
            ${family}_${1} ${@:2}
        else
            echo -e "${ERROR}ERROR:${RESET} ${CASUAL}${family} does not support \"${1}\" as an argument${RESET}"
            ${family}_help
        fi
    else
         ${family}_help
    fi

    # Cleanup and/or Garbage collection
    unset family
}


##############################################################################################
####  Helper Child Functions
##############################################################################################
# These are simple helper functions not core usage functions

spiderbox_help() {
    # Formated Help using Finder function
    echo ""
    format info "${(C)family} help"
    format casual "This function family manages a Python Flask API"
    finder functions $family $UNSORTED_FUNCTIONS_SOURCE
    echo ""
    # ${family}_examples
    format debug1 "Previous Usage" "hist functions ${family}"
    echo ""
}

##############################################################################################
####  Child Functions
##############################################################################################
# The unique functions that makes your parent function worth having

spiderbox_start() {
    # Start Python Flask
    clearly
    mem_flask

    # These exports should probably be moved to the bash_profile... but I really like them here
    if [[ -n ${1} ]]; then
        export FLASK_APP=${1}_api.py
    else
        export FLASK_APP=json_api.py
    fi
    export FLASK_DEBUG=1

    # TODO: This is dependant on the Forge
    cd ~/Forge/Development/sandbox/python/flask
    pyenv activate flask_api_testing-3.7.2

    # tab "open -a 'Google Chrome' 'http://127.0.0.1:5000/v0.1/bad'; format warning 'Check the previous tab for the Flask logs'; format success 'Opened Flask API URL'"
    tab "open -a 'Google Chrome' 'http://127.0.0.1:5000/v0.1/bad' && format warning 'Check the previous tab for the Flask logs' && format success 'Opened Flask API URL'"
    sleep 1
    flask run
}

##############################################################################################
 ########  Flask functions - END                                                     ########
  ##############################################################################################


#spiderbox_logo
start_spiderbox