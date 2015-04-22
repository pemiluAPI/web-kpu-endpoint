class Accumulation < ActiveRecord::Base
  belongs_to :category
  belongs_to :province, -> { select('id, nama_lengkap') }

  delegate :description, to: :category, prefix: true
  delegate :nama_lengkap, to: :province, prefix: true
end
