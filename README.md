# MBT Authorization Flow Service
### URLs
| URL | Description | Sample URL |
| ------ | ------ | ---- |
| /signup      |    User sign up    | http://127.0.0.1:8000/signup/
| /login      |    User login   | http://127.0.0.1:8000/login/
| /      |    landing page    | http://127.0.0.1:8000/
| /home      |    User dashboard    | http://127.0.0.1:8000/home/

### Endpoints
| Method | Endpoint | Description | Sample URL |
| ------ | ------ | ---- | ---- |
| POST | /api/signup      |    User sign up    | http://127.0.0.1:8000/api/signup/
| POST | /api/login      |  User login     | http://127.0.0.1:8000/api/login/
| POST | /api/permissions      |  creating new permissions     | http://127.0.0.1:8000/api/permissions/
| POST | /api/roles      |  creating new roles     | http://127.0.0.1:8000/api/roles/
| POST | /api/roles/<str:role_id>/permissions      |  assigning role permission     | http://127.0.0.1:8000/api/roles/<str:role_id>/permissions/
| GET | /api/roles/<str:role_id>/permissions      |  showing available role permissions     | http://127.0.0.1:8000/api/roles/<str:role_id>/permissions/
| POST | /api/users/<str:user_id>/roles      |  assigning list of roles to user     | http://127.0.0.1:8000/api/users/<str:user_id>/roles/
| GET | /api/users/<str:user_id>/roles      |  showing roles of user     | http://127.0.0.1:8000/api/users/<str:user_id>/roles/
| GET | /api/users/<str:user_id>/permissions      |  showing user permissions     | http://127.0.0.1:8000/api/users/<str:user_id>/permissions/


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

