# SpiderBox
_As locally hosted sandbox tool with web availability, SpiderBox allows for rapid deployment of Javascript, CSS, and HTML scripts with potential future support for apps._

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

#### Sub-section

---

## Installation & Setup


### Recommended installation with PyEnv

#### Install Pyenv
1. brew install pyenv
2. pyenv install 3.9.5

#### Setup Virtual Environment
3. pyenv virtualenv 3.9.5 spiderbox-3.9.5
4. Go to the root directory of your spiderbox
5. pyenv local spiderbox-3.9.5
6.

### Simple installation

1. `pip install -r requirements.txt`
  - If you're missing pip then you need to set it up in your default python
2. Edit the ngrok.yml
3. `chmod +x spiderbox.sh`

---

## Running from command line

Spiderbox directory
<!-- `ngrok start --all --config=./ngrok.yml` -->
./spiderbox.sh



---


### Limitations

+ If you are using this for testing prior to your hosted server, be aware that ngrok.com is a shared domain and you'll likely be using one of their subdomains. If so then some classically available features to subdomains of an owned domain may not be available ot you. Some examples:
  - Cookies can be set to `domian=.example.com` which allows all subdomains and the primary domain to share the same cookies. Many shared domain services (like yourSubDomain.ngrok.io) disallow writing shared cookies since it could allow you to hack/disrupt others on the shared service. (Example Error: 'Cookie “cookieTest” has been rejected for invalid domain.')



# Umnsorted Stuff
---

Used https://favicon.io/favicon-generator/ with "Leaguw Gothic" for the favicon generation