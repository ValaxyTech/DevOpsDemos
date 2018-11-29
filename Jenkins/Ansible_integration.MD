# Ansible integration with Jenkins

this article helps you to integrate Ansible with Jenkins

Follow this on **[YouTube](https://www.youtube.com/watch?v=nE4b9mW2ym0)


### Prerequisites:
1. Ansible server **[Get Help Here](https://www.youtube.com/watch?v=79xFyOc_eEY)
2. Jenkins Server ** [Get Help Here](https://www.youtube.com/watch?v=M32O4Yv0ANc)

### Integration Setps

install "publish Over SSH"
`Manage Jenkins` > `Manage Plugins` > `Available` > `Publish over SSH` 

configure ansible system credentials under "configure systems" to connect our Jenkins to ansible
- `Manage Jenkins` > `Configure System` > `Publish Over SSH` > `SSH Servers` 

	- SSH Servers:
		- server Name:`<ServerIP>`
		- username: `ansadm`
		- password: `*******`

test he connection
