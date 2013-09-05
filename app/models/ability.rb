class Ability
  include CanCan::Ability

  def initialize(user)
    
    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.role == "admin"
        can :manage, :all
      else
        can :read, :all
      end
    end
  end    
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
