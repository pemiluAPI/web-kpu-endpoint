class WebAddress < ActiveRecord::Base
  belongs_to :province, -> { select('id, nama_lengkap') }

  delegate :nama_lengkap, to: :province, prefix: true
end
