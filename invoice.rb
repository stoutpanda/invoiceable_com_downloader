require 'date'
require 'open-uri'
require 'progressbar'


class Invoice
  attr_reader :id, :date, :client_id, :uri, :uri_key, :ref


  def initialize(id,date,client_id,uri,ref)
    @id = id
    @date = date.to_date
    @client_id = client_id
    @uri = uri
    @uri_key = stripkey(uri)
    @ref = ref
  end

  def stripkey(uri)
    link = uri.split("/")[-1]
  end

  def download_invoice(output_dir)
    download_url = URI.parse("https://secure.invoiceable.com/downloadinvoice/#{@uri_key}")
    pbar = nil
    File.open("#{output_dir}#{@ref}-#{@date.to_s}.pdf", "wb") do |file|
      puts "Downloading invoice: #{@ref.to_s}!"
      file.write open(download_url.to_s,
        :content_length_proc => lambda { |t|
        if t && 0 < t
          pbar = ProgressBar.new("...", t)
          pbar.file_transfer_mode
        end
        },:progress_proc => lambda {|s|
          pbar.set s if pbar
            }).read
          end
      end
  end

class Invoices

  attr_accessor :invoices

  def initialize
    @invoices = []
  end

  def add_invoice(invoice)
    @invoices << invoice
  end

  def download_all_invoices(output_dir)
    @invoices.each { |invoice| invoice.download_invoice(output_dir) }
  end


end
