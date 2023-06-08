# MBT Authorization Flow Service

## Setup MySQL
### Download and install MySQL Community Server [here](https://dev.mysql.com/downloads/mysql/)
### Download and install MySQL Workbench [here](https://dev.mysql.com/downloads/workbench/)

## Open terminal in the directory of this folder
### Run this command to access mysql
```
mysql -u root -p 
```
### After entering your password, run this. This will create an empty database
```
CREATE DATABASE database_name CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
then
```
exit
```
### In the same terminal, import mbtDB.sql to the empty database
```
mysql -u root -p database_name < db/dumps/mbtDB.sql
```

## Run the WebApp locally

### Setup a virtual python environment (Optional)
```
python -m venv myenv
```
### Activate python env (Optional)
```
myvenv\Scripts\activate
```
### Install necessary packages and libraries

```
pip install -r "requirements.txt"
```

### Move to directory inside the web app
```
cd mbtapp
```

### Migrate models to MySQL DB
```
python manage.py migrate
```

### Run the web app
```
python manage.py runserver
```

### Open http://127.0.0.1:8000/ in your browser
