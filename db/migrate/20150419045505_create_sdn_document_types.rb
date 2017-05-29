class CreateSdnDocumentTypes < ActiveRecord::Migration
  def up

    create_table :sdn_document_types do |t|
    	t.string :code, limit:6
    	t.string :type_name, limit:50
      t.timestamps
    end
    SdnDocumentType.create :code=>"CERTFC",:type_name=>"Certificate"
    SdnDocumentType.create :code=>"NATIDC",:type_name=>"National ID Card"
    SdnDocumentType.create :code=>"PASSPT",:type_name=>"Passport Book"
    SdnDocumentType.create :code=>"FAMLBK",:type_name=>"Familty Book"
    SdnDocumentType.create :code=>"DRIVLC",:type_name=>"Driver License"
    SdnDocumentType.create :code=>"BCERTC",:type_name=>"Certificate of Birth"
    SdnDocumentType.create :code=>"OTHERS",:type_name=>"Other Documents"
  end
  def down
  	drop_table :sdn_document_types
  end
end
