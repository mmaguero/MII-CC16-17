apt_update 'all platforms'

package 'git'
package 'postgresql'
package 'postgresql-contrib'

package 'python-setuptools'
package 'python-dev'
package 'python-pip'
package 'python-psycopg2'

easy_install_package 'Flask'
easy_install_package 'Flask-SQLAlchemy'
easy_install_package 'pyTelegramBotAPI'
