## Prerequisites 
1. Install:
- Jenkins
- Docker engine
- Kubectl
- Helm
- Azure CLI
- yq
```bash
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq
```
- Ngrok
2. Run ngrok as systemd service
- Create the service file:
```bash
sudo nano /etc/systemd/system/ngrok.service
```
- Add the following content:
```
[Unit]
Description=ngrok Tunnel Service
After=network.target

[Service]
ExecStart=/usr/local/bin/ngrok start --all --config /home/<your-username>/.config/ngrok/ngrok.yml
Restart=on-failure
User=<your-username>
Group=<your-username>
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=ngrok

[Install]
WantedBy=multi-user.target
```
- Reload systemd and Start the Service
```
sudo systemctl daemon-reload
sudo systemctl start ngrok
sudo systemctl enable ngrok
sudo systemctl status ngrok
```
## Config ngrok tunnel
- Run command
```bash
nano ~/.config/ngrok/ngrok.yml
```
- Config as below
```bash
version: "3"
agent:
    authtoken: {your_ngrok_auth_token}
    api_key: {your_ngrok_api_key}
endpoints:
  - name: jenkins
    url: https://{}
    upstream:
      url: 8080
```
## Prepare
1. Add the Jenkins User to the Docker Group: 
```bash
sudo usermod -aG docker jenkins
```
2. Install the Jenkins plugins:
- Azure CLI
- Azure credentials