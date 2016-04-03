require_relative 'invoice'
require_relative 'import'
#require_relative 'users'

invoice_file = 'invoices.csv'
user_file = 'user.txt'
output_dir = 'pdf/'


include Imports

import_invoices(invoice_file)

p @invoices




 #create a new object for each with accessbile infomration above.

 #iterate through each hash in the array, and format the date.

 #iterate through each hash in the array, and make a new key in the hash of url_key which will be used for later.

 #define pdf saved name for each file

 #parse user creds into new object for user

 #login to website as user, then visit download url for each url_key, save the file in the output directory and then
