module SpecialsHelper

  def generate_token(type, car)
    if type.class.name == 'Issue'
      @token = SecureRandom.urlsafe_base64
      @permission = Permission.new(car_id: car.id, issue_id: type.id, report_type: type.class.name, token: @token)
      if !@permission.save
        return nil
      else
        return @token
      end
    elsif type.class.name == 'Maintenance'
      @token = SecureRandom.urlsafe_base64
      @permission = Permission.new(car_id: car.id, report_type: type.class.name, token: @token)
      if !@permission.save
        return nil
      else
        return @token
      end
    else
      return nil
    end
  end

end
