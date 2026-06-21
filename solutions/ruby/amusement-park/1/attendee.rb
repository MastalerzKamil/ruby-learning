class Attendee
  def initialize(height)
    @heigh = height
  end

  def height
    @heigh
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end
end


Attendee.new(106)
Attendee.new(106).height
Attendee.new(106).pass_id

attendee = Attendee.new(106)
attendee.issue_pass!(42)
attendee.pass_id