from flask import *
from flask.ext.mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'testapp'
app.config['MYSQL_PASSWORD'] = 'testpass'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_HOST'] = 'localhost'

mysql = MySQL(app)

@app.route('/')
def home():
  return render_template('home.html')

@app.route('/sign_up')
def sign_up():
  return render_template('signup.html')

@app.route('/about')
def about():
  return render_template('about.html')

@app.route('/do_sign_up', methods=['POST'])
def do_sign_up():
  name = request.form['inputName']
  email = request.form['inputEmail']
  password = request.form['inputPassword']

  if name and email and password:
    cursor = mysql.connection.cursor()
    cursor.execute('''SELECT * FROM TestTable''')
    rows = cursor.fetchall()

    return json.dumps({'html': '<span>{}</span>'.format(rows)})
  else:
    return json.dumps({'html': '<span>Enter all fields please</span>'})

if __name__ == '__main__':
  app.run(host='0.0.0.0', debug=True)
