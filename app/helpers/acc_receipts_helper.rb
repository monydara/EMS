# unicode
module AccReceiptsHelper


    def self.get_receipt_file id

        current_date = (Date.today).strftime(" %d-%b-%Y")

        report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'thinreports', 'receipt_deposit.tlf')
        # start new page
        report.start_new_page

        # ====== header info
        report.page.item(:khr_name).value("ប្រាក់បង់រូចមិនអាចបង់វិញបាន")

        # report.page.item(:image).src("#{Rails.root}/public/images/icons/logo.png")
       report
    end


end
