# SpiderBox
_A locally hosted sandbox tool with web availability, SpiderBox allows for rapid deployment of Javascript, CSS, and HTML scripts with potential future support for apps._

<!-- Patirjk-Hex ASCII Art
                           ______                                         _____               
            _____    _____|\     \   ____________  ____________      _____\    \ ___________      
       _____\    \  /     / |     | /            \ \           \    /    / |    |\          \     
      /    / \    ||      |/     /||\___/\  \____/| \           \  /    /  /___/| \    /\    \    
     |    |  /___/||      |\____/ | \|____\  \___|/  |    /\     ||    |__ |___|/  |   \_\    |   
  ____\    \ |   |||\     \    | /        |  |       |   |  |    ||       \        |      ___/    
 /    /\    \|___|/| \     \___|/    __  /   / __    |    \/     ||     __/ __     |      \  ____ 
|    |/ \    \     |  \     \       /  \/   /_/  |  /           /||\    \  /  \   /     /\ \/    \
|\____\ /____/|     \  \_____\     |____________/| /___________/ || \____\/    | /_____/ |\______|
| |   ||    | |      \ |     |     |           | /|           | / | |    |____/| |     | | |     |
 \|___||____|/        \|_____|     |___________|/ |___________|/   \|____|   | | |_____|/ \|_____|
                          ______  ______         _____  _____       _____|___|/                   
                          \     \|\     \    ____\_   \ \    \     /    /
                           |     |\|     |  /     /    \ \    \   /    / 
                           |     |/____ /  /     /\     | \    \ /    /  
                           |     |\     \ |     |  |    |  \    |    /   
                           |     | |     ||     |  |    |  /    |    \   
                           |     | |     ||     | /    /| /    /|\    \  
                          /_____/|/_____/||\     \____/ ||____|/ \|____| 
                          |    |||      ||| \_____\   | /|    |   |    | 
                          |____|/|______|/ \ |    |___|/ |____|   |____| 
                                            \|____|                      
-->

---


## Notes

A tunnel to the web! This was a fairly quick setup to allow others to easily share a simple local host with other people/teammates without the need for a shared development server. This allows local hosting to be accessible via the web. It currently works best for webhosting with HTML, CSS, and Javascript. That is likely to be expanded in an array of other languages, but may be released as another project all together.

### TODO:
- the spiderbox.sh file only runs on OSX for now, but we'll have that fixed soon. 
- the .env file isn't fully tied in yet.


---

## Installation & Setup

_Note: you will need to setup a free (or paid) account with Ngrok https://dashboard.ngrok.com/signup to get your tunnel credentials_


### Recommended installation with HomeBrew and PyEnv
(_for running without impacting your default Python installation_)

#### Install Pyenv
1. `brew install pyenv`
2. `pyenv install 3.9.5`

#### Setup Virtual Environment
3. `pyenv virtualenv 3.9.5 spiderbox-3.9.5`
4. `Go to the root directory of your spiderbox`
5. `pyenv local spiderbox-3.9.5`
6. edit the web_tunnel_settings.yml and add your ngrok credentials
7. Celebrate the installation!

### Simple installation
_Note: If you're missing pip then you need to set it up_

1. `pip install -r requirements.txt` 
2. Edit the ngrok.yml
3. `chmod +x spiderbox.sh`
4. edit the web_tunnel_settings.yml and add your ngrok credentials
5. Celebrate the installation!

---

## Running from command line

`cd [Spiderbox_directory]`
`./spiderbox.sh`
<!-- `ngrok start --all --config=./ngrok.yml` -->


---

## How to add files
1. copy your files to or creat files in SpiderBox/sandbox/
2. Open your browser to 127.0.0.1/sandbox/ or your_subdomain.ngrok.io
<!-- 3. No need to restart the service  # TODO: Need to verify this -->

---


### Limitations

+ If you are using this for testing prior to your hosted server, be aware that ngrok.com is a shared domain and you'll likely be using one of their subdomains. If so, then some classically available features to subdomains of an owned domain may not be available ot you. Some examples:
  - Cookies can be set to `domian=.example.com` which allows all subdomains and the primary domain to share the same cookies. Many shared domain services (like yourSubDomain.ngrok.io) disallow writing shared cookies since it could allow you to hack/disrupt others on the shared service. (Example Error: 'Cookie “cookieTest” has been rejected for invalid domain.')



# Umnsorted Stuff
---

Used https://favicon.io/favicon-generator/ with "League Gothic" for the favicon generation


---

# License

GNU GPL v3.0
Copywrite (c) 2022 Seth Cottam