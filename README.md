# Book Checkin

## Setup
### Install Python header files and MariaDB
```
sudo apt-get install python-dev
sudo apt-get install mariadb-server
sudo apt-get install libmysqlclient-dev
sudo /usr/bin/mysql_secure_installation
```

### Configure database
```
mysql -u root -p -h localhost checkin < db/database.sql
mysql -u root -p -h localhost --execute "GRANT ALL PRIVILEGES ON checkin.* TO 'checkin'@'localhost' IDENTIFIED BY 'checkinpass'"
```

### Install virtualenv
```
sudo apt-get install python-virtualenv
virtualenv venv
source venv/bin/activate
```

### Install Python modules
```
pip install Flask
pip install flask-mysqldb
pip install flask-login
```
