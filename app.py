from flask import *
from flask.ext.mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'checkin'
app.config['MYSQL_PASSWORD'] = 'checkinpass'
app.config['MYSQL_DB'] = 'checkin'
app.config['MYSQL_HOST'] = 'localhost'

mysql = MySQL(app)

@app.route('/')
def home():
  return render_template('home.html')

@app.route('/register')
def register():
  return render_template('register.html')

@app.route('/login')
def login():
  return render_template('login.html')

@app.route('/checkin')
def checkin():
  return render_template('checkin.html')

@app.route('/do_register', methods=['POST'])
def do_sign_up():
  username = request.form['inputName']
  password = request.form['inputPassword']
  title = request.form['inputTitle']
  lastName = request.form['inputLastName']
  email = request.form['inputEmail']

  # Validate fields
  errors = {}
  if not username:
    errors['inputName'] = 'Please enter a username'
  if not password:
    errors['inputPassword'] = 'Please enter a password'
  if not lastName:
    errors['inputLastName'] = 'Please enter your last name'
  if errors:
    return json.dumps({'errors': errors})

  cursor = mysql.connection.cursor()

  register_stmt = '''
    INSERT INTO Teacher (Username, Password, Email, Title, LastName)
    VALUES (%s, %s, %s, %s, %s)
  '''
  register_data = (username, password, email, title, lastName)
  cursor.execute(register_stmt, register_data)
  mysql.connection.commit()

  return json.dumps({}), 200

if __name__ == '__main__':
  app.run(host='0.0.0.0', debug=True)
