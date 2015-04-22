module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :web_list do
      desc "Return all Web KPU"
      get do
          web_lists = Array.new

          # Prepare conditions based on params
          valid_params = {
            province: 'province_id',
          }

          conditions = Hash.new
          valid_params.each_pair do |key, value|
            conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
          end

          limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

          WebAddress.includes(:province)
            .where(conditions)
            .limit(limit)
            .offset(params[:offset])
            .each do |wa|
              web_lists << {
                id: wa.id,
                province: {
                  id: wa.province_id,
                  name: wa.province_nama_lengkap
                },
                name: wa.name,
                link: wa.link,
                other_link: wa.other_link,
                explanation: wa.explanation
              }
            end

          {
              results: {
                count: web_lists.count,
                total: WebAddress.where(conditions).count,
                web_kpu: web_lists
              }
          }
      end
    end

     resource :accumulation do
      desc "Return all Accumulation Web KPU"
      get do
          accumulations = Array.new

          # Prepare conditions based on params
          valid_params = {
            province: 'province_id',
            category: 'category_id'
          }

          conditions = Hash.new
          valid_params.each_pair do |key, value|
            conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
          end

          limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

          Accumulation.includes(:province, :category)
            .where(conditions)
            .limit(limit)
            .offset(params[:offset])
            .each do |accumulation|
              accumulations << {
                id: accumulation.id,
                province: {
                  id: accumulation.province_id,
                  name: accumulation.province_nama_lengkap
                },
                category: {
                  id: accumulation.category_id,
                  description: accumulation.category_description
                },
                value: accumulation.value
              }
            end

          {
              results: {
                count: accumulations.count,
                total: Accumulation.where(conditions).count,
                accumulation: accumulations
              }
          }
      end
    end

   resource :category do
      desc "Return all Category Web KPU"
      get do
          categories = Array.new

          Category.all.each do |category|
              categories << {
                  id: category.id,
                  description: category.description
              }
            end

          {
              results: {
                count: categories.count,
                total: Category.all.count,
                category: categories
              }
          }
      end
    end

   resource :province do
      desc "Return all Province Web KPU"
      get do
          provinces = Array.new

          Province.all.each do |province|
              provinces << {
                  id: province.id,
                  nama: province.nama_lengkap
              }
            end

          {
              results: {
                count: provinces.count,
                total: Province.all.count,
                province: provinces
              }
          }
      end
    end
  end
end