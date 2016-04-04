require_relative 'invoice'
require_relative 'import'
include Imports

invoice_file = 'invoices.csv'
output_dir = 'pdf/'
collection = Invoices.new


import_invoices(invoice_file,collection)

collection.download_all_invoices(output_dir)
