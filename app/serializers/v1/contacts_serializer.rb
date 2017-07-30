class V1::ContactsSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :first_name, :last_name, :email, :phone_numbers, :address, :company, :job_title, :dob,
             :archived
end
