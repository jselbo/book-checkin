class BookRecord:
  def __init__(self, identifier, title, author=None, ISBN=None, ARPoints=None):
    self.identifier = identifier
    self.title = title
    self.author = author
    self.ISBN = ISBN
    self.ARPoints = ARPoints

  def __repr__(self):
    return 'BookRecord <id={}, title={}, author={}, ISBN={}, ARPoints={}>' \
        .format(self.identifier, self.title, self.author, self.ISBN, self.ARPoints)

  @staticmethod
  def fetchAll(mysql):
    cursor = mysql.connection.cursor()
    cursor.execute('''
      SELECT BookRecordID, Title, Author, ISBN, ARPoints
      FROM BookRecord
    ''')
    return [BookRecord(br[0], br[1], br[2], br[3], br[4]) for br in cursor.fetchall()]

  @staticmethod
  def fetchFromIdentifier(mysql, identifier):
    cursor = mysql.connection.cursor()
    cursor.execute('''
      SELECT BookRecordID, Title, Author, ISBN, ARPoints
      FROM BookRecord
      WHERE BookRecordID=%s
    ''', (identifier,))
    br = cursor.fetchone()
    return BookRecord(identifier, br[1], br[2], br[3], br[4])
