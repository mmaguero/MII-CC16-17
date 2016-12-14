apt_update 'all platforms'

package 'git'
package 'mongodb'
package 'nodejs'
package 'npm'

execute "npm install --prefix /home/mmaguero/modulos/ mongoose"
