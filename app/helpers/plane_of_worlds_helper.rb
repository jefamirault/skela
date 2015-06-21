module PlaneOfWorldsHelper
  def portal_link(direction, world = current_player.world)
    if world.portal_open? direction
      # Travel Portal
      link_to direction.to_s.titleize, travel_portal_path(direction), remote: true, class: 'travel_portal'
    else
      # Create Portal
      link_to direction.to_s.titleize, open_portal_path(direction), remote: true, class: 'open_portal'
    end

  end
end
